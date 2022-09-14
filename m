Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B892ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 07:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C60738183D;
	Wed, 14 Sep 2022 07:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C60738183D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ixkUIFwJ7Qw6; Wed, 14 Sep 2022 07:40:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA6A881852;
	Wed, 14 Sep 2022 07:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA6A881852
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E3271BF909
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 07:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A9C2606BF
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 07:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A9C2606BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MTANGR6_5CzY for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 07:40:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3012060B53
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 07:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3012060B53
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 202E8838BB; Wed, 14 Sep 2022 07:40:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 09:36:03 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: c9688510adf2b827e3d6bac0f32a142c77602227
X-Git-Newrev: 0f44b89e5e66c3e435b01004576189051a48691a
X-Patchwork-Hint: ignore
Message-Id: <20220914074035.202E8838BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/openvmtools: fix
 link in Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f44b89e5e66c3e435b01004576189051a48691a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

The page on Sourceforge says since 2015 that the project has moved to
https://github.com/vmware/open-vm-tools, so update the Config.in help
text link accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit eda5590fa9fc647598e2a407612b4072ec8cb3cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvmtools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index a50b6b9b3e..c866b36569 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_OPENVMTOOLS
 	help
 	  Open Virtual Machine Tools for VMware guest OS
 
-	  http://open-vm-tools.sourceforge.net/
+	  https://github.com/vmware/open-vm-tools
 
 	  ICU locales, Xerces, and X11 tools are currently not
 	  supported.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
