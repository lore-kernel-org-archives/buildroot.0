Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC6EC54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 09:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E53881E9F;
	Mon, 25 Mar 2024 09:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WrNT-KNw-RSV; Mon, 25 Mar 2024 09:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58EB581EAB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58EB581EAB;
	Mon, 25 Mar 2024 09:07:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D55FB1BF370
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 09:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9760605D8
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 09:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yUq6wuPfVxXY for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 09:06:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED2D16084A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED2D16084A
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 09:06:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EF1A83DAD; Mon, 25 Mar 2024 09:06:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 09:59:55 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 37b2a882e94cab3a58b1a2ab15de8b6af1424efd
X-Git-Newrev: 2680f08178e233a6ec4d8869781e4ca15ee76316
X-Patchwork-Hint: ignore
Message-Id: <20240325090652.9EF1A83DAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/multipath-tools:
 drop README.md from license files
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

commit: https://git.buildroot.net/buildroot/commit/?id=2680f08178e233a6ec4d8869781e4ca15ee76316
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Drop README.md from license files as advocated by Arnout Vandecappelle:
https://patchwork.ozlabs.org/project/buildroot/patch/20240314211117.9103-1-fontaine.fabrice@gmail.com

The only license-related part of README.md is that specifies that the
default license, if not mentioned in the file, is LGPL-2.0. Since the
README file is likely to be updated with every new release, this is a
lot of overhead for such a small added value.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit e511539cd29015f08d7417094cbf202a861ad533)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/multipath-tools/multipath-tools.hash | 1 -
 package/multipath-tools/multipath-tools.mk   | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
index c1f32e7a3b..03a2867144 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -4,4 +4,3 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1
-sha256  9c69bb0089aa0b82b10a25095c04a7c4aec6b5bbf0776b7129123c8459fe7725  README.md
diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index e62e85e14d..164d850600 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -16,8 +16,7 @@ MULTIPATH_TOOLS_LICENSE_FILES = \
 	LICENSES/GPL-2.0 \
 	LICENSES/GPL-3.0 \
 	LICENSES/LGPL-2.0 \
-	LICENSES/LGPL-2.1 \
-	README.md
+	LICENSES/LGPL-2.1
 MULTIPATH_TOOLS_CPE_ID_VENDOR = opensvc
 
 MULTIPATH_TOOLS_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
