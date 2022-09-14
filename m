Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EED2ECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 22:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30E8C4176E;
	Wed, 14 Sep 2022 22:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30E8C4176E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DJpJC-JyX_Mh; Wed, 14 Sep 2022 22:31:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1E7F40913;
	Wed, 14 Sep 2022 22:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1E7F40913
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F81E1BF38C
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ADB3408E1
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ADB3408E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4R602fCe_NNC for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 22:29:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E1FD40913
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 22:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E1FD40913
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4B3C883BA2; Wed, 14 Sep 2022 22:29:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 00:27:05 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 6e14a276ca21506a729434146c25461e80546c73
X-Git-Newrev: 247375faf877edecc40bd026c95dd40524a4c083
X-Patchwork-Hint: ignore
Message-Id: <20220914222927.4B3C883BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/weston: remove
 md5 and sha1 hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=247375faf877edecc40bd026c95dd40524a4c083
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Since weston 10.0.0, md5 and sha1 hashes are not published
with the release announce email.

The values were probably calculated locally, so remove them
since upstream provide stronger hashes.

Fixes:
f67a6e9b7a7be9adbc405b3126000056120a01af

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit af972178bdee45469fffdaa3a53ecb9fd8a322f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/weston.hash | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 951d62a100..d58ca1ef70 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,6 +1,4 @@
 # From https://lists.freedesktop.org/archives/wayland-devel/2022-June/042260.html
-md5  dac91aecc97a85bf9664dec0d5c90ae3  weston-10.0.1.tar.xz
-sha1  87cc339503f01317a0ca8d986b1b211c8aae99bb  weston-10.0.1.tar.xz
 sha256  8a9e52506a865a7410981b04f8341b89b84106db8531ab1f9fdd37b5dc034115  weston-10.0.1.tar.xz
 sha512  688d843096a95b463161b98e85ca3443b31ba2ee49fc8d456a2780cc96f576e9d097054e9f361997a66e9cc8373cf29e406a742dae3884b3b50b26acf1710c8c  weston-10.0.1.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
