Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80C9C4450A
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 11:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DA9E60624;
	Sun, 19 Jul 2026 11:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJW5lVWit2Hg; Sun, 19 Jul 2026 11:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 408D96062C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784459274;
	bh=/Ye0V96BXll6F1f1RZ14WKXbe5GhUmWfU6hgFqbtASA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k2vvCy7RIXuxnSV7CyRwP9LJDkUb8o6/alAvwNZYt+pEeBhdZwTNzWtjElSd+531i
	 wKc5PoQEGeUatYTBYbuigNiPoJNEQoVBkxwDCpRJG06Pra/0DQV91aUg4rqopAedvO
	 wW9oEbtegQdRxxew3GnfowbblHD2NDVMdVhviTgCKOQigyHRVeyTU+c8nNYv7WeIaa
	 mTlXXvl/ePeW5PmkHMyUEBGXBMJ3W01Y92nrxiI+Kqm+RCuA1GJmlKvQQtuEhqdZsG
	 EykOiCCTOVqzIlfhu0dygNy2Ug0LVAKKkuXhCMZEfePKgWvNLxlSHehCo3e5IEB0q+
	 j3vvrGvGd7xxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 408D96062C;
	Sun, 19 Jul 2026 11:07:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C4C5206
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02A2D808AC
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YjXBn1UhVKDl for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 11:07:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C40A808A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C40A808A0
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:07:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE7E988F7A; Sun, 19 Jul 2026 11:07:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Jul 2026 12:28:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82969faed3963ad8a0d1ce311190be532b526229
X-Git-Newrev: ee9ab33d6f0423d767c6ad13be19c1dc25d321b5
X-Patchwork-Hint: ignore
Message-Id: <20260719110714.CE7E988F7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdnsd: bump to v1.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ee9ab33d6f0423d767c6ad13be19c1dc25d321b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This is a major update of mdnsd, for the full release notes see
https://github.com/troglobit/mdnsd/releases/tag/v1.0 and
https://github.com/troglobit/mdnsd/releases/tag/v1.1

- Update package description to match mdnsd v1.x capabilities
- LICENSE hash change due to update of copyright years

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mdnsd/Config.in  | 23 +++++++++++------------
 package/mdnsd/mdnsd.hash |  4 ++--
 package/mdnsd/mdnsd.mk   |  2 +-
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/package/mdnsd/Config.in b/package/mdnsd/Config.in
index c83c090595..f0d3652e1c 100644
--- a/package/mdnsd/Config.in
+++ b/package/mdnsd/Config.in
@@ -3,16 +3,15 @@ config BR2_PACKAGE_MDNSD
 	depends on BR2_USE_MMU # fork()
 	help
 	  Small mDNS-SD daemon for advertising services and device
-	  discovery, similar to Avahi and Bonjour.
+	  discovery, similar to Avahi and Bonjour, at fraction of
+	  the size, ~90 kB.
 
-	  By default, mdnsd runs on all interfaces that support
-	  multicast.  It reads services to announce from
-	  /etc/mdns.d/*.service, a few common services are included
-	  below.  To override the defaults, e.g., path to services,
-	  TTL of multicast frames, or the default interface, set
-	  MDNSD_ARGS in /etc/default/mdnsd
-
-	  Note: currently no NSS integration with GLIBC.
+	  By default, mdnsd acts as a responder on all interfaces
+	  that support multicast.  It works with both IPv4 & IPv6,
+	  advertising services from /etc/mdns.d/*.service (common
+	  services included below).  To override defaults, e.g.,
+	  path to services, TTL of multicast frames, hostname, or
+	  default interface, set MDNSD_ARGS in /etc/default/mdnsd
 
 	  https://github.com/troglobit/mdnsd
 
@@ -22,9 +21,9 @@ config BR2_PACKAGE_MDNSD_MQUERY
 	bool "mquery"
 	help
 	  Scan a LAN for mDNS capable devices, or query specific
-	  records, similar to the mdns-scan tool.  Useful for
-	  verifying multicast connectivity or locating neighbors with
-	  link-local address.
+	  records, similar to the mdns-scan and avahi-browse tools.
+	  Useful for verifying multicast connectivity or locating
+	  neighbors with link-local address.
 
 comment "Services to advertise"
 
diff --git a/package/mdnsd/mdnsd.hash b/package/mdnsd/mdnsd.hash
index 6ab0676702..024dc87cc1 100644
--- a/package/mdnsd/mdnsd.hash
+++ b/package/mdnsd/mdnsd.hash
@@ -1,5 +1,5 @@
 # Upstream sha256 from GitHub
-sha256  1af8742ab82a0af88d99d0b15508358ad4305879ab039631bea889138f5c87e8  mdnsd-0.12.tar.gz
+sha256  b3f242415b2f29c510e709c862126ecab09d77e8dc1eecf1aefef879bce29003  mdnsd-1.1.tar.gz
 
 # Locally computed
-sha256  2969546227b58ce1b431cc4c36c9a9b45d604e6b94fb8b787ea5d3696f3eee3b  LICENSE
+sha256  89a722240ac1fdc0366696eaa5469968397ae274a0003e09a88d0686eeb3cd3e  LICENSE
diff --git a/package/mdnsd/mdnsd.mk b/package/mdnsd/mdnsd.mk
index f5a5fb93fb..c938890508 100644
--- a/package/mdnsd/mdnsd.mk
+++ b/package/mdnsd/mdnsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDNSD_VERSION = 0.12
+MDNSD_VERSION = 1.1
 MDNSD_SITE = https://github.com/troglobit/mdnsd/releases/download/v$(MDNSD_VERSION)
 MDNSD_LICENSE = BSD-3-Clause
 MDNSD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
