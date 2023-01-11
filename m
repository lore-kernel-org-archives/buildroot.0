Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC39C46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92F59419BF;
	Wed, 11 Jan 2023 09:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92F59419BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S2vwq4PKmxne; Wed, 11 Jan 2023 09:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84F7841948;
	Wed, 11 Jan 2023 09:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84F7841948
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E56B71BF95E
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C110740135
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C110740135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 249KsvbculBk for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:51:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E69AF405C4
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E69AF405C4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D08C387914; Wed, 11 Jan 2023 09:51:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 10:48:31 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b96bf0a106e4c344dfb8fff4d8e6785e19d17d15
X-Git-Newrev: 05900e5b6ea9a679a6296a91d34d5b799b22a01d
X-Patchwork-Hint: ignore
Message-Id: <20230111095143.D08C387914@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/gobject-introspection: really use host python for host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=05900e5b6ea9a679a6296a91d34d5b799b22a01d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit "abc110e362 package/gobject-introspection: bump to version
1.68.0" renamed the define that makes sure g-ir-tool-template uses the
host python, but forgot to update its call on pre-configure hooks.

Update it now.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 80c5be77ceb021e8319b9269b58d6373d378fac5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gobject-introspection/gobject-introspection.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index 99f4a7e2fe..ec236c621d 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -66,7 +66,7 @@ HOST_GOBJECT_INTROSPECTION_CONF_ENV = \
 define GOBJECT_INTROSPECTION_FIX_TOOLS_PYTHON_PATH
 	$(SED) '1s%#!.*%#!$(HOST_DIR)/bin/python3%' $(@D)/tools/g-ir-tool-template.in
 endef
-HOST_GOBJECT_INTROSPECTION_PRE_CONFIGURE_HOOKS += GOBJECT_INTROSPECTION_FIX_TOOLTEMPLATE_PYTHON_PATH
+HOST_GOBJECT_INTROSPECTION_PRE_CONFIGURE_HOOKS += GOBJECT_INTROSPECTION_FIX_TOOLS_PYTHON_PATH
 
 # Perform the following:
 # - Just as above, Ensure that g-ir-tool-template.in uses the host python.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
