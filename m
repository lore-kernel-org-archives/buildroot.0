Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68327C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 13:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0012C4032A;
	Sun,  9 Jan 2022 13:21:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CeJUGK4DpTWM; Sun,  9 Jan 2022 13:21:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5554F402A5;
	Sun,  9 Jan 2022 13:21:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9885E1BF4D7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8706C80BBD
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TDIjkXZz90IW for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 13:21:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E736780BB5
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 13:21:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5AC4782B94; Sun,  9 Jan 2022 13:15:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 14:19:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31848ba595bfd77e5471601edc35cf587de4ce34
X-Git-Newrev: 65054d1a1964548a72c320b075cb20a122117952
X-Patchwork-Hint: ignore
Message-Id: <20220109131517.5AC4782B94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python.mk: fix typos
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

commit: https://git.buildroot.net/buildroot/commit/?id=65054d1a1964548a72c320b075cb20a122117952
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

s/interperter/interpreter/ and drop 'use use' / 'depend on use'.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-python.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 4cc416cea0..22ea77352c 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -155,8 +155,8 @@ endif
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
@@ -215,8 +215,8 @@ endif # SETUP_TYPE
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
