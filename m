Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9175AF3028C
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6051B61202;
	Sun, 15 Mar 2026 22:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftY2dJtwVLGw; Sun, 15 Mar 2026 22:18:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3A1B61208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613094;
	bh=bKMBVfrJd2kCAdRmnBtjWJ38bno21PpEhS4Taj5S0xY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BzbX/4sCoo3MRvvRdkz6RuKudQFFqXnLAEzlg4hOMp7PZVcGC5b0iG9f4TKd0enVh
	 UBbvLpht4kjxgFfEwWpLQWB3BiDo17C65a9/MnMUWQL4E811sKScmlxUuubvuCaSYm
	 F9rIebe2m4a5GuMq/O26RACAt7KKI/ECRq2DfaccZ22rKKHDoNNN14EcxykB/4+b5X
	 0iwoJ/BOLHzp9nxcx2+PxR6FHgQXsxn7R4rtTcpvQINnyNb9cUvdCNc6DmfIC7YIM0
	 9+YhVvRi/ohE4NfsVxmqjNhnbJF7ZtbZpId3hq6vQhnpEbwIORPL3C8mpsODY/nm7B
	 5eimQSd7gVgNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3A1B61208;
	Sun, 15 Mar 2026 22:18:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 150CE1B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DFA040910
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u2A6c09fbUs5 for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01BE040952
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01BE040952
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4462D8285B; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 16:21:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d0906b77f224a988a49109902be6565d829e2c6
X-Git-Newrev: 4c5aae676b1b7792067926fcbe222ce541bb61cb
X-Patchwork-Hint: ignore
Message-Id: <20260315221801.4462D8285B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dbus-fast: bump version to
 4.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4c5aae676b1b7792067926fcbe222ce541bb61cb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/Bluetooth-Devices/dbus-fast/releases/tag/v4.0.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index 1fac0c0396..deaaf4bd79 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  605c7ca53ec797a9513c742d705f8494  dbus_fast-3.1.2.tar.gz
-sha256  6c9e1b45e4b5e7df0c021bf1bf3f27649374e47c3de1afdba6d00a7d7bba4b3a  dbus_fast-3.1.2.tar.gz
+md5  02f1448d52a71999626135269f3763f2  dbus_fast-4.0.0.tar.gz
+sha256  e1d3ee49a4a81524d7caaa2d5a31fc71075a1c977b661df958cee24bef86b8fe  dbus_fast-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 7d98581eeb..5addc1031f 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 3.1.2
+PYTHON_DBUS_FAST_VERSION = 4.0.0
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/16/a4/e54607cf8b0a696beba591f1a543cff5b6a9e4b4f842fd55f7ba741d678d
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/3d/f7/36515d10e85ab6d6193edbabbcae974c25d6fbabb8ead84cfd2b4ee8eaf6
 PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
