Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD97C606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=B+sJmtex;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=SzHA35B8
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8C7B6062A;
	Sun, 25 Oct 2026 22:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKlwboTWvusu; Sun, 25 Oct 2026 22:09:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F1AE66060B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966154;
	b=VPPIrucHKDLUYqUyqbBTDpnQabE6P7MQ52wt1WuwKdnqpnE/76YoTETxPJhTlExB0QJw
	 YRIThDiF+zhqsrMVTDQ8taqdu624brntIIwgWQicuLDQjiNQJ0pVbaepBmu9YxF6kYuBZ
	 UsWPjlXYit6NMz9JbHCEJBbbcIM3IKBkfoZvCAT0EnUSAblBZ+wyVOW8JosgwLa1q66P+
	 54aW3mp0VGQ/8ccKVS6rffjRpeVSHULdnSvFS6li4AIYf4HIZXXhWyOofhPWsjH108ZTP
	 Abr8drQaJsj/Ct1T/mbPybT61NHIbj7w1vjEbFNyPLW4Q9lyN/Mi/pUXvfKpvk+jjhg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966154;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5DozUQGpNEymmfep62Ec3pqvRx+mn4C7XHDkOxetF6Y=;
	b=rDTwF4HFiVnyjlzCm7skK4BoXKJ21sz9k73rOdHxl/En322q8oVtD7lcg9uxJpSLZLQL
	 iUIA4tovFR+2V3K6XqIwGsh3aoGJFk+OOPs+8Y4xEwjvmRHAWK3ogj25lbeSvSY6Hnn+V
	 OOoIWSwkpQCHKT0HCVr6Rly0Qu0lTi8v1V3yHgeqNzlvxgY7qJ28kfq2/pShRDuTSrz04
	 OX2SNgjz5pBy26WWvjMErdyMdoWQvZWRw7vIeXc2obzQ/6F+3YgE67QhiS+T9BQ7rDpkV
	 WL0XQOOqfd1TFBsLeww2ZEJxBBar41UWvE82BOlRLGg5CHcjcSjQQG6z+I8jbWs2FhA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966154;
	bh=5DozUQGpNEymmfep62Ec3pqvRx+mn4C7XHDkOxetF6Y=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B+sJmtex/k/krOnskNUCrJXlLiyWISoclKoyPa1NzJnVKT4pjl8wYsfKagfaCqVD/
	 5YsG50vOzJpg2pE6tUdh7xOf16HNw7y8JEQo3R2DfIa0F2cQ4c9uSfc07VA7+zBtSt
	 OWb5hsp4eBmJzIZ3ePp4a9hNffe7Heq5zd/8Wzbwx2X6eIPDPYT8kaaOLY7+7EOmUr
	 JoEIxIXIIlzNW4g+XRqD5lMYg5FJG1SBurZ2wTpMePJHABEogbdyNSLGgd9rgEUpRw
	 nb5Mo1JVETLK6lUoNOD/mWut1rKB63EFJLhpuigGAv5xWZzhU88rzzB3LcdAdAZ+IH
	 9H63lHHoIHRHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1AE66060B;
	Sun, 25 Oct 2026 22:09:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF0C6356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D559A4040E
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id deIEi3ypLfaI for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:09:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 006ED4040C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966151;
 b=QDo50qirnl811DilErqFx46MQGeYmYnYOccnf4gUTc0SD81b7vYdT3Q32vM7j6oYYSVM
 uYkKcJwfdzPYCmTIIkNOBk7xAcLOCl4XvKQfAL5nK/t7ti6ydkW7qKJbWZI5sFTNNuMy4
 U/FUN0TUVbbCERlp43xYX2ZZFkOYmk7nn0yiGAsND3pnowzOnjl6VaWLAgs4mvpXORahK
 Q8B7ekqbgvOwSlkA+T8O4hMvZUcsPXNexdNRUc5sw5UDLk25rqORrGe48nUYuPI8ViBMZ
 +gtklQ4erv19OKG8C8SEAM4LRaVHbgMavnLfGgGa5ns/+xmQDXtQcAlyZw8QvYzIEyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966151;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=7TJMtN5JWiAYVzCR3DTKEL2QSnFUdCuCWlacELppXag=;
 b=oQJDgywbbDO+3qlVilVGB4r/ZioxPGZT9bRrWoLSNm6D2uqy93qket5XEs2/fB6Fykwr
 zH0rhmNdP8FNUIWqRA+ShuixfrHHms1lrdOx7ojBoEIx4+qMOQX8r/18BSseamdhPpxUl
 bur5ZsiilG8Q556S/UnymmxQd2M2Dy0n8Fdsvfy7eCb8mRQ52AwD/HGGEv1ghTbTCrAYp
 zZKIng5pPFUBm6xXPO9PwzZDK/QSS6a2LEpfObzGiszHLH8xh/qXgOhbGNsjKeYWHsTlH
 fZC0Zue6eVvu+QDfvcoGcgUiK9SXZHtK/dEbAyoeebEzHOuK7kfkFjXeFeNhH38/CKQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SzHA35B8; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=SzHA35B8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 006ED4040C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966083;
 bh=7TJMtN5JWiAYVzCR3DTKEL2QSnFUdCuCWlacELppXag=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SzHA35B8qMYhUhjKFpTjC6JURdLg7dkjvrDzM6VFs0KjMlKZ3b6a6Q0Yju6P+XYMi
 jxnpKbnh6dFruhxgtZTwuLj4b65MOCvcIbRIdSiJ367lJznVZ2HbPRBbcnhHEP29pK
 Rdl4Ap2CjZi1WALVM53QA2/f5zVHbxK8q6PjAjj+SkTOVrWpd4Nb1AY/+HVAnc6x5N
 MelDYVY42SLXmTmEZwwvH+MGmUE5yoOrLX+3eWQDEgIxeG7lDzVgxI48HD10l3qtP/
 b2VILo7L5MSZ705mkZaN+Si3d10mJlkKqRH+sV7fAPOAwYdf5aDUh7Q8bCPvklgian
 gJrd8c/iialtw==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 s2zfnpnDnJpMXFjl55gsRW7tJNLyxo/i7ZUlHKqjoh76KpRdr953VCE8l86DUniaeJZXxeR9meN
 h1CVfJtv88Yppa0QM/xkihQ2Q9OV/FjOmlqEq3u1zTszoyPRMblfFlZe2H9Duedkd38euG0TPJo
 WYfpANZQG++hToh7jm9cveeMV+ts450jnoNCLqxdmZEE6YqnK8TcqaAgar8pmOml8SHUUP1Uj4M
 og/xrLoFB+yqcC6FjhDuDeuBDQq1gpek6H7xdz+8fZ7uCafLhF6x1dXKeOq+VU7x8SIfHsMa5vG
 eNQDlH1xNP8OeFRHSQkxNawB9ubM7fB9O5O+9oGOgVW8QuVx8/Ae6ZKsU8sWdH8Yz3qZc6+2MM4
 F6clOA5xq2Lwjaih9Ve8NcgLflVCJPtKM9z8+GStx8lQ8YZPA7dTxnDkN+EzAq/6mc+mYX19/XB
 IJqU2OFPgxIBn8htHEBmxIcrcXd6j/iK/E116glWRYcVNRQJcqxuXSCzwgqD1Q9ThTtyRhowCe6
 8yNgeTfWm26tTFKEOl+oEFvzdepwpNd2w0ucUpP9JQ2pFJplGHuw9lMOs8+HAXxolzqZM96pQ==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 397A2A4C69DA;
 Sun, 25 Oct 2026 23:08:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6ND-000000001fP-0Mmu;
 Sun, 25 Oct 2026 22:07:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:06:53 +0100
