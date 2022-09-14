Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1D1ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 07:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BE0641711;
	Wed, 14 Sep 2022 07:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BE0641711
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fq3CxMJUlDvi; Wed, 14 Sep 2022 07:39:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC03441710;
	Wed, 14 Sep 2022 07:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC03441710
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21D381BF909
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 07:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99B5E40B3C
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 07:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99B5E40B3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1jJZI8la-0Sb for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 07:39:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33AD840B47
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 07:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33AD840B47
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 21F0E838AA; Wed, 14 Sep 2022 07:39:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 09:35:54 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: cd852bca8e13eece52156d7c0c46ea79323f3fb3
X-Git-Newrev: 4dd9175c141aacbfea1ed51e59849baaadb9f668
X-Patchwork-Hint: ignore
Message-Id: <20220914073925.21F0E838AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/openvmtools: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=4dd9175c141aacbfea1ed51e59849baaadb9f668
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
