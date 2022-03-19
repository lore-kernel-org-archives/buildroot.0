Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAEBC433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Mar 2022 21:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFB8281991;
	Sat, 19 Mar 2022 21:51:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ubhiDTPBkSk; Sat, 19 Mar 2022 21:51:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C62881902;
	Sat, 19 Mar 2022 21:51:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96BC71BF32A
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 21:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85EB940911
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 21:51:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vpVwN8imjmA9 for <buildroot@lists.busybox.net>;
 Sat, 19 Mar 2022 21:51:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DE124089F
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 21:51:01 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 56DC0FF802;
 Sat, 19 Mar 2022 21:50:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nVgyQ-00EoiG-GE; Sat, 19 Mar 2022 22:50:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20220311065511.14015-1-ps.report@gmx.net>
Date: Sat, 19 Mar 2022 22:50:58 +0100
In-Reply-To: <20220311065511.14015-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 11 Mar 2022 07:55:11 +0100")
Message-ID: <87ils9pq65.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/openssh: fix
 '-fzero-call-used-regs' option support detection
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

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+IHdyaXRl
czoKCiA+IC0gYWRkIHVwc3RyZWFtIHBhdGNoIChbMV0pIHRvIGZpeCAnLWZ6ZXJvLWNhbGwtdXNl
ZC1yZWdzJyBnY2MgY29tcGlsZXIgb3B0aW9uCiA+ICAgc3VwcG9ydCBkZXRlY3Rpb24KCiA+IC0g
YWRkIGF1dG9yZWNvbmYgYXMgdGhlIHBhdGNoIHRvdWNoZXMgbTQvb3BlbnNzaC5tNAoKID4gRml4
ZXM6CgogPiAgIC0gaHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNDY1
MQoKID4gICBiaXRtYXAuYzogSW4gZnVuY3Rpb24g4oCYcmVzZXJ2ZeKAmToKID4gICBiaXRtYXAu
Yzo5ODoxOiBzb3JyeSwgdW5pbXBsZW1lbnRlZDog4oCYLWZ6ZXJvLWNhbGwtdXNlZC1yZWdz4oCZ
IG5vdCBzdXBwb3J0ZWQgb24gdGhpcyB0YXJnZXQKID4gICAgICA5OCB8IH0KID4gICAgICAgICB8
IF4KCiA+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vb3BlbnNzaC9vcGVuc3NoLXBvcnRhYmxlL2Nv
bW1pdC9mMTA3NDY3MTc5NDI4YTBlM2VhOWU0YWE5NzM4YWMxMmZmMDI4MjJkLnBhdGNoCgogPiBT
aWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+CiA+IC0tLQog
PiBDaGFuZ2VzIHYxIC0+IHYyOgogPiAgIC0gcmViYXNlZCBhbmQgcmVudW1iZXJlZCBwYXRjaCBm
cm9tIDAwMDEtSW1wcm92ZS1kZXRlY3Rpb24tb2YtZnplcm8tY2FsbC11c2VkLXJlZ3MtYWxsLXN1
cHBvci5wYXRjaAogPiAgICAgdG8gMDAwMi1JbXByb3ZlLWRldGVjdGlvbi1vZi1memVyby1jYWxs
LXVzZWQtcmVncy1hbGwtc3VwcG9yLnBhdGNoCgpDb21taXR0ZWQgdG8gMjAyMi4wMi54LCB0aGFu
a3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
