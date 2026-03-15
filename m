Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB76F3028A
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F9984155D;
	Sun, 15 Mar 2026 22:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ys8KofIAKQw9; Sun, 15 Mar 2026 22:19:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FDD541556
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613160;
	bh=fxlxWPcpG8d4eLKdPpTDtYqKp5tQRYYpbRC8f/rM5sU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YT5tf3OdpshQKDVZA6lODaYLns9wv5pTaIrlou9niUJ0/7Oj9bOL4NpK0zzNKwark
	 JJK0besXAf0Kd6C/NEnN44xFvgrHD+GR0jwvf2PuVYJIiUHw2s7U1f0O44qoS/oo3z
	 3xQu9G7b0xvVCEjkP7CHBmuJJRCx/Ip5wEamNRXAret58H+24HABHqHbS7uc8hHHQr
	 UlEo1/K3qUU+ZnL3/tDgUnOmjD2TNUWfbAIReVjmTXEZSQUj6fXKeTGolq4C+eTYNX
	 RrnbpLrO9zIYfUaU9M5yn1HkyChbdJ8tfsjO+ZawFt6hZJczKjIKSdJhFc81lB+9ZK
	 5lgdy7Ui0Tshg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FDD541556;
	Sun, 15 Mar 2026 22:19:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 185BE357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08DAE40B0D
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dlIbtOJfq6F3 for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2954640919
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2954640919
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C15480FBC; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd1a44dbbc3aab25c7ea85be1e96707b82fec211
X-Git-Newrev: ac3633ec9ca29fc6749348b51af09e0a438f3149
X-Patchwork-Hint: ignore
Message-Id: <20260315221804.6C15480FBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tomlkit: bump version to
 0.14.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ac3633ec9ca29fc6749348b51af09e0a438f3149
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/python-poetry/tomlkit/blob/0.14.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tomlkit/python-tomlkit.hash | 4 ++--
 package/python-tomlkit/python-tomlkit.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomlkit/python-tomlkit.hash b/package/python-tomlkit/python-tomlkit.hash
index 1e6fe31c0a..51c8a2b560 100644
--- a/package/python-tomlkit/python-tomlkit.hash
+++ b/package/python-tomlkit/python-tomlkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomlkit/json
-md5  b77382a3de2e0c1ab715ad456139e260  tomlkit-0.13.3.tar.gz
-sha256  430cf247ee57df2b94ee3fbe588e71d362a941ebb545dec29b53961d61add2a1  tomlkit-0.13.3.tar.gz
+md5  5afa19bb5604584a7c7e718a5c0d8059  tomlkit-0.14.0.tar.gz
+sha256  cf00efca415dbd57575befb1f6634c4f42d2d87dbba376128adb42c121b87064  tomlkit-0.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f2f9b460ba719da6626add264d3782f275a4ff7aab677beda08b330911e23adb  LICENSE
diff --git a/package/python-tomlkit/python-tomlkit.mk b/package/python-tomlkit/python-tomlkit.mk
index 51e6e40483..df7b66f2e1 100644
--- a/package/python-tomlkit/python-tomlkit.mk
+++ b/package/python-tomlkit/python-tomlkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLKIT_VERSION = 0.13.3
+PYTHON_TOMLKIT_VERSION = 0.14.0
 PYTHON_TOMLKIT_SOURCE = tomlkit-$(PYTHON_TOMLKIT_VERSION).tar.gz
-PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/cc/18/0bbf3884e9eaa38819ebe46a7bd25dcd56b67434402b66a58c4b8e552575
+PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/c3/af/14b24e41977adb296d6bd1fb59402cf7d60ce364f90c890bd2ec65c43b5a
 PYTHON_TOMLKIT_SETUP_TYPE = poetry
 PYTHON_TOMLKIT_LICENSE = MIT
 PYTHON_TOMLKIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
