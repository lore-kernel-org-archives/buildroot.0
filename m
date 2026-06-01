Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3720CCD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3038685E08;
	Tue,  9 Jun 2026 13:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4bqHKTQTy3c; Tue,  9 Jun 2026 13:05:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 366B185DFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010330;
	bh=h/+9y7YWAAN0aSy8IEI0STjTi7k8G8LQRMXD+vJ9d/A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R6xYGLtXXtGIRTYK5zqNj4WWLA4u/VtQlAeQdJ6c++thEKCANL3l2dxayXCCWp6vf
	 xCeSOz3xnkosZ81YnhLzODYtafH9r4UqfWKq05SVFw48QuQ02AG5Hd+NiRjF6sv/zz
	 ecEV1HSyJS+Krlkq45D1kdBLKqcYU7yKYi1FEZ8h8WtJu59n/40gnA+guP2aKQZ5oA
	 RPpADIPIUutPfde19ul95AiV5ReV4k7fWvL+u5Troil5/Mw8RtKpo5Ak2mYCF8EZ5d
	 tEL05QtVkUauc6iNhtOwQtb1VT7eX8G3SIyl2rjs7YoR88txqFyDgPw6jr6Yja+qsI
	 9DDrrKO+70NNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 366B185DFC;
	Tue,  9 Jun 2026 13:05:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3035B196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA1F045969
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eqJo4FjP1rX for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9CFF455DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9CFF455DD
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0258087E87; Tue,  9 Jun 2026 13:01:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jun 2026 22:14:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2870919b2943c2d4a62127201a0d334fdb5a461
X-Git-Newrev: 5242ac9a144ef34b52241fb82903038c6f2b2721
X-Patchwork-Hint: ignore
Message-Id: <20260609130126.0258087E87@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sane-airscan: bump version to
 0.99.37
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5242ac9a144ef34b52241fb82903038c6f2b2721
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/alexpevzner/sane-airscan/compare/0.99.36...0.99.37

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/sane-airscan/sane-airscan.hash | 2 +-
 package/sane-airscan/sane-airscan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sane-airscan/sane-airscan.hash b/package/sane-airscan/sane-airscan.hash
index affd7031d5..e1faa08195 100644
--- a/package/sane-airscan/sane-airscan.hash
+++ b/package/sane-airscan/sane-airscan.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  43d3436c0199496ee18aca4f875fe3926a40a0fae781bc280cdb96f7b5068ac0  sane-airscan-0.99.36.tar.gz
+sha256  b012d4ca8b526e28b0baf1e0dcc1504a1f67118914ee9362201d04a37dbf7e5f  sane-airscan-0.99.37.tar.gz
 sha256  a2631c1b81992bd6f66db6be8b009ed7e3e998d1e2db4de497fa82d65011d373  LICENSE
diff --git a/package/sane-airscan/sane-airscan.mk b/package/sane-airscan/sane-airscan.mk
index 46948ab547..911761317e 100644
--- a/package/sane-airscan/sane-airscan.mk
+++ b/package/sane-airscan/sane-airscan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SANE_AIRSCAN_VERSION = 0.99.36
+SANE_AIRSCAN_VERSION = 0.99.37
 SANE_AIRSCAN_SITE = $(call github,alexpevzner,sane-airscan,$(SANE_AIRSCAN_VERSION))
 SANE_AIRSCAN_DEPENDENCIES = avahi gnutls jpeg libpng libxml2 sane-backends tiff
 SANE_AIRSCAN_LICENSE = GPL-2.0+-with-exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
