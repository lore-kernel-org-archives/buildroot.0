Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE50AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 09:05:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D2B061056
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 09:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D2B061056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=grinn-global.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B36AB405C9;
	Thu, 28 Oct 2021 09:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m03NzXaa2Fh5; Thu, 28 Oct 2021 09:05:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07986405BD;
	Thu, 28 Oct 2021 09:05:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 71FE81BF319
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 09:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60E754032C
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 09:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NbAM4H2EVwTk for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 09:05:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84B23402F3
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 09:05:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (7)
Received: from zm (pub-198.183.29.194.multiplay.pl [194.29.183.198])
 by server220076.nazwa.pl (Postfix) with ESMTP id E68531C4F06;
 Thu, 28 Oct 2021 11:05:44 +0200 (CEST)
References: <20211026075020.12072-1-b.bilas@grinn-global.com>
User-agent: mu4e 1.6.9; emacs 27.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Thu, 28 Oct 2021 11:04:34 +0200
In-reply-to: <20211026075020.12072-1-b.bilas@grinn-global.com>
Message-ID: <87k0hxecyj.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/liteboard: bump to linux 5.14.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkJhcnRvc3ogQmlsYXMgPGIuYmlsYXNAZ3Jpbm4tZ2xvYmFsLmNvbT4gd3JpdGVzOgoKPiBTaWdu
ZWQtb2ZmLWJ5OiBCYXJ0b3N6IEJpbGFzIDxiLmJpbGFzQGdyaW5uLWdsb2JhbC5jb20+Cj4gLS0t
Cj4gIGNvbmZpZ3MvZ3Jpbm5fbGl0ZWJvYXJkX2RlZmNvbmZpZyB8IDQgKystLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2NvbmZpZ3MvZ3Jpbm5fbGl0ZWJvYXJkX2RlZmNvbmZpZyBiL2NvbmZpZ3MvZ3Jpbm5fbGl0ZWJv
YXJkX2RlZmNvbmZpZwo+IGluZGV4IDhiZWMyZTFkNTQuLjVkNzcwMjY3NDIgMTAwNjQ0Cj4gLS0t
IGEvY29uZmlncy9ncmlubl9saXRlYm9hcmRfZGVmY29uZmlnCj4gKysrIGIvY29uZmlncy9ncmlu
bl9saXRlYm9hcmRfZGVmY29uZmlnCj4gQEAgLTEsMTIgKzEsMTIgQEAKPiAgQlIyX2FybT15Cj4g
IEJSMl9jb3J0ZXhfYTc9eQo+IC1CUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9N
XzVfNz15Cj4gK0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNV8xND15Cj4g
IEJSMl9TWVNURU1fREhDUD0iZXRoMCIKPiAgQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0i
c3VwcG9ydC9zY3JpcHRzL2dlbmltYWdlLnNoIgo+ICBCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FS
R1M9Ii1jIGJvYXJkL2dyaW5uL2xpdGVib2FyZC9nZW5pbWFnZS5jZmciCj4gIEJSMl9MSU5VWF9L
RVJORUw9eQo+ICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPiAtQlIyX0xJTlVY
X0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS43LjIiCj4gK0JSMl9MSU5VWF9LRVJORUxf
Q1VTVE9NX1ZFUlNJT05fVkFMVUU9IjUuMTQuMTQiCj4gIEJSMl9MSU5VWF9LRVJORUxfREVGQ09O
RklHPSJpbXhfdjZfdjciCj4gIEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQo+ICBCUjJf
TElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iaW14NnVsLWxpdGVib2FyZCIKCgpSZXZpZXdl
ZC1ieTogTWFyY2luIE5pZXN0cm9qIDxtLm5pZXN0cm9qQGdyaW5uLWdsb2JhbC5jb20+CgotLQpN
YXJjaW4gTmllc3Ryw7NqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
