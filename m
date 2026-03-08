Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8C2EA8545
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 21:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D13C40CB9;
	Sun,  8 Mar 2026 21:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PwnLt7z0EKHa; Sun,  8 Mar 2026 21:55:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B922040C78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773006930;
	bh=jxtapTctelGXGfNB7dGsZVGLS6xOTkwdGk2sM3Ep5As=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ru+Z3jehPbx7T/FLLdOiYzeK8PeiaCLqW4eRlzIxY4rndbaazjFfFfmq7CNSajh1u
	 C3cvOm8YX/YOSf9/QmWqxYlC5GY0dkcw2ODqM6XszZG4bcsGTFB5T+GZ1tc7KLrzsp
	 YKOd692kCm51iJ+g/tJfkB5jjIpt8lPmrfR/7b++/qUCXz8FfwoCrfOqqAPdvXkm2r
	 04eQwUzouPsxAZ1XNb0Y+49Xq+OqQcYdo0uSm56y0hVj/0jyMaTc9JfTdNqoOew/IM
	 kG6ZyyzKKPVcVwQ/gyoGR8fcczTAleYKrEJYjmqvgbG0TMqV2W/JNX8sFwdQ4owWVW
	 SHK/QEPo2eM4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B922040C78;
	Sun,  8 Mar 2026 21:55:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 97DF7119
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 897334008D
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q97C67DX4tqU for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 21:55:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5FA6540064
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FA6540064
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FA6540064
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:55:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C1AE35FFB4;
 Sun,  8 Mar 2026 22:55:22 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 08 Mar 2026 22:55:22 +0100
MIME-Version: 1.0
Date: Sun, 08 Mar 2026 22:55:22 +0100
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
In-Reply-To: <20260303083702.2275652-2-buildroot@heine.tech>
References: <20260303083702.2275652-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.13
Message-ID: <171fa9c539e7192d6e1006e23e08c370@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773006926;
 bh=uWFeRKLIeHUY1TFGrI8HnpyePXLhZdK1iYLdTU7UA5Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qRWUEuObkrVpT8yU8RQJSc860Qy2VSXktg4yL3IxWz6l9OGga/eMqRio7h3eZbtyh
 OY/SqZr38c+HYh5SPHVKzHUXoTYP5H9wFig8tegruA72Qo95wxaviB4VvrqArXa8ZT
 GRik4/Fv9sRrOJkHfkJ5mCOky9T3DSVP4D1mdi8n1WU968XaquNz+B+Xe6l2VJPWrW
 zJ7H98nfPh53HUKYZx+PiV4Ac6agF3YspATFaydfsfSW/TaZh4v/zZJ8KSOKAgTy0b
 D76zuT//N8oWfDJGdFYw9xKoGWPOUGSYE2Mj1W0epeOcLg03LS3UznFPJHsGQCfztL
 UI0dN0nodKT5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qRWUEuOb
Subject: Re: [Buildroot] [PATCH] package/{python-}protobuf: bump to version
 34.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWljaGFlbCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKT24gMDMvMDMvMjAyNiAwOTozNiwg
TWljaGFlbCBOb3N0aG9mZiB2aWEgYnVpbGRyb290IHdyb3RlOgo+IC0gY29udGFpbnMgYnJlYWtp
bmcgY2hhbmdlcywgaGVuY2UgcHl0aG9uIG1ham9yIHZlcnNpb24gaXMgYnVtcGVkIHRvIDcuCj4g
Cj4gQ2hhbmdlbG9nOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9wcm90b2NvbGJ1ZmZlcnMvcHJvdG9i
dWYvcmVsZWFzZXMvdGFnL3YzNC4wCj4gCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBOb3N0aG9m
ZiA8YnVpbGRyb290QGhlaW5lLnRlY2g+Cj4gLS0tClsuLi5dCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcHJvdG9idWYvcHJvdG9idWYubWsgCj4gYi9wYWNrYWdlL3Byb3RvYnVmL3Byb3RvYnVmLm1r
Cj4gaW5kZXggYjIwNDZlMDU3Yi4uMWQxMTBmZGJmMCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3By
b3RvYnVmL3Byb3RvYnVmLm1rCj4gKysrIGIvcGFja2FnZS9wcm90b2J1Zi9wcm90b2J1Zi5tawo+
IEBAIC03LDcgKzcsNyBAQAo+ICAjIFdoZW4gYnVtcGluZyB0aGlzIHBhY2thZ2UsIG1ha2Ugc3Vy
ZSB0byBhbHNvIHZlcmlmeSBpZiB0aGUKPiAgIyBweXRob24tcHJvdG9idWYgcGFja2FnZSBzdGls
bCB3b3JrcyBhbmQgdG8gdXBkYXRlIGl0cyBoYXNoLAo+ICAjIGFzIHRoZXkgc2hhcmUgdGhlIHNh
bWUgdmVyc2lvbi9zaXRlIHZhcmlhYmxlcy4KPiAtUFJPVE9CVUZfVkVSU0lPTiA9IDMzLjUKPiAr
UFJPVE9CVUZfVkVSU0lPTiA9IDM0LjAKClRoaXMgbmV3IHZlcnNpb24gYnJlYWtzIHRoZSBidWls
ZCBvZiBwcm90b2J1Zi1jLiBZb3UgY2FuCnJlcHJvZHVjZSB0aGUgaXNzdWUgd2l0aCB0aGUgY29t
bWFuZDoKCm1ha2UgaG9zdC1wcm90b2J1Zi1jCgpJdCBmYWlscyB3aXRoIHRoZSBlcnJvcjoKCnBy
b3RvYy1nZW4tYy9jX2J5dGVzX2ZpZWxkLmNjOjk3OjI0OiBlcnJvcjog4oCYY29uc3QgY2xhc3Mg
Cmdvb2dsZTo6cHJvdG9idWY6OkZpZWxkRGVzY3JpcHRvcuKAmSBoYXMgbm8gbWVtYmVyIG5hbWVk
IOKAmGxhYmVs4oCZOyBkaWQgeW91IAptZWFuIOKAmExhYmVs4oCZPwoKU2VlIGFsc286Cmh0dHBz
Oi8vZ2l0aHViLmNvbS9wcm90b2J1Zi1jL3Byb3RvYnVmLWMvaXNzdWVzLzc5NQoKSSdkIGxpa2Ug
dG8gbWVyZ2UgdGhhdCBwYXRjaCBvbmx5IHdoZW4gcHJvdG9idWYtYyB3aWxsIGJlCmFibGUgdG8g
Y29tcGlsZSB3aXRoIHRoaXMgbmV3IHByb3RvYnVmIHZlcnNpb24uCgpDb3VsZCB5b3UgaGF2ZSBh
IGxvb2ssIHBsZWFzZT8KCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
