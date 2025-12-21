Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC7DE66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 13:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58F1081083;
	Sun, 21 Dec 2025 13:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mpkbqwrb7TWy; Sun, 21 Dec 2025 13:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8182F8108B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766324557;
	bh=dyXtz0t0HGBlLAm+5UNS0tLVxBK3QliUfJrww63apmo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hrCk+Ng2ZQP3xH07z6RnvF8+d83Y0J89JxPegFNE0GOuNvdHiSkxsz/ufkMctCVT2
	 6qUsCsd3feCnIwcJQWnbh5LUsYcHSzldEM0ZJlgaHWqSNsD+HkJLUMFwuG42WjANuA
	 qvjyuN67MldqAf3B/Zz1Tu0jt0GyhcKtvob3sB4s0Xj9jWlJ56a2pO80JXI6zev6so
	 K/1D+gIZ22YJztVEKUhiZiMbCql6ahs8LJRbTKcLK6VefpcGycTi+Tg5ctvVspAqtZ
	 vRC4J4KkvJtFFk+X3lyoQUs8XhMufTXJfcRDrBLyZ2l3NiKp7+g0p5gtEmrxRwSvCb
	 pqoB2mNxZAyZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8182F8108B;
	Sun, 21 Dec 2025 13:42:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D26B1A6
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63AC66080C
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RUf7OcTbEH-M for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 13:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BAE8607C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BAE8607C4
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:42:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3785D874B9; Sun, 21 Dec 2025 13:42:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 14:36:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 440483b8e18060267a66f978426d40a0b1b8ec67
X-Git-Newrev: bc3128fc57021c1efb8faa6e0643c808dd58c180
X-Patchwork-Hint: ignore
Message-Id: <20251221134235.3785D874B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/udpcast: bump version to 20250223
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc3128fc57021c1efb8faa6e0643c808dd58c180
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes of this bugfix release:
https://udpcast.linux.lu/mailman3/hyperkitty/list/udpcast@udpcast.linux.lu/thread/JTGZCUMSXYLVT73TIRJJICBX7AWIE4CA/

Switched _SITE and Config.in homepage URL to https.

Fixes:
https://autobuild.buildroot.net/results/acf/acf208588c2ca7e658a9a7bee49b947309d6b8be

Upstream removed the tarball of the previous version causing autobuilder
errors, first recorded March, 2nd 2025.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: update package homepage url to use https]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/udpcast/Config.in    | 2 +-
 package/udpcast/udpcast.hash | 2 +-
 package/udpcast/udpcast.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/udpcast/Config.in b/package/udpcast/Config.in
index cc38c6e57c..cc65f94360 100644
--- a/package/udpcast/Config.in
+++ b/package/udpcast/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_UDPCAST
 	  A multicast protocol implementation which happens to
 	  be very handy for imaging drives over the network.
 
-	  http://www.udpcast.linux.lu/
+	  https://www.udpcast.linux.lu/
 
 if BR2_PACKAGE_UDPCAST
 
diff --git a/package/udpcast/udpcast.hash b/package/udpcast/udpcast.hash
index aca098d982..5b0426efe6 100644
--- a/package/udpcast/udpcast.hash
+++ b/package/udpcast/udpcast.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  17b5cd8b1e54f7e2e53357ac02ee86e4198bf704096987a03a3b5c402a0ecea1  udpcast-20230924.tar.gz
+sha256  cefd7554c877e1bc76987d2b96b23f7699a2e5340c254454f61b6e0dae370aa7  udpcast-20250223.tar.gz
 sha256  422befd3503b1f39a6027017f639874c1f274e37ec60ba3174894646b584ccbc  COPYING
diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index 64a0bfbd37..e087f2dbb2 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-UDPCAST_VERSION = 20230924
-UDPCAST_SITE = http://www.udpcast.linux.lu/download
+UDPCAST_VERSION = 20250223
+UDPCAST_SITE = https://www.udpcast.linux.lu/download
 UDPCAST_DEPENDENCIES = host-m4
 UDPCAST_LICENSE = BSD-2-Clause, GPL-2.0+
 UDPCAST_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
