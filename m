Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF1C606A32C
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qlApU/hy
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53A0A40E0A;
	Fri, 20 Nov 2026 10:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rc-JIu-ofa4M; Fri, 20 Nov 2026 10:00:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 61E9F40D07
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168836;
	b=ABf+UQPyWR5sGLV+xnndjR3AbF1B6g9Izzu6oj0TsAD6zLNYvO0+MENK7bnHanHWmdU5
	 m5S3koGG2BiPSA7aSbcYdjAyX6m73Gxp8+HLgYJge3v2DjtPuXJgu/6SI/0C1dKGCfTJd
	 7zjiIL6cKYuqH6nkdpqNvVr0B4e2M5S1rrWGtO7Xmn6wAe+6rrG2wfrc7xYIUfEp7TSG1
	 s/N36QOivY7JuxHoQ/n22dcm/TO4UTAc1II5c+jC05xdOehope1I01Lh3Xx+s2QVgWsaC
	 ybuYmuSDCwH+SkFmXYnyQdJDYwTKc2jKDwZZH08ttBMJsZxPUVN4WD+UQoABHpRTGfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168836;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2hCXAhUxKFiYn38lrCCg9iIy/i+b/M4ZEmyVhftevWc=;
	b=R3Kl4IaB5vdY3WNGBghnpa0ziY6C3qqFyqu0j0l9nVPeEm9kkO97lgTwPRTzga2gHnk8
	 yKZ5r1+Zm9/uEKy/iFQykldM4gDtSLpG0vJmyo6mj9vcvdXctc3854328DrahqILQ7oSt
	 l8+Bxy6PKP9bcV1Fy3DqPurUVGgKmstsqb1LD18jQWaoBvjhefT89rQKfQF9frn0Ap4OT
	 9+/qIZwqhXAf2Az9Ddyq0nmxZGizv4XoBEfbFlcehK8/sVJJYaphmh4ztCA6GDTlJBbE7
	 thWZejvheET9+xHir2NHE7aJbuFl4KkbVUO9qLfvTJz5+lETZfVDvBKMbxWvhKlLK+Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168836;
	bh=2hCXAhUxKFiYn38lrCCg9iIy/i+b/M4ZEmyVhftevWc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qlApU/hyb9bLKHvFBYJMMep0lTiaZmQZ6rT4Jek2Rwbix/r1VnvBMHI03XkDzZbE9
	 JknYFRZe7VoLhlzo85I9fVOOjUvJmj8Qbg+PeDlK7HMH9MJXnf6o5QijrTbPg9UX/O
	 r7q2W0XUzZ18RHU7oBFcqI97FLCJqOhDj9Ao0Hr6GAatS7bAB0qQ31ym/sbIxv3te0
	 3DBcRpTlPMcRJBj60kian2UKROvUD3CzbvPoKH63W9G/swgkSU21IV+jWYyTGhM9Ln
	 tt6nnAllTPOzmi7FwJwpbeNhIId4Tm+XGl/0K0oa/XH8/K/WVhUXgn/uBDYkEA8IrU
	 K0qG/vFh0INCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61E9F40D07;
	Fri, 20 Nov 2026 10:00:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FFD3E22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75C68812F1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3cWyKIWxdTbO for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:00:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 01771813F2
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01771813F2
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:31 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a207b02a2cso4569035e9.1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:00:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168830; x=1795773630;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5k2KQZrL6BULAWsVngFe5x6bbhis1g3fRZjMP3ipoNc=;
 b=YgZhgeBKQ73wsqkFpVZty2nlOrz0x9Q1cJoS933ssDsAMsolthWPqwXyGypU5xyrV5
 XM+HwhqxO9cp0ut+d1lii1cmYq1W3+WK6cL3eLtQGs1HitWU2HwS8ZjPUloEdQ0PFVOe
 YLxWoW5PFg0ORHrcIaX4TWaEl2znivAhNCEptjm6QTBJYZrvGM+1T5yRCKP+zh9f84mE
 umDvSzdYQYUgDmHgT3x0Co0v5ab6WZmJO7K2S1KsItHXlGOY3KumvZP4ZkZpZaDes7FX
 n0NkSAvB8FPi4R666yJgqBiqtLgN5y2LFkCi+oZOOr/0QqRw1EiZyUOu25sy/I/Ip+bU
 zc6A==
