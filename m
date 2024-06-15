Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB30C27C53
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 14:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD2CA821F0;
	Sat, 15 Jun 2024 14:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HxbIC0bN1pou; Sat, 15 Jun 2024 14:35:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A10DB821A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A10DB821A1;
	Sat, 15 Jun 2024 14:35:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93FA51BF302
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 14:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D22F821A1
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 14:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0UatblKyXKLO for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 14:35:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CE328218F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CE328218F
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 14:35:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82EF187CEC; Sat, 15 Jun 2024 14:35:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 16:35:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4d38ef61cb1846871d15f49bdffd70a5ca05a2c
X-Git-Newrev: 1c1edaefb819b85d13db8b618df9dbd208a98e69
X-Patchwork-Hint: ignore
Message-Id: <20240615143541.82EF187CEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs,
 package/gcc: switch to Gitlab issue tracker
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c1edaefb819b85d13db8b618df9dbd208a98e69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our Bugzilla is so slow and unstable that it has become
unusable. Let's switch to using the Gitlab issue tracker instead.

There are still lots of references to the Bugzilla bug tracker in our
News page at https://buildroot.org/news.html, but these are for older
news.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: don't needlessly re-flow]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/contribute.adoc  | 2 +-
 docs/manual/resources.adoc   | 2 +-
 docs/website/contribute.html | 2 +-
 docs/website/support.html    | 2 +-
 package/gcc/gcc.mk           | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index 6ff6c15314..c88035597e 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -25,7 +25,7 @@ for more information on obtaining a Buildroot git tree.
 === Reproducing, analyzing and fixing bugs
 
 A first way of contributing is to have a look at the open bug reports in
-the https://bugs.buildroot.org/buglist.cgi?product=buildroot[Buildroot bug
+the https://gitlab.com/buildroot.org/buildroot/-/issues[Buildroot bug
 tracker]. As we strive to keep the bug count as small as possible, all
 help in reproducing, analyzing and fixing reported bugs is more than
 welcome. Don't hesitate to add a comment to bug reports reporting your
diff --git a/docs/manual/resources.adoc b/docs/manual/resources.adoc
index 68b7eb9062..4ef709c317 100644
--- a/docs/manual/resources.adoc
+++ b/docs/manual/resources.adoc
@@ -40,7 +40,7 @@ better as it will reach more people, both developers and users.
 Bug tracker::
 +
 Bugs in Buildroot can be reported via the mailing list or alternatively
-via the https://bugs.buildroot.org/buglist.cgi?product=buildroot[Buildroot
+via the https://gitlab.com/buildroot.org/buildroot/-/issues[Buildroot
 bugtracker]. Please refer to xref:reporting-bugs[] before creating a bug
 report.
 
diff --git a/docs/website/contribute.html b/docs/website/contribute.html
index aa1cf93f1b..95028ee788 100644
--- a/docs/website/contribute.html
+++ b/docs/website/contribute.html
@@ -13,7 +13,7 @@
 
       <ul>
 	<li>Reproducing, analyzing and fixing bugs from our
-	  <a href="https://bugs.buildroot.org/">bug tracker</a></li>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a></li>
 	<li>Analyzing and fixing <a href="http://autobuild.buildroot.org/">
 	    autobuild failures</a></li>
 	<li>Reviewing and testing patches sent by other developers. See the
diff --git a/docs/website/support.html b/docs/website/support.html
index 28873c6d76..0bcf365332 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -81,7 +81,7 @@
 		</div>
 		<div class="col-sm-11">
 		  <p>If you think you found a bug in Buildroot, you can use the
-		    <a href="https://bugs.buildroot.org/">Bug Tracker</a> to post your bugs and/or
+		    <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">Bug Tracker</a> to post your bugs and/or
 		    participate to find solutions to existing problems.</p>
 
 		  <p>Note: patches are only accepted through the mailing list.</p>
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 672f9472a9..e4780353cb 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -83,7 +83,7 @@ HOST_GCC_COMMON_CONF_OPTS = \
 	--with-mpc=$(HOST_DIR) \
 	--with-mpfr=$(HOST_DIR) \
 	--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
-	--with-bugurl="http://bugs.buildroot.net/" \
+	--with-bugurl="https://gitlab.com/buildroot.org/buildroot/-/issues" \
 	--without-zstd
 
 ifeq ($(BR2_REPRODUCIBLE),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
