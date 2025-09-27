Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49258CAC5B0
	for <buildroot@archiver.kernel.org>; Sat, 27 Sep 2025 10:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E05184221F;
	Sat, 27 Sep 2025 10:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyymmMjjdCjW; Sat, 27 Sep 2025 10:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 231AF421F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 231AF421F9;
	Sat, 27 Sep 2025 10:38:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A100212D
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 10:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86D61421E5
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 10:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kzAlPvryc_65 for <buildroot@buildroot.org>;
 Sat, 27 Sep 2025 10:38:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.132;
 helo=smtpdh18-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD86F421DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD86F421DE
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD86F421DE
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 10:38:50 +0000 (UTC)
Received: from smtpclient.apple ([37.163.174.188]) by Aruba SMTP with ESMTPSA
 id 2SKEvtdEMUZSE2SKFvf4lF; Sat, 27 Sep 2025 12:38:47 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 27 Sep 2025 12:38:46 +0200
Message-Id: <ECCE8DCB-304F-40EC-A6BD-1DA56D9FC24A@benettiengineering.com>
References: <f133f133285ba3207a596e83284cf435@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <f133f133285ba3207a596e83284cf435@free.fr>
To: Julien Olivain <ju.o@free.fr>
X-Mailer: iPhone Mail (23A341)
X-CMAE-Envelope: MS4xfFRf67YEv4vGYK5Ci9/QmZh6Xydh7I+PnrinO6XvhRhY0p7SKKLPzD34++A/Hme1fZ/mkokL6peW7lgILHrdzVMcBJF2vfAHDmO1f63ZbZtCbxtTT1pR
 kFiNLhuNyoJfohxYla3OUAEmogIHTbF7LQYTX2r9w9SlhpPiyfFbyhmX2MoPE8422xyEIuCgO5MNs9h1RcYVv0fVUyOTg/u+5UpvqB8KLTRvlxhyjPjyCyUO
 5huWIMU7rd5YvwiFTp4KZQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1758969527; bh=Lmxn65ghXNPNBTkHThm/p5flHNLtMazfkDXgoGqH4+4=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=VjbmcUBynlKA5FxTCo6baJreFHWJxqHCcFsUTOIeI+2EH3Zq93KaItORgmb3pWbs1
 kPZ5QCbqOsMqRtILmd9f8cJXdknC3S4cf/R2WrXp4Q0b3tLDR2TsnRPja37RpdYhGH
 yhLiJR3fTPrwsuwPLSjaFFJLUm3YoskRc8arNZRqcuOjBvJpAM/wDjMRaBsReN8Are
 Q1ijgNwNvLVEfwtkJVgrSoCZtqy3Fg+qPyKJAy0u//aEaV7DpBdn63uhvo8ntcbZ0y
 lgJjWsFOWwn1WUEFEeDXWym4qi3ZduvyODEejtxb2tRpfHCUzEXKSofr33lLm8bRQo
 LFXTVFBXiszyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=VjbmcUBy
Subject: Re: [Buildroot] [PATCH] package/libblockdev: security bump to
 version 3.4.0
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

SGkgSnVsaWVuLAoKPiBJbCBnaW9ybm8gMjcgc2V0IDIwMjUsIGFsbGUgb3JlIDExOjA3LCBKdWxp
ZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPiBoYSBzY3JpdHRvOgo+IAo+IO+7v0hpIEdpdWxpbywK
PiAKPj4gT24gMjYvMDkvMjAyNSAyMzozNywgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+IFJlbGVh
c2Ugbm90ZXM6Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9zdG9yYWdlZC1wcm9qZWN0L2xpYmJsb2Nr
ZGV2L2Jsb2IvMy40LjAvTkVXUy5yc3QKPiAKPiBJcyB0aGlzIHJlYWxseSBhIHNlY3VyaXR5IGJ1
bXAsIGFzIHNhaWQgaW4gdGhlIGNvbW1pdCB0aXRsZT8KPiBJIGNhbid0IGZpbmQgYW55IGRpcmVj
dCByZWZlcmVuY2Ugb2Ygc2VjdXJpdHkgZml4IGluIHRoaXMgcmVsZWFzZSBub3RlLgoKUGFyZG9u
LCBubyBpdOKAmXMgbm90IGEgc2VjdXJpdHkgYnVtcCwgaXTigJlzIGEgd3JvbmcgY29weSBhbmQg
cGFzdGUgb2YgcHJldmlvdXMgcGFja2FnZSBidW1wIGxvZy4KRG8geW91IHdhbnQgbWUgdG8gcmVz
ZW5kIHRoZSBwYXRjaCB1cGRhdGVkPwoKQmVzdCByZWdhcmRzCkdpdWxpbwoKPiAKPj4gU2lnbmVk
LW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmlu
Zy5jb20+Cj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+IEp1bGllbi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
