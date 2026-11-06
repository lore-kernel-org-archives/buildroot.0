Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC6C606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZwZ66uK3
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA7F7608F0;
	Fri,  6 Nov 2026 21:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_PZX7s6xpym; Fri,  6 Nov 2026 21:14:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1518C608B9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999669;
	b=gvbTk1sbrg/L2uMaBrE3Gh58+rfpa6+t222E/tjwrme1p/OPeTgcgKucSlS9EoPdsTdM
	 WioDFj/qK99gSpASs8oPrWl5CYuBrv2WJFrGns3NpsiUdcCTHTX7Clowj8LDU6a+3rYJL
	 mKGD94fe9paItuKQHshrZ7oOj+t6fYx+dAFEYuMqUXq2uJaVIldwtsRzJ63TWaB+FPaD9
	 2fWwJJ2tozpX49m300lre9DQQN8JVQosA/W4xYlmAAeJ4vfPujM9FQjSVq2n0HijBr+Y1
	 GNMDcIzU8dhqDPyZhobIXFUWw5IMD8bBsNoAArGG3M8iUTHmpFdY7NX7Idu3HPEdRcw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999669;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TA53obZDp4H+u5Dnh1S++x8jpe6v85cyoXzhRDZMJoc=;
	b=Rt6aL4zo8YEKmeVsLVL0/uSeOVgY+14R3sz96yvvwkjyHpuvMzUHeILXA7+DHeApdEpq
	 eH++uaBWW7NRgJ0pRYAsCmRPZNEygX341NHCbn6Z9rchoiAVHQYgp5oaEYUOAS1E8lxjU
	 9Fw7mNfQ7XojR03D99de+svLbFkdyGnD4EXsmP9JPrOD+OIbqGgyIF24T590ukgVAFPHg
	 1kI8A52nWTk71Lmm1aPJzZyDhgCzMw7UoHyxMzsCmTmqywn3IdM3h79SjnSlragu9kKVy
	 YxQDg3tUDQvbAEYlcSrkNach3JHiRLXhsrCRcWEe/7WU/bTooN9ZSCjpWV+4HItxBxA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999669;
	bh=TA53obZDp4H+u5Dnh1S++x8jpe6v85cyoXzhRDZMJoc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZwZ66uK3VVeHusjVpLtR1Cn+3sG69bc6+apSOnnsqSPPIgAIlLoJ39Zu7XKDmFbWS
	 1Ctfkonpw4O37rXKVzQIs2gQL9CdgAjn3GKQ89SceXo5OT5Tjwze+Krpkaya6b3SHE
	 ofY5jOXC96frH1d6MrJDBoRIfDT3YIL07424O51uV61D24j5p3JX/XuiG6dCksPAdd
	 1RiZTEYm7RJN/7Ugk4KEXv7xBdhT60UhWjhZHQg4slcFNUwMXmTp2RLpTWvJwho0Fk
	 OUXyjNHE9r1VtSNg1fe83eiZOeDFk5kqQ4uy3Z4HZjcNVM6ETxAlkASVXYWI4RH58I
	 qvufI7tZihdyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1518C608B9;
	Fri,  6 Nov 2026 21:14:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E80BA64
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C78E400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6B63QpP60wz0 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4BA7E40400
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BA7E40400
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5ACF19E104; Fri,  6 Nov 2026 21:12:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74a624e3fa2eef6eb227e8db36703032c6ae4b08
X-Git-Newrev: 48f40a59117304c86a76602759d1907359dde73d
X-Patchwork-Hint: ignore
Message-Id: <20261106211248.5ACF19E104@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cachetools: bump to version
 7.3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/48f40a59117304c86a76602759d1907359dde73d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cachetools/python-cachetools.hash | 4 ++--
 package/python-cachetools/python-cachetools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index 125da449ba..50072a055e 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  07b2d6da1fe4690c42c2580076ac0cbc  cachetools-7.2.8.tar.gz
-sha256  3f9b146b2160975da273e7c23ec882f3996b65df608150d52083c07de0682075  cachetools-7.2.8.tar.gz
+md5  033d407f2c6216c9ad7aa017a36bb861  cachetools-7.3.0.tar.gz
+sha256  3f63fc208410f0c3a3b37883c4903ecdacd6f0b259134e6d2e82debd5b2e01de  cachetools-7.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  28c000b52b0ee27138a68ef778227e4057046e86b65f62f1cacb99b0cc49e0d2  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index e059b3f9d6..a7b1917e20 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 7.2.8
+PYTHON_CACHETOOLS_VERSION = 7.3.0
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/93/6f/faa5e0606769105e70e0478031a8f9a6b729e329f42ce2462585c6d9aa52
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/5f/6b/6c1553e1e8f672f9423344a1915aad1537439ad3d14a3fbc1a02159cfd94
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
