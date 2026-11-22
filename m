Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F218C606A31A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 19:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QXB/yybD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=D38PodL2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD23B80BB7;
	Sun, 22 Nov 2026 19:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvMXDTx2T7LF; Sun, 22 Nov 2026 19:44:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5633C80BB9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795376690;
	b=bLxoAgV3JL45eq8fTVNoCi0+WTwjQue/ajmt8TIqfPLr1yfkxvhEhtm2Xkj90NWyvl8E
	 OpVsEYVvaGqGr80Bzd1WCv4HlJ1Xv3oiF7YYOhxZ6aHho1hbpcEg+CTjtJLYNXyxW+cBS
	 +Y0UHDxmC3XxP9ETP4O4erAdpp2QD2wHiAdIBsWLhgLu8lY0qYY2H3nApg0dA0FaPflUo
	 z1nULRiYM8NGvURnSVJ0rhsWCE+GIDusDu5vwqa37/TeelLk3uODu8x9wF5iQl75BzFna
	 trNbuf+M3SzthRDSm/VdcTwV/xBxvgUqv/xQVocfSScHsl7VTsQa41K5UoJUqmwx4zg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795376690;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=D/deIcjbfbMCms9CdfaA+7Zaov+1UA6wP7IM0xUXelI=;
	b=pYhA1P6rTfrJCF4DuYzXG8T6X6nr7vRg1LCPETDGwDO37Fv0V0OK4Tl3IzGULdfLMAcq
	 C5BwA2CaTjf8t3LLHkYdAdEpVopUoSI5ll3UfvbY0pfYR4esEWNEUNPX/tq4GPgFG5qu5
	 pNcH67pMVS9ouLpIUjTsnv5EfynejxvDJBL7gaEM8G0pNERoo2xt0dchc+fclYic9bIfP
	 cSrw/q9oHI1ZY84XQlUz6rcv3+r8Z7CHaG4I0/X43JQOh1qGnGh+y+pmWVJR7PNS6CcFL
	 3bx/YSXEjnn49+SP+twRgT4NX4ZiXtQ9/4uDcgc2sWP7BPDQ9hd18jCKASlQOCIt/+Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795376690;
	bh=D/deIcjbfbMCms9CdfaA+7Zaov+1UA6wP7IM0xUXelI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QXB/yybDfFaDlpA4FY8QAVPCSwmfaz316KZfZ4+tyNjBzyzFTEMU+g5/s+17TONHC
	 E1TkV7gC1Vo7+S9sZPV3sSEVltSwj+BbqrwR2euARktNCqESe0im0vQLaWAlPab1gX
	 DfwBtdNtX2UNZ6Qc2lNygpL2/0nJF3Wov71i0Lf1ZMnMHyWLWs28dKcN5Rk7UvErLJ
	 i6SsQWbaKHswWZjd+n+PR31ZiBd2MyAD+MSQSweDF8Hzn2T5It+RZyFCa/7Ckde8lq
	 3GQvm4QlTINYCJ4amr4V3aLD58piB1Y3EWIjga5ilMwWafRMpZk16mpw1RbIwy+2Ev
	 DlHQ+cMzz1hsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5633C80BB9;
	Sun, 22 Nov 2026 19:44:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A4A4371
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 19:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 408654008C
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 19:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQWWu8_sAxz4 for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 19:44:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 689AB4008B
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=D38PodL2
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 689AB4008B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 19:44:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=D38PodL2LV1EMd1TAuiGMVOjqapl+n/XCb+yALZFdhUoRR6/LSFeZZjdC+V1sxQgHRu09kwSzJ6IRUMmDdFTBpFiKcue0lJ50++aBU3nPvCZn8/DT6VFXhkakjQqp09DCyUzSOh12a5ESE74GFXsF1k7VEbsLHvp5dTBtubRKTmMBgYsAGBo6OHzlr9oTBBiu3M1YD3rmqROugvdRF8vjZxHaw3DKIXS0OcxiH5vx61IKidIdffWg0iacXTr6j5WZY3pUeg9wYgQOqIeIPTco60ZBJfQS0LSUtM2znlUTGpHdC6oYpiz4LZlW9rAqRS6ggc/94kBd9zpRhItxdpDUw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=F49MakMmWHc4WwIkI5BG7xq2bAQxZp5PQlYuPFhzLeU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1979931685; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 22 Nov 2026 19:44:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xVDUQ-00000006J0S-3H7P;
 Sun, 22 Nov 2026 20:44:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= via buildroot
 <buildroot@buildroot.org>,  Julien Olivain
 <ju.o@free.fr>,  Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <8dae3bc9-d241-4a32-bb43-46339dc5889a@mind.be> (=?utf-8?Q?=22?=
 =?utf-8?Q?Rapha=C3=ABl=09M=C3=A9lotte=22's?= message of "Sun, 22 Nov 2026
 19:49:28 +0100")
References: <20261120100106.542645-1-raphael.melotte@mind.be>
 <8733svvd2w.fsf@dell.be.48ers.dk>
 <8dae3bc9-d241-4a32-bb43-46339dc5889a@mind.be>
Date: Sun, 22 Nov 2026 20:44:42 +0100
Message-ID: <87tsl8mz11.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: test_grub: fix test by
 selecting BR2_i386=y
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pj4+Pj4gIlJhcGhhw6tsIiA9PSBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1p
bmQuYmU+IHdyaXRlczoKCkhpLAoKID4+IFdoeT8gVGhvc2UgYnJhbmNoZXMgZG8gbm90IChhbmQg
c2hvdWxkIG5vdCkgaW5jbHVkZSB0aGUgY2hhbmdlIHRvCiA+PiB0aGUgZGVmYXVsdCBhcmNoaXRl
Y3R1cmUuCgogPiBJbmRlZWQsIHRoZSBjb21taXQgdGhhdCBjaGFuZ2VzIHRoZSBkZWZhdWx0IGFy
Y2hpdGVjdHVyZSBpcyBub3QKID4gaW5jbHVkZWQgaW4gdGhlIExUUyBicmFuY2hlcy4KCiA+IElu
IHRoaXMgY2FzZSB0aGVyZSB3YXMgbm8gc2luZ2xlIHN0cm9uZyByZWFzb24gdG8gY2hlcnJ5LXBp
Y2sgdGhlCiA+IGNoYW5nZSBidXQgSSBzYXcgdGhlIGZvbGxvd2luZyBzbWFsbCBvbmVzOgoKID4g
LSBUaGUgdGVzdCBub3cgc3RhdGVzIGl0cyBhcmNoaXRlY3R1cmUgZXhwbGljaXRseSwgc28gYSBy
ZWFkZXIgZG9lcwogPiAgIG5vdCBoYXZlIHRvIGtub3cgdGhlIGRlZmF1bHQgdG8gc2VlIHdoaWNo
IGFyY2hpdGVjdHVyZSBpdCB1c2VzLgogPiAtIEl0IHJlZHVjZXMgdGhlIGNoYW5jZSBvZiBjb25m
bGljdHMgaWYgd2UgYmFja3BvcnQgb3RoZXIgY2hhbmdlcyB0bwogPiAgIHRoZXNlIHRlc3RzIGxh
dGVyLCBhbmQga2VlcHMgc3VwcG9ydC90ZXN0aW5nIGNsb3NlciB0byBtYXN0ZXIuCiA+IC0gQXBh
cnQgZnJvbSB0aGUgY29tbWl0IG1lc3NhZ2UsIHdoaWNoIGlzIGNvbmZ1c2luZyBpbiB0aGUgTFRT
CiA+ICAgY29udGV4dCwgaXQgZG9lcyBub3QgY2hhbmdlIHRoZSB0ZXN0IGFzIEJSMl9pMzg2PXkg
aXMgYWxyZWFkeSB0aGUKID4gIGRlZmF1bHQgdGhlcmUuCiA+IC0gT24gbWFzdGVyLCBBRkFJQ1Qg
ZXZlcnkgcnVudGltZSB0ZXN0IG5vdyBzZXRzIGl0cyBhcmNoaXRlY3R1cmUKID4gICBleHBsaWNp
dGx5LiBDaGVycnktcGlja2luZyB0aGlzIG9uZSAoYW5kIHRoZSBvdGhlciBzaW1pbGFyIG9uZXMp
CiA+ICAga2VlcHMgdGhlIExUUyB0ZXN0cyBjb25zaXN0ZW50IHdpdGggdGhhdC4KCiA+IE5vbmUg
b2YgdGhvc2UgcmVhc29ucyByZWFsbHkgcmVxdWlyZSBpdCB0byBiZSBjaGVycnktcGlja2VkIGJ1
dAogPiBjb25zaWRlcmVkIHRvZ2V0aGVyIEkgYWdyZWVkIHdpdGggVGhvbWFzIFBlcmFsZSdzIGNv
bW1pdCBhbm5vdGF0aW9uCiA+ICgiTm90IG5lZWRlZCBidXQgZ29vZCB0byBoYXZlIikgdGhhdCBp
dCB3b3VsZCBiZSBiZXR0ZXIgdG8gaW5jbHVkZSBpdC4KCk9LLiBNYXliZSB5b3UgY291bGQgbWVu
dGlvbiBzb21ldGhpbmcgYWJvdXQgdGhpcyB3aGVuIHNlbmRpbmcgdGhlCm5vdGlmaWNhdGlvbiBt
YWlsIG5leHQgdGltZSB0byBtYWtlIHN1Y2ggdGhpbmdzIGNsZWFyPwoKLS0gCkJ5ZSwgUGV0ZXIg
S29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
