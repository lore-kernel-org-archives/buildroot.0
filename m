Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01291C433FE
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 17:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9CBC40A4D;
	Thu,  2 Dec 2021 17:16:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cBZwh2aGNc_9; Thu,  2 Dec 2021 17:16:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7E6440A44;
	Thu,  2 Dec 2021 17:16:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D6AC1BF3F9
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E0F383EFA
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ErHkJSytWqTi for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 17:15:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67E1383F02
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 17:15:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 455E692280; Thu,  2 Dec 2021 17:10:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 Dec 2021 18:11:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5ee89aa28d75d857f48d39d925a08641ebc3dfe
X-Git-Newrev: e0f6dfc4c5b91f39228e780c29ca02731c3c9370
X-Patchwork-Hint: ignore
Message-Id: <20211202171048.455E692280@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: use single space in
 LIBFOO_{DEVICES, PERMISSIONS}
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0f6dfc4c5b91f39228e780c29ca02731c3c9370
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use single space in LIBFOO_{DEVICES,PERMISSIONS} to be consistent with
LIBFOO_USERS, package/makedevs/README and most examples/packages

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 2201d4385e..2d8a1a71ce 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -48,11 +48,11 @@ system is based on hand-written Makefiles or shell scripts.
 33: endef
 34:
 35: define LIBFOO_DEVICES
-36:	/dev/foo  c  666  0  0	42  0  -  -  -
+36:	/dev/foo c 666 0 0 42 0 - - -
 37: endef
 38:
 39: define LIBFOO_PERMISSIONS
-40:	/bin/foo  f  4755  foo  libfoo	 -  -  -  -  -
+40:	/bin/foo f 4755 foo libfoo - - - - -
 41: endef
 42:
 43: $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
