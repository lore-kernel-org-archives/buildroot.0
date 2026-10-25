Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F42C606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FmAlAoLi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Cj6tUOVb
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE77660648;
	Sun, 25 Oct 2026 22:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fyd5x-EuwgLV; Sun, 25 Oct 2026 22:11:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 06B8660639
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966266;
	b=M6YE8TPUqEBaUOZl5HevDHJB3d5Ltg8cRopW7DgSha0Lr3w43YHSvJdfbnUZU0xmB3we
	 tTjiTKaXEqy64vameXmwarafNl5DciQNmCwS54+GwsCAkkvjh7ri3zC/5zsb8CA76aZnt
	 K/8t5bO+3sy8/XsxOX17307qedYpHt+OQv+9XqEWLFQXdJ5VTZdr9vGVub3Eg2HilNGrK
	 b06e0gkoAtb+yF0jJchjmJ9fZVO7uSTnAyMESsBfPa/W1wAeGv1dmS22omGa4q3QxIt9w
	 18yBoG0+lqhkuAobR+o41crOeywcAHnP9aJ6GfM+xIT9VheKyRAgABX5h9TfXmL7Zig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966266;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WjKM3jDrss4670F2qY1HPlVpM+7J2mzy6+J0cEbb3BM=;
	b=FLSA5n4alrQ/Dzr8r+QyfrEYNNXRzQwTAvboVOchPiyYcHQZvKtxxYeayEN60B6urRJi
	 0XuSf3RoRwK2nNWeEmhDXla2OoutKJfKm/pWTgtr3cdAHYygiwAVAm62ydlItN0adrOxP
	 ZdcQ/69I/6cBOaNrvs99ghFBu897bzYv6P+wupMwvkB+yKtT4WFUPvUT/SHHUFYAkl+6g
	 utlDhNstbwA+q9OWj2lkfx/0bo1P255Cr7023Ova3CMkWucJGTzRyPQIQFXbdESLND95+
	 VSRlZOe4qe0rr3JbQUf5hwbFGZJvEjHhrN+e98nxsR9pz8QCPUyIAKQa0uMB9yVzvSQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966266;
	bh=WjKM3jDrss4670F2qY1HPlVpM+7J2mzy6+J0cEbb3BM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FmAlAoLiTWpgCoRDekMzeCcOMajXmD7ZPagjB0OPVDdCxBly9uNJsNwT5UvK5MvES
	 Amg7UIlwf4ZXca0jW7lOn3ji7XrHFqFvnFglVIcaeQQPQV/e9GR+J2I37QF042p7x9
	 iNc5ZYZSxligRg5N+TbwVwk1O78jACCc/agyChO+LqYIN0hUPjdNlj960+pVeu4zGI
	 PjJyDURcgXTbr6spLrFGOSsvYXdwL/7uPeTbOQ35lrFDzj8DC3P6Z91wdVnyBAVx4u
	 JjV5el9gxGx2TFQacYhnwXju7s7tfgz7KmD4Z+96R1COJEPl8hgCOy5pzHUnsalLb3
	 zPu5ZX8h4HNLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06B8660639;
	Sun, 25 Oct 2026 22:11:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AC34356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CDF280D07
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:11:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xg8bcuLl9UBa for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:11:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5BBED80CF8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966263;
 b=QAcx8S/nYLMbx6b+k1LBoq8DR/a6iSDKRmh/c89YKtHNPhUkWAKL4JVtU8giwg2GsB4I
 8phPGAwhqf3zeE9Sb/7pUaokfglMRjGXnN2CXSDK1pFyIcnpPP7OjXIJJ41jn+m5op3ir
 5fLVUhvWHdoTFq2VqZ0g0WuS+P00bxXGxScD0aKLERQRcSVQeHOdgpLM1m9R9JFx3iYVP
 mrJ5pEOJn5Qe2ebb88e/GVnOkPWXzHv0Yu7cWhbcMizKyoUsjwwD4setaH5EB3NasCcCS
 r/VqpKQRu0Zfy7FMBq5UCY52Iy7VqkM7XlTTifWkyJd1vD9mB6hdV0vOZjANH07+ZFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966263;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=TjgmDtCGPkbcFqZBO9hyHTBPHhFtaw3ob2Lo4T2Ty+c=;
 b=NSNcISF0smooiSUnlPxCMOSDFW7uTYh4HxFPqIbEKbXC3geW3Jr03eiMEVlZ+oVD4ZXH
 inh5F9CkI9QCFuyawJzrW+q1SKbW/Ua9J0hhGcdk4v1tcjfrTD8LkWQs5zUCDnMvNraov
 lIBFtQe/0vkWHlAWOpVclDMVWm06pWhJRilpv7EpsoVOJP5OzwE3BQZTTt92i+U7c6xV2
 +wwznl17rv0O7j6Bg9nvh7fjXKbXVfqeMOmCpS3q8gb0T0uCQp67aQT68FNio3s1kBsYr
 svv1NH8DjDHBPI94kVTC4Boo0G9WoPZCJNgSE2igRi/GgyHM1NqYf6LziNjwcyxgFRQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Cj6tUOVb; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Cj6tUOVb
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BBED80CF8
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966084;
 bh=TjgmDtCGPkbcFqZBO9hyHTBPHhFtaw3ob2Lo4T2Ty+c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Cj6tUOVbgSoI1O82iuVWus80ciFh/NSkDECzmtWmW+u16TUrdHDok0UwyWMF8a+W5
 IKDiC4ZYVKTookrb9E9ogBOD58oSt7trFblXG3FO8lZEBiAcEqdHYH46RmUTaFh8oi
 2G2ZVx5r5BWFnUvoIniIAAE1DH/mSYI53wK1G6Gteeqvj4b4NgKs4Pp/YhRgCn0aK8
 kGp08QgnORI7xAZF4xCJ41ZPzlbV9NdDguZq0czXXbbkF/b/fauao4sEeCD+sqXlHa
 MzoyE2If6P5sYe6GgJtwwlCKCBvwp4SY0nEzqsciV3hVKD1kzCGUNi+gY0T3tgxe50
 tKawJZqxyZeKQ==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 dYikUdklH319IGnZLvlQsZkbd4uq80NwftW/s2yXq8MJiuv3L3Q0/JN9QUDaId1vr9cCUB+F3Xq
 ABNGvvsEZEDdsA4y5DmhS9IGhtVQDdlo9tUpwzc3eETbG5QJtju3EmSz00epT5iiQ1AdqWTq/xq
 AazX6gfZ1Be9wtI15h41MD0AFjS2YrdrB8FFALnUJ8+/Fb8did7ClEbUf18d7vyn9sBpgwGzpIb
 r7DHdMtFtUE3JlBWNnXYNNbw1I5syeYxY1zkmVbMWlHkk9kqBIn6WmVP+OLrxF2cpZpbUwkL0qc
 eRoLlaqeHdP5/pIY8Vq23bCKCS4a0CDK+qXdG5Y0RrvijMUJBj9C/CzvrPBfp/LOAdT1zFhpquf
 CHHBMAaU2XwFe5x+HwA7B31JotsWkt096WekxqgTDvI0/VjWbZeonlCPuSyyifLMdLEkavPiIAN
 3UsAw2LUDIOEV+ODVgWJrr+JN9KTuBBtnKFkCOFIVSn4vth/fwxPq00MaCOy/r45a9+K47lqu2a
 +FXYIO+hMMKICFjSWznOsBlR8H+XFIsmheCKXXdjBs/qc1okHzikIJATMObiEdcgxer83eqI9c=
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BE6C0A4C6A7C;
 Sun, 25 Oct 2026 23:08:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NE-000000001fP-07vT;
 Sun, 25 Oct 2026 22:07:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:07:06 +0100
