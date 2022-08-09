Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A3CC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 11:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6280160E35;
	Tue,  9 Aug 2022 11:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6280160E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Me_Vh-MhKeya; Tue,  9 Aug 2022 11:34:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68FB260E3A;
	Tue,  9 Aug 2022 11:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68FB260E3A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91B611BF2C7
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BF5560E3A
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BF5560E3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WCp4XcAvf-mF for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 11:34:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B996160E26
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 11:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B996160E26
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1B27A87017; Tue,  9 Aug 2022 11:20:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Aug 2022 13:32:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b872dd68c5b7e934d31ce6d417e02749b31cc97
X-Git-Newrev: 3ce97967e0a95be1585177de13ad7d4122f7fbc9
X-Patchwork-Hint: ignore
Message-Id: <20220809112022.1B27A87017@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: fix indentation
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ce97967e0a95be1585177de13ad7d4122f7fbc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 0f3115b2ca9fbdcf7a4e02aba45104f2d423fdb8 broke the indentation
(missing one space)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index a56f03681a..4846c316bb 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -535,7 +535,7 @@ def fixup_config(sysinfo, configfile):
         if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
             return False
 
-   if 'BR2_PACKAGE_REFPOLICY=y\n' in configlines and \
+    if 'BR2_PACKAGE_REFPOLICY=y\n' in configlines and \
        'BR2_PACKAGE_REFPOLICY_CUSTOM_GIT=y\n' in configlines and \
        'BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL=""\n' in configlines:
         configlines.remove('BR2_PACKAGE_REFPOLICY_CUSTOM_GIT=y\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
