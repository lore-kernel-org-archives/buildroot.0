Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECCD606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 21:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=n/JvbgJo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PRahcNre
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05157605F0;
	Sun, 25 Oct 2026 21:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_e37ajiAvVJ; Sun, 25 Oct 2026 21:47:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EDDE060612
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792964833;
	b=WsbNGsO615GophClaTKAzznSfupnm2s0GL6vLD0+gFd5dqy15zzdAo9exLEB6D4TYnKk
	 IS7vAeNkzHyo0ilJqDzqvyW4CHydXatRC0KMwFza9GbtB6nWrwQQPa/PYBKQnrsWkX5di
	 /H09FddS6bK/sHGgCwHHfa5iCRslEOE+wtcvQGQectUnqYl6VJqLJ+nJXlkgjmuhbyuOc
	 trZiRNVQq+PEjaOhaXwI4EPYvZgfmYA36rK1lzfaS25aMCK05TyUEldqiF0V6RRrX/TGp
	 GtUEuNlg90zf6e8BNDgTzzO0yiUVr9Rrdbo26f8NiKs1kRAd+bZQJw5MfrxiQQcn7cg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792964833;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=8PAJ63bida5bD8Nu0EzLWPYOsgZhwzRrnkw5AaWLM90=;
	b=q85ZNP0BwGx/PpZJy+eNqnx0Rtp8gBxJYu0TjXFkgQcPwg0zoqNqxw/3aH2zaLXj2yZC
	 diM7Q9YWJ0HhckX8R0iHUKLzrYlerUbVfNFm1HKsby2IAUlPhxGpY78Cj1kUgtJtiV6YG
	 QOqxsZj0qFFnsBO85l67fb2LO7uka19kluFCgRJXTXh8dNfny0P2b0AUKmNScUfIU13By
	 RsKcxJkje+UoE96k+pnxcwWqzMTKXjRYP8+frn1wD1k29nFVBX0vTe8p25jXvpVm14YOl
	 ouKfEryA2l0mr+RZG286xT3+g+pvLr4KCcraCqIIHbZqtxkEOaV2X/M6tY4bpEM8dKA==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792964833;
	bh=8PAJ63bida5bD8Nu0EzLWPYOsgZhwzRrnkw5AaWLM90=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n/JvbgJoEcfoALItUfoG9kUZFdOrNMSXwNYXvhIy5Y8XIDrlVOHwmZOuuueYF4LLX
	 KTcAPi0S8AETbAtM7+4HUku7Dso1tQWtQ5RhZFBZAHGPWfiZHf0Bs3SDCLILpZDmXS
	 nnQBwcHfkZx9diqkNlTvJqD49jhRzbHeju126EsbUz63NKmZSzDI3Bt7c1su0k4/1u
	 C4Gl5WyYXdpCDehjv7wEFRZJOdowJJEPD1cudXZpBtywVSUjm3SZ3NWhbueHCFoFE/
	 kIovnRqPzxRWVs25CRjXKt17TfJyWicsInZhPAgKv8h7Ludb9QPiAAo6TTjtLj5PUY
	 n6u94LPlDeURQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDDE060612;
	Sun, 25 Oct 2026 21:47:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C81B380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A451405BD
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7r5zTrW6XWSV for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 21:47:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 73B93405BB
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::e2b"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792964830;
 b=TjJ6Wo1RC/3KPn4hvu5rkfgRuUUIWK36NIJgsHn+BXXFjAlNocMZHA/ix+1bergk/bU4
 lbWcPFuHO+3ZIJh+BxKQner8fq3u/HphlKxrb0Ymyw0todzI4IPiXIrGKACtdriTNztZR
 fuMHtADDDw4wjCAeWa5anLJyPsZkYQ7iR350JkcvY7+bwGZMpbq1jGVH3Ai/jr5PbTBKt
 kw449V7LEz9SVuF208zAEIWvrwR8X/C+9yCwYjW8yvB9lGOTLkOnT6UZ+kVoEs+m5o8HA
 edeNsc/WYd7e2HfcZNu9b9CprbWOCObfMY4ybiHTtJ8UqDpLz0dNAD7hMKomp7Dcjew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792964830;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=ZFuIozxjBY3sjqGOBO6VRmh2mHkORMtDT2XaOOKwXRE=;
 b=pzTazDtqVDomy1GGYg1N9q6jwzHPPs7FqTfUv+STCe1YX1EVAF0ITbymiQH1sC92QZsR
 7t/Ld8UZEUTO+0XZNo7h8zagXDRAJy/01LOVXGZmZY7wl0kvMMegigsoF/bGHIw66QdF3
 Xyj37mI8F2niq5XA+wvZctoGTbkl5gZsmZ/XBuxXR8zVXzOcsrtN+8/AisMBW4SVxD12P
 rLGt9pFddV0tZGjTWUSg1Dzc/lUROqdeE+8PTA6oYLMUGt93LtGwNVbx9UyLs5QUPQRK0
 nvakWc5b8mpCQcP0L2fl6CZOya445VQTKZAup1ROfx5XwHYFwV9+Sio1Cjvq3DwvQoQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PRahcNre; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::e2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2b; helo=mail-vs1-xe2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PRahcNre
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73B93405BB
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:47:10 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-7cb6dc850c7so690221137.0
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 14:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792964829; cv=none;
 d=google.com; s=arc-20260327;
 b=XwG/HK+1Lwgd4CIhO3I0gsNuV42CrTc1h/nmSMyEpaYldzPErZqX651uEvg0CAFaMx
 nUrUH+LtE2TJp3Pf6Uoj8KwMb2BpBFToPVECGdqc2sTnkSFARUDXFBsgujNiQaXOePWR
 oDUlOJdtiudaGNX+3MefFFGq86LVHsGyoSWGs3um3WssjL4bs2TxNJmJP+dhGA/OB0GH
 Rfbnu4FeyWkaXM1S67EYoGN8EVLsResfmSOsnKRMNKGXigOi3rqm7l8ybuPKtaXHzsvJ
 QYq/x2/Pu7S99QFLED3ZcG/rO03sxrDkqupj+sDS2mwQzK80C1yBcUtLnOh1zGCAnmqK
 uICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ZFuIozxjBY3sjqGOBO6VRmh2mHkORMtDT2XaOOKwXRE=;
 fh=tCtZaDUGNWDAqkPIqjWN/gzDp7C+gGnCgNQZmLz7NOo=;
 b=O//TPDhuJaEzx9UUyaX/bM1ZJdEq10DuwiI7QqXXYGadiV00kUPX/ygxFJ2i4alEpO
 edb4MtTbRhVL0J5H2pJbIaLxyKH6WRFSGbGL3aNfKKsZflU6Y98fpk1pxYYp85HzxpyK
 JBRDX5YWFAeVX3XyNGqrk5NtGAsmWccrVQeJCp0QKaK/2dOKHJJAUA0uKvvQ6IjI6nnJ
 IMnCoEdY4We7WJusdl6HmpdzDQjwgkIC1IXaU2EitLA3ozc+Q+4q1Mxap9IJGJch5ZU7
 sdJfz/sW45BLNcTkGHGc6Fqohw4qO0d4WQadrwfRPE+TQpEiFj5v1rNdfCXANpN2yOrU
 2LkA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792964829; x=1793569629; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZFuIozxjBY3sjqGOBO6VRmh2mHkORMtDT2XaOOKwXRE=;
 b=PRahcNreY/UAKjugwHF0khnog5XrLw7b81E38tMTtHYGG15viJVFeuatHK5Hwyy7tC
 cAxGoaK/DgKOzFqt7bevsaSceEVcWGcOh8eDpzXFTuGr2mgmwUcl8xpEqT/nCSjrroKw
 M226Zq0ITL+AIYrhknJvwMp6ZhhRBpYzMvfgyPVEkcul7eEa74wpi6KLbXYf1Ru9kB52
 YjWjv/RRL3WAnSsSNlv2Y1IvNW8fws3UyvG0xkX1TKZ3ZmAd0dO8ujgSSBQByknbuIbe
 6DQt1/LWhVqtU3b2XpuN9ukpYYpmn9HB8ZQZhbQqQt0FYVrOgvu0QoVAAHIR4sxvyDjf
 OJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792964829; x=1793569629;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZFuIozxjBY3sjqGOBO6VRmh2mHkORMtDT2XaOOKwXRE=;
 b=FA1P9JU73uESwwwpML52vdRBbfOyyBR+TpnEAsXpE5ft3pnszpMzTxUkB2djVxnzUl
 dG7VlkaB7c8RV9Z/YgoFCQYim3JiDITJ0yZaxbZxuIUrPDC28qFUEMpixlbK/IooT9KN
 dDP3OqpiShdkjmYEIie2n5XZn8JkZ/iyGLLpmAY5JrXNN2LGkxMLAFe5NAhVPEMVD8QV
 HOxBAghTHbs1O7UFcphfXVvZ9RU15Fm81n5YDANIfAS2o+GNxIAxeG5CDZ8etRB7dAKm
 eIFoH0wL4zTOP4FkAkBLiCwlwuda2prpUg6sjuUm6vBIdQkgpip6Ho+uYaOx/G6UaC9O
 0ymw==
