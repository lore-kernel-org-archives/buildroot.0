Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E52C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 08:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D20B414CE;
	Thu,  2 May 2024 08:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMqk2emnek_w; Thu,  2 May 2024 08:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24299414C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24299414C2;
	Thu,  2 May 2024 08:36:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61BE01BF47A
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 08:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59E7E60E4F
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 08:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JAvTTMzNOOvL for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 08:36:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2BA560E46
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2BA560E46
 for <buildroot@buildroot.org>; Thu,  2 May 2024 08:36:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D15C86608; Thu,  2 May 2024 08:36:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 22:54:59 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: db08c123305cd22ea60b03ebf322410fd70cbbfc
X-Git-Newrev: 7045d2905e67158f5fe2ae5e497bc923c114e4d5
X-Patchwork-Hint: ignore
Message-Id: <20240502083654.8D15C86608@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libdrm/intel:
 Remove dependency to x86
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

commit: https://git.buildroot.net/buildroot/commit/?id=7045d2905e67158f5fe2ae5e497bc923c114e4d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

BR2_PACKAGE_LIBDRM_INTEL was dependent on BR2_i386
or BR2_x86_64, which made sense for integrated GPUs.
This is no longer valid with discrete GPUs so remove
this dependency to allow building on other CPU
architectures.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 02e30af0d059aabb694daa54cbad4cae900af29a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdrm/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 3cb0e02a41..fab8289be6 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -20,7 +20,6 @@ config BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 
 config BR2_PACKAGE_LIBDRM_INTEL
 	bool "intel"
-	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
 	select BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 	select BR2_PACKAGE_LIBPCIACCESS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
