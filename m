Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C2BFF885D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 08:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC73380EA2;
	Tue, 28 Apr 2026 08:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ietFZzZHxymp; Tue, 28 Apr 2026 08:35:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECFD880DB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777365304;
	bh=Z97BRULt8uGt83Zn45YAFGUuItEWAR6bNqgwoAGsvnU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MZEIqbMYkINZt0FF8fTMuDiuzCIf3bH3tTyEU+pelmvwCyZUrxbI5+jjXqAD94pu2
	 7R/HhAyiOhY5d7FymHqp/byBVjS5odQjJyM9Dd2zhqDW/wqV+ekX8gLX6QJ/L2Ufd8
	 +ryhcJQiVvTAVO7IqYw7XR+XNQc0Gc5/rfeL5fZFK9iiQQsC0+8xHS92VzrfB6ujuG
	 dP1i4erbTGU2glOw6BurZjbrBG4DBtR/qogMGredCB7l7v0bFKzTXI3trMQ7uS48ww
	 URtjEDBcgY/pobk/+P7rAZTOYvctawyGzdFUF3uqhL3lAvniFB81I0+4cM9A/xC8nJ
	 1jp9ym0T/oBpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECFD880DB2;
	Tue, 28 Apr 2026 08:35:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CFD1B23D
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 08:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1925608C3
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 08:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id REqk5o9Tn7uy for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 08:35:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C73DD605D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C73DD605D1
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 08:35:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CDD68384B; Tue, 28 Apr 2026 08:35:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 10:31:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37d84032bef02a913c825dc67ab7ecff39b0e9d3
X-Git-Newrev: a48ede9c2f7378b1e091057ed5bf025965a4cb76
X-Patchwork-Hint: ignore
Message-Id: <20260428083501.7CDD68384B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/htop: bump to version 3.5.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a48ede9c2f7378b1e091057ed5bf025965a4cb76
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/htop-dev/htop/blob/3.5.0/ChangeLog

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Marcus: add link to changelog]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/htop/htop.hash | 4 ++--
 package/htop/htop.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index 0750ab0098..f452d57a88 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,5 +1,5 @@
-# From https://github.com/htop-dev/htop/releases/download/3.4.1/htop-3.4.1.tar.xz.sha256
-sha256  904f7d4580fc11cffc7e0f06895a4789e0c1c054435752c151e812fead9f6220  htop-3.4.1.tar.xz
+# From https://github.com/htop-dev/htop/releases/download/3.5.0/htop-3.5.0.tar.xz.sha256
+sha256  b6586e405c5223ebe5ac7828df21edad45cbf90288088bd1b18ad8fa700ffa05  htop-3.5.0.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 55e3b9d57c..2b99637366 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.4.1
+HTOP_VERSION = 3.5.0
 HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
 HTOP_SITE = https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