X-Gm-Message-State: AFq9FYIPkFlvqFgknbIK9qU2Il7Md+dMitGYGeRB/RBePOi/pT/JlgQG
 JsMqIPIRxFcXjg2hgTdBAkKhNros8kybOwkKWvu36z0rwUUU5ji4pQpOjXPKFGFHda+URQbxL7f
 LAuGZgUpk0cc/pp4ygKmbNIIYtAFK1eodn3stkHQ=
X-Gm-Gg: AYBFou0ni910QYJ58Z5SShdAG+1RfKFjyBmX++slE2DkXH7XOGc1kvOWy5CTdJ6bAlI
 Kc0rBdta3qLnl58h5mSoFWyGBIt5zyQCCwKPtP6vqy52f1hRZy/5Ujbu6JeVnj0Sty4c15qI8dg
 G0KcI3hkYzOaKuaxFrgpEHS9zs0pEqokFWgL3ny0fjWFMWzpwz6oGDe8BMpYGqPKqFZ9LyIdn1q
 aHnrjVZJooOBRS2t6iPSD6GKVi/uOQ0bUe8WWmrSEPgiSUitx97mKQsqbkPMS4TlkuDSyQecj8s
 Q91MaF+2TpFj8V361fFHEg7MSmuH4q7+OEREbDyLYv9S+30rTOpRIL0kfutRSR2H9bgcQYOWK1z
 gqijQeduZsTcDW3QlNPoSqGakfFeqKiMLHzbVg6Ts8j3yybMGwyZqAb6GYKOei/H8ClEBRmJ5KE
 44jwDXx5mq/k4DZMgaPyfQ+qtYOjAO6jbPkQ8Y0VXUbSBk4GltUMZXEcrlOJlErx/ptyDz1cFc5
 qtpaq+XKLMokEDAdLTltypRDNbGtlotS592NlFF8qLCvRyv0m4=
