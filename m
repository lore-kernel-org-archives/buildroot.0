Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF4CC79FA7
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 17:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 154FC8133F;
	Mon,  5 Jan 2026 17:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5dkNo3ErKfP; Mon,  5 Jan 2026 17:37:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 291AA81336
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767634659;
	bh=Ve/f0JDSLSmwiSWtieCSKO/514zq0w5EXAme68s2Pec=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MKXx6Gh56t+QT9lrEnUNXuEQ/pY8keFLTYlPXvD3CDHSneoIQmlm1k4GmOg8y1d/X
	 QWro/qeyHAMB17NcFFD9gcRjyYz+DbvuiwRkVF8DTtyI8atS+ZMXqP5PKCGPTY4bX/
	 z4XngPaguM7AsQGPa7imEvj5zy+2VWGDYIRJVBen1CJ6qMIQ9ZLp6sRZCndPzLwhuK
	 xaWQq4P/9tBNqqozx5SEy1rNzeKKW81o6ufpl9h0wlpo3IhFOn/SeKbyl8UOuE2Ses
	 uUGiKEExIYC+sLvDMY8g9lf6K5snx/jqeLPnIfAzDqNWFBzC9hPEV9LTiMgTaiJLNo
	 U1rG31SDFF3Kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 291AA81336;
	Mon,  5 Jan 2026 17:37:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA8C82DF
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 17:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC3B960AD5
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 17:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2LOrL8yGUfQW for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 17:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AF7560AB0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AF7560AB0
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 17:37:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED2A888246; Mon,  5 Jan 2026 17:37:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Jan 2026 18:20:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 18655efbd5eab0fe8e9f5fd208647de04715cd9b
X-Git-Newrev: bceb64326724bd1d12429374636f46f8bd12287d
X-Patchwork-Hint: ignore
Message-Id: <20260105173731.ED2A888246@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc: bump version to 15.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=bceb64326724bd1d12429374636f46f8bd12287d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release fixing compatibility with Linux 6.19-rc1+.

https://github.com/rauc/rauc/releases/tag/v1.15.1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rauc/rauc.hash | 2 +-
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index c0eee0d8d8..ea537c63b6 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  4ae0b5246c668acb544ce0230a3bada81c78e8afd4755e5afa2218cbd686fd70  rauc-1.15.tar.xz
+sha256  603dafa5085b6b964c74d5f57a154a1489af2b415dd20c6ff1447815d02c094f  rauc-1.15.1.tar.xz
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 10d4a2db95..ba30c70dad 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.15
+RAUC_VERSION = 1.15.1
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
