Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF94606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DyBlg300
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B42660A6E;
	Fri,  6 Nov 2026 21:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iw32wVgDL8dP; Fri,  6 Nov 2026 21:14:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3267A60A97
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999699;
	b=l9GatcIXa0xOOZU2d6fds3hNDRBhNO+CSr4HJg08P7Qy0kjJqe80u9Fw/pZ0faPv4v0v
	 vQhpfEBJwZDr0+MayCj0uLKNeUFNXd0slXpAojweO/2ZBY02NJVe56IdxW9Zx2l0alf2p
	 O8OyQwM9AesejyfCRGVvmXAlTugCT9NpSsNofWOfGayvlFleypQdLlzwqdQGI2Q05nADi
	 1XrCUyS9sX0AWz3726O6LC9KTpFC0TfNXFvtEdtWz7M76WjX0hM7XrdJ1rLjBTzIXh3SQ
	 SfG77pk9x8rkoMnoZQriphkE9lsejYpSzN7rM3vy7QfyLQtsX6csS0B2KAWZKkbyiiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999699;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=A4IYjir86drMyFUGe+DujJXdfVU4JCS1N6bH0OWB0vY=;
	b=V9TKxkGY47IDYSlmNDMGW7VAmVO1AKKxuHx5oTmPjl9vpMahCZFqJCLm+IaHosYPeLPa
	 ajRn8bu8eJ/rmk/q+4pQm7dcreGhlRbA10kZ+sI2Z82nLR1dBsj9ph0OK9uprI8VsrK7E
	 vrPztZxUq72MGkDaH4Koy1IE3vjl0GqukUxhU9uqvPv/kyjR2W3aqwyq2gRaH9UqF6aJC
	 FZAxd3yX7t201W1KE3hP4fshmENpgk2DGBrt9rsdbte8fNsLNZE63nAGfkPhZp/zABrRq
	 k+g0WtNwZm1G1OBKaYzaKh2l9jdx1Pr5L7jIRgVZi934EfZCIF+iHq1W/1TxmjRaijQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999699;
	bh=A4IYjir86drMyFUGe+DujJXdfVU4JCS1N6bH0OWB0vY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DyBlg300dYTpTOF1mhPrRpiMS0i0kvGRrDHXURYCRjWwTi6Xd8QFqEJ/3a17LVjHI
	 NWGcMNQZoDmDk07IafmcZh0NytEfumAKzd2pGf1uVswfjjdyXlMrEaD5hB/qlr4M5h
	 hzBuWPAa7xaZfHDKhnohwPYEMXMv2hAmC/ClNdefvEJEOajLnHBkul/qnq7TqwDTQe
	 Xaur8lRjQOVCACSB8uLFyWnlse99l5IIf6Y3TgHWSbOpg5InPwqY86ZFsfMpItinJB
	 FSGBSYN3MJZQPihQS1F6K+F6JrWiUi02W3faTNZVpUx/DnDUhGhTp/mNWeTZZrCNEh
	 Zbcb0VPObDU1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3267A60A97;
	Fri,  6 Nov 2026 21:14:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EDCEFD36
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D419140407
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvVbV3inSRcE for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 022ED40404
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 022ED40404
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EFC29E0B2; Fri,  6 Nov 2026 21:12:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f98ccebe5e2b54f6251284f95afa277158ef732
X-Git-Newrev: 3b7faa5ff6048e5b2a916073c8f2b465bd1922ab
X-Patchwork-Hint: ignore
Message-Id: <20261106211249.1EFC29E0B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-platformdirs: bump to
 version 4.14.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3b7faa5ff6048e5b2a916073c8f2b465bd1922ab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index dba740657b..5a3d25474f 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  7c9ce7098f9d717b4a0614fa8656f871  platformdirs-4.14.3.tar.gz
-sha256  021add1ab113483edbcd4694f5fbb2d688b893ea30d35e1155bb371cf4be0be8  platformdirs-4.14.3.tar.gz
+md5  512d112422d0a9d29b41e5b2d0693557  platformdirs-4.14.5.tar.gz
+sha256  32e9921db7385aa8169bee4fe9501923e5715ba9fb7ea3b9c69b0d8e0639f7a1  platformdirs-4.14.5.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index fe8d990be4..3d10199e81 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.14.3
+PYTHON_PLATFORMDIRS_VERSION = 4.14.5
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/9a/6e/886dc7c9d21e2d95aceb696f1e31271742033aeef3661f6e9c8921493592
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/d7/9a/8475be631fb33ca1466915e70fd594c42a4e84b512db650eaa14f90fe75d
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
