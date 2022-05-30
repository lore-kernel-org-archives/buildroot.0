Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E7BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 13:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA7416119A;
	Mon, 30 May 2022 13:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0eR6roK5qm3E; Mon, 30 May 2022 13:19:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F39F6118A;
	Mon, 30 May 2022 13:19:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C52601BF357
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 13:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B337F6118A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 13:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HRwdRZnBl6mB for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 13:19:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4634561182
 for <buildroot@buildroot.org>; Mon, 30 May 2022 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mhjxrZ+xcg+yFjW1kuAz8XVY/4ucyDKPfUZ04Z4gC9I=; b=dzJDKz7m4aFgra2Do/NDSpdsPF
 agobg7r4U6exaFBfDxKeKsIZHwPqoyFET9VTbPV85w9svM5vMEioOU1ZB50ELr6wTbBef2wgfwBF4
 pTu8Oxwt5+cxOvdCXNkp/iYmkO+PHnAkmBLIewwcNM4z3NFKn2nz/Wr9M9mxU+L9X1w5y3GCcL7uV
 uAZqsIiZPURnXfDcLHaEztW6HqbB5a2rMG2XN6ysV4vEQab4e9gMZeINQo+oZ5k6/V33/j7dGO1WT
 rrRu7Lr298Ic1NBTEFdHTEly+I9IGn4prt2biaLvjQ6CJmbpeeDY7XXsrXhtmbrZ2AkhGdY0OF1nh
 dfgD0Nzw==;
Received: from 91-153-34-181.elisa-laajakaista.fi ([91.153.34.181] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nvfIv-005evA-8O; Mon, 30 May 2022 15:19:29 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id c89bf0d8;
 Mon, 30 May 2022 13:19:19 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 16:19:19 +0300
Message-Id: <20220530131919.839849-1-aperez@igalia.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libsoup: bump to version 2.74.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 2.74.1 included a flurry of build fixes, while version 2.74.3 is
able to detect whether the library is being loaded in a process where
libsoup3 is also present. The latter will come in handy for migrating
Buildroot to libsoup3. Release notes:

  https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.74/libsoup-2.74.1.news
  https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.74/libsoup-2.74.2.news

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libsoup/libsoup.hash | 4 ++--
 package/libsoup/libsoup.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
index 95c1c26eb4..b89ed7864e 100644
--- a/package/libsoup/libsoup.hash
+++ b/package/libsoup/libsoup.hash
@@ -1,4 +1,4 @@
-# From https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.74/libsoup-2.74.0.sha256sum
-sha256  33b1d4e0d639456c675c227877e94a8078d731233e2d57689c11abcef7d3c48e  libsoup-2.74.0.tar.xz
+# From https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.74/libsoup-2.74.2.sha256sum
+sha256  f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159  libsoup-2.74.2.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 1a26714992..dcd7ff459e 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSOUP_VERSION_MAJOR = 2.74
-LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).0
+LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).2
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
 LIBSOUP_LICENSE = LGPL-2.0+
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
