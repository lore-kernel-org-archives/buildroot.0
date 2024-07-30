Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C11C3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 20:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5A9F81E63;
	Thu,  1 Aug 2024 20:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7FI54L7bbb1G; Thu,  1 Aug 2024 20:56:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF9F281E48
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF9F281E48;
	Thu,  1 Aug 2024 20:56:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E9971BF995
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 20:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AA7D401EE
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 20:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0LRoMdGcQdjp for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 20:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50D56401BC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50D56401BC
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 20:56:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B421838A8; Thu,  1 Aug 2024 20:56:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Jul 2024 23:46:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f376a7509577b88790fbf9ca77049c46da9a252c
X-Git-Newrev: 8270da3e4f73a99119b6919c829d84016e1cfbcf
X-Patchwork-Hint: ignore
Message-Id: <20240801205639.3B421838A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: add option to support
 lzma/xz in host-python
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8270da3e4f73a99119b6919c829d84016e1cfbcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will be needed by the upcoming host-python-uswid package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python3/Config.in.host | 5 +++++
 package/python3/python3.mk     | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
index 88c286c55b..f3fcd63567 100644
--- a/package/python3/Config.in.host
+++ b/package/python3/Config.in.host
@@ -12,6 +12,11 @@ config BR2_PACKAGE_HOST_PYTHON3_BZIP2
 	help
 	  bz2 module for host Python3.
 
+config BR2_PACKAGE_HOST_PYTHON3_XZ
+	bool "xz"
+	help
+	  xz (a.k.a lzma) module for host Python3
+
 config BR2_PACKAGE_HOST_PYTHON3_CURSES
 	bool "curses"
 	help
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index f85dcfad30..7d6c9fe93f 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -57,6 +57,12 @@ else
 HOST_PYTHON3_CONF_ENV += py_cv_module__bz2=n/a
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3_XZ),y)
+HOST_PYTHON3_DEPENDENCIES += host-xz
+else
+HOST_PYTHON3_CONF_ENV += py_cv_module__lzma=n/a
+endif
+
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_CURSES),y)
 HOST_PYTHON3_DEPENDENCIES += host-ncurses
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
