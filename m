Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F3FCD4F24
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 13:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4254940742;
	Tue, 12 May 2026 13:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKzZM6T2-O4U; Tue, 12 May 2026 13:54:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21082406D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778594047;
	bh=ZD+9VQPscMVElZ2V12frCrd70Vdf2gDui9anfsegIfo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QrGYYD3EjIXhVtTX7GUjZYkGg1DuK5JczIuPYXyEy4/MAHESwSqFXcAy4FhsP4PvL
	 ZjX+ogFDjkT8AWOXm69mIxz7LWhvqCqbKaVmBLSrbyUmIuDxDLX7R82crhXyi9BKS0
	 BIogRiyKNXmTBbKdBzwVlYnXmD5NBL/InQ0w8/6KfZd+cmMn2W7qvCSS15/C84fzw8
	 6dZ53iaoPwnL7Q7ensJ2SqiiMSgMdmPQGRU84Bwap6QcKqQFQJnOD2/0iVklGqSXTg
	 8N+3JYpY+R1h8b3+dfp+HBQHknoSHaf5dTWuTyUXLmLd5CCwIpBlEHlAqNDkBo5wMn
	 +p/Zlb90SXV5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21082406D0;
	Tue, 12 May 2026 13:54:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 132C315F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 13:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED07D81310
 for <buildroot@buildroot.org>; Tue, 12 May 2026 13:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TVVrX7ahLpzm for <buildroot@buildroot.org>;
 Tue, 12 May 2026 13:54:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D54E781302
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D54E781302
 for <buildroot@buildroot.org>; Tue, 12 May 2026 13:54:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A52F385F5A; Tue, 12 May 2026 13:53:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 15:53:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44f60e9f708ff01ee9b4631b252923cab11c79d5
X-Git-Newrev: 9684cb9b4406e01683a9b5136100d81040d56aa0
X-Patchwork-Hint: ignore
Message-Id: <20260512135359.A52F385F5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2026.05-rc1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9684cb9b4406e01683a9b5136100d81040d56aa0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 31 +++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 26 ++++++++++++++++++++++++++
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9a95983d87..611bdd5bff 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,34 @@
+2026.05-rc1, released May 12th, 2026
+
+	Fixes all over the tree and new features.
+
+	Architecture:
+	- ARM Neoverse-V1/V2/V3/V3AE cores added
+	- Default x86 CPU variant is now i686 (from i586)
+
+	Toolchain:
+	- Support for Linux 7.0.x headers
+	- ARM external toolchains bumped to 15.2.rel1
+
+	Filesystem:
+	- Support for XFS rootfs generation.
+
+	Misc:
+	- generate-cyclonedx now adds source attribute to known
+	  CVEs for better compatibility with Dependency-Track.
+
+	New defconfigs: AMD Versal VPK120, TI j721e starter kit (TDA4VM-SK)
+
+	New packages: cxxopts, drm-info, ftxui, go-bootstrap-stage5,
+	iniparser, libnss-ato, libzippp, ndctl, opendoas,
+	python-cloudpickle, python-deprecation,
+	python-farama-notifications, python-gymnasium,
+	python-humanfriendly, python-isodate, python-transitions,
+	sbctl, ugetty, zix
+
+	Removed packages: cegui, openswan, pcre, rubix, snort,
+	spinxbase
+
 2026.02.1, released April 21, 2026
 
 	Changes with potentially large impact:
diff --git a/Makefile b/Makefile
index 092e84b32a..25c93333d3 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.05-git
+export BR2_VERSION := 2026.05-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1772611600
+BR2_VERSION_EPOCH = 1778593000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index c21bd69a35..7e1462bbb3 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -16,6 +16,32 @@
           <th>Latest release date</th>
           <th colspan="2">Downloads</td>
         </tr>
+        <tr>
+          <th>Candidate</th>
+          <th>2026.05.x</th>
+          <td>September 2026</td>
+          <td>
+            2026.05-rc1<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05-rc1/CHANGES">
+              Changelog
+            </a>
+          </td>
+          <td>2026-05-12</td>
+          <td>
+            <a href="/downloads/buildroot-2026.05-rc1.tar.gz">
+              <img src="images/zip.png" width="24" alt="">
+              .tar.gz
+            </a><br/>
+            <a href="/downloads/buildroot-2026.05-rc1.tar.gz.sign">[PGP sig]</a>
+          </td>
+          <td>
+            <a href="/downloads/buildroot-2026.05-rc1.tar.xz">
+              <img src="images/package.png" width="24" alt="">
+              .tar.xz
+            </a><br/>
+            <a href="/downloads/buildroot-2026.05-rc1.tar.xz.sign">[PGP sig]</a>
+          </td>
+        </tr>
         <tr>
           <th>Stable</th>
           <th>2026.02.x</th>
diff --git a/docs/website/news.html b/docs/website/news.html
index 373240c92e..fb2ecd527b 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2026.05-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 May 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the tree, see the
+          <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05-rc1/CHANGES">CHANGES</a>
+          file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+          <a href="/downloads/buildroot-2026.05-rc1.tar.xz">2026.05-rc1
+            release</a>, and report any problems found to the
+          <a href="support.html">mailing list</a> or
+          <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
