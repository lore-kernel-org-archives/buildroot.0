Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66F6C0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 11:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51C9C415D9;
	Sat, 12 Aug 2023 11:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51C9C415D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NpI_Wiq6Dbe6; Sat, 12 Aug 2023 11:06:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E9F9415BF;
	Sat, 12 Aug 2023 11:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E9F9415BF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51D091BF57C
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 11:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29644415BF
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 11:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29644415BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id if31cdp3n1pJ for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 11:06:10 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6D634156E
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 11:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6D634156E
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id 1AC81A07D8;
 Sat, 12 Aug 2023 13:06:08 +0200 (CEST)
Received: from smtp03.mail.de (smtp03.bt.mail.de [10.0.121.213])
 by postfix01.mail.de (Postfix) with ESMTP id 0059B8020A;
 Sat, 12 Aug 2023 13:06:07 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp03.mail.de (Postfix) with ESMTPSA id C2D80A032E;
 Sat, 12 Aug 2023 13:06:07 +0200 (CEST)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Aug 2023 13:06:07 +0200
Message-ID: <5967844.lOV4Wx5bFT@kilian-aisec>
In-Reply-To: <20230812121951.582dd68f@windsurf>
References: <2691942.mvXUDI8C0e@kilian-aisec>
 <21974407.EfDdHjke4D@kilian-aisec>
 <20230812121951.582dd68f@windsurf>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1135
X-purgate-ID: 154282::1691838367-BBFFF647-8A5F1AD2/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691838368;
 bh=wN91Pz8+nWInBCFGH5z1Fy6MBBRKsS+IXRT1hGovL/I=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=Di3ohReETpOG0YlluZA/yZHQMe9cZYXKQ1q2lCIZuK0cwzCHeUIUSlW76oTcDAZ+7
 Z5R94JKqzDZ5+axOwY0uR29Jz/7QfmiqX/HR+0hUeCS4CcfXY1lnRVsPliXbK2sC7F
 YEnefzmkQdwxZg/y79zZmDZvm4JpSOeQFfcK2KQnX48klHTi6MS4lMTg30WI8iLtJk
 /61cE8yoIFD/5Bu8NVDTgpzLB0mKqvYrV5R9SS31kiNzobknb7Y7ttlKIgha6WYigb
 BcmMjH48rJQxGAidbSsTyIZduT4YlqlWme/CX8lXamJjbJUm7VdhZeiEtVyWyNuysM
 IM0SKb4tYpxhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=Di3ohReE
Subject: Re: [Buildroot] Interested in board support for BeagleV-Ahead
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKPiA+IFllcywgSSByZWFsbHkgYXBwcmVjaWF0ZSBhbGwgaW5mb3JtYXRp
b24gdGhhdCBtYXkgaGVscCEgSSBhbSBub3QgdmVyeQo+ID4gZXhwZXJpZW5jZWQsIGVzcGVjaWFs
bHkgd2hlbiBpdCBjb21lcyB0byBhc3NlbWJsaW5nIGEgYm9vdCBpbWFnZSBmcm9tIHRoZQo+ID4g
YXJ0aWZhY3RzLCBzbyBpdCB3b3VsZCBiZSBhIGdyZWF0IGhlbHAuCj4gCj4gV2FudGVkIHRvIGV4
cGVyaW1lbnQgYSBiaXQuIFR1cm5zIG91dCB0aGF0IHRoZSBVU0IgVFRMIGNhYmxlIEkgaGFwcGVu
Cj4gdG8gaGF2ZSB3aXRoIG1lIGZhbGxzIGludG8gdGhlICJJdCBoYXMgYmVlbiBub3RpY2VkIHRo
YXQgNnBpbiBGVERJCj4gY2FibGVzIGxpa2UgdGhpcyBkb2VzbuKAmXQgc2VlbSB3b3JrIHdpdGgg
QmVhZ2xlViBBaGVhZCBkZWJ1ZyBwb3J0IGFuZAo+IHRoZXJlIG1pZ2h0IGJlIG90aGVyIGNhYmxl
cy9tb2R1bGVzIHRoYXQgd2lsbCBzaG93IGdhcmJhZ2Ugd2hlbgo+IGNvbm5lY3RlZCB0byB0aGUg
Ym9hcmQiIGF0Cj4gaHR0cHM6Ly9kb2NzLmJlYWdsZWJvYXJkLm9yZy9sYXRlc3QvYm9hcmRzL2Jl
YWdsZXYvYWhlYWQvMDItcXVpY2stc3RhcnQuaHRtbAo+ICwgc28gSSBkb24ndCBoYXZlIGFjY2Vz
cyB0byB0aGUgYm9hcmQgVUFSVCB0byBleHBsb3JlIHRoaW5ncywgc2FkbHkuCgpZZXMsIHNhbWUg
cHJvYmxlbSBvdmVyIGhlcmU6IE5vbmUgb2YgbXkgRlRESSBjYWJsZXMgd29ya3MuIFRoZXJlIGlz
IGFsc28gYSAKZm9ydW0gcG9zdCBhYm91dCB0aGlzLiBJIGRpZCBoYXZlIG9uZSBjaGVhcCBhZGFw
dGVyLCB0aGF0IGRpZCB3b3JrIGluZGVlZCwgCmhvd2V2ZXIgaXQgZGVjaWRlZCB0byBub3Qgd2Fu
dCB0byBjb250aW51ZSB3b3JraW5nIGZvciBzb21lIHJlYXNvbi4gSSBvcmRlcmVkIAphIGZldyBv
bmUgd2l0aCBhIENQMjEwMiwgbGlrZSBpdCB3YXMgc3VnZ2VzdGVkIG9uIHRoZSBmb3J1bS4gVGls
bCB0aGV5IGFycml2ZSAKKGFyb3VuZCBtaWQgb2YgbmV4dCB3ZWVrKSB0aGVyZSBpcyBub3QgdG9v
IG11Y2ggSSBjYW4gZG8sIHRvbyAuLi4KCkJlc3QgcmVnYXJkcywKS2lsaWFuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
