Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E66C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 15:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83F0B83F78;
	Thu, 17 Feb 2022 15:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5eZWUxhw9-ke; Thu, 17 Feb 2022 15:22:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBE7883F8B;
	Thu, 17 Feb 2022 15:22:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AEDC11BF2B9
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BEB541E96
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:22:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=othermo.de
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ngOj7L0xUQ5m for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 15:22:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org
 [IPv6:2001:67c:2050:101:465::110])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D450441E6F
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 15:22:35 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4Jzz8m6H0xz9slp;
 Thu, 17 Feb 2022 16:22:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=othermo.de; s=MBO0001; 
 t=1645111350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pkE7QHUWyUYO9B4FSS6FyJtJYRq0e5GP1sLWt3QUGjQ=;
 b=fT0Z+JAJglOhTRNE6YJiy0QeNwCc+KblGoRce9u8OcwuACxVPaoKyEGI4U9UNsExcI+t0/
 mxAYg6A4sRmhT2Nfq1+8KBEzTuynRLY/3UjxW6BhqDqTq11njEa4ObTB04RDKmHIiBxqta
 hhet0ZBCIAYLPDQ5B7+uFil247MHnzawvYKljjpddN5PEmOEpUxSyyRee/dNwYQABc9qob
 eAiGxIPwtU64dsLKSO5wX6w4/jrx+gCtNCYP/K/Ud4a6dalEEOdwB+MDRV1eNvgvRGyiqA
 3Y8AGZmPreWpY5ApycqEB7RKjDxWR3bK+bhfK7L9NO+2DO28vQ0zZzgEA1wkCA==
Message-ID: <6a7a1291-9bdd-74f6-e836-ff2426965762@othermo.de>
Date: Thu, 17 Feb 2022 16:22:25 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20220217151054.865073-2-marcus.hoffmann@othermo.de>
 <2B25121E-F5E4-4E61-BEA4-627E5689E813@benettiengineering.com>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <2B25121E-F5E4-4E61-BEA4-627E5689E813@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 1/2]
 configs/friendlyarm_nanopi_r2s_defconfig: uboot needs openssl
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR3VsaW8sCgpPbiAxNy4wMi4yMiAxNjoyMCwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4gSGkg
TWFyY3VzLAo+IAo+PiBJbCBnaW9ybm8gMTcgZmViIDIwMjIsIGFsbGUgb3JlIDE2OjExLCBNYXJj
dXMgSG9mZm1hbm4gPG1hcmN1cy5ob2ZmbWFubkBvdGhlcm1vLmRlPiBoYSBzY3JpdHRvOgo+Pgo+
PiDvu79GaXhlcyB0aGUgZm9sbG93aW5nIGNvbXBpbGUgZXJyb3I6Cj4+Cj4+IEluIGZpbGUgaW5j
bHVkZWQgZnJvbSBpbmNsdWRlL2Jvb3RtLmg6MTAsCj4+ICAgICAgICAgICAgICAgICAgZnJvbSB0
b29scy9pbWFnZS1ob3N0LmM6MTI6Cj4+IGluY2x1ZGUvaW1hZ2UuaDoxMTc4OjEyOiBmYXRhbCBl
cnJvcjogb3BlbnNzbC9ldnAuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+PiAxMTc4IHwg
IyAgaW5jbHVkZSA8b3BlbnNzbC9ldnAuaD4KPj4gICAgICAgfCAgICAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fgo+PiBjb21waWxhdGlvbiB0ZXJtaW5hdGVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBN
YXJjdXMgSG9mZm1hbm4gPG1hcmN1cy5ob2ZmbWFubkBvdGhlcm1vLmRlPgo+PiAtLS0KPj4gY29u
Zmlncy9mcmllbmRseWFybV9uYW5vcGlfcjJzX2RlZmNvbmZpZyB8IDEgKwo+PiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvZnJpZW5kbHlh
cm1fbmFub3BpX3Iyc19kZWZjb25maWcgYi9jb25maWdzL2ZyaWVuZGx5YXJtX25hbm9waV9yMnNf
ZGVmY29uZmlnCj4+IGluZGV4IDgxOGM4NDdmNGIuLmNlMjUyYTVkNzYgMTAwNjQ0Cj4+IC0tLSBh
L2NvbmZpZ3MvZnJpZW5kbHlhcm1fbmFub3BpX3Iyc19kZWZjb25maWcKPj4gKysrIGIvY29uZmln
cy9mcmllbmRseWFybV9uYW5vcGlfcjJzX2RlZmNvbmZpZwo+PiBAQCAtMzAsNiArMzAsNyBAQCBC
UjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDIxLjEwIgo+PiBCUjJfVEFS
R0VUX1VCT09UX0JPQVJEX0RFRkNPTkZJRz0ibmFub3BpLXIycy1yazMzMjgiCj4+IEJSMl9UQVJH
RVRfVUJPT1RfTkVFRFNfRFRDPXkKPj4gQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWUxJQkZEVD15
Cj4+ICtCUjJfVEFSR0VUX1VCT09UX05FRURTX09QRU5TU0w9eQo+PiBCUjJfVEFSR0VUX1VCT09U
X05FRURTX0FURl9CTDMxPXkKPj4gQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19BVEZfQkwzMV9FTEY9
eQo+PiBCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9DVVNUT009eQo+IAo+IFRoYW5rIHlvdSBmb3Ig
dGhlIHBhdGNoLCBoYXZlIHlvdSB2ZXJpZmllZCBpdOKAmXMgZW5vdWdoIGJ5IGJ1aWxkaW5nIGl0
IHVzaW5nIHV0aWxzL2RvY2tlci1ydW4/CgpZZXMsIHRoaXMgZml4ZXMgdGhlIGJ1aWxkIHdpdGgg
ZG9ja2VyLXJ1bi4gKHNhbWUgZm9yIHRoZSBvdGhlciBkZWZjb25maWcpCgpNYXJjdXMKCj4gCj4g
QmVzdCByZWdhcmRzCj4gR2l1bGlvCj4gCj4+IC0tIAo+PiAyLjI1LjEKPj4KPj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxp
bmcgbGlzdAo+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
