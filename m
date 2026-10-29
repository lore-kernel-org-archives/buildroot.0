Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F92C606A321
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ai/lpNJr
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEE2F813F5;
	Fri, 30 Oct 2026 14:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GrkUVTc_8shj; Fri, 30 Oct 2026 14:08:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 04DF9812BA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369294;
	b=WEO9oc4pA9ObNku902JW6EPYj3RFppHTnq59zyeaYwXClQPaiVzud72oKURJcPKVHfk6
	 DfJBoAyXlX8TpYNTxp8rLIDkkM7BHqE/blxOJhTceKBeYg+pYTf39+4bu+i3xDGOsr0IR
	 g/qgoySPBePPAd1KOT7cR+Vn6ELj3yjQCrYlkIVs0ANH5baMvMEY30yLP+9B6au7lwRXG
	 eBfxVOqjs0Tb8LfcpRf0LuucRATT7vokuezenNh/XQ6i2Qjyg0n/3Owu/ER2gmFbMHHoF
	 7rjqIDD2InLptbb3Q925hnyg5/nanhE96E5imSVjQ/eCkybaXCgN65xVPzU2PRj3Utw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369294;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=6GYcG4xzaogAwfGji/ElSKJ8guB3LM0jp+SQMi9x6/Q=;
	b=SLQbA4cOHc1fg6i2j1v0KYrz0SdvctYZ6h7aAfm8AC2x8uGjMqN7k5ffwA5GnEOShdFP
	 ag812a7Q71huTdNGaPSbxYA/1xtExT3Xkwdz/3ytGWmDdyAKeH5eWNgSd/KBt+ryD03df
	 uuEQefuWkHtLIYY5XX/scyek3NatQniJNK2fByuAX2XOU1rOcSPSLqnx5a0X7ilFO6UUd
	 AHWHp6iyCGYPQEGCEnZEVJ1ko658cEdCQTrKdaN9zctQd+lrO2ynxBPhgCfbTWMJb00OW
	 YgGD1eIyzb+ESCgipTd2bIrpYAoo5oJhpMOTs/l/Ond8XntgfndIunPaZac+YfO/9YQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369294;
	bh=6GYcG4xzaogAwfGji/ElSKJ8guB3LM0jp+SQMi9x6/Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ai/lpNJr6/3VhmtKfHIgm8RwQarNVsfed4GC2WujVnxg146ZoQu7IHj+7PoSQJcou
	 vRVpTMFonnRW/pLaL7KPaquAAnkw+VA44kD+CEuW7Ax2TIHP5bONyhzuxq6qUgBkSd
	 66nCx0X3o0Z8cMvLKimqo19TxpM60rCIm6gv4k9w4wqdXoRgdnVL2ELqTj/cPS1UgD
	 P7yKZpOSxIH2UWlgL2xRApheEvTpA4zbx1xfRThKVoJ1kqEyD/Re0bzsR1CfuThyX3
	 0Bni6l4fL8QwsuNJUnZgqZpUy5qRvv77tBdidATPbNDIC/6vPd55vsI+uGufL8JyCt
	 hEOXsKQfEJ2GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04DF9812BA;
	Fri, 30 Oct 2026 14:08:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E1D05D46
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA5E760AE5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZctlFkiYjP9U for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1323160B09
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369168;
 b=M+y9y46A+5VJGshHGPuZt2y+Q3zGk9RbKN8uS3h+BpJYQZYIlKC1zl5aI/kCYMa8QAP8
 HEnMeeoPqaRHIhiBjbVWdBysNIbtmKCcuaAkMsK6ze/oENejcPL0YvOPXbKK5u2lj9JSa
 MOFrT1yjziEROXNrawGU0pwZr+eeQ+RIZHD7S0QqIUlUeoGEjbD5s3xf+dWfcrQ/f0u2v
 6d1GXPmql5r2Ajthu7lEmwOTNrLZapZAJVJPMeoliHp4TKLi1PwfosRxJ+Hbnof2gfFwH
 WK5EmNHfZbgcLh6+FN/V9FdYI3APLn7fsZ6D4g3u6jBbhunZ2zyLQgqKS6HkoZknLyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369168;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=lPZkvAeYbwlje7mxmuo7WJ1osUMRRmK4QG2h+SLNAIQ=;
 b=HouIFoGWuxE1JphBRFUqK42z40fdpAK8EaLjUcLSnM6RLKTIWgUL2Gufp8I/z+uDs2yV
 7r6xzUOWFsFZ0IdGjKidJwXm4W9lV67xXa0A4m2jP84G+2XCgBXs/250X+2P/1a/CcTF2
 9bPSRiZ0hDh2pNmUyoGzJ9u+sH0kj8Wr0rBk/OK+l0ZA20M+MTbefZ0XR320G5Sj5ij/m
 v99QqzeoQtnOoupxX3W94ilNMEMOCJ7vzfUPj2TrwUU9fu21qjF6bxOCvUB84rmW+pJJj
 ntrudu3CFA+1ZrEG1ypgXkY42dUqf05BIxWQKoUNrlbWOJh7y/lgnuWR+gsKx9yHAeg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1323160B09
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25C719D389; Fri, 30 Oct 2026 14:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:00 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 631ecdb4e16784744ad1e3a9934705d01b918365
X-Git-Newrev: 2df41d754c5484657702d70eefcda82c9b20e0a8
X-Patchwork-Hint: ignore
Message-Id: <20261030140440.25C719D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libarchive:
 security bump version to 3.8.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6231116250593447561=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6231116250593447561==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2df41d754c5484657702d70eefcda82c9b20e0a8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/libarchive/libarchive/releases/tag/v3.8.10
"Libarchive 3.8.10 is a security, bugfix and minor feature release."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1889206b35aa8e272e5a325cb037fd9d0982ae45)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index acd4b9ef22..cd5943ebb2 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.9
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.10
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.9.tar.xz.asc
-sha256  888c934f9d95648ecb9163dc8e23ab80a476ecb81a8f1154704a227b5b676dde  libarchive-3.8.9.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.10.tar.xz.asc
+sha256  56cad765459d5ee25a3b761f90c47d99379d28297fbfb72d908880d6b875fb96  libarchive-3.8.10.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 88dbf2a48e..75cc034f6d 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.9
+LIBARCHIVE_VERSION = 3.8.10
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES

--===============6231116250593447561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6231116250593447561==--
