Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A742C02193
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 06:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF659412A6;
	Mon,  3 Feb 2025 06:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOuAmN_ncWDP; Mon,  3 Feb 2025 06:48:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73E5E412A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73E5E412A9;
	Mon,  3 Feb 2025 06:48:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8B5B198
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 06:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD17A81F79
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 06:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3eQBD9a4GMcF for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 06:48:54 +0000 (UTC)
X-Greylist: delayed 391 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 03 Feb 2025 06:48:53 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D6C281F83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D6C281F83
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=77.55.128.204;
 helo=mail.grinn-global.com; envelope-from=m.niestroj@grinn-global.com;
 receiver=<UNKNOWN> 
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D6C281F83
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 06:48:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (22)
Received: from zm.int.grinn-global.com (pub-39.5.5.213.multiplay.pl
 [213.5.5.39])
 by server220076.nazwa.pl (Postfix) with ESMTP id 452B71BBF4C;
 Mon,  3 Feb 2025 07:42:16 +0100 (CET)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Mon,  3 Feb 2025 07:42:05 +0100
Message-ID: <20250203064208.3979164-1-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=grinn-global.com
Subject: [Buildroot] [PATCH] package/python-dbus-fast: bump to 2.32.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See [1] for changelog.

[1] https://github.com/bluetooth-devices/dbus-fast/blob/main/CHANGELOG.md

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index f3d2c95a74..c711ff71c7 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  6473b4bf7e12412692d464482337b58d  dbus_fast-2.30.2.tar.gz
-sha256  87296315f4a2f2416d495f48cca019ba901d046989e94df2adda84c3170da7b3  dbus_fast-2.30.2.tar.gz
+md5  7d75dc35943f9337c68bafbc99ab1fd5  dbus_fast-2.32.0.tar.gz
+sha256  501b01387b8da5c9f1093f8405dadb4b9f2d2fb54ebc7ad5dd3667bcbc8f7d16  dbus_fast-2.32.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 92e5b661a3..7792e103ca 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 2.30.2
+PYTHON_DBUS_FAST_VERSION = 2.32.0
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/69/4a/c5dbb4eccb97d3dd0ec49e04e17b7e93dfae517881ad439141fa6179cb53
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/33/81/3f400d00b19fbebd69b0d6d90f106003d196e97fb57e69a7d99e5ac8c561
 PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
