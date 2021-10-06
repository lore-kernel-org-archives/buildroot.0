Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3F9C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:32:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BCC061186
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BCC061186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 403BD4090E;
	Wed,  6 Oct 2021 19:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RKrdEzX47uC4; Wed,  6 Oct 2021 19:32:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E5CF4090D;
	Wed,  6 Oct 2021 19:32:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A7681BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E43C2407FC
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WMEhyvV73sKG for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:30:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8177402A0
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:30:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5B3FF9121F; Wed,  6 Oct 2021 19:28:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 21:11:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 867521fed7cc0562aee2ff29ecd6cd257f128b07
X-Git-Newrev: c6e6872df467fd0d91a7c3b2f5381e9010a42e74
X-Patchwork-Hint: ignore
Message-Id: <20211006192814.5B3FF9121F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wavemon: needs libnl tools
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6e6872df467fd0d91a7c3b2f5381e9010a42e74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libnl tools is needed since bump to version 0.9.4 in commit
5cae1a0d675eca41125b6430157d3d0d78d1220c and
https://github.com/uoaerg/wavemon/commit/2a22c3dac0675c1d8985263c1a5b62d0a0f9a5e6
to avoid the following build failure:

checking for LIBNL3_CLI... no
configure: error: need libnl-cli-3.0 >= 3.2

Fixes:
 - http://autobuild.buildroot.org/results/3e5886e2c96c92e9626b2f6b2cd2b8f43c06da2e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wavemon/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/wavemon/Config.in b/package/wavemon/Config.in
index 0cb4cb5c69..0e087bd0c8 100644
--- a/package/wavemon/Config.in
+++ b/package/wavemon/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_WAVEMON
 	bool "wavemon"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # libnl tools
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_LIBNL_TOOLS
 	help
 	  wavemon is a wireless device monitoring application that
 	  allows you to watch signal and noise levels, packet
@@ -15,5 +17,5 @@ config BR2_PACKAGE_WAVEMON
 
 	  https://github.com/uoaerg/wavemon
 
-comment "wavemon needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "wavemon needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
