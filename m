Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E96C3ABCB
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 20:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7BDD40575;
	Mon, 12 May 2025 20:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbNFbPpPnES7; Mon, 12 May 2025 20:42:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C0DC4053A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C0DC4053A;
	Mon, 12 May 2025 20:42:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 43770150
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46B0641072
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVo4JDSCD3K6 for <buildroot@buildroot.org>;
 Mon, 12 May 2025 20:42:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87D0041077
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87D0041077
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:42:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74B02867DF; Mon, 12 May 2025 20:42:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 12 May 2025 22:31:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96ae6c41e7ac57692842ffbac1e81beb35b66d52
X-Git-Newrev: ce9a64b5d15a484762cbd40007650784998b100b
X-Patchwork-Hint: ignore
Message-Id: <20250512204203.74B02867DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/connman: bump to version 1.44
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ce9a64b5d15a484762cbd40007650784998b100b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:

- ver 1.44:
  * Fix issue with handling oFono context integration.
  * Fix issue with handling web context for online detection.
  * Fix issue with handling flags used when deleting routes.
  * Fix issue with handling PAC proxy integration.

- ver 1.43:
  * Fix issue with device creation when using LTE.
  * Fix issue with regulatory domain when powering up.
  * Fix issue with resolving ISO3166 code from timezone data.
  * Fix issue with handling DNS proxy zero termination of buffers.
  * Fix issue with handling DHCP packet length in L3 mode.
  * Fix issue with handling DHCP upper length checks.
  * Fix issue with handling IPv6 and URL parsing.
  * Fix issue with handling online check updates.
  * Fix issue with handling proxy method and WISPr.
  * Fix issue with handling default gateway setup.
  * Add support for low-priority default routes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/connman/connman.hash | 2 +-
 package/connman/connman.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index ea87f1ea17..38af1847ae 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256  a3e6bae46fc081ef2e9dae3caa4f7649de892c3de622c20283ac0ca81423c2aa  connman-1.42.tar.xz
+sha256  2be2b00321632b775f9eff713acd04ef21e31fbf388f6ebf45512ff4289574ff  connman-1.44.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 142a6583ad..2c5be8252c 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.42
+CONNMAN_VERSION = 1.44
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
