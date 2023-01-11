Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C006C46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9A0D820B7;
	Wed, 11 Jan 2023 09:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9A0D820B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N4qrD8-29X9V; Wed, 11 Jan 2023 09:49:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 309B182097;
	Wed, 11 Jan 2023 09:49:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 309B182097
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7CC821BF2B3
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58C5682097
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58C5682097
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5rwbWAJuiTfn for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:49:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 881968208D
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 881968208D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7011F878FE; Wed, 11 Jan 2023 09:49:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 10:48:39 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 801968f3af0c9448f99d68da43146c7d3972b4b1
X-Git-Newrev: 59e2b84680ea57f22385981753ae50bb1e212e78
X-Patchwork-Hint: ignore
Message-Id: <20230111094909.7011F878FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=59e2b84680ea57f22385981753ae50bb1e212e78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
index 0d8c666ba1..12e5b81b1b 100644
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
