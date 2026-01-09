Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE2BD2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90B90401B4;
	Tue, 13 Jan 2026 19:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vb0d-bmIvMvJ; Tue, 13 Jan 2026 19:41:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D432402B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333266;
	bh=ZbeRnHsIgW+fHVouA5eUa/X+cDdhQ4PiCbcHnF3QTKw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QDT6C6RhKIlWCUcn9xDOaD5KXzR+sQ1xCyYbRZf9vF3JmqPZ9fiYu5RMevpEMUNLw
	 BDlyjRfGg+UFZPxaYjYLLB9hUkF7j4/OrVGGELtOjOW3wGslsXj3tNcMLZgtoPJZIj
	 xWjXKEdRhkgNL3MjcVw4h4zyWdEohaI39uAba7GTpEZn9agiFfbEjj32KrMBaKe0iC
	 7NO76D5zwTpgW2S/jQpH4s7uUFqKUJ2grSAgrN4zYkXJQYRGkvQpgjeR4y1tyEH8Ki
	 FMmRg8ehBD/MM2FVPKRhtDRT5kXRklTXWWu9tZl2LMz6aqkDKKsx8o78Ub0f2qgMTj
	 SAKrGByhZIDZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D432402B8;
	Tue, 13 Jan 2026 19:41:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 641451C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C677406DE
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7YtCDAzTPGT6 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 282C4406DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 282C4406DC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 259098111F; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:03:22 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 6a3f34be1a6785dd3e092fead30c9b83f6968309
X-Git-Newrev: 9e371bf1e007be76c5fc4a516f3cb5bc8165d272
X-Patchwork-Hint: ignore
Message-Id: <20260113194032.259098111F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/rsyslog: remove
 stale IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e371bf1e007be76c5fc4a516f3cb5bc8165d272
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

The CVE-2015-3243 is then no longer matched to the rsyslog package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1e48fde1cbe62cbb486eaa0ea99d85762ebc74f3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
