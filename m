Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4083FC5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E339381299;
	Wed, 11 Jan 2023 09:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E339381299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Di3HlEIzFJjq; Wed, 11 Jan 2023 09:28:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A5EB81251;
	Wed, 11 Jan 2023 09:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A5EB81251
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30FB61BF2B3
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D628440C81
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D628440C81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gK7pEui2nM_O for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:25:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3A0540C82
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3A0540C82
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C210887817; Wed, 11 Jan 2023 09:25:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 10:15:50 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: d7c15dc4a2a351982e0a7f1cbe30c0240a6cba6c
X-Git-Newrev: aee0b26141f748609ccd140c7ffc23782b27ce1d
X-Patchwork-Hint: ignore
Message-Id: <20230111092533.C210887817@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/sqlite: security
 bump to version 3.40.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=aee0b26141f748609ccd140c7ffc23782b27ce1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fixes the following security issues:

CVE-2022-46908: SQLite through 3.40.0, when relying on --safe for execution
of an untrusted CLI script, does not properly implement the
azProhibitedFunctions protection mechanism, and instead allows UDF functions
such as WRITEFILE.

Release notes: https://sqlite.org/releaselog/3_40_1.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Peter: mark as security bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 99b3ea44295a2ec3aa841f83d81c9231f89cb6e5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index ea4e30a463..36f6907fbc 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0333552076d2700c75352256e91c78bf5cd62491589ba0c69aed0a81868980e7  sqlite-autoconf-3400000.tar.gz
+sha256  2c5dea207fa508d765af1ef620b637dcb06572afa6f01f0815bd5bbf864b33d9  sqlite-autoconf-3400100.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 9d0b60ab59..789eddfa0a 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.40.0
-SQLITE_TAR_VERSION = 3400000
+SQLITE_VERSION = 3.40.1
+SQLITE_TAR_VERSION = 3400100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2022
 SQLITE_LICENSE = Public domain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
