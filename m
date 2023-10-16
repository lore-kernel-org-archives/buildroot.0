Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1178CDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 09:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D7D4415B3;
	Mon, 16 Oct 2023 09:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D7D4415B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zr9W7UPhi8sr; Mon, 16 Oct 2023 09:53:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 500D141681;
	Mon, 16 Oct 2023 09:53:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 500D141681
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE4571BF3AA
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 09:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A400D40955
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 09:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A400D40955
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tlrGsNCxVoWb for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 09:53:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0662408EF
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 09:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0662408EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A021D85CA0; Mon, 16 Oct 2023 09:53:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Oct 2023 11:46:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e077133a6577821946e7377489d54be01fbbe576
X-Git-Newrev: 44411182707bf32fb43e50f4a9ba055aaed5f73e
X-Patchwork-Hint: ignore
Message-Id: <20231016095305.A021D85CA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.02.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=44411182707bf32fb43e50f4a9ba055aaed5f73e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 593454c77e542ca7f6924087376ad0de71412e49)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/CHANGES b/CHANGES
index 81bc209b92..7f31e8793e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -322,6 +322,42 @@
 	#15376: Libiconv config
 	#15461: QtVirtualKeyboard segfaults
 
+2023.02.6, released October 16th, 2023
+
+	Important / security related fixes.
+
+	Per-package builds: Do not use hard links for host / target
+	dirs, fixing issues with package rebuilds or post-build
+	scripts modifications.
+
+	Infrastructure: Explicitly disable shuffle mode for Make >=
+	4.4 where needed.
+
+	Urandom-scripts: Move seedrng init script to S01 for earlier
+	random number entrophy initialization.
+
+	Go: Bump to 1.20.x as 1.19.x is now EOL and affected by
+	security issues.
+
+	Updated/fixed packages: at91bootstrap, bind, cups, efl,
+	enlightenment, exim, gcc, glibc, gnu-efi, go, go-bootstrap,
+	gptfdisk, gst-omx, gst1-devtools, gst1-libav,
+	gst1-plugins-bad, gst1-plugins-base, gst1-plugins-good,
+	gst1-plugins-ugly, gst1-python, gst1-rstp-server,
+	gst1-rtsp-vaapi, gstreamer1, gstreamer1-editing-services,
+	libcue, libcurl, libfastjson, libhtp, libmodplug, librsvg,
+	libvpx, libyang, linux-tools, mbedtls, mosquitto, mutt, neon,
+	netsnmp, nmap, nodejs, olsr, openblas, opkg-utils, php,
+	powertop, python-mako, python3, rockchip-mali, samba4, sslh,
+	suricata, tar, unifdef, unrandom-scripts, webkitgtk,
+	wireless-regdb, wpewebkit
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15628: Missing dependencies in BR2_PACKAGE_PYTHON_MAKO
+	#15808: connman is not supported on musl
+	#15814: C++ not supported by bootlin toolchain
+
 2023.02.5, released September 27th, 2023
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
