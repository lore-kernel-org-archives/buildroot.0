Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99B7E95A79
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 10:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEED760B98;
	Tue, 30 Dec 2025 10:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YDi-cS2F_GxE; Tue, 30 Dec 2025 10:57:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD1E360B73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767092271;
	bh=3OuS3QNytOwFB3yNRTlDAolJ2NzxzXQ+Uq7tvoHEnKw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VnH37XbRkcWbhd4+zp0c+GSniZl9uDUMS+CNA+2jAujnXBkrtuDP0fp4LFyrZTer+
	 HnA9pOxOQ/QiI2JJWzY8WBo/RIpxsAGyKpaZG4pEXY0fkGnZWLTsI+MOvDLyDk20Zs
	 3hi+FSYHncAEwMzcIKzfY+JOBuyk4PoC6DXkjrHbzC4RxX9A9xCLWMXPCS2ypk5/Dn
	 tT37hY267p+LfFgehQhM9p8QdMwL2TWn2zc1cBF5cGrRvm5DZ0TtUgl14z3wn8QW9+
	 l17u1jEZ5LGORWTyAtE2t7GhbzbSKUzPrnkEe+ExVH3N4ZDLBaBK4H5lKaxsVYR121
	 mFPqj0WGnszjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD1E360B73;
	Tue, 30 Dec 2025 10:57:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02019177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCAC060AC6
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VlqBkPwfiYQs for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 10:57:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92E07607E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92E07607E6
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83C3B87BD2; Tue, 30 Dec 2025 10:57:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 11:54:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 237cd294b7bbe7c42e621042bef4756724d2c233
X-Git-Newrev: 1e48fde1cbe62cbb486eaa0ea99d85762ebc74f3
X-Patchwork-Hint: ignore
Message-Id: <20251230105734.83C3B87BD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsyslog: remove stale IGNORE_CVES
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1e48fde1cbe62cbb486eaa0ea99d85762ebc74f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

The CVE-2015-3243 is then no longer matched to the rsyslog package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rsyslog/rsyslog.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 69128afbac..dedecdc572 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -9,10 +9,6 @@ RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPL-3.0, LGPL-3.0, Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
 RSYSLOG_CPE_ID_VENDOR = rsyslog
-# rsyslog uses weak permissions for generating log files.
-# Ignoring this CVE as Buildroot normally doesn't have local users and a build
-# could customize the rsyslog.conf to be more restrictive ($FileCreateMode 0640)
-RSYSLOG_IGNORE_CVES += CVE-2015-3243
 RSYSLOG_DEPENDENCIES = zlib libestr liblogging libfastjson host-pkgconf
 RSYSLOG_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
