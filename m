Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753AFCD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 344E24103D;
	Fri,  5 Jun 2026 12:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1uOBZRza8kmL; Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C09541050
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663137;
	bh=gXOGK/mvbiw+SjskC30tk672zihYPdMMmSpKdmujGeA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Bsz0Q8kqc6K38PaT5cbpLc7nAA93QzQUgPQ0NmFFIDqdQykAT4ZLTo0LcLW775ZC/
	 /BnFh0KetH2ykzH6ld2pbWOsXaVqjw1Nur5eldBdYumZlamocEXi1UqldNBO38T6uQ
	 gwQw2N+MmgSjIyEZtCGb3eGwEv5ubSR5YDknqj8O74DCtTCQsNaWebwTVMnxfPdAwf
	 YyQkIvNaVSmmDG3hqAp2LNWeWIYUgYer/ZNykFiBgtiT/v/UozLGWPp6o0m6yq4Oou
	 toemDgxn0HKN2q/3xY6pv1AEFg7N7DqM5+tutnv1/gbZQbTdg9r0H44TlnEvBFflbS
	 ECJGnOW4FoOCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C09541050;
	Fri,  5 Jun 2026 12:38:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0344FF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2213E81E6D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7iDBLSu4GROS for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 441DE81EB9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 441DE81EB9
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DF6C87B3B; Fri,  5 Jun 2026 12:37:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:36:03 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 83b059dba32acc4071472c19ed6537c274adb7d4
X-Git-Newrev: d11cb6f5c7fbab656bc62cfcbe8ded1ff95f659f
X-Patchwork-Hint: ignore
Message-Id: <20260605123714.6DF6C87B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/qt6/qt6base:
 remove SBOMs from target
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d11cb6f5c7fbab656bc62cfcbe8ded1ff95f659f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

All Qt6 packages install their own SPDX SBOM in
$(TARGET_DIR)/usr/lib/qt6/sbom/. In the context of Buildroot having
such SBOMs on the target is not useful, and they take up some space,
so get rid of them.

We use a TARGET_FINALIZE_HOOKS (and not a POST_INSTALL_TARGET_HOOKS)
because it's not just qt6base that installs SBOMs, but all qt6
modules, so we want the cleanup to happen after they all got
installed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 160ef0b27a824fbd8f44a9514d5ad7762c3be560)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/qt6/qt6base/qt6base.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 5c939568ae..01661b7f01 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -431,5 +431,10 @@ define QT6BASE_RM_USR_MKSPECS
 endef
 QT6BASE_TARGET_FINALIZE_HOOKS += QT6BASE_RM_USR_MKSPECS
 
+define QT6BASE_RM_SBOMS
+	$(RM) -rf $(TARGET_DIR)/usr/lib/qt6/sbom/
+endef
+QT6BASE_TARGET_FINALIZE_HOOKS += QT6BASE_RM_SBOMS
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
