Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D29F3028C
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B150940A9D;
	Sun, 15 Mar 2026 22:18:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b79-xcogRzF7; Sun, 15 Mar 2026 22:18:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B83DD41349
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613104;
	bh=XurRx4VHVsEa+8JXUB8QfzOnQe6mNDUHZvY0NWW7Y84=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TfMPIU1sgE9R+P9bg10hoIxJ7eTg/SyH0R6gC3HM8cpl0Ne5jbgG1BMkOv8wgLZr7
	 ZgholWc8RXjuAMQajzL4O/kmoyADvbx3m207o7QPGxsvx5fkwD6qh1Lh9Wzx+rTSBA
	 NnY7JumAo2DkhPqi5LD6TiUH+7fvcT4wh5k15BE4ZFMmnQJJ9NMzjkXO5WQL+PK3jS
	 cWwXFjMhFg/yT3yMnZQGE+0LbsCAplz31n/Wcw6ijFbGDVYUtELMQSlqQQ9ck7AKbc
	 FdDMHTlRtqJngQXgvSVgk0+ndQTMslmO04gChdm2xbZg1uA2ZBZQBM+3RjnBTrq3c4
	 0sm6Txe12cGzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B83DD41349;
	Sun, 15 Mar 2026 22:18:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D1031B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46C9540A04
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sPfqtJF0etej for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A0DC409BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A0DC409BD
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D11685BFF; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:32:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 146f315ff68fa5b95c89a13140c9873cf54896f5
X-Git-Newrev: 582c6272394cf79d534fcae5e2677dd4d87ee49c
X-Patchwork-Hint: ignore
Message-Id: <20260315221801.9D11685BFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-google-auth: bump version
 to 2.49.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/582c6272394cf79d534fcae5e2677dd4d87ee49c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/googleapis/google-cloud-python/blob/main/packages/google-auth/CHANGELOG.md

2.47.0 removed the dependency to cachetools:
https://github.com/googleapis/google-auth-library-python/commit/5c07e1c4f52bc77a1b16fa3b7b3c5269c242f6f4

2.48.0 added a dependency to cryptography:
https://github.com/googleapis/google-auth-library-python/commit/52558ae2881b1e6555f6f5c0d76365c15807ead9

2.49.1 removed the dependency to rsa:
https://github.com/googleapis/google-cloud-python/commit/e8927b9c0257912dc3eca42307bde10c505e3975

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS dep in Config.in]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-google-auth/Config.in               | 4 ++--
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-google-auth/Config.in b/package/python-google-auth/Config.in
index eb5be9cda5..2b46330ccc 100644
--- a/package/python-google-auth/Config.in
+++ b/package/python-google-auth/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_GOOGLE_AUTH
 	bool "python-google-auth"
-	select BR2_PACKAGE_PYTHON_CACHETOOLS # runtime
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
-	select BR2_PACKAGE_PYTHON_RSA # runtime
 	help
 	  Google Authentication Library.
 
diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index 6a7b5cd170..9a8aa4b204 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  702a1aa7d2a65e7ae2702167be9183f4  google_auth-2.45.0.tar.gz
-sha256  90d3f41b6b72ea72dd9811e765699ee491ab24139f34ebf1ca2b9cc0c38708f3  google_auth-2.45.0.tar.gz
+md5  9e586b998d814cf0a35e98f3221181ae  google_auth-2.49.1.tar.gz
+sha256  16d40da1c3c5a0533f57d268fe72e0ebb0ae1cc3b567024122651c045d879b64  google_auth-2.49.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index 69c2a32b70..8e54c52f49 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.45.0
+PYTHON_GOOGLE_AUTH_VERSION = 2.49.1
 PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/e5/00/3c794502a8b892c404b2dea5b3650eb21bfc7069612fbfd15c7f17c1cb0d
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/ea/80/6a696a07d3d3b0a92488933532f03dbefa4a24ab80fb231395b9a2a1be77
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
