Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEA9CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 06:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D8B082919;
	Fri, 13 Oct 2023 06:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D8B082919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IHXRIJ7Q_FxD; Fri, 13 Oct 2023 06:26:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79D4F827DD;
	Fri, 13 Oct 2023 06:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79D4F827DD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 735DD1BF3C8
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FA4841C22
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FA4841C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CrQpHyaYtqz7 for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 06:24:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD8C84173C
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 06:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD8C84173C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E01B846BC; Fri, 13 Oct 2023 06:24:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 08:12:04 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 371018f7c4678768aae6b0fbbbad55fe82f22eff
X-Git-Newrev: 1c00ef0684ab83b1af01397e78bb30dcda51df95
X-Patchwork-Hint: ignore
Message-Id: <20231013062403.9E01B846BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-mako: add
 optional runtime dependency on python-babel
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c00ef0684ab83b1af01397e78bb30dcda51df95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Some extensions of python-mako use python-babel, if they are used,
python-babel must be added as a runtime dependency.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 411a3deb1a4850f4eeff3faebdb87b8ef544d650)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-mako/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python-mako/Config.in b/package/python-mako/Config.in
index 2e1094189f..7bba31943e 100644
--- a/package/python-mako/Config.in
+++ b/package/python-mako/Config.in
@@ -17,4 +17,11 @@ config BR2_PACKAGE_PYTHON_MAKO_EXT_PYGMENTPLUGIN
 	  Provide python-pygments support for
 	  mako.ext.pygmentplugin
 
+config BR2_PACKAGE_PYTHON_MAKO_EXT_BABELPLUGIN
+	bool "mako extension babelplugin"
+	select BR2_PACKAGE_PYTHON_BABEL # runtime
+	help
+	  Provide python-babel support for
+	  mako.ext.babelplugin
+
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
