Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3EEC43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 16:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E595611DE;
	Wed,  1 Jun 2022 16:15:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xCmS3Y67pQBf; Wed,  1 Jun 2022 16:14:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0958611A9;
	Wed,  1 Jun 2022 16:14:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EE911BF9AD
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 16:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BE194092A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 16:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 23eplDc8fU-R for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 16:14:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23DB440923
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 16:14:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 14EAB868BA; Wed,  1 Jun 2022 16:02:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Jun 2022 17:57:43 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1335d46be5eaf1adc313ab398273724b0693309b
X-Git-Newrev: 84bb483afba1f95de646f7a5c4b54849dcefe381
X-Patchwork-Hint: ignore
Message-Id: <20220601160252.14EAB868BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/x11r7/xdriver_xf86-video-amdgpu: fix glamor support
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

commit: https://git.buildroot.net/buildroot/commit/?id=84bb483afba1f95de646f7a5c4b54849dcefe381
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 5962c7ec398cb3b1f0fd4b68f21d66f129104931)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
