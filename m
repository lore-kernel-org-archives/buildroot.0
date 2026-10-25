Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A3A606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GMiYm7FV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=rHutRc5i
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46FEA606A0;
	Sun, 25 Oct 2026 22:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AbifC6cAq8cU; Sun, 25 Oct 2026 22:13:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 57C7060626
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966425;
	b=s1/F6K/c+Btmgdm8t3e7FKLxSe+KyYpr7VRvLlnuxYugFA1VXl6eiJLcDnsTkfM5Iqvl
	 4ymGlSIFpUgzm3VT5VBa6aKJmujCaOd0HPXrhOmZrU0ifW+hFrHqPcdUGFCS3QvKTmdK4
	 2no0dx+y9LpHfGA0cb1tgl89BNGj7uW4Dc/yx89gmEjjY9FRjx0ZOXQGZAjrukE3VXzlO
	 VkX2EUNsVlaKavJGzB4V0aGr4pOs1MQN8EPyazMjecTgcBh6XG7n561oCkPgRyOtsWaPE
	 N6vM/emOah32FBs8L4dy2QnFLslNdY+rN0B9WUjzmH9zc1O8UzgutVMHN/1pJ8xx1lA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966425;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SZG6fLIMki8jI0sLzP21Ht5UAFBBa5DmMwX0lbTJSrg=;
	b=d3fw1Y62rvPWyCHGXoEfwtA5NCk3CoKS8gHsKBovq0YcIxZXRrByiOEpYpIR2XSgCqYV
	 iGhT95xTmI5NA8Mk/OdsaBKxPNN5wOSkLL6vaBXwctHHX/nQOGPGvkQBgenUkAeP1tsaN
	 ing9XYRHrh6bzhoHLzrzVJc5ImsFtIpJ1eE5OtsclxuC5ZHBVbw3pssrk95rvwlqZjnzn
	 d1gNxYu5+/sxg07NuKtunicndP1cl4xDdc5YlY73a8LbAqeiBfRawjD814DQYwzc7r28m
	 JH6aqPRFL1pcY5D8KIDNfd2jCzoYDkEy5Nu2htS3yZRc4NKPCSGwIanxdALnnFgnNzw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966425;
	bh=SZG6fLIMki8jI0sLzP21Ht5UAFBBa5DmMwX0lbTJSrg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GMiYm7FV9PLv5FLxu4MCeyOCWiN+TmYRCdWGG3QA0PmsCA1GrOxN0kKSVx7Sd2Iun
	 DtOZ3XHnk6xDDOsLa4vU/d6hZyHOFhhZJN04XVJ474ZtBtUNhd8+ItpCwIZcfss1nm
	 GIGhuL1xFYGcCx3z7BwteCHH3OR1fZMs+vfQ3OrcUtJTbaj0+XSmNa5/vu864u0v3v
	 BgSG9OCS8ob7vyNgOIauz0ccRuQn+vI4NbndBb9RLSDXWY5wrhUM4obWuE+q0EzXbK
	 nnp46anuT/2yQ56BzwVfsomb2JhU/NBH60vzVOFgnFvuwcZhmk4V7EB6omzZK7uk93
	 a8NtEw9nh/erw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57C7060626;
	Sun, 25 Oct 2026 22:13:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 346D6279
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A09480822
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hl-Gre1ZF74V for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:13:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 330C7806F2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966422;
 b=cToPlyvkGrm3UMKd1OQAyxx/OW/jw6OldzIQ1NNkoHGenul1X+T2A+SjdktUcY4a3aal
 9enBLo09V60uCyXzhL7Fwd8Mke2y6mQvoQBo04aZpywrb3ozdsTqroOSPTc+WD/kHgToe
 +MHdjUJJoenWPPA048/w1T52DyPM86Qn1FQWwd812LF2Ue+u4DWoXkVCC7hKwLqgOETxF
 uW7SwlUiJjyHLnl78VZ2/HuLnXvR7nelfTjx9zkq0pXtT8BA/olzzL+Mzi8wgkb3l7/xL
 C9bzkiH1BsNL4g3CgOyWx+fBXM+RV/vxqkgdVqT1zWJCX6L/5Vjs1N/SjI7Vmu4h8WQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966422;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=dKSw+1a6tkqZNtjK55HCcDiHMwreNJZmqDoERLalFEw=;
 b=lQOoeI5waxlmzB2rHQ7c/Z8rUrFVyZvP20blrAoJdMVN0+fPsJ11LTFHV7VaPhkEQrEc
 kO4ENmcM6cLNqbuiJZXwTpEYO2ncdLTN+CzTHB6eF4ylvra7vIWbwDJuOwFFt/t+SV9/N
 DR3ROmIbODnfwZ7T3DX126/lwobiksLKztK4DlxMe8mIqfVeOt3U4Una6vZAoQ0C1Rr4O
 ZYxUFpuW+pDdmegpR1aaecCutI+f4dZyaikHxJ/nbduIqxYnG8+h17K6idOENB87Hafw+
 cOtNyckyE5vsBFLSMqX1c4Yo9Owh151RoEGd53gclzGsrUDRNq79+B7JmC5Rfdw2GSQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rHutRc5i; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=rHutRc5i
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 330C7806F2
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966087;
 bh=dKSw+1a6tkqZNtjK55HCcDiHMwreNJZmqDoERLalFEw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rHutRc5iBFirAPYbLe6p8haCM5rmbuphM+sQjIrqk+VhikXn24MlS1Gs5ocDf/N3m
 Dlh2UN74utLvg+Yil5tmlcUdmnNHtQbLwP/a3TR7eQTOiaToSK/ucOXt6c/OANi62z
 AU3IjDsXfcTQ94vlruG4+mXpoAOrKmIj08h+Ta/Bg9b2GgCjfG32OXgG6CbkUShGeP
 5VWAFcN5AD+ejVK6lHLSINX8GMaMNObLsY9vAlJo/2ad6wp0KStcyMITCV/4XoF8uv
 +f282oFFuGNmMi5F1CXD2Bya0Xa1eGju32Ts6N5mzhZXXEaluDEXC7Byi5cpqzN9GD
 SuCnmWh6UwklA==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 KtXN3gY2xhdhPXwfvuYVsY12uRrfvQA14zrbIYg6QGkzRuE+T88dGW7KCk1QfPPfgrml/Hi3m4k
 Ct55ztq8j3965YyTkVixCBLAbKm9mThIltWg9knwPVMp3sEHA99B0oC7hdQSiUidEegLlmwCfZb
 3hPPP3Uaq/MuSNVrcSNCQrsVkFL8FwgWQoM3s6kUD9omru8sjOiQJFV1WWEDfsVW55UsqrM0F+N
 TOQcg5e0rHrTVONRdHX5Teyb9a6VbtczzoIANICElO9OtziMMCBq7BXrudd0uW9Ao1tSSS3HOea
 pwHkD6inV5CBglTJ1v05W24h30ZhdBVOty0FDmOn4SDxhJJtmZ/DTS3Ly5KP3pbteaTQlyVPbSi
 N91RKuo+n91eAewMiX0WMAViM5ZrfYgZ1uxCWVXXVhy3yvuNg1w5VJCxnXecpaDtzGmmXrOF5K9
 dPjn4IrDKCvtgT0wJCabYnxhACy6ZiCSztm1tT3Ibic5uioh9DtBIcwBRsqx/PiQBvpPpqd9QMz
 HsX6lv7rRnzSN6/ITwANgoMyaLIPE+i3soaPn5XQlYyGFZMxb1zHTiSJBRgasmtXBJCDm20q+Rl
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 09C83A4C6AB4;
 Sun, 25 Oct 2026 23:08:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NF-000000001fP-04iH;
 Sun, 25 Oct 2026 22:07:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:07:19 +0100
