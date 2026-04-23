Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DC8FDEE48
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 20:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFF5160F7A;
	Thu, 23 Apr 2026 20:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0kkG3C2XnYL; Thu, 23 Apr 2026 20:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0262160F71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776976327;
	bh=5Ed+A3H0UQ0ZIYK3y36p1i3UxE/mjLN5wxf8lIrIOxA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ayk29bwEsjvytVdoSsvazQgVqqv89GeJE91kncubwUZuWdTyqYrIeDbZpmzEzmtQK
	 +ZtiYrO8TWAxO7gbnP4va52sa2ClJLmumZYTx3p9tn+pNnzg4IjiZYsJBa2eITqJ3G
	 gx7e2+qMNvNp6Ztsog0/Pk85Vz+hD40H2nmvwU0Fmw7Ni4xThT3tGzv+BcOSR3caVw
	 qOj7wjvc63uCDKKP8Wxgv6w8U+tZMFRlcDZsoW/eRaAePgV1VFnNLTKCW3EAlvpiEU
	 vcSBLBZ0dWUuvrH/2emJLb5Vlqv6DEwqToqAjguq+r4yqtuI/1M1Q1XVYsNVezTtAd
	 CSxhHknljU8bA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0262160F71;
	Thu, 23 Apr 2026 20:32:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 72C7A206
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64969408F5
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTQEupUXKN3Q for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 20:32:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D72B40108
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D72B40108
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:32:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0308C828C8; Thu, 23 Apr 2026 20:32:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 22:29:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83ea6a9441a80f994201cdd13e356d4c27a79b7b
X-Git-Newrev: 85f1e9cf0b9de205352ab013c4fe303b2f52b828
X-Patchwork-Hint: ignore
Message-Id: <20260423203204.0308C828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/haproxy: bump version to 2.6.25
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/85f1e9cf0b9de205352ab013c4fe303b2f52b828
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

http://www.haproxy.org/download/2.6/src/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index ce5dae17e7..5c644356a6 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.23.tar.gz.sha256
-sha256  1281d57f25e98456a042c81f32801a106a293c1340b0c06debb2a87d6a7b3611  haproxy-2.6.23.tar.gz
+# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.25.tar.gz.sha256
+sha256  d861cacbe2ed51ae8ad5fa9ee5165b4e5e2bccaa5b9e04324711761d7d946be9  haproxy-2.6.25.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 9504ec6b7a..a22c8b38ce 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.6
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).23
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).25
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
