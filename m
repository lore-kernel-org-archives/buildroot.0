Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA92C2A074
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2C08607A5;
	Sun,  4 Jan 2026 10:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQT7hPTqMDrd; Sun,  4 Jan 2026 10:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5075460729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767522690;
	bh=ln+DGWnwRKupX1NSh1G49WNvoDzKhqWDDJ+KwxuK1xc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AgM/k/a3KU/26d1K5mJpMV4IUc1SizzNee4fEoF7wn0lKQQYy5QpSZ8gVdXcwigO7
	 3ST/FB3ItrHiHuYiW8rLsZutcbKVnErU7b8/gdzNqBRqM+fDjzcwE4tMyRVzNUT82w
	 MTDyid+zBTysGkqHDfQn5KgIiGh5Hs7T/LfPAk+uHk+7zfbtxVV04GtB/ChZWHdgVg
	 gxkfTIiOEb3w54a10wGtsfD20k4ZcPxZ0jyRp3h9pwFwIWPZ0hPLphJyfX1onbTdLp
	 jhZy/YCP7IUmqqmr4EjzQWLqBQwnmR5YqTwltXA9jDjdaoLt9vm1ITgDkJNHwnzSMW
	 LCXXK274FY6FA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5075460729;
	Sun,  4 Jan 2026 10:31:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DCD6B37A
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4028606E2
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IDCCfljrrj4y for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:31:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB45B606A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB45B606A2
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:31:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBC5F88188; Sun,  4 Jan 2026 10:31:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 11:21:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2dbe5b22f36a57d4a4c3aab5a2bbcf8b1f2ed350
X-Git-Newrev: b216322fc637d16dd77e7495da056081433d97f7
X-Patchwork-Hint: ignore
Message-Id: <20260104103126.CBC5F88188@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-memray: bump to version
 1.19.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b216322fc637d16dd77e7495da056081433d97f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-memray/python-memray.hash | 4 ++--
 package/python-memray/python-memray.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-memray/python-memray.hash b/package/python-memray/python-memray.hash
index bde66a24d9..b8e7a35b70 100644
--- a/package/python-memray/python-memray.hash
+++ b/package/python-memray/python-memray.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/memray/json
-md5  b48d378a5e5ca043a210781a2023dbe6  memray-1.17.2.tar.gz
-sha256  eb75c075874a6eccddf361513d9d4a9223dd940580c6370a6ba5339bae5d0ba2  memray-1.17.2.tar.gz
+md5  2142af623ddf0bd4b46944d9940d0dc7  memray-1.19.1.tar.gz
+sha256  7fcf306eae2c00144920b01913f42fa7f235af7a80fa3226ab124672a5cb1d8f  memray-1.19.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c973dd08e49022a4017ffd457116b046ebe07fc71a644fd760d64183869ca97f  LICENSE
 sha256  ef8a9b3247488f8901ca60de9b17b745d7bd67e5ec1e622f80d62364572200d8  src/vendor/libbacktrace/LICENSE
diff --git a/package/python-memray/python-memray.mk b/package/python-memray/python-memray.mk
index ee2605a9b0..85e16a4c95 100644
--- a/package/python-memray/python-memray.mk
+++ b/package/python-memray/python-memray.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MEMRAY_VERSION = 1.17.2
+PYTHON_MEMRAY_VERSION = 1.19.1
 PYTHON_MEMRAY_SOURCE = memray-$(PYTHON_MEMRAY_VERSION).tar.gz
-PYTHON_MEMRAY_SITE = https://files.pythonhosted.org/packages/df/40/66e6ae86c0a22b8b998779fa8d6c0ab9ee63f0943198adcf714934286cbf
+PYTHON_MEMRAY_SITE = https://files.pythonhosted.org/packages/36/18/5df5995a7b142e12ab194f4b2fd1473efd51f4f622dfe47f3c013c3c11f7
 PYTHON_MEMRAY_SETUP_TYPE = setuptools
 PYTHON_MEMRAY_LICENSE = Apache-2.0
 PYTHON_MEMRAY_LICENSE_FILES = LICENSE src/vendor/libbacktrace/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
