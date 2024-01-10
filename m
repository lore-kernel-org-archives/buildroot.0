Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773EBC47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2508E43748;
	Wed, 10 Jan 2024 20:19:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2508E43748
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TjvTsUN9JZmA; Wed, 10 Jan 2024 20:19:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E42C0437E7;
	Wed, 10 Jan 2024 20:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E42C0437E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 473871BF95D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B78783A77
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B78783A77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tocskKKajOOr for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:16:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E09283B40
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E09283B40
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D29A85CC6; Wed, 10 Jan 2024 20:16:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:10:24 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: b2a8693a8dc8821a094615a290d141a605f9384a
X-Git-Newrev: 8bcd8a64808020e5ab689fe21d9ac7ee8d10d4e8
X-Patchwork-Hint: ignore
Message-Id: <20240110201652.2D29A85CC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/proftpd: security
 bump to version 1.3.8b
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

commit: https://git.buildroot.net/buildroot/commit/?id=8bcd8a64808020e5ab689fe21d9ac7ee8d10d4e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

1.3.8b - Released 19-Dec-2023
--------------------------------
- Issue 1735 - Compiling ProFTPD 1.3.8a mod_sftp, mod_tls using libressl 3.7.3
  fails.
- Issue 1756 - Build system fails for specific module names.
- Issue 1760 - mod_sftp is affected by "Terrapin" Prefix Truncation Attacks in
  SSH Specification (CVE-2023-48795).

https://github.com/proftpd/proftpd/blob/1.3.8/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e83793705b5436feffc087c7f33e3f455439ede7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proftpd/proftpd.hash | 2 +-
 package/proftpd/proftpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
index f950f26b86..5a7d153a31 100644
--- a/package/proftpd/proftpd.hash
+++ b/package/proftpd/proftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f7139e7377a2cb059b8b9b14d76a6df5f440e3181cb15ae890d43bbcae574748  proftpd-1.3.8.tar.gz
+sha256  183ab7c6107de271a2959ff268f55c9b6c76b2cf0029e6584fccc019686601e0  proftpd-1.3.8b.tar.gz
 sha256  391a473d755c29b5326fb726326ff3c37e42512f53a8f5789fc310232150bf80  COPYING
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 398155222d..0820822e17 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROFTPD_VERSION = 1.3.8
+PROFTPD_VERSION = 1.3.8b
 PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source
 PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
