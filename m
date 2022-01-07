Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE1BC433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E866C40192;
	Fri,  7 Jan 2022 18:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VIrhzE4mkPd7; Fri,  7 Jan 2022 18:01:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E20B4049E;
	Fri,  7 Jan 2022 18:01:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F5421BF2FE
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A7184049E
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nl5g-zARYent for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:01:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AD66400E5
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:01:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D658282AD1; Fri,  7 Jan 2022 17:55:23 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 18:57:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 702ebf1704d8789a696fab25a518890f68720026
X-Git-Newrev: 685ef8d47a8dc8abe679600386a112f4b8bbf235
X-Patchwork-Hint: ignore
Message-Id: <20220107175523.D658282AD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/gstreamer1/gst1-plugins-bayer2rgb-neon: use "config"
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
Content-Type: multipart/mixed; boundary="===============5477897180476775530=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5477897180476775530==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=685ef8d47a8dc8abe679600386a112f4b8bbf235
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gst1-plugins-bayer2rgb-neon doesn't have sub-options so use "config"
instead of "menuconfig".

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in
index 570300a304..d3e4d0e243 100644
--- a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in
@@ -1,4 +1,4 @@
-menuconfig BR2_PACKAGE_GST1_PLUGINS_BAYER2RGB_NEON
+config BR2_PACKAGE_GST1_PLUGINS_BAYER2RGB_NEON
 	bool "gst1-plugins-bayer2rgb-neon"
 	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64 # bayer2rgb-neon
 	depends on !BR2_STATIC_LIBS # bayer2rgb-neon

--===============5477897180476775530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5477897180476775530==--
