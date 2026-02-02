Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DEBE73159
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C816180E12;
	Mon,  2 Feb 2026 10:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Rf5fWJ1sDrA; Mon,  2 Feb 2026 10:27:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC25880E25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770028072;
	bh=D6gp1UG2Ceq07UHodIGjod1TZnUn5yILU2fkCAXVXQI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LxM13EOmAPuxeSfRySpKHb9ozQmhpunNXDUY/FoGwDcaAnoNmVzxTkaR3KnD95i0J
	 TaSwkqbZEUAw7NTx35zGBNBO+7YDCYpwXGQ6Dk1js9Lm7EEdlO/d76Qf3a9w0jyHM7
	 dfzCalv4SwDd+2fSdYXNXAjIgXT1eLOiaNN0wzsZ84iqrHQR/ip+f09sK+STMmJnTb
	 HLN8d+nXOa0uACo3cqSdLM7ra0G16/05CI/cbjQoxcbnXkAjnqmDQ4pIMXsA2SNGyv
	 RzIaSSa5TwV3p7uTq6b1600QURP/8ia45m1YA9aPGH3RAQDctOIAg2YLWXYBK6+zJg
	 NO/B5sE/TKptA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC25880E25;
	Mon,  2 Feb 2026 10:27:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BAD7634E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B521C80E25
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8VDiwfBQdoKa for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:27:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99B6D80E12
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99B6D80E12
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:27:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AF17862CB; Mon,  2 Feb 2026 10:27:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 11:26:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0403637c2ea98d661188aadc6d572c183b70841c
X-Git-Newrev: ab9bb65a98de7da2a6daf79545daeac38f14a5bd
X-Patchwork-Hint: ignore
Message-Id: <20260202102747.8AF17862CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pv: bump to version 1.10.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab9bb65a98de7da2a6daf79545daeac38f14a5bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 1.9.0, see:
https://codeberg.org/ivarch/pv/src/tag/v1.10.3/docs/NEWS.md

Upstream commit [1], included in version 1.9.42, introduced a use
of fork(). This commit adds this new dependency.

The pgp key ID used to sign the source archive changed. This commit
updates the comment in the hash file.

[1] https://codeberg.org/ivarch/pv/commit/fb7c05c2629cfa9770b44b7bf71e0faced60b55d

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pv/Config.in | 1 +
 package/pv/pv.hash   | 4 ++--
 package/pv/pv.mk     | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pv/Config.in b/package/pv/Config.in
index 671f78e8c9..b9a98df958 100644
--- a/package/pv/Config.in
+++ b/package/pv/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PV
 	bool "pv"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Pipe Viewer - is a terminal-based tool for
 	  monitoring the progress of data through a
diff --git a/package/pv/pv.hash b/package/pv/pv.hash
index 6b0ffbc02e..76595904d4 100644
--- a/package/pv/pv.hash
+++ b/package/pv/pv.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# using key: 4267B4F90F2678A112169BD61D1EF7581B45E9A0
+# using key: D8FF44A79CC8A61EF694FA7EB883E01314DA8E84
 # from: https://codeberg.org/a-j-wood.gpg
-sha256  b38d69d7fc0785eb5eb3c57e8b12a7334f862047bf84b18f414365335399469a  pv-1.9.0.tar.gz
+sha256  aa1630c79af6960a8922ffa64d2c3e7f87486da21fcb57e277824294fd266742  pv-1.10.3.tar.gz
 
 # Hash for license file
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  docs/COPYING
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 1266d83a07..41a7280f6f 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PV_VERSION = 1.9.0
+PV_VERSION = 1.10.3
 PV_SITE = https://www.ivarch.com/programs/sources
 PV_LICENSE = GPL-3.0+
 PV_LICENSE_FILES = docs/COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
