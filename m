Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9A2606A31C
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 11:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eHPWwExy
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2EBF606E0;
	Wed, 11 Nov 2026 11:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xMkkhDFxAg2; Wed, 11 Nov 2026 11:14:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E192760796
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794395690;
	b=NlJZLSoWqnaygv1pOegM0wEVqDQDxZ2w29nVxgsiP9FlnQIoQ0nm0xhU/SVDnkoheBys
	 yMUcYY2tx8YwOKTAFZt4rCErIbuxfCFP4kHpP3Nahzgd5v7UCglF7oo9w2GxGD5sS+leg
	 d2xu1bsmEirS8Nh9ZI4MXJBm6Ro3lxxHUj0iFabjzVh7H1NqJ08YLae3JOKW3NzQ41h4G
	 psbNDPxKve+lpnHNI3ffqsKuRL/8YzB9XVUyyl7QC9WqDSrrw/MR9HGNC0MRpTtwfxvV4
	 Nbka1WY9WjHBfhfOAmyXsC5b6O2LPDFscyaBBQcLpydlbK+VnWQtfypyFrPlf79MsMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794395690;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=t5wjmX8TsIv+sc+UMnfB2w/BWTU9f5AxPti6MUHuAZI=;
	b=NWWv5QBocYV5RnsSHxPyxxwpHEmKO0pOY+OK01utxeA/a+4w8hqdw/t502dREB7XIfah
	 2Wg0cY2ROJWCQe3LolvwRi3oE3t7FzUJhyHx2ol1rCjRZ+vxQ5zyqsm9eSbGx0a8QR+Am
	 R1H+DDMgeSdqWLeBVbw/EmEAHLaXJNTfwlI3aqAJttSbj2bDrqFBt/0MuWJMoQR55xcmy
	 7n9SclM5LrSSVwP+z9wV28s/e6ZAxbjv46aodszw9OOpXy8yVOSOUDBDSFMGR28OrdpOu
	 /uXGfoby7AG9gwG6UWFAKtVvFZquXEfsm1RHosPe+V0XOrtdJ0xg/JI4LA4G2QO2Rrg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794395690;
	bh=t5wjmX8TsIv+sc+UMnfB2w/BWTU9f5AxPti6MUHuAZI=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eHPWwExybjQLkF1vA+9rimPoK8BwqrRckRyAHXvjCa76AyTxLg9hC9Thx651foeC9
	 2oe/sy1EKRqwBNbNBsEfuiPwB8fyxPppOF0rqv3udqkzOWn5APYN53kk4oxzezS6tF
	 g1jF9E6MOsfOl2gqe98FFJMbmh8eSPc1RDDynpCAgbeFV1oyc1GINpen19oYd7u+sR
	 C9LgupR9QbRQMSRDg2h4QCnPXdaDrfoLqdXxLVylxbxWY62tlE6+xDFWA/LTp8XJ0q
	 yDoCMo+g8YGp+T9aDVXFRiyYzVwRh3tAUP2nCudOyYx2sFxIS+tVNJJKYIXfc2fqJU
	 kLUcYayB5w8JQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E192760796;
	Wed, 11 Nov 2026 11:14:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7425B731
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5989240B04
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEyMwO_edoTM for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 11:14:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 325D740AF4
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 325D740AF4
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:14:46 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c4203bbb1e9so457160366b.3
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 03:14:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794395684; x=1795000484;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dn9EGPDmOdLbdro9ykLsUwPjHdI1Y6s116FJCag019o=;
 b=JSK1W4EdS4SdD2VAuHIAxCYigB47tfK3DeOM1B7916R4xEktv5qr7M6PJ/jrpUgL8z
 gtxds0stTCWX4wYOLYlNlq/U/+QbesDJeUOuqHIp+dXAlqzbieGJ7LfHaRDbn3uymARC
 rAAGhkQzV1XVrRijJo2wdsw/Sh5vJdeNi3fVPauiuW/0fEHlWC2Dr9ibLkWYrnolYKW+
 osoMmlbxkerzw9HxJRAeSq9yHGsIUTmQnIpsWOIJo2WLhIkmCjrKAd5HH2EBDokzkZmE
 OtFSUW7mtd8nZfVlRrEJxn5n67tHCgz75+BN708WlqJFCnaDEy04YDebMFJ58UN913Ez
 UO+A==
X-Gm-Message-State: APuU4Z9GSgK6rqOk71iPFrxDLBehuN7hnikeQnPjEQgXaK8ADUJYhfWz
 BlqlRZUjiIdqegw6ATPHyGX8xZp8dTKJ/PIUqYzAxZ0OLivuMFKGwTYcAOrYHY75oyYbwikzB9L
 6NQBzfGNeeXKU7ho/MBEdzHkbcRbUv+uacQ==
X-Gm-Gg: AYBFou2rVxsgzj4KtskzNgytvTpwcRgmao8xCRIkODLTg5oTIA4mKytWX75IR4vqVBI
 sN1LakJ7OlH1czmZzxA695cWX2yIzsIrF2KEvLUi7tjmM8Avyjd7UN2bmEIODKMS2i4cyGbK017
 QQdPdeTIvtWyB48YIxp4X/+4/AepB1UOctadGrAiGz1vl2wtJp7SxuzGkiKaagMrwzLTFXL8iXl
 924rZiBt38g5zyAEmYQFeQDoaCOhXGgSq5W8JgFmP8IhNxBrA1hSUKIOUNj7VcnboO7daGftVCn
 KbCeJroO1MEBwfc1Q5wyA02SnAL5XhghAXjyqyAEu4uJ84JzDGQgH+ZmIoYcretKW/8jAeTmgmz
 wpK8qLn7Ob93Rfp2rzm7Kn3KiJprSI2AyfXkxUg==
