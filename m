Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F69EF06E3
	for <buildroot@archiver.kernel.org>; Sun,  8 Feb 2026 13:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D9D840509;
	Sun,  8 Feb 2026 13:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1cIDYUh0IRVp; Sun,  8 Feb 2026 13:16:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09B3040483
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770556583;
	bh=XzpsZqp/pgGV/tdEsfbWbqYnC7tLOVM6OwM/GXER6k8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GQHsanF+/LOdyQGISKBV35KaQK9/1djagC57+22bEyUtPgcHGBAw2lqmWWRlBVJiF
	 sveMGlIf+JncqJ5wGq1Ch13HO6w0goiz3uQOpjsRK0hmgGq2zbYBo3iHCuJccxRdC5
	 Xh9BHQG27RStdQTMsXlTjPmfA71wW2TkcZRVLH24IvbDalzp9bBohxxByowf0Jj6i2
	 Ha+kXL193OBx4L/o1I1wUOTEf1OU7BGZjUjHy5JhXqrE03/QpaAOvJoPD11GRBcAUK
	 tXNj32MAa4tE4bwLD9afGOMTUOk/6hnxhp4lt1/kh28aWUkB8ODHHw+7EN5QkI3oyo
	 IfEc9Ahg+F7JQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09B3040483;
	Sun,  8 Feb 2026 13:16:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E00D4219
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 13:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1B8E81F1F
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 13:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OvPO63pQK0Xy for <buildroot@buildroot.org>;
 Sun,  8 Feb 2026 13:16:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10CB381F06
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10CB381F06
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 13:16:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6A0B86B92; Sun,  8 Feb 2026 13:16:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 8 Feb 2026 13:44:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 759f5d5a1779e7d6fb3a3e10c8f41f9fda89f049
X-Git-Newrev: 87d2e5ff59ffaa94000a4776a3f5ab7f60a23fda
X-Patchwork-Hint: ignore
Message-Id: <20260208131619.D6A0B86B92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sane-airscan: bump version to
 0.99.36
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/87d2e5ff59ffaa94000a4776a3f5ab7f60a23fda
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/alexpevzner/sane-airscan/commits/0.99.36/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sane-airscan/sane-airscan.hash | 2 +-
 package/sane-airscan/sane-airscan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sane-airscan/sane-airscan.hash b/package/sane-airscan/sane-airscan.hash
index 40fb84e32d..affd7031d5 100644
--- a/package/sane-airscan/sane-airscan.hash
+++ b/package/sane-airscan/sane-airscan.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  647f41f84f9bce743c796ca84c1fda67e519968fab407490c28fd0cc6d7ac485  sane-airscan-0.99.33.tar.gz
+sha256  43d3436c0199496ee18aca4f875fe3926a40a0fae781bc280cdb96f7b5068ac0  sane-airscan-0.99.36.tar.gz
 sha256  a2631c1b81992bd6f66db6be8b009ed7e3e998d1e2db4de497fa82d65011d373  LICENSE
diff --git a/package/sane-airscan/sane-airscan.mk b/package/sane-airscan/sane-airscan.mk
index 168430e3e3..46948ab547 100644
--- a/package/sane-airscan/sane-airscan.mk
+++ b/package/sane-airscan/sane-airscan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SANE_AIRSCAN_VERSION = 0.99.33
+SANE_AIRSCAN_VERSION = 0.99.36
 SANE_AIRSCAN_SITE = $(call github,alexpevzner,sane-airscan,$(SANE_AIRSCAN_VERSION))
 SANE_AIRSCAN_DEPENDENCIES = avahi gnutls jpeg libpng libxml2 sane-backends tiff
 SANE_AIRSCAN_LICENSE = GPL-2.0+-with-exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
