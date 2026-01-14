Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E450DD39013
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 20:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2F9E60C03;
	Wed, 14 Jan 2026 20:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DsR_LxscpQQP; Wed, 14 Jan 2026 20:20:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D270060C07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768422055;
	bh=jmdkteKcUn2nSfgoIUQeNbvmeIdgQmt0iJWCF8xpH2Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kVaoBvQpDUMMH1euqAqrAT+XamlgEBs9h16sE4NwP5Hiv3BXRILSBjwVTLqtQxIjS
	 QoNVGJnntWNWZZN7gMiaawc5SfRLq8fIR1SnbPBINAbDK2O4K7PtqePyTUnbxnohfi
	 Y/4X+IoaqTeZgATsHWxb3YpohLBz484oz0FlV7jTee6Ke/HYLVEgP92JfGGHblvLhh
	 YQn/0Q2iIqr01ugQ06vkLPzrXdv9loFqmd1fmxcR6uw0tHO4E6XP0Y21D9/hFRovdP
	 Jg2ryRrluuarVk96oh8yZyZq9VCwblzdxe5t67UjIrnHYT0xVG1MKB1Rfqcr4R4tzg
	 pqYpSZasz/Vnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D270060C07;
	Wed, 14 Jan 2026 20:20:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C4C41C3
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D90460C07
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DX3HJ9fdvfsp for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 20:20:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1C6C60C08
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1C6C60C08
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:20:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A534D885D1; Wed, 14 Jan 2026 20:20:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 21:16:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f4d619a4ca82f8c179f083f44895888b5880b97
X-Git-Newrev: 73ab737a25a3e08c48920873280323d0f62330b2
X-Patchwork-Hint: ignore
Message-Id: <20260114202053.A534D885D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/privoxy: bump version to 4.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=73ab737a25a3e08c48920873280323d0f62330b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.privoxy.org/gitweb/?p=privoxy.git;a=blob;f=ChangeLog;h=4a45820271febac332f183dd763749393dc97adf;hb=ad5cec777f1180c28f6fa229f4b587a2f245adf1
"- Removed support for pcre1."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/privoxy/Config.in    | 2 +-
 package/privoxy/privoxy.hash | 6 +++---
 package/privoxy/privoxy.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/privoxy/Config.in b/package/privoxy/Config.in
index 4138c0d281..d1133976e4 100644
--- a/package/privoxy/Config.in
+++ b/package/privoxy/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PRIVOXY
 	bool "privoxy"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_PCRE2 if !BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_ZLIB
 	help
 	  A non-caching web proxy with advanced filtering capabilities
diff --git a/package/privoxy/privoxy.hash b/package/privoxy/privoxy.hash
index 3c96c5644e..cfb6f5a5c8 100644
--- a/package/privoxy/privoxy.hash
+++ b/package/privoxy/privoxy.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/ijbswa/files/Sources/4.0.0%20%28stable%29/
-sha1  d302cb0bf23536e67a1b5505d01486a335d9c4c0  privoxy-4.0.0-stable-src.tar.gz
+# From https://sourceforge.net/projects/ijbswa/files/Sources/4.1.0%20%28stable%29/
+sha1  6afc12dc38781a37670c7e4bb69700900123084f  privoxy-4.1.0-stable-src.tar.gz
 # Locally computed
-sha256  c08e2ba0049307017bf9d8a63dd2a0dfb96aa0cdeb34ae007776e63eba62a26f  privoxy-4.0.0-stable-src.tar.gz
+sha256  23e4686e5848c74cb680c09c2811f0357739ecfe641f9c4072ee42399092c97b  privoxy-4.1.0-stable-src.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
index 64e8fb24db..bfd4996292 100644
--- a/package/privoxy/privoxy.mk
+++ b/package/privoxy/privoxy.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PRIVOXY_VERSION = 4.0.0
+PRIVOXY_VERSION = 4.1.0
 PRIVOXY_SITE = https://downloads.sourceforge.net/project/ijbswa/Sources/$(PRIVOXY_VERSION)%20%28stable%29
 PRIVOXY_SOURCE = privoxy-$(PRIVOXY_VERSION)-stable-src.tar.gz
 # configure not shipped
 PRIVOXY_AUTORECONF = YES
-PRIVOXY_DEPENDENCIES = $(if $(BR2_PACKAGE_PCRE2),pcre2,pcre) zlib
+PRIVOXY_DEPENDENCIES = pcre2 zlib
 PRIVOXY_LICENSE = GPL-2.0+
 PRIVOXY_LICENSE_FILES = LICENSE
 PRIVOXY_CPE_ID_VENDOR = privoxy
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
