Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BF6FCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A38D61453;
	Fri,  6 Mar 2026 19:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XpxvZEcJ0HYe; Fri,  6 Mar 2026 19:52:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37FEE6144D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826761;
	bh=Y0lExiu7fkCOfxdJYdgDTDkLaccj7LzHFK9w2u+gBpY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=csP1zagXHn9AlhicWqvYNRwkDppWGM74b5Wu+j/X/+lWOK49xSABLyMJDxUadZJJF
	 Xmb3k+YT0gecS7Av7b1YPzmp6RbUaYq3KWSiRnMY3lOaqWEV+AyVRsTBR+UmcAX/oN
	 7avGRF/VZ+AKommeEItKiZzDxRkyP9BBFw3XDamRDd4NJDYWZXlIXuN/uVqleVdDSS
	 Behq9WSoq+SGlcJretDas1jSMl1PiLK8pvJf5hv9QsjAslteD5c1Zx8rULgJ/O95QT
	 XZkO+q9m5WbvDms+OeEMYGnY8Vefs4A++Pr1tKI3P/dzG4xWUCQ7Kt96YdFjJJW16Y
	 TS4XSCGtI7sGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37FEE6144D;
	Fri,  6 Mar 2026 19:52:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EF8D25B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2230A41E47
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jp2Sj713yLeH for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 669A641E48
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 669A641E48
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BC7D83582; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:15:01 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4859a7b0f9d12c689a73e7e1f8c26f0f19234116
X-Git-Newrev: c68c55964c688ee0d4eff4dd48569059d373262e
X-Patchwork-Hint: ignore
Message-Id: <20260306195223.7BC7D83582@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/freerdp: bump to
 v2.11.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c68c55964c688ee0d4eff4dd48569059d373262e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For more information on the release, see:

- https://github.com/FreeRDP/FreeRDP/commit/9b678b6d5a40ce01607d8c3b1b1416437c8416c4
- https://github.com/FreeRDP/FreeRDP/releases/tag/2.11.8
- https://github.com/FreeRDP/FreeRDP/compare/2.11.7...2.11.8

Note: the previous freerdp version 2.11.7-18-g0ee17e2f in Buildroot
is only 5 commits prior the 2.11.8 tag. This is a very minimal bump.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien: add note in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 73861bb720a82316cb56e644fc75d3a7ce95980e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/freerdp/freerdp.hash | 2 +-
 package/freerdp/freerdp.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 83b83db121..5ae222e2ec 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f7cc2bf43b9778e9079cd229ea8e37fc1843eb1c11a8e4e003034af71858ce6a  freerdp-2.11.7-18-g0ee17e2f8e49d56ab5b90d5160fa8f87ffc445e0-git4.tar.gz
+sha256  8a7c953ece217aa4fa22c4a21ab2bc4c9093fc79aa67d3e1273c140d140203f7  freerdp-2.11.8-git4.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 3a1ba61621..07b9d36339 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-# Latest, and probably last, commit on the stable-2.0 branch
-FREERDP_VERSION = 2.11.7-18-g0ee17e2f8e49d56ab5b90d5160fa8f87ffc445e0
+# Latest, and probably last, release on the stable-2.0 branch
+FREERDP_VERSION = 2.11.8
 FREERDP_SITE = https://github.com/FreeRDP/FreeRDP
 FREERDP_SITE_METHOD = git
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
