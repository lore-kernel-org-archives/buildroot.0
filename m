Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25233CD6E4A
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 13:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D109142A16;
	Thu,  4 Jun 2026 13:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sarU3N4wvifP; Thu,  4 Jun 2026 13:37:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDCBA42A17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780580278;
	bh=pSgEqVWVdVz0MEfqZcFGr6s+5rc6LHYYJv+h4F5y8+Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mH8IkQGlWn+TClFqbqyCgzDfadnyWdX1E/0LbqIlqQvktQTsUdkyXIOxDuYSvrFqW
	 4/+oO+ltighq6lIDI7OU6vCmVJrEsCTT+8NCacWYdg3Tb0waU4wnvijwPBhDz84VTd
	 JkNjFggYFjiNmtm7R+80Ka1g/q+ilQZJof+el4iSSdgwc+kp8TXKKIq2b1MLKUeSTR
	 G/XZxc33RctxR0UBh7F8SeellDWfiP6FtHjawhZ0WoFWZSCQoLHfGja33dUAfOMDUQ
	 5VNmSzXD68RfaIyzBq0kDhHaOBQvJNyVzj7f/uB6SIihp0tI85PkwXyn5pC66gZm2Q
	 qdDOQs0oqcz+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDCBA42A17;
	Thu,  4 Jun 2026 13:37:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 363EDDE
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 13:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C7B36F50F
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 13:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mNkw8jPd0lS1 for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 13:37:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7D8F6F50D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7D8F6F50D
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 13:37:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C65987A4B; Thu,  4 Jun 2026 13:37:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 15:36:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b168816cd85698ffb377bc1e06333d57a2ab4e4
X-Git-Newrev: 443bec78114bfd9e7062fc59a633cb9568c55859
X-Patchwork-Hint: ignore
Message-Id: <20260604133740.6C65987A4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2026.05-rc4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/443bec78114bfd9e7062fc59a633cb9568c55859
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 50 ++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 14 ++++++-------
 docs/website/news.html     | 22 ++++++++++++++++++++
 4 files changed, 81 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 568908d144..9c5c08a360 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,53 @@
+2026.05-rc4, released June 4th, 2026
+
+	Fixes all over the tree.
+
+        Infrastructure:
+
+        - dependencies: detect and reject buggy uutils 'install'
+          program as used in Ubuntu 26.04
+
+        - pkg-generic: Cleanup /usr/share/info/dir in the target
+
+        - generate-cyclonedx / cve-check: Various fixes for better
+          CycloneDX / BSI TR-03183-2 compliance
+
+        - linux: No longer forcibly disable CONFIG_WERROR
+
+        - 'make show-info-all' added, which works like 'make
+          show-info' but for all packages. The package hash files are
+          now also included in the show-info{,-all} output.
+
+        Architectures:
+
+        - Drop support for the (rare) PA-RISC 1.0 variant
+
+	Updated/fixed packages: aardvark-dns, arm-trusted-firmware,
+	asterisk, babeld, bpftrace, busybox, ca-certificates, cairo,
+	capnproto, collectd, cppdb, crucible, cups-filters,
+	docker-cli, docker-engine, drm-info, efl, esp-hosted, exim,
+	faad2, freeipmi, freeswitch, gcc-bare-metal, gdb, gerbera,
+	glibc, graphene, gst1-plugins-bad, gst1-plugins-good,
+	gstreamer1, harfbuzz, heirloom-mailx, hiredis, hplip, icu,
+	jemalloc, jq, kodi, lcms2, libbpf, libdill, libdrm, libenca,
+	libgit2, libheif, libks, libmad, libmicrohttpd,
+	libmodsecurity, libpthsem, libssh2, liburing, llvm-project,
+	lrzip, lrzsz, lua-sdl2, mesa3d, mpd, mrp, ndctl, netatalk,
+	netavark, odhcp6c, openblas, opencv4, opendoas, openscap, php,
+	podman, poppler, powerpc-utils, privoxy, python-ecdsa,
+	python-gymnasium, python3, qt53d, qt5webengine-chromium,
+	qt6base, readline, redis, rpcbind, rtl8188eu,
+	rtl8812au-aircrack-ng, rtl8822cs, runc, rust, rust-bin,
+	samba4, sane-airscan, sane-backends, sdl2_image, sqlite,
+	sshfs, stellarium, suricata, sway, sysrepo, tor, unzip,
+	ustream-ssl, util-linux, vlc, vorbis-tools, weston,
+	wireless-regdb, xdriver_xf86-video-nv, xen, xerces,
+	xserver_xorg-server, xwayland, zsh
+
+        Removed packages: daq, kodi-pvr-hdhomerun, libhdhomerun,
+        libphidget, phidgetwebservice, pigpio, ptpd2, xml-security-c,
+        zeek
+
 2026.05-rc3, released May 29th, 2026
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 14ea241dc4..63356e6901 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.05-rc3
+export BR2_VERSION := 2026.05-rc4
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1780006000
+BR2_VERSION_EPOCH = 1780580000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 0b03034886..c7d15b2570 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -21,25 +21,25 @@
           <th>2026.05.x</th>
           <td>September 2026</td>
           <td>
-            2026.05-rc3<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05-rc3/CHANGES">
+            2026.05-rc4<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05-rc4/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-05-29</td>
+          <td>2026-06-04</td>
           <td>
-            <a href="/downloads/buildroot-2026.05-rc3.tar.gz">
+            <a href="/downloads/buildroot-2026.05-rc4.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2026.05-rc3.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.05-rc4.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2026.05-rc3.tar.xz">
+            <a href="/downloads/buildroot-2026.05-rc4.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2026.05-rc3.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.05-rc4.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
         <tr>
diff --git a/docs/website/news.html b/docs/website/news.html
index b0b32892cd..3c9f914f0e 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2026.05-rc4 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 June 2026</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>The Nice hackathon brought a large amount of (security) bugfixes, so here comes another
+          release candidate. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05-rc4/CHANGES">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2026.05-rc4.tar.xz">2026.05-rc4
+	  release</a>, and report any problems found to the
+         <a href="support.html">mailing list</a> or
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
