Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD618C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 21:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 718DD416E5;
	Sun, 12 Mar 2023 21:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 718DD416E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VHeCJHnt6XMt; Sun, 12 Mar 2023 21:50:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6209041702;
	Sun, 12 Mar 2023 21:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6209041702
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75C231BF863
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68A00405CF
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68A00405CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4AiGbcTWgqVI for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 21:46:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D10C405D9
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 21:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D10C405D9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A47C87006; Sun, 12 Mar 2023 21:46:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 09:28:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ab0431b70e3d963ff3bbc8f10a1871d9f628789
X-Git-Newrev: 07634619d9738154e46e9b309d0697d223639167
X-Patchwork-Hint: ignore
Message-Id: <20230312214622.6A47C87006@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ssdp-responder: bump to v2.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=07634619d9738154e46e9b309d0697d223639167
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ChangeLog:
 - https://github.com/troglobit/ssdp-responder/releases/tag/v2.0
 - https://github.com/troglobit/ssdp-responder/blob/v2.0/ChangeLog.md

Critical Fixes:
 - Fix periodic busy loop causing intermittent 100% CPU load
 - Fix invalid <UDN>uuid:uuid:...</UDN> in description.xml (dup uuid:)

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ssdp-responder/ssdp-responder.hash | 2 +-
 package/ssdp-responder/ssdp-responder.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ssdp-responder/ssdp-responder.hash b/package/ssdp-responder/ssdp-responder.hash
index 425ad86e08..8b4f3e4e45 100644
--- a/package/ssdp-responder/ssdp-responder.hash
+++ b/package/ssdp-responder/ssdp-responder.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  974c244abd4ba8c87532867a84756182a1460c99072ffb1eb91c5a1f73311d89  ssdp-responder-1.9.tar.gz
+sha256  d8888f2ac59febfb3b2473a1402041014052ad4dc1eeb4168c78aeca1692aae3  ssdp-responder-2.0.tar.gz
 sha256  68d6fdc22e337f725fe719bf9ae6d92b1d8d0ca4cff8219b303ab76706670a8d  LICENSE
diff --git a/package/ssdp-responder/ssdp-responder.mk b/package/ssdp-responder/ssdp-responder.mk
index 5193966908..20e7219386 100644
--- a/package/ssdp-responder/ssdp-responder.mk
+++ b/package/ssdp-responder/ssdp-responder.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSDP_RESPONDER_VERSION = 1.9
+SSDP_RESPONDER_VERSION = 2.0
 SSDP_RESPONDER_SITE = https://github.com/troglobit/ssdp-responder/releases/download/v$(SSDP_RESPONDER_VERSION)
 SSDP_RESPONDER_LICENSE = ISC
 SSDP_RESPONDER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
