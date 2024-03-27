Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0335BC47DD9
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 09:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AFA36078D;
	Wed, 27 Mar 2024 09:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0h8e8xNaMEj; Wed, 27 Mar 2024 09:40:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B582960B4E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B582960B4E;
	Wed, 27 Mar 2024 09:40:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C7AB21BF297
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 09:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B493881DE9
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 09:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWaxsv3OXCr4 for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 09:40:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3F5A81D73
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3F5A81D73
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 09:40:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD962842E0; Wed, 27 Mar 2024 09:40:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Mar 2024 10:33:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9536c726bb305e4bef6f09762283a8633090f82b
X-Git-Newrev: f578744ad43fe59e5639ce0c766877622117a84f
X-Patchwork-Hint: ignore
Message-Id: <20240327094047.AD962842E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.02.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=f578744ad43fe59e5639ce0c766877622117a84f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cc34b5b2abf2588f0ef55e46a4fe85a60c19ba1f)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/CHANGES b/CHANGES
index a5ee80016e..4b0cc08244 100644
--- a/CHANGES
+++ b/CHANGES
@@ -728,6 +728,29 @@
 	#15376: Libiconv config
 	#15461: QtVirtualKeyboard segfaults
 
+2023.02.11, released March 26th, 2024
+
+	Important / security related fixes.
+
+	Defconfigs: Starfive visionfive2: Use correct genimage
+	configuration.
+
+	Updated/fixed packages: bind, bitcoin, botan, c-ares, clamav,
+	cvs, dash, dnsmasq, ell, exim, expat, freetype, ghostscript,
+	gnupg2, google-breakpad, gst1-python, gst1-vaapi, iwd,
+	libcoap, libcurl, libgit2, libkrb5, libmodsecurity, libunwind,
+	libuv, libxml2, lua-http, luvi, nginx-naxsi, nodejs, openssh,
+	openvmtools, parted, php, poco, postgresql, privoxy,
+	pure-ftpd, putty, python-cheroot, python-configshell-fb,
+	python-django, python-rtslib-fb, python3, rsync, sdl2, shim,
+	spice, squid, strace, strongswan, sudo, systemd, targetcli-fb,
+	unbound, uvw, v4l2loopback, vim, webkitgtk, wpewebkit, xvisor,
+	zlib-ng
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15997: Build Squid with GCC12.3 in Buildroot 2024.02 will fail
+
 2023.02.10, released March 1st, 2024
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