X-Gm-Message-State: APuU4Z/ioV7bU2TD50MA8ZEkTdRRavDLo3PoIsNEvqlCTIWkSzyd533S
 9WKeaUaPDQFRy6KNpD3kHmX4uZ5gClQqHs9UVm7tIM14wsaI96J3gDGwVcd+syz7EnslqXvSZh9
 h7w6P7/ll+Q==
X-Gm-Gg: AYBFou2ruwTS7LyWweZTYhqGVkOh7HwF6JNT4okVQDVq85UN7oCLebxZY8y4DNtAEAE
 gMs2FygQH66yWb9g3qSZ7jCZZJcyd1dVmcOGvUrVga9mVP0tfOqPP/PgLT3008+euIjadUTn5t9
 UMbMzCUwgNliXVQAzWWZyAnalYkvhrEwiO6YK+hW+RiA7OJusHVTu5exxB5XTLkJ8bTXJVPixG6
 Z+Lpi6z8e52/pF5wKfQtP/UBf1wenFQPnZTOJog6apss1mrurmEZP649deIMe0JPQh9AGaN6iyI
 A2QbV06wSxEeLPGvbITUQZ0N0vHtHm7312IZUKu/gZRGLy5WU5vOH7g/ET3v1yDZEi5TkIl41fL
 RkpbWFHeg5WPPsRTYT0iZQMQUWgq7itmaYYivFElPqKlxBW8au+DGq1ejAUssZK0wlfFg6nIRnm
 EIzQZvt21x95Nb6iBOujBmFclB5H74i8ofp7qXNyv9bhuGMiOoCggOFn1EoGHZ2VXDepOxvqPBl
 UtQGOo+8czb91UKAD59RhSMHuNfmLOvFTOzv0lDfaXyj5rhvvnwBknSNYCqlDiPvT85AwL/jbKP
 5HyqlBhdPbG7eYuOqIh0xj7IxMYe+hTDypr4LMXvelRI
X-Received: by 2002:a05:600c:64c8:b0:4a4:fc8c:cfd9 with SMTP id
 5b1f17b1804b1-4bb8881de62mr51162065e9.25.1795168829633; 
 Fri, 20 Nov 2026 02:00:29 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb895eec06sm21085195e9.2.2026.11.20.02.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:00:29 -0800 (PST)
To: buildroot@buildroot.org,
 =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 11:00:23 +0100
