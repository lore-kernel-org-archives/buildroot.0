Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFB5CD6E55
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 08:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91703615A5;
	Sun, 31 May 2026 08:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMzRKHqB4dHX; Sun, 31 May 2026 08:29:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA5F060DBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780216170;
	bh=csgO6QadwniXIrhGNdkSfTdYktD3NOazDZzGwdq57Qw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TKB5OzmnDjS5jUZAGtGFaopKXaLHPRRUeOXkdaHq43PZ/RSHZXIb85aCOqr8z1kPU
	 dm8JVkRsRWEgYfomT6HHO/brRnpUKqJacJFuYVBi4vyNiWltzTtzw5kV+g/hkNXx5J
	 lvKrTFQyh4vK8u5cPtCq54h87DYgZo74B5k0ahqmZR7tVSiaVVz4DCzc6+uPKyONuN
	 vFPWEg54UvHWksXZrx64chM2HY0VaAacjl4YMepCn+Ze69lQ+QrJVlgqa3zUrD1yXj
	 z5+jslu82VqhrJclAG13mO/DnwzVkIs7BvSVlnvi9POY/9CeZ8bzl5HnWPMQgzHdsC
	 7KmciiwszqF4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA5F060DBD;
	Sun, 31 May 2026 08:29:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C678F4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 08:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E4CE81306
 for <buildroot@buildroot.org>; Sun, 31 May 2026 08:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIQOgajA7_5Y for <buildroot@buildroot.org>;
 Sun, 31 May 2026 08:29:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B4798122B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B4798122B
 for <buildroot@buildroot.org>; Sun, 31 May 2026 08:29:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAE99876AC; Sun, 31 May 2026 08:29:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 10:15:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45789c73b138c3a3b2212d1a1da314630d42b8a6
X-Git-Newrev: 160ef0b27a824fbd8f44a9514d5ad7762c3be560
X-Patchwork-Hint: ignore
Message-Id: <20260531082914.EAE99876AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: remove SBOMs from
 target
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/160ef0b27a824fbd8f44a9514d5ad7762c3be560
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
