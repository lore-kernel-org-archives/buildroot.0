Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D768BC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:27:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A464A60F56
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A464A60F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EABC40497;
	Tue,  3 Aug 2021 21:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2uI1IqSCbqeI; Tue,  3 Aug 2021 21:27:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC2E1404A7;
	Tue,  3 Aug 2021 21:27:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C1A11BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F36B34049A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s2BMmdXMfulK for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C07040249
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 86A097FCEC; Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 22 May 2021 15:42:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 96c23d1d0f5fbe3da903507afa39393be844b565
X-Git-Newrev: e326fcff64bfb5df5409440bcde7954c4e734c34
X-Patchwork-Hint: ignore
Message-Id: <20210803210943.86A097FCEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Update for 2021.05-rc2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=e326fcff64bfb5df5409440bcde7954c4e734c34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 35 +++++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 3 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9f9f5e94ff..53b9020767 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,38 @@
+2021.05-rc2, released May 22th, 2021
+
+	Fixes all over the tree.
+
+	support/scripts/gen-missing-cpe: A script to query the list of
+	CPE IDs for the packages enabled in the current configuration and:
+
+	- for CPE IDs that do not have any matching entry in the CPE
+	  database, it emits a warning
+
+	- for CPE IDs that do have a matching entry, but not with the same
+	  version, it generates a snippet of XML that can be used to propose
+	  an updated version to NIST.
+
+	CPE meta data has been added for a large number of packages
+
+	Updated/fixed packages: assimp, binutils, bitcoin, bullet,
+	cutelyst, dhcp, dmalloc, docker-engine, ebtables,
+	environment-setup, flatcc, gcc, gd, gerbera, hostapd,
+	imx-gpu-viv, intel-microcode, jquery-validation, libdrm,
+	libgeos, libraw, libtirpc, libxml2, libxslt, live555, lmbench,
+	localedef, lvm2, mender, mender-grubenv, modem-manager, mutt,
+	opensbi, openssh, opentyrian, pipewire, postgis, postgresql,
+	prosody, python-bluezero, python-falcon, redis, rocksdb,
+	rt-tests, runc, vlc, waylandpp, webkitgtk, wireshark,
+	wpa_supplicant, wpewebkit, xlib_libX11, xterm
+
+	New packages: jh71xx-tools
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13781: isc dhcp-server package don't create file /usr/bin/dhcpd
+	#13801: toolchainfile.cmake CMAKE_BUILD_TYPE
+	#13806: Building host-localedef fails on fedora 34/gcc 11
+
 2021.05-rc1, released May 12th, 2021
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 9d2c0d8ecb..57322fb586 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.05-rc1
+export BR2_VERSION := 2021.05-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1620809000
+BR2_VERSION_EPOCH = 1621690900
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 96a51e4874..3654285527 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 -->
-      <h3 style="text-align: center;">Latest release candidate: <b>2021.05-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2021.05-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.05-rc1.tar.gz">buildroot-2021.05-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2021.05-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.05-rc2.tar.gz">buildroot-2021.05-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2021.05-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.05-rc1.tar.bz2">buildroot-2021.05-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2021.05-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.05-rc2.tar.bz2">buildroot-2021.05-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2021.05-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