X-Received: by 2002:a17:907:2d27:b0:c2e:4a61:d436 with SMTP id
 a640c23a62f3a-c5066d3bd65mr168938966b.36.1794395684192; Wed, 11 Nov 2026
 03:14:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111081946.3850218-1-yegorslists@googlemail.com>
 <878q2zmxq9.fsf@dell.be.48ers.dk>
In-Reply-To: <878q2zmxq9.fsf@dell.be.48ers.dk>
Date: Wed, 11 Nov 2026 12:15:06 +0100
X-Gm-Features: AclHuK-K90G4NfYItROB1_f6I1O221MjNvd5vNhQd8tZKMS404T23N6z6OWOwD8
Message-ID: <CAGm1_ks5cqsnUXwepApaQ0C=s3b1u8rqu-Xiv2mStVAKWj6KHg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH] package/am335x-pru-package: fix host build
 with GCC 15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgUGV0ZXIsCgpPbiBXZWQsIE5vdiAxMSwgMjAyNiBhdCAxMjowOOKAr1BNIFBldGVyIEtvcnNn
YWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JvdGU6Cj4KPiA+Pj4+PiAiWWVnb3IiID09IFll
Z29yIFllZnJlbW92IHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cml0
ZXM6Cj4KPiAgPiBUaGUgaG9zdCBwYXNtIGFzc2VtYmxlciBmYWlscyB0byBidWlsZCB3aXRoIEdD
QyA+PSAxNSBvbiB0aGUgaG9zdDoKPiAgPiAgIHBhc20uYzogSW4gZnVuY3Rpb24gJ21haW4nOgo+
ICA+ICAgcGFzbS5jOjQzNzo5OiBlcnJvcjogdG9vIG1hbnkgYXJndW1lbnRzIHRvIGZ1bmN0aW9u
ICdwcENsZWFudXAnOyBleHBlY3RlZCAwLCBoYXZlIDEKPiAgPiAgICAgNDM3IHwgICAgICAgICBw
cENsZWFudXAoUGFzcyk7Cj4gID4gICAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+IH5+fn4KPiAg
PiAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBwYXNtLmM6NzU6Cj4gID4gICBwYXNtLmg6NTc2OjY6
IG5vdGU6IGRlY2xhcmVkIGhlcmUKPiAgPiAgICAgNTc2IHwgdm9pZCBwcENsZWFudXAoKTsKPiAg
PiAgICAgICAgIHwgICAgICBefn5+fn5+fn4KPgo+ICA+IHBwQ2xlYW51cCgpIHRha2VzIG5vIGFy
Z3VtZW50cywgYnV0IG1haW4oKSBwYXNzZXMgb25lLiBUaGUgZW1wdHkKPiAgPiBwYXJhbWV0ZXIg
bGlzdCBpbiBwYXNtLmggaGlkIHRoZSBtaXNtYXRjaCB1bnRpbCBHQ0MgMTUsIHdoaWNoIGRlZmF1
bHRzCj4gID4gdG8gQzIzLCB3aGVyZSAiKCkiIG1lYW5zICJubyBwYXJhbWV0ZXJzIi4KPgo+ICA+
IEFkZCBhIHBhdGNoLCBzdWJtaXR0ZWQgdXBzdHJlYW0sIHRoYXQgZHJvcHMgdGhlIGV4dHJhIGFy
Z3VtZW50Lgo+Cj4gID4gVGhpcyBpc3N1ZSBoYXMgYmVlbiBwcmVzZW50IHNpbmNlIGNvbW1pdCA3
MjVlZmVmODMxM2EKPiAgPiAoImFtMzM1eC1wcnUtcGFja2FnZTogbmV3IHBhY2thZ2UiKSwgYXMg
dGhlIGJvZ3VzIGNhbGwgaGFzIGJlZW4gaW4KPiAgPiBwYXNtIHNpbmNlIDIwMTIsIGJ1dCBpdCBv
bmx5IHNob3dzIHVwIHdpdGggYSBHQ0MgMTUgaG9zdCBjb21waWxlci4gSXQKPiAgPiB0aGVyZWZv
cmUgYWZmZWN0cyAyMDE0LjExIGFuZCBsYXRlciwgaW5jbHVkaW5nIHRoZSAyMDI1LjAyLnggYW5k
Cj4gID4gMjAyNi4wMi54IExUUyBicmFuY2hlcy4KPgo+ICA+IEZpeGVzOgo+ICA+IGh0dHBzOi8v
YXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9kNmU3MGQyMDBhM2E3MDAzYTFkM2ZiMDMw
MDBmY2ZiZDZiOWRjYzU2Cj4KPiAgPiBGaXhlczogNzI1ZWZlZjgzMTNhZTU1OTFiYjQ5N2ZlYzNh
YTdlNjI3MTdhZjlhMiAoImFtMzM1eC1wcnUtcGFja2FnZTogbmV3IHBhY2thZ2UiKQo+ICA+IEFz
c2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNS01Cj4gID4gU2lnbmVkLW9mZi1ieTogWWVn
b3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgo+Cj4gQ29tbWl0dGVkLCB0
aGFua3MuCgpUaGFua3MuIFNob3VsZCB3ZSBrZWVwIHRoaXMgcGFja2FnZSBhdCBhbGw/IFRoZSBs
YXN0IGNvbW1pdCB3YXMgaW4KMjAxOC4gSXQgbG9va3MgYWJhbmRvbmVkLgoKWWVnb3IKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
