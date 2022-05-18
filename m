Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04094C433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB86D61271;
	Wed, 18 May 2022 19:22:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zTcR-_FZWtqb; Wed, 18 May 2022 19:22:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B49A360C01;
	Wed, 18 May 2022 19:22:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E3E11BF9B2
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CA7241C8A
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:21:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xXuSxd_-9ZDq for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:20:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4076241C7E
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:20:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E02D786069; Wed, 18 May 2022 19:09:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 21:07:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ce7c0dd134619758d3317d8a46ba542be48ac9f
X-Git-Newrev: 5962c7ec398cb3b1f0fd4b68f21d66f129104931
X-Patchwork-Hint: ignore
Message-Id: <20220518190952.E02D786069@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-amdgpu:
 fix glamor support
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

commit: https://git.buildroot.net/buildroot/commit/?id=5962c7ec398cb3b1f0fd4b68f21d66f129104931
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add configure options for glamor support following the logic of the
xserver_xorg-server package:
https://git.busybox.net/buildroot/tree/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk#n141

Fixes:
http://autobuild.buildroot.net/results/e78/e786118db87f65bdcb913656a7b6d9b3187a212c/
http://autobuild.buildroot.net/results/a00/a0089ed3abdb0a3712524ae77fc613a4982054ed/
http://autobuild.buildroot.net/results/541/54193d198efe371bdb19ac4981d631ff1e279717/
http://autobuild.buildroot.net/results/298/298198c036931b10f7e1046176bd48310ae7455f/
http://autobuild.buildroot.net/results/4da/4da87d30e6f5a10aafae60abce1b89ed92204a4e/
http://autobuild.buildroot.net/results/74c/74ceb71bd48ea3a2bf6ff68aec0af76a11662f1f/
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk    | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
index e7196956a3..6423c03f5f 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
@@ -15,6 +15,12 @@ XDRIVER_XF86_VIDEO_AMDGPU_DEPENDENCIES = \
 	xorgproto \
 	xserver_xorg-server
 
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yyy)
+XDRIVER_XF86_VIDEO_AMDGPU_CONF_OPTS += --enable-glamor
+else
+XDRIVER_XF86_VIDEO_AMDGPU_CONF_OPTS += --disable-glamor
+endif
+
 # xdriver_xf86-video-amdgpu requires O_CLOEXEC
 XDRIVER_XF86_VIDEO_AMDGPU_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
