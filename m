Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFE7CCF2D4
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 09:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6A8B81DB2;
	Mon, 19 Jan 2026 09:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GW9atD6Mk_QZ; Mon, 19 Jan 2026 09:59:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11CD581D65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816756;
	bh=RCo3KTArSOIUFEEseyciAgSUpZ09C/DUpyGmbiet5Eg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fwDB2ZdCtu6kM93n52mXnH9vfUSq/ljSQ4STYgdLyEpiMuyI5eKAwJkU0WV9yIjA9
	 AkDIREhqAeO8BWf8dfS65i80Ev0q0H5/BtVIiC+r4YrPGOvrJDa4Cm5GKStyfhmSpI
	 GZ2sJHvKlr/XhJEcAvzy3TfUNgTJQILJ78bUpVwgNJJeXMKknMLMJA702qguXt5nV+
	 01vuFEb8bvH+izyGE8V41Vw3rzmEUgtIf+benDCTzohnmcdP3s9iYynyb+NqPz0kNT
	 76G2/8a3JbDisg82kZq9aENUfD3LNr02h2+v84iog73wqdKKb31tvM1LLrevpPSfsb
	 cymr3ASfoDi3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11CD581D65;
	Mon, 19 Jan 2026 09:59:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 057812CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F65B40CEB
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBGDvn1QlEF8 for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 09:58:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB02F40CE3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB02F40CE3
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C960688673; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:36:08 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a84c83d2962a7e5fd08b408e1248bdf2455163ab
X-Git-Newrev: dd2122c6f095100110d7bf68daf81bf099dc4a60
X-Patchwork-Hint: ignore
Message-Id: <20260119095850.C960688673@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] docs: use https for
 documentation links
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dd2122c6f095100110d7bf68daf81bf099dc4a60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Switch a handful of documentation/website links from http to https.

Signed-off-by: Preyas Sharma <preyas17@zohomail.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 71f2cc70025e30883152ff7b8899fec8dea3d2f6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 README                       |  2 +-
 docs/website/contribute.html | 10 +++++-----
 docs/website/download.html   |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/README b/README
index 008e996f5f..143b476be6 100644
--- a/README
+++ b/README
@@ -3,7 +3,7 @@ Linux systems through cross-compilation.
 
 The documentation can be found in docs/manual. You can generate a text
 document with 'make manual-text' and read output/docs/manual/manual.text.
-Online documentation can be found at http://buildroot.org/docs.html
+Online documentation can be found at https://buildroot.org/docs.html
 
 To build and use the buildroot stuff, do the following:
 
diff --git a/docs/website/contribute.html b/docs/website/contribute.html
index 52c30d60d3..115b1fd8b8 100644
--- a/docs/website/contribute.html
+++ b/docs/website/contribute.html
@@ -14,22 +14,22 @@
       <ul>
 	<li>Reproducing, analyzing and fixing bugs from our
 	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a></li>
-	<li>Analyzing and fixing <a href="http://autobuild.buildroot.org/">
+	<li>Analyzing and fixing <a href="https://autobuild.buildroot.org/">
 	    autobuild failures</a></li>
 	<li>Reviewing and testing patches sent by other developers. See the
-	  <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">mailing list
+	  <a href="https://lists.buildroot.org/mailman/listinfo/buildroot">mailing list
 	  </a> or <a href="https://patchwork.ozlabs.org/project/buildroot/list/">
 	    patchwork</a>.</li>
 	<li>Working on items from the
-	  <a href="http://www.elinux.org/Buildroot#Todo_list">TODO list</a></li>
-	<li><a href="http://buildroot.org/manual.html#submitting-patches">Submitting
+	  <a href="https://www.elinux.org/Buildroot#Todo_list">TODO list</a></li>
+	<li><a href="https://buildroot.org/manual.html#submitting-patches">Submitting
 	  your own patches</a> through the
 	  <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">mailing list
 	</a></li>
       </ul>
 
       <p>For more details on these topics, check out the
-	<a href="http://buildroot.org/manual.html#_contributing_to_buildroot">
+	<a href="https://buildroot.org/manual.html#_contributing_to_buildroot">
 	  Contributing to buildroot</a> chapter in the Buildroot manual. Thanks for your help!</p>
 
       <p>If you need any support yourself, have a look at <a href="./support.html">
diff --git a/docs/website/download.html b/docs/website/download.html
index 501fcc68f8..ba7fc5b686 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -111,7 +111,7 @@
       </div>
 -->
       This and earlier releases (and their PGP signatures) can always be downloaded from
-      <a href="/downloads/">http://buildroot.net/downloads/</a>.
+      <a href="/downloads/">https://buildroot.org/downloads/</a>.
     </div>
   </div>
 
@@ -136,7 +136,7 @@
       </div><br>
 
       <p>If you are not already familiar with using Git, we recommend
-	you visit <a href="http://git-scm.org">the Git
+	you visit <a href="https://git-scm.org">the Git
 	website</a>.</p>
 
       <p>Once you've checked out a copy of the source tree, you can
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
