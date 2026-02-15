Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7691E63F08
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 18:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3888E406C1;
	Sun, 15 Feb 2026 18:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-eiOFNMEc_7; Sun, 15 Feb 2026 18:46:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5230940561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771181181;
	bh=wd/Sa8yvjtk2IDiux1sI2Nv5pqp7WIqUXR16E8e1j0k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E6QQQYsJ914l2cAryfpusiUXJID9bsMdoj7H7ahPvgUYrtL4rxaUtgF7WZYKE3Kp8
	 7UznbNAiEup1lMWmj4jrgrTnKCIpCEh9rOO638Xfid2U7klX+Eo5J2HIN2jIyNxfpi
	 a0FOZmry8tfkpM/jIVsKKUGZ2f7OJWKPncrG9YvUoMW9rT/QGVUEGkBvzCnPs0UMfs
	 84ZPkF9tQC0+bzV5T3PfBILV/oT+OIEkMsZnLWC9PVhWMEOgvL0X/Z4/ZdgcpJOEJF
	 fw5hkS9MJh4FYFCIk4N1WjgkNJM6uNNmqYoC/l88X1jpbIAz5kYwaK8GC9EAxW1W0N
	 dcWRd32M2207w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5230940561;
	Sun, 15 Feb 2026 18:46:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE8DC270
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 18:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0C5960A3C
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 18:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7jqYdHOJMHF for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 18:46:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E47AE606EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E47AE606EF
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 18:46:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0BEB86E7E; Sun, 15 Feb 2026 18:46:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Feb 2026 19:41:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6dcf28eaa89c4dc5514e2c5cd303dffcd56214cf
X-Git-Newrev: 429bcb111baada7445ac69b31e83e858559d7f9b
X-Patchwork-Hint: ignore
Message-Id: <20260215184618.D0BEB86E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/less: bump to version 692
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/429bcb111baada7445ac69b31e83e858559d7f9b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://www.greenwoodsoftware.com/less/news.692.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/less/less.hash | 4 ++--
 package/less/less.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index 49dcaf28ef..5f0b0f3846 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # using DSA key F153A7C833235259
-# https://www.greenwoodsoftware.com/less/less-691.sig
-sha256  88b480eda1bb4f92009f7968b23189eaf1329211f5a3515869e133d286154d25  less-691.tar.gz
+# https://www.greenwoodsoftware.com/less/less-692.sig
+sha256  61300f603798ecf1d7786570789f0ff3f5a1acf075a6fb9f756837d166e37d14  less-692.tar.gz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/less/less.mk b/package/less/less.mk
index 6f78fb67c7..49156a805b 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LESS_VERSION = 691
+LESS_VERSION = 692
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
