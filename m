Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE073C433FE
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 16:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 758D684FCD;
	Thu, 27 Jan 2022 16:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RAM9ajbOWzcQ; Thu, 27 Jan 2022 16:41:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C51D584FC8;
	Thu, 27 Jan 2022 16:41:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56C561C1135
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 535AD84FC9
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:41:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 79JfmAQ8mq-M for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 16:41:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A759284FC6
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 16:41:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7BBB182837; Thu, 27 Jan 2022 16:34:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 17:41:36 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 9f40890a29f008589a7cfa8a27818432d2ddc8d0
X-Git-Newrev: 947b6bc79924101f2a7956fd291be05d5f512d6b
X-Patchwork-Hint: ignore
Message-Id: <20220127163448.7BBB182837@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/pkg-python.mk:
 fix typos
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

commit: https://git.buildroot.net/buildroot/commit/?id=947b6bc79924101f2a7956fd291be05d5f512d6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

s/interperter/interpreter/ and drop 'use use' / 'depend on use'.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 65054d1a1964548a72c320b075cb20a122117952)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-python.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 59a48e5a87..7cdd858628 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -170,8 +170,8 @@ endif
 # - for target packages, we always depend on the default python interpreter
 #   (the one selected by the config);
 # - for host packages:
-#   - if *_NEEDS_HOST_PYTHON is not set, then we depend on use the default
-#     interperter;
+#   - if *_NEEDS_HOST_PYTHON is not set, then we use the default
+#     interpreter;
 #   - otherwise, we depend on the one requested by *_NEEDS_HOST_PYTHON.
 #
 ifeq ($(4),target)
@@ -230,8 +230,8 @@ endif # SETUP_TYPE
 # - for target packages, we always use the default python interpreter (which
 #   is the same version as the one built and installed on the target);
 # - for host packages:
-#   - if *_NEEDS_HOST_PYTHON is not set, then we use use the default
-#     interperter;
+#   - if *_NEEDS_HOST_PYTHON is not set, then we use the default
+#     interpreter;
 #   - otherwise, we use the one requested by *_NEEDS_HOST_PYTHON.
 #
 ifeq ($(4),target)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
