Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9093CE77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 20:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36B0B403C4;
	Sun,  8 Dec 2024 20:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jaf_dOlcPN5C; Sun,  8 Dec 2024 20:13:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED3A7403BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED3A7403BE;
	Sun,  8 Dec 2024 20:13:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F1940979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 20:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DABD5403CA
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 20:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BouMAx1D8WM4 for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 20:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B487840111
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B487840111
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 20:13:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A906986BD6; Sun,  8 Dec 2024 20:13:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Dec 2024 21:07:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d81e3225672d146248ed3e36ba9ec33768d2d27
X-Git-Newrev: b8111f065312c1f0b16aaae3c38238d27c6ade80
X-Patchwork-Hint: ignore
Message-Id: <20241208201354.A906986BD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.08.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=b8111f065312c1f0b16aaae3c38238d27c6ade80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 563852c4362c5128ecaae6deb8057b395681e087)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/CHANGES b/CHANGES
index cf49ce56b3..3816e5e13d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -74,6 +74,28 @@
 	- ripgrep leaves /usr/crates2.json / .crates.toml files
 	  https://gitlab.com/buildroot.org/buildroot/-/issues/17
 
+2024.08.3, released December 8th, 2024
+
+	Important / security related fixes.
+
+	Defconfigs: fix mender_x86_64_efi_defconfig build on setups
+	where /bin/sh is not bash.
+
+	Updated/fixed packages: alsa-lib, android-tools, bats-core,
+	bluez-alsa, bmap-tools, boost, checksec, ebtables, expat, fbv,
+	ffmpeg, foot, frr, gnuplot, gnutls, intel-microcode, irssi,
+	libcurl, libgit2, libkrb5, libmodbus, libpng, libvpl,
+	linux-pam, linux-tools, lmbench, mbedtls, mosquitto, musl,
+	musl-compat-headers, nfs-utils, ntp, php, picotool,
+	postgresql, procps-ng, python-psycopg2, python-sip, qt6base,
+	quagga, rt-tests, sexpect, sshguard, systemd, tiff, x11vnc
+
+	Issues resolved:
+	- procps-ng: builderror in 2024.08
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/38
+	- fbv package download link is broken in long term support branch
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/73
+
 2024.08.2, released November 14th, 2024
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
