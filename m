Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2F7606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 21:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=b4x8+KuO
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B71F940A7D;
	Thu, 29 Oct 2026 21:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBxi_d6dMSUx; Thu, 29 Oct 2026 21:50:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 946EE40A80
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793310621;
	b=rRUi4hU1PAmmNJ2RioSjEIqcH2dZB1p28xW7e2jRYJ1XT4PkcC3H9xXij5/QWkeF4l27
	 3H0LrISV6pjYu65zBl8by+OiXtFniE5J9i9wpTTzV4zxtOyHUG+PR10kadcFkovwcWm9V
	 SK40TvM+BNBRpqK3Ej8E4Vs8uSLjqbm3c6dADc1M/rqhA5kpEH9nBvYBJ2dBFT9u8ynI6
	 /PlIVUKCEVQZtXVrXMLS/Oxk21O8v9YAtAkGKIsydL9PwbtEsTdYmtGCY5yX3kNB2ZG1a
	 zIjj62whRf3i6P7NiRAqF+n/1ZpO0EX4ybqCWeG0NK9bkiX5HUtgVii1rRp0SWVb1rA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793310621;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DUV6gC/a+6qMYqrdrSnhChy+O8aJ5LW+tyeSC3g/zQk=;
	b=d7cX9LNmTS2MrNmmVjklVXRFFKyVGH4aEIsY6Fy2LIUlcwiiS70YFI9CrvjAmRFekINf
	 52jtaoS884h69RSb97Pn52Ww+mlrJeJvaRCuJR69fGVgHYW4lUcvVVeEabjDkYg5lY+L1
	 NPhJFDPDkEO4H4kT2oqGSzyJBxUHyDBSf+emrk2QXanyYjTQ4uTXFMWCUjxb5bTNgUNHx
	 aA2Pd/nwU8QYyhBeq225IbQvDqC1mLDODFLduajrzr5Zq2cRw+hO8Nzi4uJDsonzFcaWV
	 4KlISbztdpI0WZ7FAE8jYsMfi65UYeLy0DfD1n3I+vGaET6b2ziwvvkBJ/l6IrcvQRg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793310621;
	bh=DUV6gC/a+6qMYqrdrSnhChy+O8aJ5LW+tyeSC3g/zQk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b4x8+KuOmaaKouJqA2roxJl1DozrR4e7nCU5LgLfp4BipEO/xw/K02Vj/v/+gtMAv
	 UBWmaX+nlXxkb5Cni7ATphiFm7j0qRSk/t6pcWjsH89ZlzG1qiZnJVl7sfVWMu66qZ
	 WNlQmqVZ4N3GethvPBLv7PRkls8hXTQEi9eclKGFL9453qhVNNpIGgADOxn+fLqPex
	 X8xkAH5gbYkltYIPp2IaGTZWLoLx1oW/nX4gsVoRnQ4mVGZoyqd8enjYHy0UMEgRZU
	 Yzyg2a7T4GXZEhWWN9d+DmbFgVK6PnuChJ2CCAsmGbPc9iCxF/qbZ4Ez2IqeTIMMZI
	 my5n/2iSYJxAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 946EE40A80;
	Thu, 29 Oct 2026 21:50:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 656421DE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AC5B40A77
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UOEwIYCEMspf for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 21:50:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ECBB540A67
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793310619;
 b=KpO5+aM9kDi+hsGvflRUtUlxDCqszjBsA1M1KT2LfjL794ZMC9e/n8gT/D4BfnCrM7uG
 ySPGFkcMWz+LqFvF+Muo/yk2owsbBfQVx/c6krm8hSJsFl4Wv1gxtvERJM4qUNdJhydUZ
 vOf67pXR7rZg91g58Lyj2i4lxBxvrnkRRShjtkDqRjs0l+A1vHqSEz8hIC/v366SlGqT3
 TdTJORL6XE3t1SYG+jqeuLgWgHJflgo+HnAe0uW8eemgdcBvgJxkS5uh5NtPe2akievyN
 MmX9aNbsOfah+rrdNr3PGbFHzRFLJyjQl54gBnb+1OpFwnSV4GbMET6h9sH/J9jsePw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793310619;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=gzpoJ77bYxg79kJZfbsCjJZMjG50LvqMExyYQm19Kcc=;
 b=PFpu5U5bu9NGqMHRjs1E+W39xm/GFmY98MKTVCx6p6UdKdKaCLAoEra6pxeAJPzVfp+s
 vYmCGHWVoWS8ddmQsnnOYETaRUys+JZAtQiDRUkKH2swOkeuKGL4dFXfy08FpqFPxEWNg
 9a4ah11OSMr65W0tHuVWKVCG7RQd/gO4Tlmht4cagmiLjpm6F87hAX+x6QJI4AY2lVesq
 QUGABGlHoVNw73T+hj2fwVJxwp6TdC27wh6PXYcb9CVBrEd3dbC+vhHOqyWpOIrWOmA+w
 L/vcOHGR4j4HgWWBsLPfMO6B4rSzQJgfR+RrGtZF6VXCPkPR+J3roHglpNeLO9wUTyQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Kf8Faloo; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECBB540A67
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:50:18 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a60f9474c4so535685e9.0
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793310616; x=1793915416;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=gzpoJ77bYxg79kJZfbsCjJZMjG50LvqMExyYQm19Kcc=;
 b=phT6zfpR4Ac33yghSZilntC+YlQsLACTyDalFBThxdMs+49H8y2IqPaDdPgUtlnwaR
 AjbvRjW1DFypR0ul2v3yaGOqKIMuf2vGOQPkFJEeGYIg9FW93bbkNi2v7HU2mkvXQS3V
 X95GSPSEmzUr0OgVe32YB/AnJHxNDJFirbvbDnrapNsA4K0WIlgpRK8O8x53sWeR8JNr
 7SA15HRy549K3vkhntfWGLN3BultCfGJDRf0FYZITjY8yMHTBYxt41xru3hWqk1+ZXm0
 2KAXDhDHLi0cEHfcyR3RsDlcatEEVqpu9ki5CNh+STliNcQekDS/DUy5vuLlD/a3QXTH
 i5xA==