X-Received: by 2002:a05:6102:548e:b0:7cc:2946:7f69 with SMTP id
 ada2fe7eead31-7ce5cc8aa1emr1200794137.8.1792964828843; Sun, 25 Oct 2026
 14:47:08 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023074432.947659-1-yegorslists@googlemail.com>
 <CADvTj4rE1i=jV_Dc0AyCRi5c_7v=p8-4mEC4giRCysBkqBTQqg@mail.gmail.com>
 <CAGm1_ktqG-XEXUTLj6cYOyU8LXHos8Upp1L=fN_Nehq_kVR+DA@mail.gmail.com>
In-Reply-To: <CAGm1_ktqG-XEXUTLj6cYOyU8LXHos8Upp1L=fN_Nehq_kVR+DA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Oct 2026 15:46:57 -0600
X-Gm-Features: AclHuK-JqZIFIJfAZfiuNjb9M71BD7eIy3Zd79ett-QIxvcMtwgwpTzGblugkbU
Message-ID: <CADvTj4qUoqKkgSbbLyGGoM7kzNAn6RqjJM2qBroHKvD+o-qXQQ@mail.gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, 
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Subject: Re: [Buildroot] [PATCH] package/python-remi: fix build when
 setuptools_scm is installed
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBPY3QgMjUsIDIwMjYgYXQgMzo0MOKAr1BNIFllZ29yIFllZnJlbW92Cjx5ZWdvcnNs
aXN0c0Bnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBKYW1lcywKPgo+IE9uIFN1biwgT2N0
IDI1LCAyMDI2IGF0IDEwOjM44oCvUE0gSmFtZXMgSGlsbGlhcmQKPiA8amFtZXMuaGlsbGlhcmQx
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBPY3QgMjMsIDIwMjYgYXQgMTo0NOKA
r0FNIFllZ29yIFllZnJlbW92Cj4gPiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBweXRob24tcmVtaSBmYWlscyB0byBidWlsZCB3aGVuIGhvc3QtcHl0aG9u
LXNldHVwdG9vbHMtc2NtIGhhcyBiZWVuCj4gPiA+IGJ1aWx0IGJlZm9yZSBpdDoKPiA+ID4KPiA+
ID4gICBGaWxlICIuLi4vc2V0dXB0b29sc19zY20vX2ludGVncmF0aW9uL3NldHVwdG9vbHMucHki
LCBsaW5lIDE3NCwgaW4gZ2V0X2tleXdvcmRfb3ZlcnJpZGVzCj4gPiA+ICAgICBhc3NlcnQgaXNp
bnN0YW5jZSh2YWx1ZSwgZGljdCksICJ2ZXJzaW9uX2tleXdvcmQgZXhwZWN0cyBhIGRpY3Qgb3Ig
VHJ1ZSIKPiA+ID4gICBBc3NlcnRpb25FcnJvcjogdmVyc2lvbl9rZXl3b3JkIGV4cGVjdHMgYSBk
aWN0IG9yIFRydWUKPiA+ID4KPiA+ID4gcmVtaSdzIHNldHVwLnB5IGZpcnN0IGNhbGxzIHNldHVw
KCkgd2l0aCBzZXR1cF9yZXF1aXJlcz1bJ3NldHVwdG9vbHNfc2NtJ10uCj4gPiA+IFdpdGggYSBQ
RVAgNTE3IGJ1aWxkLCBzZXR1cHRvb2xzJyBidWlsZF9tZXRhIGJhY2tlbmQgYWx3YXlzIHJhaXNl
cwo+ID4gPiBTZXR1cFJlcXVpcmVtZW50c0Vycm9yIGZvciBpdCwgc28gdGhlIGJhcmUgZXhjZXB0
IGZhbGxiYWNrIGlzIGFsd2F5cwo+ID4gPiB1c2VkLCB3aGljaCBjYWxscyBzZXR1cCgpIGFnYWlu
IHdpdGggdXNlX3NjbV92ZXJzaW9uPUZhbHNlLiBJZgo+ID4gPiBzZXR1cHRvb2xzX3NjbSBpcyBp
bnN0YWxsZWQsIGl0cyB1c2Vfc2NtX3ZlcnNpb24ga2V5d29yZCBoYW5kbGVyIHN0aWxsCj4gPiA+
IHJ1bnMsIGFuZCBzaW5jZSBzZXR1cHRvb2xzX3NjbSA4LjAgaXQgcmVqZWN0cyBGYWxzZS4KPiA+
ID4KPiA+ID4gQWRkIGEgcGF0Y2gsIHN1Ym1pdHRlZCB1cHN0cmVhbSwgdGhhdCByZW1vdmVzIHRo
ZSB1c2Vfc2NtX3ZlcnNpb24KPiA+ID4ga2V5d29yZCBpbiB0aGUgZmFsbGJhY2sgaW5zdGVhZCwg
c28gdGhlIHN0YXRpYyB2ZXJzaW9uIGlzIHVzZWQgd2hldGhlcgo+ID4gPiBzZXR1cHRvb2xzX3Nj
bSBpcyBpbnN0YWxsZWQgb3Igbm90Lgo+ID4KPiA+IFRoaXMgc2VlbXMgZmluZSBhcyBhIHdvcmth
cm91bmQgYnV0IHByb2JhYmx5IGlzbid0IHdoYXQgdXBzdHJlYW0gd291bGQKPiA+IGFjdHVhbGx5
IHdhbnQgYXMgYSBwcm9wZXIgZml4Lgo+Cj4gSnVzdCBpbiBjYXNlLCBpIHB1c2hlZCB0aGlzIFBS
OiBodHRwczovL2dpdGh1Yi5jb20vcmF3cHl0aG9uL3JlbWkvcHVsbC81NTUKClllYWgsIEkgc2F3
IHRoYXQsIGJ1dCBmcm9tIG15IHVuZGVyc3RhbmRpbmcgdGhlIHByb2plY3Qgd2Fzbid0IHRyeWlu
ZyB0bwpyZW1vdmUgc2V0dXB0b29scy1zY20sIEkgY3JlYXRlZCBhbiBhbHRlcm5hdGl2ZSBtaW5p
bWFsIGZpeDoKaHR0cHM6Ly9naXRodWIuY29tL3Jhd3B5dGhvbi9yZW1pL3B1bGwvNTU2Cgo+Cj4g
PiA+Cj4gPiA+IFRoaXMgaXNzdWUgaGFzIGJlZW4gcHJlc2VudCBzaW5jZSBjb21taXQgODkzN2Ri
OGRkNTk1Cj4gPiA+ICgicGFja2FnZS9wa2ctcHl0aG9uLm1rOiBtaWdyYXRlIHNldHVwdG9vbHMg
dG8gcGVwNTE3Iik6IGJlZm9yZSBpdCwKPiA+ID4gc2V0dXAucHkgd2FzIHJ1biBkaXJlY3RseSBh
bmQgdGhlIGZpcnN0IHNldHVwKCkgY2FsbCBzdWNjZWVkZWQgd2hlbgo+ID4gPiBzZXR1cHRvb2xz
X3NjbSB3YXMgaW5zdGFsbGVkLiBDb21iaW5lZCB3aXRoIHNldHVwdG9vbHNfc2NtID49IDguMAo+
ID4gPiAoYnVtcGVkIGluIDIwMjQuMDIpLCBpdCB0aGVyZWZvcmUgYWZmZWN0cyAyMDI0LjA1IGFu
ZCBsYXRlciwgaW5jbHVkaW5nCj4gPiA+IGFsbCBtYWludGFpbmVkIGJyYW5jaGVzLgo+ID4gPgo+
ID4gPiBGaXhlczoKPiA+ID4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRz
L2NmMTk4NWMwMDhjMGFmNmEwYTJkYzA4Zjk4YWU0MjZiM2IxNzg3NGIKPiA+ID4KPiA+ID4gRml4
ZXM6IDg5MzdkYjhkZDU5NWUwOTg4NzUxZTVkYmI1NjhlODcwYjA3YjM5Y2MgKCJwYWNrYWdlL3Br
Zy1weXRob24ubWs6IG1pZ3JhdGUgc2V0dXB0b29scyB0byBwZXA1MTciKQo+ID4gPiBBc3Npc3Rl
ZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTUtNQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZZWdvciBZ
ZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogSmFt
ZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAg
Li4uZHJvcC11c2Vfc2NtX3ZlcnNpb24taW4tdGhlLWZhbGxiYWNrLnBhdGNoIHwgNDMgKysrKysr
KysrKysrKysrKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKykKPiA+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1yZW1pLzAwMDEtc2V0dXAucHkt
ZHJvcC11c2Vfc2NtX3ZlcnNpb24taW4tdGhlLWZhbGxiYWNrLnBhdGNoCj4gPiA+Cj4gPiA+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1yZW1pLzAwMDEtc2V0dXAucHktZHJvcC11c2Vfc2Nt
X3ZlcnNpb24taW4tdGhlLWZhbGxiYWNrLnBhdGNoIGIvcGFja2FnZS9weXRob24tcmVtaS8wMDAx
LXNldHVwLnB5LWRyb3AtdXNlX3NjbV92ZXJzaW9uLWluLXRoZS1mYWxsYmFjay5wYXRjaAo+ID4g
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gPiBpbmRleCAwMDAwMDAwMDAwLi42NzE5MGE0NTE5
Cj4gPiA+IC0tLSAvZGV2L251bGwKPiA+ID4gKysrIGIvcGFja2FnZS9weXRob24tcmVtaS8wMDAx
LXNldHVwLnB5LWRyb3AtdXNlX3NjbV92ZXJzaW9uLWluLXRoZS1mYWxsYmFjay5wYXRjaAo+ID4g
PiBAQCAtMCwwICsxLDQzIEBACj4gPiA+ICtGcm9tIGM2NTNhYjI0ZTM2ZWY2YzQxOTBlNzBlMDY0
ZTgxMDI0MDEyNDc0MjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gPiA+ICtGcm9tOiBZZWdv
ciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4gPiA+ICtEYXRlOiBGcmks
IDIzIE9jdCAyMDI2IDA2OjA4OjQxICswMjAwCj4gPiA+ICtTdWJqZWN0OiBbUEFUQ0hdIHNldHVw
LnB5OiBkcm9wIHVzZV9zY21fdmVyc2lvbiBpbiB0aGUgZmFsbGJhY2sKPiA+ID4gKwo+ID4gPiAr
VGhlIGZhbGxiYWNrIHNldHVwKCkgY2FsbCBzZXRzIHVzZV9zY21fdmVyc2lvbiB0byBGYWxzZS4g
QnV0IHdoZW4KPiA+ID4gK3NldHVwdG9vbHNfc2NtIGlzIGluc3RhbGxlZCwgaXRzIHVzZV9zY21f
dmVyc2lvbiBrZXl3b3JkIGhhbmRsZXIgaXMKPiA+ID4gK3N0aWxsIGludm9rZWQsIGFuZCBzaW5j
ZSBzZXR1cHRvb2xzX3NjbSA4LjAgaXQgb25seSBhY2NlcHRzIFRydWUsIGEKPiA+ID4gK2RpY3Qg
b3IgYSBjYWxsYWJsZToKPiA+ID4gKwo+ID4gPiArICBGaWxlICIuLi4vc2V0dXB0b29sc19zY20v
X2ludGVncmF0aW9uL3NldHVwdG9vbHMucHkiLCBsaW5lIDE3NCwgaW4gZ2V0X2tleXdvcmRfb3Zl
cnJpZGVzCj4gPiA+ICsgICAgYXNzZXJ0IGlzaW5zdGFuY2UodmFsdWUsIGRpY3QpLCAidmVyc2lv
bl9rZXl3b3JkIGV4cGVjdHMgYSBkaWN0IG9yIFRydWUiCj4gPiA+ICsgIEFzc2VydGlvbkVycm9y
OiB2ZXJzaW9uX2tleXdvcmQgZXhwZWN0cyBhIGRpY3Qgb3IgVHJ1ZQo+ID4gPiArCj4gPiA+ICtU
aGUgZmFsbGJhY2sgaXMgYWx3YXlzIHRha2VuIHdoZW4gYnVpbGRpbmcgdGhyb3VnaCBhIFBFUCA1
MTcgZnJvbnRlbmQKPiA+ID4gK3N1Y2ggYXMgcHlwYS9idWlsZCwgYmVjYXVzZSBzZXR1cHRvb2xz
JyBidWlsZF9tZXRhIGJhY2tlbmQgcmFpc2VzCj4gPiA+ICtTZXR1cFJlcXVpcmVtZW50c0Vycm9y
IGZvciB0aGUgc2V0dXBfcmVxdWlyZXMgZW50cnkuIFNvIHJlbWkgY2FuJ3QgYmUKPiA+ID4gK2J1
aWx0IHdoZW5ldmVyIHNldHVwdG9vbHNfc2NtIGlzIGluc3RhbGxlZCBpbiB0aGUgYnVpbGQgZW52
aXJvbm1lbnQuCj4gPiA+ICsKPiA+ID4gK1JlbW92ZSB0aGUga2V5d29yZCBpbnN0ZWFkLCBzbyB0
aGF0IHRoZSBzdGF0aWMgdmVyc2lvbiBpcyB1c2VkLgo+ID4gPiArCj4gPiA+ICtVcHN0cmVhbTog
aHR0cHM6Ly9naXRodWIuY29tL3Jhd3B5dGhvbi9yZW1pL3B1bGwvNTU0Cj4gPiA+ICtBc3Npc3Rl
ZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTUtNQo+ID4gPiArU2lnbmVkLW9mZi1ieTogWWVnb3Ig
WWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgo+ID4gPiArLS0tCj4gPiA+ICsg
c2V0dXAucHkgfCAyICstCj4gPiA+ICsgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4gPiA+ICsKPiA+ID4gK2RpZmYgLS1naXQgYS9zZXR1cC5weSBiL3NldHVw
LnB5Cj4gPiA+ICtpbmRleCBmZmNkYTlhLi4xYWJjMjdkIDEwMDY0NAo+ID4gPiArLS0tIGEvc2V0
dXAucHkKPiA+ID4gKysrKyBiL3NldHVwLnB5Cj4gPiA+ICtAQCAtMjYsNiArMjYsNiBAQCB0cnk6
Cj4gPiA+ICsgICAgIHNldHVwKCoqcGFyYW1zKQo+ID4gPiArIGV4Y2VwdDoKPiA+ID4gKyAgICAg
ZGVsIHBhcmFtc1snc2V0dXBfcmVxdWlyZXMnXQo+ID4gPiArLSAgICBwYXJhbXNbJ3VzZV9zY21f
dmVyc2lvbiddID0gRmFsc2UKPiA+ID4gKysgICAgZGVsIHBhcmFtc1sndXNlX3NjbV92ZXJzaW9u
J10KPiA+ID4gKyAgICAgcGFyYW1zWyd2ZXJzaW9uJ10gPSAnMjAyMi43LjI3Jwo+ID4gPiArICAg
ICBzZXR1cCgqKnBhcmFtcykKPiA+ID4gKy0tCj4gPiA+ICsyLjM0LjEKPiA+ID4gKwo+ID4gPiAt
LQo+ID4gPiAyLjM0LjEKPiA+ID4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