Message-ID: <20261025220723.1332924-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 04/34] package/containerd: bump version to v2.1.4
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKaHR0cHM6Ly9naXRodWIuY29t
L2NvbnRhaW5lcmQvY29udGFpbmVyZC9yZWxlYXNlcy90YWcvdjIuMS40CgpTaWduZWQtb2ZmLWJ5
OiBKYW4gxIxlcm3DoWsgPHNhaXJvbkBzYWlyb24uY3o+ClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1
aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLQogcGFja2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQu
aGFzaCB8IDIgKy0KIHBhY2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLm1rICAgfCAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5oYXNoIGIvcGFja2FnZS9jb250YWlu
ZXJkL2NvbnRhaW5lcmQuaGFzaAppbmRleCAxYzNhMzlkOTlhLi43MDE4YTA2YTFhIDEwMDY0NAot
LS0gYS9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5oYXNoCisrKyBiL3BhY2thZ2UvY29u
dGFpbmVyZC9jb250YWluZXJkLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIENvbXB1dGVkIGxvY2Fs
bHkKLXNoYTI1NiAgZjVmZDQzYjllZWZkNzFkZGVmMTAwZTcwNzAwMTZmOWU0MGExZDY4OTI1MWJj
ODg1YTJkMmE4Nzc1MGRhMjZiNSAgY29udGFpbmVyZC0yLjEuMy1nbzIudGFyLmd6CitzaGEyNTYg
IDhjNDA5ZjhhMGJhNjAxNWNiMzY1YTk1ZTAzOWEwZmM5ZjM2NjNjODkxYTI2ZWI1MmMwZmI4Y2Qy
OTFiYTc1ZDQgIGNvbnRhaW5lcmQtMi4xLjQtZ28yLnRhci5negogc2hhMjU2ICA0YmJlM2I4ODVl
OGNkMTkwN2FiNGNmOWE0MWU4NjJlNzRlMjRiNTQyMjI5N2E0ZjJmZTUyNGU2YTMwYWRhMmI0ICBM
SUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5tayBiL3Bh
Y2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLm1rCmluZGV4IDM3OWY5YzQwNTkuLjA0YjczOTc4
YTYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLm1rCisrKyBiL3Bh
Y2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKIAotQ09OVEFJTkVSRF9WRVJTSU9OID0gMi4xLjMKK0NPTlRBSU5F
UkRfVkVSU0lPTiA9IDIuMS40CiBDT05UQUlORVJEX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGNvbnRh
aW5lcmQsY29udGFpbmVyZCx2JChDT05UQUlORVJEX1ZFUlNJT04pKQogQ09OVEFJTkVSRF9MSUNF
TlNFID0gQXBhY2hlLTIuMAogQ09OVEFJTkVSRF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQotLSAK
Mi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
