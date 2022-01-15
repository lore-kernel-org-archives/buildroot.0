Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370CBC433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 15:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF6FE408A6;
	Sat, 15 Jan 2022 15:39:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5xfMg8cT80z8; Sat, 15 Jan 2022 15:39:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DDE840898;
	Sat, 15 Jan 2022 15:39:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F3A3D1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86F9040463
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C9LGxuiGVMjo for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 15:37:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2AD74010E
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 15:37:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 40FF982B52; Sat, 15 Jan 2022 15:31:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 16:16:11 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 9087da9922f10513c604d73f8d5d6d86cea91768
X-Git-Newrev: ab4c0e6fc28aa5ea2f07c4699d1bff9c7edca78a
X-Patchwork-Hint: ignore
Message-Id: <20220115153110.40FF982B52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/dav1d: don't
 override TARGET_LDFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab4c0e6fc28aa5ea2f07c4699d1bff9c7edca78a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

TARGET_LDFLAGS is overriden since the addition of the package in commit
8d66bc940d6e4707f9773aeb052e94d45fa439ad

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 6deb6bdc7cee0664a71f3363f4ee2d2e9d2f031b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dav1d/dav1d.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 68f6fc8805..235f070be5 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -25,7 +25,7 @@ endif
 
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-DAV1D_LDFLAGS += -latomic
+DAV1D_LDFLAGS += $(TARGET_LDFLAGS) -latomic
 endif
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
