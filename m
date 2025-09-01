Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135F1CA0FF2
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 02:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 938F24127F;
	Mon,  1 Sep 2025 02:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DRgfmJxeHBv; Mon,  1 Sep 2025 02:40:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C56F44127B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C56F44127B;
	Mon,  1 Sep 2025 02:40:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 644E710E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 02:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5504D81D73
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 02:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MDNIxOAKuSSi for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 02:40:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E30881D34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E30881D34
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E30881D34
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 02:40:16 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id 9848F440EC1;
 Mon,  1 Sep 2025 05:40:03 +0300 (IDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org,  Tzu-Jung Lee <roylee17@gmail.com>
In-Reply-To: <87o6rvfset.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 31 Aug 2025 16:59:54 +0200")
References: <20250829080657.2627985-1-peter@korsgaard.com>
 <87o6rvfset.fsf@dell.be.48ers.dk>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Mon, 01 Sep 2025 05:40:12 +0300
Message-ID: <87zfbevqsz.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1756694403;
 bh=sCodN39dpRcRm1C/G+l+prYy3stedH8RlafJfnDSzEY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=CZfADk6iLkzBwUxJEJBp13X86N3puteB/8nge0wCvgMzcZR6WMdKvXbvQiHH/kP+c
 mz10/fSU0XxPzhzNH8kn2QwSklhxTfNQJwsIpBT7zJRrNGl2Dss5PETHCzECgxiWn0
 vn1jEdyQDvqsUH4TNW33sQM5E8O+U+LMrTmW8mNgU7OfSz81m2ewyiohRe0RjwEJxc
 0Nlj4wK4ylf13SyTex1Zt0lkWfKwab/dzKApN/ZkAKKLujmOWR/0XNOEjw1mW7CtqN
 RKxFI8odQ1XoeNtViQKkwjLv67ruxGO8BOB8bTRTsVj2kXhhh5AEj37M+SiKvakxo+
 WgAC21RMEyT4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=CZfADk6i
Subject: Re: [Buildroot] [PATCH] package/tstools: fix build w/ gcc-15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpPbiBTdW4sIEF1ZyAzMSAyMDI1LCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6Cgo+
Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdy
aXRlczoKPgo+ICA+IEdDQy0xNSBkZWZhdWx0cyB0byBDMjMsIHdoaWNoIGNoYW5nZXMgdGhlIG1l
YW5pbmcgb2YgYW4gZW1wdHkgcGFyYW1ldGVyCj4gID4gbGlzdDoKPgo+ICA+IGh0dHBzOi8vZ2Nj
LmdudS5vcmcvZ2NjLTE1L3BvcnRpbmdfdG8uaHRtbCNjMjMtZm4tZGVjbHMtd2l0aG91dC1wYXJh
bWV0ZXJzCj4KPiAgPiBMZWFkaW5nIHRvIGEgYnVpbGQgZmFpbHVyZToKPgo+ICA+IHRzc2VydmUu
YzogSW4gZnVuY3Rpb24g4oCYc2V0X2NoaWxkX2V4aXRfaGFuZGxlcuKAmToKPiAgPiB0c3NlcnZl
LmM6Mjk4ODoyMTogZXJyb3I6IGFzc2lnbm1lbnQgdG8g4oCYX19zaWdoYW5kbGVyX3TigJkge2Fr
YSDigJh2b2lkCj4gID4gKCopKGludCnigJl9IGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlw
ZSDigJh2b2lkICgqKSh2b2lkKeKAmQo+ICA+IFstV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVz
XQo+ICA+ICAyOTg4IHwgICBhY3Rpb24uc2FfaGFuZGxlciA9IG9uX2NoaWxkX2V4aXQ7Cj4KPiAg
PiBBZGQgYSBwYXRjaCBmcm9tIGFuIHVwc3RyZWFtIFBSIHRvIGZpeCB0aGF0Lgo+Cj4gID4gU2ln
bmVkLW9mZi1ieTogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgo+Cj4gQ29t
bWl0dGVkLCB0aGFua3MuCgpUaGlzIGlzIG5vdCBpbiBtYXN0ZXIgYXMgb2YgY29tbWl0IGM3YWYw
MWY0N2EgKCJwYWNrYWdlL2lwbWl0b29sOiBtb3ZlCnRvIGNvZGViZXJnIikuCgpiYXJ1Y2gKCi0t
IAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH4u
IC5+ICAgVGsgT3BlbiBTeXN0ZW1zCj19LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tb29PLS1VLS1Pb28tLS0tLS0tLS0tLS17PQogICAtIGJhcnVjaEB0a29z
LmNvLmlsIC0gdGVsOiArOTcyLjUyLjM2OC40NjU2LCBodHRwOi8vd3d3LnRrb3MuY28uaWwgLQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