Message-ID: <20261025220723.1332924-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 17/34] package/containerd: bump version to v2.2.4
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKQ2hhbmdlbG9nOgoqIGh0dHBz
Oi8vZ2l0aHViLmNvbS9jb250YWluZXJkL2NvbnRhaW5lcmQvcmVsZWFzZXMvdGFnL3YyLjIuNAoK
U2lnbmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgpTaWduZWQtb2Zm
LWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIHBhY2thZ2UvY29udGFpbmVy
ZC9jb250YWluZXJkLmhhc2ggfCAyICstCiBwYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5t
ayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQuaGFzaCBiL3Bh
Y2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLmhhc2gKaW5kZXggM2ExZGZmNGRhOC4uZTAwOWRm
MGRlOCAxMDA2NDQKLS0tIGEvcGFja2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQuaGFzaAorKysg
Yi9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBD
b21wdXRlZCBsb2NhbGx5Ci1zaGEyNTYgIGQ2ZThlNjQyNGM1NDRjZGFiOWI1MWNhZTMyMGMzYTlh
YTU1OTBlOGUxZmZiZDFmODYyZWIzOTVmZDhjNWJjMjggIGNvbnRhaW5lcmQtMi4yLjItZ28yLnRh
ci5negorc2hhMjU2ICBmNzNhNDU4MGE4Njk0MjYxMjBiYzk5YmNkODEyYWM3MjM3MDFhOGM5MzQ1
NDlmNzBjOGE2MDY3ZTMwZTE0NThkICBjb250YWluZXJkLTIuMi40LWdvMi50YXIuZ3oKIHNoYTI1
NiAgNGJiZTNiODg1ZThjZDE5MDdhYjRjZjlhNDFlODYyZTc0ZTI0YjU0MjIyOTdhNGYyZmU1MjRl
NmEzMGFkYTJiNCAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9jb250YWluZXJkL2NvbnRh
aW5lcmQubWsgYi9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5tawppbmRleCBmZGE0NTUw
MjQxLi4zZWNmZjhhNzBjIDEwMDY0NAotLS0gYS9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVy
ZC5taworKysgYi9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5tawpAQCAtNCw3ICs0LDcg
QEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUNPTlRBSU5FUkRfVkVSU0lPTiA9IDIu
Mi4yCitDT05UQUlORVJEX1ZFUlNJT04gPSAyLjIuNAogQ09OVEFJTkVSRF9TSVRFID0gJChjYWxs
IGdpdGh1Yixjb250YWluZXJkLGNvbnRhaW5lcmQsdiQoQ09OVEFJTkVSRF9WRVJTSU9OKSkKIENP
TlRBSU5FUkRfTElDRU5TRSA9IEFwYWNoZS0yLjAKIENPTlRBSU5FUkRfTElDRU5TRV9GSUxFUyA9
IExJQ0VOU0UKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
