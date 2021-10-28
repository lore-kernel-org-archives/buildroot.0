Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540EEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 09:06:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A559F60232
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 09:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A559F60232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=grinn-global.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73C978266D;
	Thu, 28 Oct 2021 09:06:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sf-4nptRy6GF; Thu, 28 Oct 2021 09:06:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCCEB8266C;
	Thu, 28 Oct 2021 09:06:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A90941BF319
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 09:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97D984032E
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 09:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ducz0phJRPj for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 09:06:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D77F1402F3
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 09:06:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (1)
Received: from zm (pub-198.183.29.194.multiplay.pl [194.29.183.198])
 by server220076.nazwa.pl (Postfix) with ESMTP id 1EC1D1C3DAC;
 Thu, 28 Oct 2021 11:06:49 +0200 (CEST)
References: <20211026075020.12072-1-b.bilas@grinn-global.com>
 <20211026075020.12072-3-b.bilas@grinn-global.com>
User-agent: mu4e 1.6.9; emacs 27.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Thu, 28 Oct 2021 11:06:35 +0200
In-reply-to: <20211026075020.12072-3-b.bilas@grinn-global.com>
Message-ID: <87bl39ecwn.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/liteboard: bump to u-boot 2021.10
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
Cj4gIGNvbmZpZ3MvZ3Jpbm5fbGl0ZWJvYXJkX2RlZmNvbmZpZyB8IDIgKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvY29u
Zmlncy9ncmlubl9saXRlYm9hcmRfZGVmY29uZmlnIGIvY29uZmlncy9ncmlubl9saXRlYm9hcmRf
ZGVmY29uZmlnCj4gaW5kZXggNWQ3NzAyNjc0Mi4uZjMxNzNmMmU0MCAxMDA2NDQKPiAtLS0gYS9j
b25maWdzL2dyaW5uX2xpdGVib2FyZF9kZWZjb25maWcKPiArKysgYi9jb25maWdzL2dyaW5uX2xp
dGVib2FyZF9kZWZjb25maWcKPiBAQCAtMTYsNyArMTYsNyBAQCBCUjJfVEFSR0VUX1JPT1RGU19F
WFQyXzQ9eQo+ICBCUjJfVEFSR0VUX1VCT09UPXkKPiAgQlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9T
WVNURU1fS0NPTkZJRz15Cj4gIEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT049eQo+IC1C
UjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDIwLjA0Igo+ICtCUjJfVEFS
R0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDIxLjEwIgo+ICBCUjJfVEFSR0VUX1VC
T09UX0JPQVJEX0RFRkNPTkZJRz0ibGl0ZWJvYXJkIgo+ICBCUjJfVEFSR0VUX1VCT09UX0ZPUk1B
VF9JTUc9eQo+ICBCUjJfVEFSR0VUX1VCT09UX1NQTD15CgoKUmV2aWV3ZWQtYnk6IE1hcmNpbiBO
aWVzdHJvaiA8bS5uaWVzdHJvakBncmlubi1nbG9iYWwuY29tPgoKLS0KTWFyY2luIE5pZXN0csOz
agpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
