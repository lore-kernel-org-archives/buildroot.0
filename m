Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66629CD342C
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 399026127A;
	Sun,  3 May 2026 14:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dChi9b43ZLw; Sun,  3 May 2026 14:51:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B399461523
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819874;
	bh=NXRn7ta11sSyBzAeJRs6/kOjc/q6CSNMCYeVz2b0bm4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hCKMEHQUS80hvlDB2OUg7zN5WN9DJHvgYuF3ElFgxHl2j0fdN7zZd8xU2NJa2j7b3
	 WFmbEl43OZRfsI13WX1d8Fe01BEAB075qtwDu1kd6M6P5RXf8hVxrGUGxjG0erPIbx
	 0fB1LLu6p2YQooscvP5QRMxbJiEbwI3E6V17zHZgoTqvEBiCBey6C0gu0U4LW8j3dw
	 DUd2jq8AnP2yPFPKvC8VR8R0LKVebCvHO5m8CfhgxwU7a650jwn1L7Ii6N9l98t+pn
	 gcgKWbGk2CzFONYPD30ahYvO1KhqzQ44N9dvXcAzyvrbj3YUp2bHHDtlowxjJaRgnu
	 DChZlHIPxbxWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B399461523;
	Sun,  3 May 2026 14:51:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 81E3C127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2667406FA
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWyb1mcepocV for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B19F4074C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B19F4074C
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFACB83E54; Sun,  3 May 2026 14:50:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5acf70b92e95c33d9987bc49cbe8095a2c66cd62
X-Git-Newrev: 7bcba8498b257f949cecfb466e56f2891dac51d8
X-Patchwork-Hint: ignore
Message-Id: <20260503145041.BFACB83E54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyopenssl: security bump
 version to 26.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7bcba8498b257f949cecfb466e56f2891dac51d8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pyca/pyopenssl/blob/26.1.0/CHANGELOG.rst

Version 26.1.0 fixes CVE-2026-40475
Version 26.0.0 fixes CVE-2026-27459 & CVE-2026-27448.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyopenssl/python-pyopenssl.hash | 4 ++--
 package/python-pyopenssl/python-pyopenssl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
index b42719e3ca..84f4b7fa60 100644
--- a/package/python-pyopenssl/python-pyopenssl.hash
+++ b/package/python-pyopenssl/python-pyopenssl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyopenssl/json
-md5  d755732945157fb8ca98c2d66a55755d  pyopenssl-25.3.0.tar.gz
-sha256  c981cb0a3fd84e8602d7afc209522773b94c1c2446a3c710a75b06fe1beae329  pyopenssl-25.3.0.tar.gz
+md5  e48484d4a915a47a71064c10ede7e991  pyopenssl-26.1.0.tar.gz
+sha256  737f0a2275c5bc54f3b02137687e1a765931fb3949b9a92a825e4d33b9eec08b  pyopenssl-26.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index 2dee55d8cc..da31da5c5a 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYOPENSSL_VERSION = 25.3.0
+PYTHON_PYOPENSSL_VERSION = 26.1.0
 PYTHON_PYOPENSSL_SOURCE = pyopenssl-$(PYTHON_PYOPENSSL_VERSION).tar.gz
-PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/80/be/97b83a464498a79103036bc74d1038df4a7ef0e402cfaf4d5e113fb14759
+PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/8c/a8/26d36401e3ab8eed9030ad33f381da7856fcfad5691780fccd1b019718fc
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
 PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
 PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
