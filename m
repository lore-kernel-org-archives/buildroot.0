Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEBEC43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BAAD40F36;
	Fri, 26 Jun 2026 14:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_CjmBjCT2kp; Fri, 26 Jun 2026 14:51:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A44D40F6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485500;
	bh=mQaaXnT57e6OioeVgI3NT1gN90zDqiRMsJs6AK9Pl4c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=srfmuK8yl/HZ6PGB1cgxDW2eK2Rn/OmNHGXEbXaJGt+8guxlmgOKQdA9QUxay3bAo
	 Ix8ZQhmhIXYm2PwkHHQyv9mvLF+Flxa1clLsGkaEhKaWifS3GhLkHfXRRDwVi0ueGp
	 iRMw1WND01nXNhwjbAxqXvRmZP+1NaVwMiSB4SeXOrXDTTNStmcAzte2fudsEVNj4Q
	 AYF/2CaqeVRflHtyZIFeqLVWXJzOqrGwufIHXHNApeh8O3SEC75DnUmQslMQQnGICH
	 5L6W7Anh3gDU3yT1B+Vxqp6gLHmRwNTI0q26MeH6wU/BJ60ZiBnR7AlO7MQU6Tgaeq
	 /ltMbA6hM3ETA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A44D40F6A;
	Fri, 26 Jun 2026 14:51:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C273B231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4462809A7
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rsAQC_z1TiM8 for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E01F180966
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E01F180966
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0EF2864B9; Fri, 26 Jun 2026 14:51:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:33:15 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: b60dc41c1285abacf06ff6c9471af12e05feeaa7
X-Git-Newrev: b3289aa1b6b96167289ea827a1998861af34519a
X-Patchwork-Hint: ignore
Message-Id: <20260626145107.E0EF2864B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/bind: security
 bump to version 9.18.50
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b3289aa1b6b96167289ea827a1998861af34519a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Release notes:
https://ftp.isc.org/isc/bind9/9.18.50/doc/arm/html/notes.html

Changelog:
https://ftp.isc.org/isc/bind9/9.18.50/doc/arm/html/changelog.html

Security fix:
GL #5934
https://gitlab.isc.org/isc-projects/bind9/-/issues/5934

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 09a13526b8197767a08d56d8517aae1cd783177e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index b719012de7..766540ee22 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.49/bind-9.18.49.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.50/bind-9.18.50.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  c43ce4548ebed788cd9df63658a7de105ceafba43fcd63fa352b1093e525cd24  bind-9.18.49.tar.xz
+sha256  a24f93be94712a8c11752294410f2f8a2510ec7fdc931d207fc61cdf30e54f4d  bind-9.18.50.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 6c0d2f8a03..54870bfa4e 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.49
+BIND_VERSION = 9.18.50
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
