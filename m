Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B12CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E19C417FE;
	Sun, 24 Sep 2023 21:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E19C417FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JUkg5lxtm9FX; Sun, 24 Sep 2023 21:47:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D24D4150C;
	Sun, 24 Sep 2023 21:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D24D4150C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 263601BF909
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE3FC6080A
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE3FC6080A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nOcb7CKSjUzo for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:46:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7793060F5D
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7793060F5D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 657BA875DC; Sun, 24 Sep 2023 21:46:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 23:31:16 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 4093b3046b5ed216723b7c72be9c9fe604827f4e
X-Git-Newrev: 1a5c0387b30f9b5222eba7dbd9aaad671f5f31c5
X-Patchwork-Hint: ignore
Message-Id: <20230924214608.657BA875DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/asterisk:
 security bump to version 16.30.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a5c0387b30f9b5222eba7dbd9aaad671f5f31c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fixes the following security vulnerabilities:

CVE-2022-23537: Heap buffer overflow when decoding STUN message in pjproject

Possible buffer overread when parsing a specially crafted STUN message with
unknown attribute.  The vulnerability affects Asterisk users using ICE
and/or WebRTC.

https://github.com/asterisk/asterisk/security/advisories/GHSA-4xjp-22g4-9fxm

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 01ec478cb642dc6d221ab4c2f7f2938d629dcec1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 98ee3bdc71..41e1da2962 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  9b93006a87be9c29492299118200e4f66c8369851c66a50fdef5b15dfc4eb2c2  asterisk-16.29.1.tar.gz
+sha256  ef1ddc07dc02bb0c5f5ba58a5e42e42bcb63e55ac94199be8e3b5d3910f43736  asterisk-16.30.1.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 22ac0334fd..4f1a80ba8b 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 16.29.1
+ASTERISK_VERSION = 16.30.1
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
