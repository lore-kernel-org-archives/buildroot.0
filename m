Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194B0C636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 15:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A155C60760;
	Sun,  5 Feb 2023 15:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A155C60760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hv3gcZlTKn-O; Sun,  5 Feb 2023 15:04:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9312606EB;
	Sun,  5 Feb 2023 15:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9312606EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 607801BF59E
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 15:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40F5541575
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 15:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40F5541575
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7V25OwDbk1qx for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 15:04:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 522A241571
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 15:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 522A241571
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0640A838BC; Sun,  5 Feb 2023 15:04:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 16:02:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a7b1b913e756358b40359115c12fff241d4ca92
X-Git-Newrev: 78e3637dd26766976d09e5d8286613f67975f8d6
X-Patchwork-Hint: ignore
Message-Id: <20230205150429.0640A838BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: fix openssl dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=78e3637dd26766976d09e5d8286613f67975f8d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 6a0f7c39bcb48fc13aa2ce3fc4996baf1be66483:

Makefile:576: *** libopenssl is in the dependency chain of fluent-bit that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/9c3b8e19063f7587877fdb0598739b55abccb3e8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fluent-bit/fluent-bit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 879437e5f4..13077e53cc 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -10,7 +10,7 @@ FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
 FLUENT_BIT_CPE_ID_VENDOR = treasuredata
 FLUENT_BIT_CPE_ID_PRODUCT = fluent_bit
-FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml libopenssl
+FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml openssl
 
 FLUENT_BIT_CONF_OPTS += \
 	-DFLB_DEBUG=No \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
