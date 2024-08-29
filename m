Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D74BC71151
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 06:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8CAF40C97;
	Thu, 29 Aug 2024 06:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BC341pQcB9oc; Thu, 29 Aug 2024 06:20:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACD7B40C9F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACD7B40C9F;
	Thu, 29 Aug 2024 06:20:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EE101BF867
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 06:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0F7B60A4F
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 06:20:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFZ41mMZcSL4 for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 06:20:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32BDA60639
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32BDA60639
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 06:20:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C57486620; Thu, 29 Aug 2024 06:20:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 08:18:52 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: feeb6ea3690f73eb3748c1970a69e1b53db03c9e
X-Git-Newrev: ae32afab9b234a78d9b3a4015ea733c53e5d05b9
X-Patchwork-Hint: ignore
Message-Id: <20240829062034.1C57486620@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libcoap: enable
 required libopenssl options
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae32afab9b234a78d9b3a4015ea733c53e5d05b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

libcoap unconditionally calls the (deprecated) ENGINE_* logic in
libopenssl resulting in a build failure when
!BR2_PACKAGE_LIBOPENSSL_ENGINES since commit
623d3bbe43e9193aa8e3395367d01af59071b859

libcoap also unconditionally uses PSK

Fixes: 623d3bbe43e9193aa8e3395367d01af59071b859
 - http://autobuild.buildroot.org/results/6bd3e1390cbbc59b9b3d030c2a401e45e9d173da
 - http://autobuild.buildroot.org/results/f243209454feed4f33f759786c2023c576a2cd3d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 33d25f08f97450cea7a415582dc2110b2bc828c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcoap/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libcoap/Config.in b/package/libcoap/Config.in
index 6e0c1905bc..950aee5279 100644
--- a/package/libcoap/Config.in
+++ b/package/libcoap/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBCOAP
 	bool "libcoap"
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  libcoap is a C implementation of a lightweight
 	  application-protocol for devices that are constrained their
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
