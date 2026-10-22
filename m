Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2664606A322
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AZFXEOQb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=k9491p6k
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDFCC40960;
	Thu, 22 Oct 2026 21:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kFLVXFmh6JK; Thu, 22 Oct 2026 21:20:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D604340967
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792704057;
	b=fHY5OO90e7kkKcojr8zonipXW9XIOAben8w5vPuJbWueCbgma47oQKkT7W2jn2CFwwz0
	 JKuCIGFV5A0UCLoPWJkAlSXZAih1LBbtAA300pPmUP+twffPxqJ6lv8ZrqI0JmmtP/QEE
	 D4raAuG1HTg9PSqpDt9bke0BtFcfLeBgn/K+QtA91sO+l/UwdXMjPH24LNutfFgf6ZQYR
	 BUoZetCY+jGSoaRveLTb2Cp3M2YZIUXVNRsfYiwIhsNiyGSDOAvmuZF12Du45vkFKNmnB
	 pqtlB4U8T2GoOiNQ+G3IsBXmjNMj5RnN8o3cxLmFQ1b+N3xEG8MKkJpEbNmerZvC57w==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792704057;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=bI40cLDwYyBkLosKAxc/F1/oVMScUVIHvcQ9XYQG3X4=;
	b=PzSzFjVOfpfCbVW3nKnfx7tqgW/qs/uXz18b6YblmyIXT6FUoooQ3W+Z6Cs/x0sK9ZiM
	 oCTiHn8t/rMVFC4ofxETQn9+oLaXvfvhdN1Mq/MKZ/002oM/fhBbuutk++Lhj44fNK3O2
	 YK1Zkp4hytNIhpPzo8dOQCh6v0h/bRI1kk17uttsSHi+H5SWCG3YyMNOazqgn5EVQh23Z
	 89t7c7ZClDzSj2zGKq8yWfoiHHIcH0yOuoaIc+RcjzqmBoXhNMIFGmYafL4G7sK0FbIVE
	 N3X4WWpvK0zwcitdz03alMEBdPl9chqbMmZ7WD/LaFQDPLeDfeH4CIaoW6LYAhUyP/w==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792704056;
	bh=bI40cLDwYyBkLosKAxc/F1/oVMScUVIHvcQ9XYQG3X4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AZFXEOQbw2Jn9uhuqm2IevOmcE+m1R9ijeUexmFTA3KtaqfOk+Uo2j30K86qh9e13
	 0j7T4fRE/zZ7TSWWNFVVFEjGaGHSJU3Gr+4vBJiE/hl2abwMkdZ4k7FSRGhVWm6+3r
	 zbkpbK5OekB8GsGqc+LCC7LZY8ukfKGbIVLQuVKHIgEkdDQ3dcvs1qfNxpRsHvYo9M
	 70+4e8sAOtasqJVTaHNdRfbkhAzipjidWxXPbuaTtiYUXpMBzz+JS6A+QxiplMRD+1
	 ppX5lfUEbzFGJQY0D1QMPpr+p3vcRPBdkphRjS+4gMVpDGCHCKQvN19iT2tWNdozUt
	 jRnKwHXnczbZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D604340967;
	Thu, 22 Oct 2026 21:20:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1ACA43AF
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17FCE6080C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZvRF26Ac8Lp for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:20:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 03228607E7
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::122c"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792704054;
 b=tQEvcK4/DIN3wW/oQykZGK+gOGmUOv25Dg8z7/rs8IcQOgSLeZroG5xzsoGdUlGk/os2
 IuCmbIhFfbK7+R6g80tk0hlowxb/lNsutS5ruzGSQ0Vd+HuhicRpeO81xzkd0dcJW9wLK
 /wFquesMnBNte92f1ckXfNfcgU0Am06+1/YLCSHRbDj+kntI2T7IBKXHU5q8lBHLvjH/v
 R2j1feFkWWCmm1spficPyRVSh7klkSQUrwkWX8X4ImLTpRZBH4gB0wQjxqfVx/JNaAkIX
 wQmSyC0zJXpsLtJR7sbGYBO8BzfwlkCjqJMo1ZI2bkZDf0GBJfiNPULjvU0t3QYx7eg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792704054;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=llH4iK05HVvnHTQIdkVQus6xeReF2WJ4DF0WGeYAaM8=;
 b=TZ7IIgjfz20K/lnAEa45Dpb5UoHAMfu4SNg/0vuvRbYfKtrf0Z8ZGKeO4I8HKMo+/iJW
 xx8gdw2Kk8LqhI8ekPv1gyIGg19IlhKFjcqTNb8QfDFJ7oi6uqlH1eoWYCQhMBKaet1iN
 FfZXFIUdsIY2sFoXMrVQUcI+b7uBUU4TKeWZElYPfSibqMhi4S6cZsxdmJ+oU3xKjjLbc
 byPhzpstK2YW1PzAN+gXJhDa+v8nYCLc+R3e2OXhAb1wLNpfFsJdEQZNdH7Ad4PmKLmZr
 hxFf8mcIwghcWszkKkdPK9bpZNzWOQLsqbQlJoJjmEfXkbs8dMyiXPVNOPOW6nfUP5w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
 dmarc=none header.from=j-ernberg.se;
 dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=k9491p6k; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::122c"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::122c; helo=mail-dl1-x122c.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=j-ernberg.se
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=k9491p6k
Received: from mail-dl1-x122c.google.com (mail-dl1-x122c.google.com
 [IPv6:2607:f8b0:4864:20::122c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03228607E7
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:20:51 +0000 (UTC)
Received: by mail-dl1-x122c.google.com with SMTP id
 a92af1059eb24-188406bb948so105345c88.1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 14:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792704051; cv=none;
 d=google.com; s=arc-20260327;
 b=lMvmaeLfvHLOnapOABtEsC+NjP25uTAtnsQ0MPSIoJwgbvrbAZS/HJuEe0W8HVmktV
 qNK9wMUMUQdqLOzKH5jKprcFBNRxY4Ll8fp8Xi5WSRA6Cn9JpgZ3bIWGAuyfJcUeIZuo
 3mdt4GOynda08QBzfwqEUKnYbaXKnNlLmpIzXRNvBBBGAymfFtt9NQRz56lVbPycMcN+
 xmGDk7O95bg8uu49UsT4d2nLyNY6HtA+4Gv6IjZB/jKhTYtUQp0rcKGO4Wxek8Ya9V0P
 Acw5ItL6QqMjpFMhjHVhuDj6iOMU2Yurh7wyZ17XaB1qJsnfmcnwtvWGoVBk3hZGWfsg
 IYdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=llH4iK05HVvnHTQIdkVQus6xeReF2WJ4DF0WGeYAaM8=;
 fh=D5db7cbxWLjmrsHsBmUJVulr3mMdGHGTEXKn1n7PKFI=;
 b=F4ivv6f6zhA87nuJcgFAWJqTMtexNldR90NEmRpJkEOvn29Wh9t6BiMSHKKMGjVpW4
 wnYX/l2gEBuRGOfUVWrX0rkbdypq1dbBTgKm6KGRidF7RZ3T180ZWd6LWP0vghyB4l2B
 Fit20s5ea143i4JRxQ0esBaohGlFoM7LwfBQf7DLM8DtBAs3HP864BY12/lgYniKoXqi
 tx5XXAuZw9ikHDa2LP15WKHjTcaLqwc4bX84cxpCzF8uDwvz4wstpaoguegscqrUkNV/
 WGu+qws5SML2vOhjOdod1mTo+iI704X1kzk+/CgjPs51HywLXg/LBBoSuw93dhw/ug5G
 yrng==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1792704051; x=1793308851;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=llH4iK05HVvnHTQIdkVQus6xeReF2WJ4DF0WGeYAaM8=;
 b=k9491p6kK1GgJbNfCn2SSD6AA3sBzqvLHhd6LhWFXpn13S9bszGKmJx76Nl/q8kJqD
 UlK9NesEWmlViV7iWhufjDzi3f3JKJb5uBBHorrMdrh8C/K/Vxwn4gm7+Do2xRhV2LOo
 4oudI2x7RgFlQ3mf+mB06OFPfdnblj+DsVPRk0rBJ/+CC4OT8veO9gfRg+7v+nTn3Lc8
 C6XO2nBY0FF0W2buX+5df2yIrhOgY7rdgVhnIGgGWoK9vYATiR9WYRXBeaUDn9cdDMrR
 hWLgF3GKDdTXkjBVr8Iu66JzqyKZ9tmS6eMolaFXkszdmklTXDqx378BSmovQFTqhZis
 oifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792704051; x=1793308851;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=llH4iK05HVvnHTQIdkVQus6xeReF2WJ4DF0WGeYAaM8=;
 b=qd74awFqsKIy0RmpMBiU9Rf+VUy2QEjAULoEVWWJrVzGkMZHLPHdXIasLGKCnPlCl2
 WgdercViuQc+WT34p16VuqIPcoReVZHMSQtaJtaeJMsi0MVHzoztMHdm1kKAT5bR920R
 gRZlLiYcClgbFG19ASMEsYGdTqOUaaXF5Yox0ZESsL8d+vsbN9+9crtTeKGPPpL1/Dt5
 d+yIdc2WX8UAS4gMctPGeMwczSHrkBWkEq6cDT+gs+wY5/k9DTBiOjOJjtbpsAXwoHQt
 ddejrhQbBWg4djwnjdOggXlvEI3rWvM4eiU0IGZcFLl6ryx7/SQK2vKjYAKvCjsukPUh
 Mt8w==
X-Gm-Message-State: AFq9FYLlfNw6IBfoK6KGKatQL0W14ochoWuHX1FOPQkMk1vCgYPMrTtD
 gsQmvBfEuvJ8n0hC3AOrCHxQzPpIoUivmF1JyL3KyWZYg8Md0fhE0HMbjrURJ/CO+DT8HrBkxaj
 6PzIwq1MPpt7pie3BhfD/XV8+TQ7ES5xzFVhaujWU12aumeoXYKj9dpQ=
X-Gm-Gg: AYBFou2oSdxrRUI2XHVHhvs5JXDNAutUFINsthmd9kqfSAOz9mrVw6gePNrPDMFWHOE
 D2EKvZJRxn/Gw0FqX0Fb57IdQGroeEybLm84ZKba6OlpEagxbvuC73wfsoUD4XW6ADKVE415Pym
 sUMXchW1EW0Yi8A2PIucP+J+g3yo6K9L8vedxJJ5JVSM8XxZIdgIClkuWIrvUs3M7DmNt73802z
 /mXfMrp3XPi8y3z6qGQD8dP7ofLHnydEk6g/+DHIxyg+i4aqUwCONolz4ptd/a/GV37YmjvSPOu
 H+Q83osCU1/84hMHQ6ghtLKy4u0WwW+k/br9wjVwNlYs0EWwEwvu95h18uMcqT9blsmkMdWXh1G
 LbikTecBzqo0J9y/hemIN+uWf+8mUmafupid1P/x/SOn8Rq58NJ+Mxx6hTGfwT0AZa0pWwMhk9D
 MPxsgRVcSUYpe0P4dKP2yTIQ==
X-Received: by 2002:a05:7022:ea58:b0:190:da74:2c89 with SMTP id
 a92af1059eb24-195c5ad28e5mr437995c88.21.1792704050644; Thu, 22 Oct 2026
 14:20:50 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020130045.1323516-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20261020130045.1323516-1-thomas.petazzoni@bootlin.com>
From: John Ernberg <j@j-ernberg.se>
Date: Thu, 22 Oct 2026 23:20:38 +0200
X-Gm-Features: AclHuK_PUuHO--CPYnttpIY1Kb-JSfBlv0Zd1Iw-C8R_-kP_RHFEzRaPpiI26R4
Message-ID: <CAAHg4ZiGfAt=owkHFsJxRORALCXt6mDGbAC2pvXgRAxvEfzXMQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>, 
 Romain Naour <romain.naour@smile.fr>
Subject: Re: [Buildroot] [PATCH] package/jailhouse: remove package
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVGhvbWFzLAoKT24gVHVlLCBPY3QgMjAsIDIwMjYgYXQgMzowMeKAr1BNIFRob21hcyBQZXRh
enpvbmkgdmlhIGJ1aWxkcm9vdAo8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+Cj4g
amFpbGhvdXNlIGZhaWxzIHRvIGJ1aWxkIGFnYWluc3QgcmVjZW50IExpbnV4IGtlcm5lbCB2ZXJz
aW9uczoKPgo+IGRyaXZlci9zeXNmcy5jOjU3MToxNzogZXJyb3I6IGluaXRpYWxpemF0aW9uIG9m
ICdzc2l6ZV90ICgqKShzdHJ1Y3QgZmlsZSAqLCBzdHJ1Y3Qga29iamVjdCAqLCBjb25zdCBzdHJ1
Y3QgYmluX2F0dHJpYnV0ZSAqLCBjaGFyICosIGxvZmZfdCwgIHNpemVfdCAnIHtha2EgJ2xvbmcg
aW50ICgqKShzdHJ1Y3QgZmlsZSAqLCBzdHJ1Y3Qga29iamVjdCAqLCBjb25zdCBzdHJ1Y3QgYmlu
X2F0dHJpYnV0ZSAqLCBjaGFyICosIGxvbmcgbG9uZyBpbnQsICBsb25nIHVuc2lnbmVkIGludCkn
fSBmcm9tIGluY29tcGF0aWJsZSBwCj4gb2ludGVyIHR5cGUgJ3NzaXplX3QgKCopKHN0cnVjdCBm
aWxlICosIHN0cnVjdCBrb2JqZWN0ICosIHN0cnVjdCBiaW5fYXR0cmlidXRlICosIGNoYXIgKiwg
bG9mZl90LCAgc2l6ZV90KScge2FrYSAnbG9uZyBpbnQgKCopKHN0cnVjdCBmaWxlICosIHN0cnVj
dAo+ICBrb2JqZWN0ICosIHN0cnVjdCBiaW5fYXR0cmlidXRlICosIGNoYXIgKiwgbG9uZyBsb25n
IGludCwgIGxvbmcgdW5zaWduZWQgaW50KSd9IFstV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVz
XQo+ICAgNTcxIHwgICAgICAgICAucmVhZCA9IGNvcmVfc2hvdywKPiAgICAgICB8ICAgICAgICAg
ICAgICAgICBefn5+fn5+fn4KPgo+IFsuLi5dCj4KPiBkcml2ZXIvcGNpLmM6IEluIGZ1bmN0aW9u
ICdjcmVhdGVfdnBjaV9vZl9vdmVybGF5JzoKPiBkcml2ZXIvcGNpLmM6MzM2OjEzOiBlcnJvcjog
dG9vIGZldyBhcmd1bWVudHMgdG8gZnVuY3Rpb24gJ29mX292ZXJsYXlfZmR0X2FwcGx5JzsgZXhw
ZWN0ZWQgNCwgaGF2ZSAzCj4gICAzMzYgfCAgICAgICAgIGlmIChvZl9vdmVybGF5X2ZkdF9hcHBs
eShfX2R0Yl92cGNpX3RlbXBsYXRlX2JlZ2luLAo+ICAgICAgIHwgICAgICAgICAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+fn4KPgo+IEhvd2V2ZXIsIHRoZSBwcm9qZWN0IHNlZW1zIHRvIGJlIHVubWFp
bnRhaW5lZDogdGhlcmUgaGFzIGJlZW4gbm8KPiBjb21taXRzIGZvciB0aGUgcGFzdCA0IHllYXJz
IGluIHRoZSB1cHN0cmVhbSBHaXQgcmVwb3NpdG9yeSBhdAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9z
aWVtZW5zL2phaWxob3VzZS8uCj4KPiBTaW5jZSBtYWludGFpbmluZyBhbiBoeXBlcnZpc29yIGxp
a2UgdGhpcyByZXF1aXJlcyBrZWVwaW5nIHVwIHdpdGgKPiBMaW51eCBrZXJuZWwgY2hhbmdlcywg
c2VlaW5nIHRoZSBwcm9qZWN0IGJlaW5nIGluYWN0aXZlIGZvciB0aGUgcGFzdCA0Cj4geWVhcnMg
bWFrZXMgaXQgYmFzaWNhbGx5IHVudXNhYmxlLCB3aGljaCBpcyB3aHkgd2UncmUgcmVtb3Zpbmcg
aXQuCj4KPiBUaGVyZSBhcmUgYSBudW1iZXIgb2YgYXV0b2J1aWxkZXIgZmFpbHVyZXMgcmVsYXRl
ZCB0byBqYWlsaG91c2UgZm9yCj4gdGhlIHNhbWUgcmVhc29uLgo+Cj4gU2lnbmVkLW9mZi1ieTog
VGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KClJldmlld2Vk
LWJ5OiBKb2huIEVybmJlcmcgPGpAai1lcm5iZXJnLnNlPgoKQWRkZWQgSnVsaWVuIGFuZCBSb21h
aW4gdG8gQ2MsIHNpbmNlIHRoZXkgd2FudGVkIHRvIGtlZXAgaXQgYWxpdmUgd2hlbgpJIHRyaWVk
IHRvIHJlbW92ZSBpdCBmb3IgdGhlIHNhbWUgaXNzdWVzLgoKQmVzdCByZWdhcmRzIC8vIEpvaG4g
RXJuYmVyZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