X-Gm-Message-State: AFq9FYLhKEVoioDodXIV+ZdKCjfnWhTatd5nAsNIkwpE92zLcCQWORuf
 xH3c8kvap4nyFftyjPZderS795VJKA0DyNcgHDB9fimjmHM/ZoGTdmj6NuA6OxrWJfL6CZktrVY
 lWDcIvxxkDw==
X-Gm-Gg: AYBFou2nCfcP80J8CAYoNw4/BmLAVxFdEpwCuDNeeKFPNVIvkXNQvlF7Yw1pW6m/U7t
 vbbRQM9V5Ju+3JpQGDrNK4hUIzX1BjW9JPb0obJ6XuZwVA5QrzJdnfs9xaUunBi93KyD8Ls/pE6
 4M3nMP5YcmisJ7zvNyZgnGlZ8+Hzgn25JY65Ajobu3kYxbN83FQfDjIZRcballve0cZoEpy+kCo
 8PjM0XMIKfQMNoxP6/5p5rUG3XvWgFpr9mkg+11CvYEfVT1Zo+tneY2N0vIBnUOHlzK6lvyzz6g
 0p9CodwPG3Je4YRZmWIPUiJiVw3iWPhFVXKhUhkrQq4sXRJDI8ZAJ4g9MCb4wOeunOlhhAeekFG
 C6uwel6QvP1hl0mHrvMsFtqmNyeoR0RtGdMbMHj/0TomlPMkeNfIkKmfM8g4MpFpN7QS6jCU6LK
 sgraDoIX8mHGXdxNxiRQ9d8O9QGZ5N5bSUrTpSF3BfRA57XjTRb8+FPtOnPRBHabACHjXYS1dEK
 dA0sCxL5J91WlUN0RAYk1m4UYC1ssB2e7GJ+olE1F3uut6XkzvqyZjPTmMcWI6Rdbwi1T3+garp
 ESIKWbDkdlU9L25ax3idnsSU4RoVm4b81KTOnwK0Ahdbm83pjKWjL3+N7wFNDpvX+3I=