Message-ID: <20261120100028.541871-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261113-fix-host-vim-build-v1-1-58b2e5f832b2@armadeus.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/vim: prevent host-vim from using
 host's libncurses
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SW4gcmVwbHkgb2Y6Cj4gV2hlbiBjb25maWd1cmluZyBob3N0LXZpbSwgdGhlIGNvbmZpZ3VyZSBz
Y3JpcHQgbG9va3MgZm9yIG5jdXJzZXMKPiB3aXRob3V0IHdpZGUgY2hhcmFjdGVyIHN1cHBvcnQg
YmVjYXVzZSBvZiB0aGUgIi0td2l0aC10bGliPW5jdXJzZXMiCj4gb3B0aW9uIHBhc3NlZC4gSG93
ZXZlciwgaG9zdC1uY3Vyc2VzIGlzIGJ1aWx0IHdpdGggd2lkZSBjaGFyYWN0ZXIKPiBzdXBwb3J0
IChlbmJhbGVkIGJ5IGRlZmF1bHQgb24gbmN1cnNlcyA2KSBzbyBob3N0LXZpbSdzIGNvbmZpZ3Vy
ZSBzY3JpcHQKPiBmYWlscyB0byBmaW5kIG5jdXJzZXMgYW5kIGZhbGxzIGJhY2sgb24gdGhlIGhv
c3QgbmN1cnNlcyBsaWJyYXJ5Lgo+IAo+IEl0IHdvcmtzIGZpbmUgb25lIHNvbWUgaG9zdCAoaS5l
IEJ1aWxkcm9vdCBkb2NrZXIgaW1hZ2UpIGJ1dCBmYWlscyBvbmUKPiBvdGhlcnMgKGkuZSBHZW50
b28pIHdpdGggdGhlIGZvbGxvd2luZyBlcnJvcjoKPiAKPiBjaGVja2luZyBmb3IgdGdldGVudCgp
Li4uIGNvbmZpZ3VyZTogZXJyb3I6IE5PVCBGT1VORCEKPiAgICAgICBZb3UgbmVlZCB0byBpbnN0
YWxsIGEgdGVybWluYWwgbGlicmFyeTsgZm9yIGV4YW1wbGUgbmN1cnNlcy4KPiAgICAgICBPbiBM
aW51eCB0aGF0IHdvdWxkIGJlIHRoZSBsaWJuY3Vyc2VzLWRldiBwYWNrYWdlLgo+ICAgICAgIE9y
IHNwZWNpZnkgdGhlIG5hbWUgb2YgdGhlIGxpYnJhcnkgd2l0aCAtLXdpdGgtdGxpYi4KPiAKPiBP
biB0aGUgQnVpbGRyb290IGRvY2tlciBpbWFnZSwgbGlibmN1cnNlcy5zbyBpcyBhIGxpbmtlciBz
Y3JpcHQgdGhhdAo+IGNvbnRhaW5zICJJTlBVVChsaWJuY3Vyc2VzLnNvLjYgLWx0aW5mbykiLiBJ
dCBhdXRvbWF0aWNhbGx5IGxpbmtzCj4gbGlidGluZm8gKHdoaWNoIGNvbnRhaW5zIHRnZXRlbnQp
Lgo+IAo+IE9uIHRoZSBHZW50b28gaG9zdCwgbGlidGluZm8gaXMgbm90IGF1dG9tYXRpY2FsbHkg
bGlua2VkIGhlbmNlIHRoZQo+IGZhaWx1cmUuCj4gCj4gRml4IHRoaXMgYnkgcGFzc2luZyAiLS13
aXRoLXRsaWI9bmN1cnNlc3ciIG9wdGlvbiB0byB0aGUgaG9zdC12aW0KPiBjb25maWd1cmUgc2Ny
aXB0IHNvIGl0IGZpbmRzIGFuZCB1c2VzIGxpYm5jdXJzZXMgYnVpbHQgYnkgQnVpbGRyb290Lgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFu
c2tpQGFybWFkZXVzLmNvbT4KCkFwcGxpZWQgdG8gMjAyNS4wMi54LCAyMDI2LjA4LnguIFRoYW5r
cwoKPiAtLS0KPiAgcGFja2FnZS92aW0vdmltLm1rIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiAKPiAtLS0KPiBiYXNlLWNvbW1pdDog
Y2IyOWIxOGRhMTNiYWNmZWM2Mzk2N2NkNWE5ZTM2OGYxZjBmZTg5NAo+IGNoYW5nZS1pZDogMjAy
NjExMTMtZml4LWhvc3QtdmltLWJ1aWxkLWI1YTU2NzZjYzdjZQo+IAo+IEJlc3QgcmVnYXJkcywK
PiAtLSAgCj4gU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRl
dXMuY29tPgo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3ZpbS92aW0ubWsgYi9wYWNrYWdlL3Zp
bS92aW0ubWsKPiBpbmRleCAzYjU4YWQ0N2E1OTYuLjYyM2I4YzE4ZTFmOSAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL3ZpbS92aW0ubWsKPiArKysgYi9wYWNrYWdlL3ZpbS92aW0ubWsKPiBAQCAtNzUs
NyArNzUsNyBAQCBWSU1fUE9TVF9JTlNUQUxMX1RBUkdFVF9IT09LUyArPSBWSU1fSU5TVEFMTF9W
SV9TWU1MSU5LCj4gIAo+ICBIT1NUX1ZJTV9ERVBFTkRFTkNJRVMgPSBob3N0LW5jdXJzZXMKPiAg
SE9TVF9WSU1fQ09ORl9PUFRTID0gXAo+IC0JLS13aXRoLXRsaWI9bmN1cnNlcyBcCj4gKwktLXdp
dGgtdGxpYj1uY3Vyc2VzdyBcCj4gIAktLWVuYWJsZS1ndWk9bm8gXAo+ICAJLS13aXRob3V0LXgg
XAo+ICAJLS1kaXNhYmxlLWFjbCBcCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
