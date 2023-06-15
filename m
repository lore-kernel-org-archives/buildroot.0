Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B9BEB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 16:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2350461462;
	Thu, 15 Jun 2023 16:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2350461462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oe4N_OdE1RUl; Thu, 15 Jun 2023 16:49:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49CD36145C;
	Thu, 15 Jun 2023 16:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49CD36145C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E8EE1BF23B
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 16:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2335241F0F
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 16:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2335241F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gt2ZP-DYyvvW for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 16:49:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A686641B9B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A686641B9B
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 16:49:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bcb3.dip0.t-ipconnect.de [84.161.188.179])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ED616A4C0796
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 18:49:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58088)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1q9qAF-0006kS-2E
 for buildroot@buildroot.org; Thu, 15 Jun 2023 18:49:39 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 18:49:39 +0200
Message-Id: <20230615164939.1159230-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1686847779;
 bh=4oouAcY6c3ptYbRrPdZFi9D8KWmtkQs7Cme6lfDztLA=;
 h=From:To:Subject:Date:From;
 b=TbJWIow3XRMUAxa0IsMDCUag29buqnue3We0CPC6JSYgr9Nh+Kg0b9dd0wYiT/IIu
 zrZLaDrlCS6p6Kj5zI2Bs2rasjAG2uXWF/fasN4EqKW9ONqMwUJ6uuuOldCEpiqt/E
 8ryexoVn4gDdUgNuScz2IwRWR/tUXSBOmqG7zzCXHF9m4vJWKJewQ2Ci4F4OWH75EH
 vWQxbZV01+uvKB6L84g8Ho56JwfiHoxH0ZATlqESUqREG2NuqX7gbc/A0dnZ+YNTzL
 sRaz14leC7htKQmmZ+0+TLNc4vPmooa23DSsFigcgGtpNCtDbX70CIxFjM50foO+6p
 mi4D1CdJ5a1lQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=TbJWIow3
Subject: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.8.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://ccache.dev/releasenotes.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ccache/ccache.hash | 2 +-
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 9b11f026ec..2b6cd65a74 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  df0c64d15d3efaf0b4f6837dd6b1467e40eeaaa807db25ce79c3a08a46a84e36  ccache-4.7.4.tar.xz
+sha256  3d3fb3f888a5b16c4fa7ee5214cca76348afd6130e8443de5f6f2424f2076a49  ccache-4.8.2.tar.xz
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
 sha256  56cf64f68b7b8150300acd79899941615523ea5c56c120e92f5b175b7cc78e3c  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 6b7d57b40c..ac4bc4aba5 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.7.4
+CCACHE_VERSION = 4.8.2
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
