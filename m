Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFFCCD5BAF
	for <buildroot@archiver.kernel.org>; Thu, 21 May 2026 21:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A291A84D0F;
	Thu, 21 May 2026 21:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rh7wQGK8i6BD; Thu, 21 May 2026 21:22:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19AB484D0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779398547;
	bh=/M4g5hG+UR+Cdd9DDz/s+c72UMDTOr/p5Ojt6KkwPVQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JeEvzwi9mZgWDrSgjiY28sXat+6kOByhgLKQeyMVt5eBQqniEeaEoJAR8RTqDMsqr
	 m+NbbPY4HxJFQDw0lexzg3nzwtVLV5ObSZLaDCfXTSA/vNKAdyfTTvO+0EJlbch8iq
	 tLNP5k9kp5YKR2fYU7kQOK85G7mcbjiPn5p+uuRvx0Zt9OvIvTA+FlmrtfAQdMiycY
	 FmMLtk91/QUgSelj2PJwSRqybF1IhV4bpCQG95x475H530s97tlAqiXsPNgxqKNvQ0
	 7vl7FnzIWZF7KPI+ColDz/atXZFqEUOvIB9I1Caw1QK+GMwFMEba4ttYoSCu4MLJU0
	 p/jk8neVG85AQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19AB484D0A;
	Thu, 21 May 2026 21:22:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11B3E282
 for <buildroot@buildroot.org>; Thu, 21 May 2026 21:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FFF641B32
 for <buildroot@buildroot.org>; Thu, 21 May 2026 21:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MihtG6GZ20aj for <buildroot@buildroot.org>;
 Thu, 21 May 2026 21:22:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA46340093
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA46340093
 for <buildroot@buildroot.org>; Thu, 21 May 2026 21:22:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 137CA86AC5; Thu, 21 May 2026 21:22:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 May 2026 23:20:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e3db9d23349d63177a1f9b70c6fef477e44a29f
X-Git-Newrev: 94b0b0c6c10471443bf75637ccf6d528177babdf
X-Patchwork-Hint: ignore
Message-Id: <20260521212215.137CA86AC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2026.05-rc2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/94b0b0c6c10471443bf75637ccf6d528177babdf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 14 ++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 14 +++++++-------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 954fab64b4..7108e98fcd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,17 @@
+2026.05-rc2, released May 21th, 2026
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: bind, cog, exim, fwts, gnupg2,
+	haveged, htop, imagemagick, intel-microcode, libabseil-cpp,
+	libargon2, libblockdev, libde265, libgphoto2, libheif, libks,
+	libmodsecurity, libnfs, libnss, liburiparser, libvncserver,
+	memcached, mongoose, mpd, openvmtools, postgresql,
+	python-cbor2, python-google-api-core,
+	python-sdbus-modemmanager, rsync, samba4, sed,
+	shadowsocks-libev, supertux, tzdata, weston, wireshark,
+	wpewebkit, zic, zlib-ng
+
 2026.05-rc1, released May 12th, 2026
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 25c93333d3..ffba8ba6a2 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.05-rc1
+export BR2_VERSION := 2026.05-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1778593000
+BR2_VERSION_EPOCH = 1779398000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 4210789507..c1d8a366ce 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -21,25 +21,25 @@
           <th>2026.05.x</th>
           <td>September 2026</td>
           <td>
-            2026.05-rc1<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05-rc1/CHANGES">
+            2026.05-rc2<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05-rc2/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-05-12</td>
+          <td>2026-05-21</td>
           <td>
-            <a href="/downloads/buildroot-2026.05-rc1.tar.gz">
+            <a href="/downloads/buildroot-2026.05-rc2.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2026.05-rc1.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.05-rc2.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2026.05-rc1.tar.xz">
+            <a href="/downloads/buildroot-2026.05-rc2.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2026.05-rc1.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.05-rc2.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
         <tr>
diff --git a/docs/website/news.html b/docs/website/news.html
index 2265943c55..6e48090b1f 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2026.05-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 May 2026</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05-rc2/CHANGES">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2026.05-rc2.tar.xz">2026.05-rc2
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
