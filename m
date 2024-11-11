Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE63D3ABF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 19:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 254F3606E6;
	Mon, 11 Nov 2024 19:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sko1KmWoWwHE; Mon, 11 Nov 2024 19:38:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A1FA606D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A1FA606D0;
	Mon, 11 Nov 2024 19:38:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15ECB6C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 19:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB719401E2
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 19:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cRwVqmKvbxcT for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 19:38:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0AC0401DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0AC0401DF
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 19:38:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5357860B5; Mon, 11 Nov 2024 19:38:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 20:38:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7deecbce2d1f3bb9037cd6c5db9d5a655d6044d
X-Git-Newrev: 5a59c24e577f19111bef37af946ad498f689ccd8
X-Patchwork-Hint: ignore
Message-Id: <20241111193842.A5357860B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: update in preparation for
 2024.11-rc1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5a59c24e577f19111bef37af946ad498f689ccd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 CHANGES | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/CHANGES b/CHANGES
index 40cc866bc3..f00ffdd5ab 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,43 @@
+2024.11-rc1, released November 11th, 2024
+
+	Fixes all over the tree and package updates.
+
+	Toolchain:
+
+	- binutils 2.43 added, binutils 2.42 becomes the default.
+	- glibc updated to 2.40
+	- ARM, Bootlin and Synopsys external toolchains updated
+	- Support added for ARM FDPIC, which allows to use shared
+	  libraries on ARM noMMU targets
+
+	Go support: allow using a pre-built Go compiler, using the new
+	go-bin package.
+
+	New defconfigs: friendlyarm_nanopi_neo, nvidia_bf3,
+	stm32f746_disco_sd, ti_am62px_sk, versal_vek280
+
+	Removed defconfigs: qemu_nios2_10m50
+
+	New packages: andes-spi-burn, bfscripts, cpp-httplib, dlib,
+	dpdk, evilwm, go-bin, iana-assignments, iotools, lua-uuid,
+	oath-toolkit, perl-mime-base32, python-aiohappyeyeballs,
+	python-aiomqtt, python-argcomplete, python-dotenv,
+	python-dunamai, python-immutabledict, python-iterable-io,
+	python-path, python-poetry-dynamic-versioning,
+	python-propcache, python-proto-plus, python-psygnal,
+	python-pyaml, python-pydantic-settings, python-pyqt5-sip,
+	python-pysnmpcrypto, python-rgbmatrix, python-sdbus,
+	python-sdbus-networkmanager, python-simple-websocket,
+	python-tinyhtml5, python-zipstream-ng, qt6charts, qt6scxml,
+	superiotool, tailscale, tinyinit, uefisettings
+
+	Removed packages: bsdiff, popperjs
+
+	Added tests: erofs filesystem, audit, dosfstools, dtc,
+	exfatprogs, go-bin, iputils, oath-toolkit, parted, pppd, pv,
+	pyqt5, python-sdbus, python-sdbus-networkmanager, rrdtool,
+	unbound, which
+
 2024.08.1, released October 20th, 2024
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
