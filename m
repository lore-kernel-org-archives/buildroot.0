Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B317DE9536E
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 10:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83AF760A96;
	Wed,  4 Feb 2026 10:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5uUxa9rOtVgQ; Wed,  4 Feb 2026 10:01:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BC7260A97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770199316;
	bh=PFChEvfS5zkBD/KYVNdEnaazolysu45H7eNKLkHpVUk=;
	h=From:Date:References:Cc:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j5T5q4fopZ0fOFJKiZmBHHnJadQ02kYAz5wz9JCQpy8tN1hyEqgjx9Ap6xXrlr9Pv
	 I/Wo4vwGT/KG2v3RlbJVUVytD9A8qU8slMnIYax66BWV/KSyJaWYpTkfoU9HgE3kDw
	 xJdsixrZ1lR7nXzkvTCL1Ih6oAEq2X82OXQlVfP27ZNl3CyAooqfZoLdOut0bqzTGZ
	 rGraICFGzHuIm/8vry0RyV+1LYLgezW6JfcyM6mKwUcckcd4S9PhgKk3YRk/uzE/uO
	 INYJlZFjU2EYQ3AAE8IaESjISLFlCPslufxhyhM0Pabt1PzlLGXbAP/SKKSAcRGQql
	 2z3ZkE7xk4AzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BC7260A97;
	Wed,  4 Feb 2026 10:01:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 375FFF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22EBA4016B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ssTPvfrq7zB for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 10:01:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.165;
 helo=smtpdh20-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79BE44005C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79BE44005C
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79BE44005C
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:01:52 +0000 (UTC)
Received: from smtpclient.apple ([37.163.222.44]) by Aruba SMTP with ESMTPSA
 id nZhlvhdqlgZB2nZhlvRELb; Wed, 04 Feb 2026 11:01:50 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 4 Feb 2026 11:01:48 +0100
Message-Id: <34314385-4879-4FD5-90FF-B2D9CFCE6B5F@benettiengineering.com>
References: <87ms1o7rzy.fsf@dell.be.48ers.dk>
Cc: buildroot@buildroot.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <87ms1o7rzy.fsf@dell.be.48ers.dk>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailer: iPhone Mail (23C71)
X-CMAE-Envelope: MS4xfOardCtc5mmOQwadH6dOa50Iyj7jCBRqs3fO/QvBm6nmbmjxD2WpwnD8K2cRqA+fUPZZgyM5cjie/VNmDS2AQXhPAqN75Bj1LF0FUuar2rD1fNfm2PIS
 MmLQ606osGHAl2XBCdT1MvbGDuVYbZxIhKS4MKLElr8rHw928c97chPx60cSakmAcjvC0D1wr4KCMc4cBpBH1O0H9zVe5BOOrzTf5b+y5KuNXbsegz3RCBzk
 B5XRRMSxbKC9DDjCJJx50fWoh+wRvrn/M8e13UadQHyDwk0I9F3EOmdRI2JlL86P
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770199310; bh=tNwzvw18T9f+X8EMbUT5HYscpaHg/zPGj1EQVD3Vb9E=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=cs/FgV7unmg5yUr9p5iTh4IAOxh61sOqORIjCz+M1gUKlIeMmLl0RD7xTUSBY4omv
 odzp6QkhqqR5em6ivyJ6IQ2PwUD2DTFLYtmlFkKGdzbnNGRQkgKABs6OLGKbtwZdVN
 DgK5w9ftKwkwIlWq7Xgryk8kEC7S/8WypShsKElOZab4YaxWqQQ144BpKsIUqdmmLi
 xP0IvqwQ481t4QTRX+PEMHk+C99OYyHWaSkimS4xuh0NlDkvKFSaUHPApKb0oQ6oeg
 PP68jzcLAUjjJhqcR7bcXyujw8J23fxVpBCaWyuJ7bmvzJuXmUaa24p6lWdavFTxPC
 O7YTxz6DQvP9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=cs/FgV7u
Subject: Re: [Buildroot] [PATCH v2] package/bind: security bump version to
 9.20.17
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gCj4gSWwgZ2lvcm5vIDQgZmViIDIwMjYsIGFsbGUgb3JlIDEwOjU1LCBQZXRlciBLb3JzZ2Fh
cmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IGhhIHNjcml0dG86Cj4gCj4g77u/Cj4+IAo+Pj4+Pj4g
IkdpdWxpbyIgPT0gR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVl
cmluZy5jb20+IHdyaXRlczoKPiAKPj4gT24gMi80LzI2IDEwOjQ2LCBQZXRlciBLb3JzZ2FhcmQg
d3JvdGU6Cj4+Pj4gVGhhdCdzIHdoeSBJJ3ZlIHBvaW50ZWQgb25seSB0aG9zZSAyIENWRXMuIFdh
cyBpdCBjb3JyZWN0Pwo+Pj4gTm8sIHRoZXkgd2VyZSBmaXhlcyBmb3IgaXNzdWVzIG9ubHkgaW50
cm9kdWNlZCBpbiB0aGUgOS4yMC54IHNlcmllcywKPj4+IHNvCj4+PiB3ZSB3ZXJlIG5ldmVyIHZ1
bG5lcmFibGUgdG8gdGhlbS4KPiAKPj4gQnV0IGlmIHdlIHdlcmUgYnVtcGluZyB0byA5LjIwLjE3
IHRoZXkgd2VyZSByZXF1aXJlZCwgY29ycmVjdD8KPiAKPiBZZXMsIGlmIHdlIHdlcmUgdG8gbW92
ZSB0byA5LjIwLnggdGhlbiB3ZSBzaG91bGQgbmF0dXJhbGx5IG5vdCBtb3ZlIHRvIGEKPiB2ZXJz
aW9uIHRoYXQgaW50cm9kdWNlcyBuZXcga25vd24gdnVsbmVyYWJpbGl0aWVzIC0gQnV0IGFzIHRo
ZSB2ZXJzaW9uCj4gd2UgdXNlZCBiZWZvcmUgd2FzIG5vdCB2dWxuZXJhYmxlIHRvIHRob3NlIGlz
c3VlcyBpdCB3b3VsZCBiZSB3cm9uZyB0bwo+IHNheSB0aGF0IHRoZSB2ZXJzaW9uIGJ1bXAgZml4
ZXMgdGhvc2UgdHdvIGlzc3VlcyAoRS5HLiB0aGUgTFRTCj4gbWFpbnRhaW5lcnMgd291bGQgdGhp
bmsgdGhhdCB0aGV5IGhhdmUgdG8gZ28gdG8gOS4yMC54IHRvIGZpeCBzZWN1cml0eQo+IGlzc3Vl
cywgd2hpY2ggaXMgbm90IHRoZSBjYXNlKS4KPiAKPj4gT3RoZXJ3aXNlIHJlYWxseSBJIGRvbid0
IGdldCBpdAo+IAo+IEhvcGVmdWxseSB0aGUgYWJvdmUgbWFrZXMgaXQgbW9yZSBjbGVhcj8KCk9o
LCBub3cgSSBnZXQgaXQhIFRoYW5rcyBhIGxvdCBmb3IgY2xhcmlmeWluZy4KCkdpdWxpbwoKPiAK
PiAtLQo+IEJ5ZSwgUGV0ZXIgS29yc2dhYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
