Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249F9C79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 15:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B8DF40BEA;
	Fri,  4 Sep 2026 15:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZv_N23uCgv4; Fri,  4 Sep 2026 15:33:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1FA2A40BF6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788536031;
	b=KXNfi8taul2CG2UW3uiUNkIiVCEIoTD+QyME+SPwXF+MU4LHJmnx919AZ4nWmswtFisd
	 6LadIeTG/n15hQEXp0/id2eq0LQ7Lh/CRNO1S1BJdzk3WCquEi+HkJfubbJY/b181Jx99
	 aKfPYsFL/qy/oeWKcfM94DRz6aSlz/5lrT8WMGXsyV8NOKu/kyeW/Fq+VskSzv5jGHkDV
	 CV0I3AbO7ZoggWXDQjpqLW+cUS02HVWMWh+mUYOXaGqGM6B4a9sTPBwsSGNrbxWqOO3dg
	 G7kKkhrem4evHjjoDhFaiGiZrXjTIXQ7EcteNP4Yled3DWTeV8tSplCiUBI/ujaiZiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788536031;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=t3GAAZ/QUjJYTh+Ps8rP7i9Hu4MDZH+ack5db4F3ckw=;
	b=m1O2Bw8mSbBAgynXTB3JJUUBMdtBq1GG2NnIwDcwKI2wCt+ujxBo8JMxXXYNNSfZu4VC
	 I2JLKArh4eIYVuFKROLzewpN2zeM9aoPC5a9Q9i/6zZPqdfGWibtZpxsQ3XhFn0inMIVD
	 EMPiWRTibFbkyK5M2CeRQBs5vi2vGxeipOZFP6kUdUwgpa4LG35Wp55LiQAI7ILgLio1M
	 lF0mG4FrCGXUhb+TPkH7mXxIy4lG5aVTYoR7w/RDcq382L7p/8WZjlSDOHO9Yp3WFQeW+
	 k28PrS1n2MZGjCoUjp+06lH+1Ghui9yYy1q4e2BvKggU+KmFke7FyV+lLn++xAqiVtA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788536031;
	bh=t3GAAZ/QUjJYTh+Ps8rP7i9Hu4MDZH+ack5db4F3ckw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eoDCfbe6Z4IaEdvajJr4LtWbYb7iID4vP0qOaRB8VRiVvlN+s38QxBD9T4aHXBUcp
	 +yGtP3eXu979SilBCbJgCe1Z3gsofg4iJmjGf9vFoerYP68fDNzwLcasVHLgLdF3dg
	 9RptpZYPNqj1/fVvijrOhdDKIJB9U7pATDhiHMqIN0SMh4P5SfjrpQkvY2fZ4bNj3V
	 J35rIKlRO+6pklrCuIeitGK7xkdyhnGF6dOrMOmBo9VbxZRaQhElXdIqswwmG/z3HU
	 yRrgqQrX9q5skz8ngC9AUbcHyp+TTeyQuv0f3RU2SujGfSk81VofXmfYPdJhmGD02u
	 U2Wcqg6GubJ7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FA2A40BF6;
	Fri,  4 Sep 2026 15:33:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 162CA3DA
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 15:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0E5140BEA
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 15:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXNZzKi9dMnr for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 15:33:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 43ED440BCD
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788536028;
 b=iFeJEB8rZWHhBcbgoSnyY38z/BR4Bu5Hv8D2hVyMJgC8gw8S9pW1DXA30hS2sDaphX8e
 YyfaHua7cj/UdiEf/76SgbFG3vc1STwIn9su+pNM+eO9IGvnLJz8koM2kctk8TG1TMPSx
 sXAlx2T40F4Hkrb0hr0SxBSvbylX16A9LbojLdmBe/kaurOFFvJ2hydQnEDsLK4vzVNJY
 nbtWZ0gku+SqNkIUae5d+NfA1862Sr3RfhvD+6qk/rzpSMYk+gOlrqop5S4NYQdwXjFH0
 +B7DF2yft4YgWsLGWEM9s2aPgJd1aAkWqo26mqDDmItrgphqCi5Qw5Cty1C8QNrWjzg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788536028;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nylWGooJSFT2v0LZJ06XZKAxW7PgJTw6pU5rgX5zTd4=;
 b=lEOCJJkDI0Iy+BcOypqblUQvXzvzFg8G2hg2q2kJaZhETM0cAlKdYTCoyl0CpzJMAryy
 9GZmHefnv7mLzI6oKfhzCEtciIzJqvgg3zXHpnj8HGmqVYWPD6cQimlufkpjJKCUedoyP
 8tY4jNnu64fZA7dY+joAvLgPEzMSzNLdFsPsfCgXBc7ZOR7UTbSIyXHwnf/1EQ4MJfeoH
 H4eUjYZKXDmRmdanicr7AExW9vQdSlY8kshjMa/srGqnjiVyVqw40iKAwxI3rgoMhhkIu
 N3NDOoZ+aMIrLau/9T2QP49zS8nxjqHMaBpj5jmL3OnERtfVl0hLZx8XzfRkbmOG8NA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43ED440BCD
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 15:33:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACD0F94AD5; Fri,  4 Sep 2026 15:32:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 4 Sep 2026 17:31:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3a1c36e84d1564805dfc02f85d6ba03a962f2dc
X-Git-Newrev: d5180309b1b66ef3b8eaccca70ad69be8e0729a1
X-Patchwork-Hint: ignore
Message-Id: <20260904153247.ACD0F94AD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2026.08
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d5180309b1b66ef3b8eaccca70ad69be8e0729a1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |  9 +++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 20 +++++++++++---------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4c60984b14..4cb4c095ef 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,12 @@
+2026.08, released September 4th, 2026
+
+	Various fixes.
+
+	Updated/fixed packages: dpdk, dracut, drogon, erlang, exiv2,
+	expat, freeswitch, gcc, glibc, libcurl, libldns, libnfs,
+	libopenssl, mpd, ncmpc, newt, opencv, openscap, openssh, perl,
+	proftpd, qemu, vim
+
 2026.08-rc3, released August 29th, 2026
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 71f6acac41..36fbd7b3e7 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.08-rc3
+export BR2_VERSION := 2026.08
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1788030000
+BR2_VERSION_EPOCH = 1788535000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index dade5d2441..8fb2277bfb 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -16,6 +16,7 @@
           <th>Latest release date</th>
           <th colspan="2">Downloads</td>
         </tr>
+<!--
         <tr>
           <th>Candidate</th>
           <th>2026.08.x</th>
@@ -42,30 +43,31 @@
             <a href="/downloads/buildroot-2026.08-rc3.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
+-->
         <tr>
           <th>Stable</th>
-          <th>2026.05.x</th>
-          <td>September 2026</td>
+          <th>2026.08.x</th>
+          <td>December 2026</td>
           <td>
-            2026.05.2<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05.2/CHANGES">
+            2026.08<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-08-29</td>
+          <td>2026-09-04</td>
           <td>
-            <a href="/downloads/buildroot-2026.05.2.tar.gz">
+            <a href="/downloads/buildroot-2026.08.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2026.05.2.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.08.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2026.05.2.tar.xz">
+            <a href="/downloads/buildroot-2026.08.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2026.05.2.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.08.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
         <tr>
diff --git a/docs/website/news.html b/docs/website/news.html
index 340e302c79..acce4c59d1 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2026.08 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 September 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2026.08 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08/CHANGES">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2026.08.tar.xz">2026.08 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 6e5fad3202..4fb2c9728a 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2026.05'
+RELEASE='2026.08'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
