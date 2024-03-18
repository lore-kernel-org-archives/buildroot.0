Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22C0C54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 15:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FE27405D3;
	Mon, 18 Mar 2024 15:21:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CnQlPv8pnJeY; Mon, 18 Mar 2024 15:21:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54DBC40A42
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54DBC40A42;
	Mon, 18 Mar 2024 15:21:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 765001BF48B
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 15:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 622DB40A42
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 15:21:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6z--CnFA6nC for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 15:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8692B405D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8692B405D3
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 15:21:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8218482B36; Mon, 18 Mar 2024 15:21:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 16:17:47 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 526b91ba8a18e830b31b3b02eba1b0b41112c088
X-Git-Newrev: 0722334c8acb270d9e913a9acce6f4fa54591e5a
X-Patchwork-Hint: ignore
Message-Id: <20240318152154.8218482B36@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libxml2: security
 bump to version 2.11.7
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0722334c8acb270d9e913a9acce6f4fa54591e5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix CVE-2024-25062: An issue was discovered in libxml2 before 2.11.7 and
2.12.x before 2.12.5. When using the XML Reader interface with DTD
validation and XInclude expansion enabled, processing crafted XML
documents can lead to an xmlValidatePopElement use-after-free.

https://gitlab.gnome.org/GNOME/libxml2/-/blob/v2.11.7/NEWS

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 78c1ddc6a2..33bf512f60 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.6.sha256sum
-sha256  c90eee7506764abbe07bb616b82da452529609815aefef423d66ef080eb0c300  libxml2-2.11.6.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.7.sha256sum
+sha256  fb27720e25eaf457f94fd3d7189bcf2626c6dccf4201553bc8874d50e3560162  libxml2-2.11.7.tar.xz
 # License files, locally calculated
 sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index b7a2c796fc..6de984d9b8 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.11
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).6
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).7
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
