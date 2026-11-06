Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD879606A32F
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Cv7Hf6wn
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A61B560A65;
	Fri,  6 Nov 2026 21:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5lTLgJ8HAj8; Fri,  6 Nov 2026 21:15:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8201B60AAA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999705;
	b=ULoEbloEUjvJ0Pn6oy33KMn63jmdlslZNXm/bo7EtDwNOyOtHVlp9lD3OGPzdtTCk57z
	 yisOZkprI7QtRDHd4UIACC7OrZZFNH5s23EQt40mRGgdxKu17HvV3hWPQCKEfxZsPkz7/
	 2jvFhZopzIayniUHBg1SvpVSaWvBHH/2hs5OixVqwHSJ9TPG7gH1oTzJ15IPXWPDGcBik
	 8bSQI9fuyWUVxo2HxR0KqHZtIK7QC+3aDyK8BOpvH5Ugqb8yv9arJu92StxfegFfQI0FO
	 1E7NZA/Uljheav7I2KijJ9Qfa6tY+PYjCfS892r2EI7ZydlI5m5BK4Lmyn1CNzv+4Rw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999705;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cThnTIRlGyzXC67Zks9PcDGHoKEeK1DnLjplhA4Y8Oo=;
	b=Ey9l51sU4c5hRZ8JNLBTDJL8dBjdMVXafm696Z3a2lV9Y3iNd4QhVYD8PIJLDQhL+j5b
	 7i/K2ftg6H24Wh4rochjGiaEWR3dxpopbgfzHCQGVoLPOkHJIlgKKMwdLIsz50Z/BHED/
	 Y+XPyEkmH8ufQlE5A8PsCgpfSCb/CGjCWO/9i+N8za2dwfj9iyWQjGGdQmTAhQ+bcv/ea
	 n32EH3+axkBo2r2VOxgZ+I8FCDbuppNaHUOH9MWxguKcCm1smbhP8nPGB2T4Y52atCcDk
	 wDu5+UIJ9tY3Ea7sQJuW6naqeHJ5Wm3FMue+X5um25gdXkbH+mL2Joo8ehUdJxHntsA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999705;
	bh=cThnTIRlGyzXC67Zks9PcDGHoKEeK1DnLjplhA4Y8Oo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Cv7Hf6wnHbd7JZWna4/geAInenbcODZ+o8d7hQPzhoO2KXBK5jHAQ73/x9MZBEkDt
	 CKEyNl9eKRqP33/Duez9seuJb/4a6S9VCVX6ebqrILT1KccHoIe5rhDZcozvamvWV1
	 kUueleLWUJn5MXs2WINh/DgSmIFzWGd0GVcCj+M77x4EFHQ6b6c88HjKJWUk0kXJZm
	 Lscs9H7NVY3GZ+kEN6ucxutRM9wlTRDmFlTyebC51LM0rSRGvHJfeOtINHV3toMuz/
	 lKT+X64IyX1C/cmkWH1q3sQNAx1n7FwrsuOW9rBOnC+3akUaCDJlhvoiO0SLZHm4qw
	 HApYMddVLwDHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8201B60AAA;
	Fri,  6 Nov 2026 21:15:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 272DAAFC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 194A2400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id znpDVk2dM-e6 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5996D403FE
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5996D403FE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76A089E0B2; Fri,  6 Nov 2026 21:12:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3ab6c1fb25bef4d5c3bb82deffc9cc9eb6c096b
X-Git-Newrev: 4a3529f119f189fc44d5553b3000111f83f09a50
X-Patchwork-Hint: ignore
Message-Id: <20261106211249.76A089E0B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqlalchemy: bump to version
 2.1.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4a3529f119f189fc44d5553b3000111f83f09a50
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index 3960b36888..f130886a24 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  e48a02203a8c156dda64d0f8f703e5e7  sqlalchemy-2.1.6.tar.gz
-sha256  499eae5c9051efe96cb9a73ec2fbde8ffa4186f102b9094ebab8fcc9d3b99f52  sqlalchemy-2.1.6.tar.gz
+md5  72556b6c195d1b5f796874a132f4f708  sqlalchemy-2.1.8.tar.gz
+sha256  8bc4081dd7c17c073f2384ad0f5ee968e63b43507b2e024a3523c000a06d70da  sqlalchemy-2.1.8.tar.gz
 # Locally computed sha256 checksums
 sha256  e862bb5b904fb5513c3e14288d7a25a12eb0ecc7847a0a965d310e9a955e7cb9  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index 57a82f1ca5..01037b2921 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.1.6
+PYTHON_SQLALCHEMY_VERSION = 2.1.8
 PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/36/dc/9addbf490110b5727380059ee542ad8353bdcee45a37ba6a5e0976966ae0
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/9c/e7/2855174facf54a83b4fa3eddcece3631c6bdae43605dacd69cc3b6794319
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
