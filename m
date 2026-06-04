Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA0ACD6E68
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 08:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B69D642DF9;
	Thu,  4 Jun 2026 08:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQa7QcD4lj0Z; Thu,  4 Jun 2026 08:09:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3A1242DDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780560595;
	bh=iZT87k2+sJlEWPiv0fy6O/JTWk2l7C1wPdjwLPQXwqQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hwVF7HU6NG5byn/BW2jrMN54dCiJVpjpTUMyIdRzdnuuOdNB4jNJ0m7UYB/ZsNtQf
	 KFh5t+RTlys5fwJpQCwFjaYY9aqA89XDp03wvoPmy9fepqdt0gRUnuzpd/V0Q+r+0H
	 55YQ0K3GbYgnkEaNV3Wbj4Acqfg+HkQ9f2SvmBWda+8CxZU2OITyt8rbNjIHu4yXjg
	 /uE+Z//miWwojjjQIhLIzQb8oQ9ZteOAQ9qN6qUCiEN8xtHROGO5Swq/4DYF3Q1HiV
	 EKvVPNbmXZG8BObWE7klfJmLwg3YpGIBoZjGpSZ2ZRsrRVpx2s7ttHH66GGuTmWMlC
	 syMj1u7lqKR7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3A1242DDB;
	Thu,  4 Jun 2026 08:09:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ED16388
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 08:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9043784B4D
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 08:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kg7J0ttzdQPa for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 08:09:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E41BB84B4C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E41BB84B4C
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 08:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A183287A25; Thu,  4 Jun 2026 08:09:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 09:58:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efc8b141fe39b06ba21f3c2fe5ab2fdb2ddd4295
X-Git-Newrev: 0b168816cd85698ffb377bc1e06333d57a2ab4e4
X-Patchwork-Hint: ignore
Message-Id: <20260604080937.A183287A25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3.53.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0b168816cd85698ffb377bc1e06333d57a2ab4e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes of this bugfix release:

https://sqlite.org/releaselog/3_53_2.html
https://sqlite.org/src/timeline?from=version-3.53.1&to=version-3.53.2&to2=branch-3.53&y=ci

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index d520096a3b..948a603d4d 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  83e6b2020a034e9a7ad4a72feea59e1ad52f162e09cbd26735a3ffb98359fc4f  sqlite-autoconf-3530100.tar.gz
+sha256  588ad51949419a56ebe81fe56193d510c559eb94c9a57748387860b5d3069316  sqlite-autoconf-3530200.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index e2f1a426e7..aa2e24e8b5 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.53.1
-SQLITE_TAR_VERSION = 3530100
+SQLITE_VERSION = 3.53.2
+SQLITE_TAR_VERSION = 3530200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