Message-ID: <20261025220723.1332924-31-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 30/34] package/docker-engine: bump version to
 v29.8.1
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKUmVsZWFzZSBub3RlczoKKiBo
dHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjk4MAoqIGh0
dHBzOi8vZG9jcy5kb2NrZXIuY29tL2VuZ2luZS9yZWxlYXNlLW5vdGVzLzI5LyMyOTgxCgpTaWdu
ZWQtb2ZmLWJ5OiBKYW4gxIxlcm3DoWsgPHNhaXJvbkBzYWlyb24uY3o+ClNpZ25lZC1vZmYtYnk6
IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLQogcGFja2FnZS9kb2NrZXItZW5naW5l
L2RvY2tlci1lbmdpbmUuaGFzaCB8IDIgKy0KIHBhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXIt
ZW5naW5lLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2VyLWVu
Z2luZS5oYXNoIGIvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUuaGFzaAppbmRl
eCAwYTIxZThhOTk5Li45OWUzM2RkZGNlIDEwMDY0NAotLS0gYS9wYWNrYWdlL2RvY2tlci1lbmdp
bmUvZG9ja2VyLWVuZ2luZS5oYXNoCisrKyBiL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXIt
ZW5naW5lLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2
ICAzYTkzYTg4YmZmNDFmZmE2ZjRkY2E5ZjRlZDlmYzA1ZTdmZGIwOGUwZjkwMTRjZjFkODE3N2Y4
NWVjYmMwNjgzICBkb2NrZXItZW5naW5lLTI5LjcuMi1nbzIudGFyLmd6CitzaGEyNTYgIDk0YmU5
ZDY5NDBiNjEzNjc2MzM1ZmM0OTRlNjE3YjRhY2Y5ODY3NjQzNWIzNzQ0ZjMyNjQ5ZWQ3MjExNGJk
NTggIGRvY2tlci1lbmdpbmUtMjkuOC4xLWdvMi50YXIuZ3oKIHNoYTI1NiAgN2M4Nzg3MzI5MWYy
ODk3MTNhYzVkZjQ4YjFmMjAxMGViNjk2Mzc1MmJiZDZiNTMwNDE2YWI5OWZjMzc5MTRhOCAgTElD
RU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsg
Yi9wYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2VyLWVuZ2luZS5tawppbmRleCBiMWUxYTM0NTc4
Li5jMjNjZjIzNThhIDEwMDY0NAotLS0gYS9wYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2VyLWVu
Z2luZS5taworKysgYi9wYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2VyLWVuZ2luZS5tawpAQCAt
NCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLURPQ0tFUl9FTkdJTkVf
VkVSU0lPTiA9IDI5LjcuMgorRE9DS0VSX0VOR0lORV9WRVJTSU9OID0gMjkuOC4xCiBET0NLRVJf
RU5HSU5FX1NJVEUgPSAkKGNhbGwgZ2l0aHViLG1vYnksbW9ieSxkb2NrZXItdiQoRE9DS0VSX0VO
R0lORV9WRVJTSU9OKSkKIAogRE9DS0VSX0VOR0lORV9MSUNFTlNFID0gQXBhY2hlLTIuMAotLSAK
Mi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
