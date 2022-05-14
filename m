Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BABC433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 17:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0222340915;
	Sat, 14 May 2022 17:58:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YVS_tDffxB4b; Sat, 14 May 2022 17:58:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1105E408DB;
	Sat, 14 May 2022 17:58:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D3DE1BF909
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 17:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6B3F414CB
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 17:56:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IpVxJkCxECYp for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 17:56:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 290C3414D1
 for <buildroot@buildroot.org>; Sat, 14 May 2022 17:56:20 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout10.t-online.de (Postfix) with SMTP id 7FC626620;
 Sat, 14 May 2022 19:56:17 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.4.164]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npvzx-2G5rpx0; Sat, 14 May 2022 19:56:13 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:41714)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npvzw-0005N1-Vk;
 Sat, 14 May 2022 19:56:13 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 19:55:55 +0200
Message-Id: <20220514175612.2510884-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
References: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652550973-000116DC-64B1523F/0/0 CLEAN NORMAL
X-TOI-MSGID: 2953dbe2-141c-4aa3-9c9d-7d06cb8f9719
Subject: [Buildroot] [PATCH 02/19] package/x11r7/xdriver_xf86-video-amdgpu:
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 .../xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk  | 6 ++++++
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
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
