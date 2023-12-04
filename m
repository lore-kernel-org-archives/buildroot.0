Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27A5C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 21:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7411D4174F;
	Mon,  4 Dec 2023 21:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7411D4174F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QGK5ZdXu_gu4; Mon,  4 Dec 2023 21:16:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F672419B5;
	Mon,  4 Dec 2023 21:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F672419B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FC321BF30E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1420A40969
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1420A40969
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zo6-JlOTzmUl for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 21:16:49 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B1A840963
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 21:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B1A840963
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 58D73A4C0F40;
 Mon,  4 Dec 2023 22:16:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58136)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rAGIh-00077J-0D;
 Mon, 04 Dec 2023 22:16:23 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Dec 2023 22:16:22 +0100
Message-Id: <20231204211622.12687-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204211622.12687-1-bernd@kuhls.net>
References: <20231204211622.12687-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701724583;
 bh=U3VA1wEIKDdlWmAmBnUILbfm30byBm7zt69dP0YEYXI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZtosPHp+og397AlFEtfzWc8T4ykqbTiz081xOZi6FD/1jZK514P0cxjneCLDnNRHu
 T2eYSWF4qw1rr3H493pZSBaOqjl/03kSiYQDnoVtWG2vnXsF45fQSFj7WISLmRMf+L
 yD1QYkxJtauldXyb5ChgfSwQN+ZSXAZ1YoQxf2tZkrWG+hVHfsabBG9MqYkv6wst6u
 BFD0q2R0TLkODTBoiE42oIA8EfFGVNwwL0HG2mizL26jMInAbL/D7UZjsVa9l+bqN2
 xpUxAECMn61EkkFo4CvZ/JfK9/bm0TpzQfvhx4x+IVFsk/f0DpdFEsL+SDWMCghTeM
 th+e0oyJD5k+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=ZtosPHp+
Subject: [Buildroot] [PATCH 3/3] package/libxml2: bump version to 2.12.1
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated license hash due to upstream commit
https://github.com/GNOME/libxml2/commit/4a513d5667d7690998f01b9048c56c4f1f50f6a5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libxml2/libxml2.hash | 6 +++---
 package/libxml2/libxml2.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 78c1ddc6a2..a3b2230b8a 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.6.sha256sum
-sha256  c90eee7506764abbe07bb616b82da452529609815aefef423d66ef080eb0c300  libxml2-2.11.6.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.1.sha256sum
+sha256  8982b9ccdf7f456e30d8f7012d50858c6623e495333b6191def455c7e95427eb  libxml2-2.12.1.tar.xz
 # License files, locally calculated
-sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  Copyright
+sha256  7fb0a66f3989f9bd5c7e5438a3de02cd4a7a47dde0aea2f7ea2ba2ff454ee6a4  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index c93a4aacc5..5606532b62 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBXML2_VERSION_MAJOR = 2.11
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).6
+LIBXML2_VERSION_MAJOR = 2.12
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).1
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
