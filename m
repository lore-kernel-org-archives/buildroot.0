Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3032EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 16:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D386C41CB4;
	Thu, 27 Jan 2022 16:42:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yocC5oA4ALlw; Thu, 27 Jan 2022 16:42:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11B8741CDB;
	Thu, 27 Jan 2022 16:42:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D21C51C1135
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDE2841CBA
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:41:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ziHu7bUITfN for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 16:41:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2535741CB6
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 16:41:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EF91282837; Thu, 27 Jan 2022 16:34:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 17:41:31 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 52404bc144d9ced1b2194cff1d95ffdc2110f892
X-Git-Newrev: 9279040543e9d2de39d8fdf222f80c82bb9c445e
X-Patchwork-Hint: ignore
Message-Id: <20220127163452.EF91282837@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/pkg-python.mk:
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

commit: https://git.buildroot.net/buildroot/commit/?id=9279040543e9d2de39d8fdf222f80c82bb9c445e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

s/interperter/interpreter/ and drop 'use use' / 'depend on use'.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 65054d1a1964548a72c320b075cb20a122117952)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-python.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index e6b81bdfd3..bb1e6e5826 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -162,8 +162,8 @@ endif
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
@@ -222,8 +222,8 @@ endif # SETUP_TYPE
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
