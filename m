Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2352BE9D3F8
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7CDE60D98;
	Wed,  4 Feb 2026 15:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gCq_F9tbCUj7; Wed,  4 Feb 2026 15:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E10F660DAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770217271;
	bh=JAYhyZTBV5GB+CJKlSxJ0UdXtcGnZcuHpKOGs/1rMrE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XpIIWgigNGvE1HZs8xVzCDNZXRwsgTCGAezMEtlVsoq8rvY9Tm4NcSHnQRLznnsq4
	 xHXX6FFDlTw0NM8YTeCTaQ3rumdCPOjffSpigPtyp2ZZ3MA2vQRrhtVeCmHXsF/TQH
	 FvKeKaNFe3bc0sUvnHzX5KPGdtdXjqHvVyJVQuUTCN1qsofFzmdVed0+Agl2aUwMNN
	 8FUW61sfjZO3jaaF/EntRND1Cua6+9IsycxDRfdmo3bC6VHTxri3yW91IYihK6+KYP
	 oXpvJj+7UbMLnXSOrpLomGlyFmtFSagJHOIcJbbhIrJiWQRiK1qGWBSVCgy4ia84ny
	 hO5Rjm3JMuODQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E10F660DAA;
	Wed,  4 Feb 2026 15:01:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 348FDF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1465783E3B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jdB-qw0cR6S3 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:01:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AB7583DBB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AB7583DBB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:01:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 254928691D; Wed,  4 Feb 2026 15:01:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 16:00:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e57c73bd5a67fa62fea7d9219a1ba751571f1756
X-Git-Newrev: e4e71c6c83924716b826a4eb1096eefbfcaecd5f
X-Patchwork-Hint: ignore
Message-Id: <20260204150108.254928691D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/asterisk: add workaround to fix
 build issues
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e4e71c6c83924716b826a4eb1096eefbfcaecd5f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Sometimes asterisk buildsystem decides to remove our own
build menuselect stuff for the host. And then fails to
run the cross-compiled binary.

Add a patch to avoid removal of the menuselect stuff.

Fixes:
 - https://autobuild.buildroot.net/results/5f7/5f76f032ee596e928089b064b01f08adacade47a/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0005-Makefile-don-t-clean-menuselect.patch     | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/asterisk/0005-Makefile-don-t-clean-menuselect.patch b/package/asterisk/0005-Makefile-don-t-clean-menuselect.patch
new file mode 100644
index 0000000000..79c3174853
--- /dev/null
+++ b/package/asterisk/0005-Makefile-don-t-clean-menuselect.patch
@@ -0,0 +1,26 @@
+From 844c1cddf38fd91e15a93eef96c67a5834fc9a78 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sat, 10 Jan 2026 12:25:30 +0100
+Subject: [PATCH] Makefile: don't clean menuselect
+
+Upstream: not applicable
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index b57f77477f..80035a09e7 100644
+--- a/Makefile
++++ b/Makefile
+@@ -436,7 +436,6 @@ _clean:
+ 	rm -f doxygen.log
+ 	rm -rf latex
+ 	rm -f rest-api-templates/*.pyc
+-	@$(MAKE) -C menuselect clean
+ 	cp -f .cleancount .lastclean
+ 
+ dist-clean: distclean
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
