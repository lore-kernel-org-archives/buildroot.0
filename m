Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E71FD9E11
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6873407AD;
	Thu, 26 Feb 2026 20:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0pTH_RL-bE3X; Thu, 26 Feb 2026 20:45:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6993407B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138743;
	bh=eKIepfXqBg884UaZIhAEYZ5Kgn/5ZZU8ehhjFEmyLV8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jIfrJqUr9P+IghQK8xwbD3MRpUgv+aQnqE+w0xnvZ3gqa7cCK0VjPbWW0nhlFW7MU
	 kY/a24i+BHpN2Zuuo1k5q/2VV8Ish6mFYvHrNE+bfW/BJo+jMESu0JqCz3up/bQ1k/
	 wfYr9lrwdXPHinGzSoj0IBbUaZY+AjrHDG863Ti6TU02exQlzr2IZfcT9ZzDD+NX//
	 LSVccy8TVYQzNsEXYcqae8AsHEAnyshoLzO5gE0tSI2c+LkmLXXzJD4kCp4r/oJkdj
	 okhiKgkyy2W44iZJ2MbHZEq4fCT5Rai5lZx+Tju4wFzYbVj2VXfxVyiYaOtVEF1HAV
	 o+6OZ37REi3DA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6993407B5;
	Thu, 26 Feb 2026 20:45:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31A9123D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD1A740261
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXPFXW_QaY72 for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:45:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E96594026A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E96594026A
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:45:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D13758705B; Thu, 26 Feb 2026 20:45:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 10:26:06 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: ede94f1b9a7671cc60c3c88de78f0a08c6c76805
X-Git-Newrev: 22cfd2c9afb9059e730dbfd055dd630960e01633
X-Patchwork-Hint: ignore
Message-Id: <20260226204529.D13758705B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/wmctrl: fix
 tarball URL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/22cfd2c9afb9059e730dbfd055dd630960e01633
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Current site is down, switch to Debian.

Fixes:
https://autobuild.buildroot.net/results/679/679a9f6224d1771ec2ab52e45fd74af8d03c1604/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f90d38dafcadf959e6a0383376639a137a8bae4d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/wmctrl/wmctrl.hash | 2 +-
 package/wmctrl/wmctrl.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wmctrl/wmctrl.hash b/package/wmctrl/wmctrl.hash
index 531f64a0d8..86b04d0c01 100644
--- a/package/wmctrl/wmctrl.hash
+++ b/package/wmctrl/wmctrl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d78a1efdb62f18674298ad039c5cbdb1edb6e8e149bb3a8e3a01a4750aa3cca9  wmctrl-1.07.tar.gz
+sha256  d78a1efdb62f18674298ad039c5cbdb1edb6e8e149bb3a8e3a01a4750aa3cca9  wmctrl_1.07.orig.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/wmctrl/wmctrl.mk b/package/wmctrl/wmctrl.mk
index 36ad3513ff..e948f7a939 100644
--- a/package/wmctrl/wmctrl.mk
+++ b/package/wmctrl/wmctrl.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 WMCTRL_VERSION = 1.07
-WMCTRL_SITE = https://sites.google.com/site/tstyblo/wmctrl
+WMCTRL_SOURCE = wmctrl_$(WMCTRL_VERSION).orig.tar.gz
+WMCTRL_SITE = https://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/w/wmctrl
 WMCTRL_LICENSE = GPL-2.0+
 WMCTRL_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