X-Received: by 2002:a05:600c:4715:b0:4a6:eca1:7d5c with SMTP id
 5b1f17b1804b1-4ac182dca82mr5658335e9.32.1793310616404; 
 Thu, 29 Oct 2026 14:50:16 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf396dfdbsm14406245e9.1.2026.10.29.14.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 14:50:16 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Thu, 29 Oct 2026 22:50:02 +0100
Message-ID: <20261029215007.1788801-3-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029215007.1788801-1-raphael.melotte@mind.be>
References: <20261029213546.1783883-3-raphael.melotte@mind.be>
 <20261029215007.1788801-1-raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for, 2025.02.x,
 2026.08.x 3/4] package/mupdf: add upstream security fix for
 CVE-2026-40505
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIC4uLm9uLXQtcHJpbnQtcmF3LWZvbnQtbmFtZS10by10ZXJtaW5hbC5wYXRjaCB8IDI4
ICsrKysrKysrKysrKysrKysrKysKIHBhY2thZ2UvbXVwZGYvbXVwZGYubWsgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAzICsrCiAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL211cGRmLzAwMDQtYnVnLTcwOTEwOC1kb24tdC1wcmlu
dC1yYXctZm9udC1uYW1lLXRvLXRlcm1pbmFsLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9t
dXBkZi8wMDA0LWJ1Zy03MDkxMDgtZG9uLXQtcHJpbnQtcmF3LWZvbnQtbmFtZS10by10ZXJtaW5h
bC5wYXRjaCBiL3BhY2thZ2UvbXVwZGYvMDAwNC1idWctNzA5MTA4LWRvbi10LXByaW50LXJhdy1m
b250LW5hbWUtdG8tdGVybWluYWwucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMC4uZDkxZmRmNDlmMAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbXVwZGYvMDAw
NC1idWctNzA5MTA4LWRvbi10LXByaW50LXJhdy1mb250LW5hbWUtdG8tdGVybWluYWwucGF0Y2gK
QEAgLTAsMCArMSwyOCBAQAorRnJvbSBjMTljODJlNDZhZmZlOGQ0MDcwZjU1MTRhM2EzMDcyNThm
OWRmYmQ5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogVG9yIEFuZGVyc3NvbiA8dG9y
LmFuZGVyc3NvbkBhcnRpZmV4LmNvbT4KK0RhdGU6IE1vbiwgOSBGZWIgMjAyNiAxNzo0NDowNSAr
MDEwMAorU3ViamVjdDogW1BBVENIXSBCdWcgNzA5MTA4OiBEb24ndCBwcmludCByYXcgZm9udCBu
YW1lIHRvIHRlcm1pbmFsLgorCitVc2UgJXEgdG8gZm9ybWF0IHRoZSBmb250IG5hbWUgYXMgYSBx
dW90ZWQgc3RyaW5nLgorCisoY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCAwZjE3ZDc4OWZlOGMy
OWI0MWU0NzY2M2JlODI1MTRhYWNhM2E0ZGZiKQorVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNv
bS9BcnRpZmV4U29mdHdhcmUvbXVwZGYvY29tbWl0LzBmMTdkNzg5ZmU4YzI5YjQxZTQ3NjYzYmU4
MjUxNGFhY2EzYTRkZmIKK0NWRTogQ1ZFLTIwMjYtNDA1MDUKK1NpZ25lZC1vZmYtYnk6IFJhcGhh
w6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KKy0tLQorIHNvdXJjZS90b29s
cy9wZGZpbmZvLmMgfCAyICstCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9zb3VyY2UvdG9vbHMvcGRmaW5mby5jIGIvc291cmNl
L3Rvb2xzL3BkZmluZm8uYworaW5kZXggYmM0YzA3ZWRjLi5hYjRlNjYzMDEgMTAwNjQ0CistLS0g
YS9zb3VyY2UvdG9vbHMvcGRmaW5mby5jCisrKysgYi9zb3VyY2UvdG9vbHMvcGRmaW5mby5jCitA
QCAtNzE3LDcgKzcxNyw3IEBAIHByaW50aW5mbyhmel9jb250ZXh0ICpjdHgsIGdsb2JhbHMgKmds
bywgY2hhciAqZmlsZW5hbWUsIGludCBzaG93LCBpbnQgcGFnZSkKKyAJCWZ6X3dyaXRlX3ByaW50
ZihjdHgsIG91dCwgIkZvbnRzICglZCk6XG4iLCBnbG8tPmZvbnRzKTsKKyAJCWZvciAoaSA9IDA7
IGkgPCBnbG8tPmZvbnRzOyBpKyspCisgCQl7CistCQkJZnpfd3JpdGVfcHJpbnRmKGN0eCwgb3V0
LCBQQUdFX0ZNVF96dSAiJXMgJyVzJyAlcyVzKCVkIDAgUilcbiIsCisrCQkJZnpfd3JpdGVfcHJp
bnRmKGN0eCwgb3V0LCBQQUdFX0ZNVF96dSAiJXMgJXEgJXMlcyglZCAwIFIpXG4iLAorIAkJCQln
bG8tPmZvbnRbaV0ucGFnZSwKKyAJCQkJcGRmX3RvX251bShjdHgsIGdsby0+Zm9udFtpXS5wYWdl
cmVmKSwKKyAJCQkJcGRmX3RvX25hbWUoY3R4LCBnbG8tPmZvbnRbaV0udS5mb250LnN1YnR5cGUp
LApkaWZmIC0tZ2l0IGEvcGFja2FnZS9tdXBkZi9tdXBkZi5tayBiL3BhY2thZ2UvbXVwZGYvbXVw
ZGYubWsKaW5kZXggNzZlNWRiOWY2ZC4uYWM5MDk1YTJmYiAxMDA2NDQKLS0tIGEvcGFja2FnZS9t
dXBkZi9tdXBkZi5taworKysgYi9wYWNrYWdlL211cGRmL211cGRmLm1rCkBAIC0zNiw2ICszNiw5
IEBAIE1VUERGX0lHTk9SRV9DVkVTICs9IENWRS0yMDI1LTQ2MjA2CiAjIDAwMDMtYnVnLTcwODg0
MC11c2UtaXRlcmF0aW9uLWZvci12YWx1ZS1mcm9tLWluaGVyaXRhYmxlLXByb3BlcnR5LnBhdGNo
CiBNVVBERl9JR05PUkVfQ1ZFUyArPSBDVkUtMjAyNS03MTM4MgogCisjIDAwMDQtYnVnLTcwOTEw
OC1kb24tdC1wcmludC1yYXctZm9udC1uYW1lLXRvLXRlcm1pbmFsLnBhdGNoCitNVVBERl9JR05P
UkVfQ1ZFUyArPSBDVkUtMjAyNi00MDUwNQorCiAjIG11cGRmIGRvZXNuJ3QgdXNlIENGTEFHUyBh
bmQgTElCUyBidXQgWENGTEFHUyBhbmQgWExJQlMgaW5zdGVhZC4KICMgd2l0aCBVU0VfU1lTVEVN
X0xJQlMgaXQgd2lsbCB0cnkgdG8gdXNlIHN5c3RlbSBsaWJyYXJpZXMgaW5zdGVhZCBvZiB0aGUg
YnVuZGxlZCBvbmVzLgogTVVQREZfTUFLRV9FTlYgPSAkKFRBUkdFVF9NQUtFX0VOVikgJChUQVJH
RVRfQ09ORklHVVJFX09QVFMpIFwKLS0gCjIuNTQuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
