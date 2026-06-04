Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE34CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D730760E89;
	Fri,  5 Jun 2026 12:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fqS_GvPiJZ2n; Fri,  5 Jun 2026 12:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0380E60E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663234;
	bh=nSuL9SO3ofDUPB2wHDwJWv1IogqfmHNzEWZ4QA0f3pY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hNbPqenrgNmmxznqyWS+MaGwQVwN9MbCLLcLBB+NNXzngqWk72vnRCYhwYA9y0iir
	 cmHTrkBhMV4J0lTj1omi5cVcJY0jod1T45JC74enCzBKMaKI1pCsqW61KUNq52n/rE
	 wYCts4WDWObMe1s851sZsRmwviT03KOuPdwVS0cpCBbFc1exCd5PdoaJTaqafLmN17
	 Wa/oF3gNxFuu9fn/7R2MuMjhHly0+ob5EKLl9cf+Vn0C+bS2t3586NESiZMlbvK6E/
	 DKA/L8ykJt93c4hcs7/JmJjH7+BNEQ/CwmYTcWWmxzfMpHiRl2C5Dqbjk8mb2ngzM1
	 8maPDKj7JV1kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0380E60E97;
	Fri,  5 Jun 2026 12:40:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E451F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A63741076
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1N32LN3enJgT for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2ABE41013
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2ABE41013
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08A1A87B03; Fri,  5 Jun 2026 12:38:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:13:43 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 44ca25220b4878639e18674e96859ded6e7e04dd
X-Git-Newrev: 4781035ebd1cc5f4fb2800affb1a07a3fb2f1fcb
X-Patchwork-Hint: ignore
Message-Id: <20260605123839.08A1A87B03@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/qt5/qt53d: force
 using Buildroot's assimp when selected
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4781035ebd1cc5f4fb2800affb1a07a3fb2f1fcb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

If we're adding a dependency to the package, it's for its build system
to use it. Unfortunately, when -feature-system-assimp is not passed, the
assimp module from the sources will be used. Moreover, it doesn't build
currently.

Unfortunately, qt53d still doesn't build with assimp from Buildroot.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 79b13f6e675d628e8253004a34d1881ffc3a4250)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/qt5/qt53d/qt53d.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 459b019902..ae15b58df3 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -16,6 +16,8 @@ QT53D_CONF_OPTS = --
 
 ifeq ($(BR2_PACKAGE_ASSIMP),y)
 QT53D_DEPENDENCIES += assimp
+QT53D_CONF_OPTS += \
+	-feature-system-assimp
 else
 QT53D_CONF_OPTS += \
 	-no-feature-assimp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
