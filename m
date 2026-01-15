Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9ACCCF2D4
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 192B2402EE;
	Mon, 19 Jan 2026 10:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8kUr-Ue6WVw7; Mon, 19 Jan 2026 10:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EC5D40467
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816870;
	bh=ZQHE7deaxaXLQw/hni8Xc2BgyWcvKSNaJi5C2bg9CNM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kfwn/mTOmy5cvgbfUHifvXoYsVGxGF06e0CJkBv6L4MRF/g5jJwn80nVy60/vNI61
	 KB0at3N1iR0FnYIuedIPaIIoYLazAdQufdr4bPY5yCzZYGBcT2T6Z7HkY9P7xz3igr
	 oSXVLH3UEneYa+l3XdAVtwPjZaU8K3HxRx2PWN1QUYrw3kRcs4n4MCxu2pywxqkcxt
	 YJYBkoLl5eQDM2nsEGe/R7ulU8VqUuSQqVzyYwrIWnSOt1YoVSt9OPWWt/FxzRV2lK
	 Cga0J1KZYAfJU+B+xV5icD2w/o2dRrEFg3A6p9nil7oxJZPKmA8FH52wB0ILteaqdp
	 U0N/KEBwHDqvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EC5D40467;
	Mon, 19 Jan 2026 10:01:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DA742CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F0E0406DD
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LqfZ-g45fhcG for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:00:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32D4F406DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32D4F406DF
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31F12885E6; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:36:11 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: e850c121ef33b9a49f877d3583ee38c9c7e80bc1
X-Git-Newrev: 24f4c18ccdefdbd14d034342990e72da1b9009f3
X-Patchwork-Hint: ignore
Message-Id: <20260119100041.31F12885E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] docs: use https for
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

commit: https://git.buildroot.net/buildroot/commit/?id=24f4c18ccdefdbd14d034342990e72da1b9009f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
index d1d92c8e6b..b2b4891464 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -98,7 +98,7 @@
       </table>
 
       This and earlier releases (and their PGP signatures) can always be downloaded from
-      <a href="/downloads/">http://buildroot.net/downloads/</a>.
+      <a href="/downloads/">https://buildroot.org/downloads/</a>.
     </div>
   </div>
 
@@ -123,7 +123,7 @@
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
