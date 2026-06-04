Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AC2CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E70880AFB;
	Fri,  5 Jun 2026 12:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aW204za9OCBM; Fri,  5 Jun 2026 12:41:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CAC480AFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663263;
	bh=XJDhwJATMlLX8YONIIJN0RO0LKa0eOPQ0jvhgiP/wxY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IKK5Q+4LsFtdI3A9rY6DC4QE1sbwJnyRiSsIfOyW4XyiET1NVkvuyDBWK8IWuMk+U
	 nOLEirvlWdhWplEOG6GgSXQuN9iId6skiZ8hjfdj7+gMVRnzDVGORxxXcKumwIljKf
	 guPlZadlluIV13exhMeV0vhTEEdZFI03H87Ds5nEGkiVp5sPn0T5ljCuK+LBDZS8j8
	 VMyqvnY12fm5dOA4k+n6BhqRAssBiUqPMres2ypVkaiVdNNomRkYjoqRPSU8X/RpH4
	 PTl2czGCerJCTDGdxkNz3L1iOYuc2/PGGsFDztQ1HbEgQ4hMe0CUVChds3wkgBBCWH
	 RNah3u5duPIxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CAC480AFE;
	Fri,  5 Jun 2026 12:41:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1074B3B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BB8F81FBE
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4fbGdcyOo7d for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2C0682030
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2C0682030
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECF6687B39; Fri,  5 Jun 2026 12:38:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:13:39 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: f243d6b1514738cf7a198f749684c106eb5fda57
X-Git-Newrev: 44ca25220b4878639e18674e96859ded6e7e04dd
X-Patchwork-Hint: ignore
Message-Id: <20260605123838.ECF6687B39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/qt5/qt53d:
 disable assimp support when BR2_PACKAGE_ASSIMP is not set
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/44ca25220b4878639e18674e96859ded6e7e04dd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

If we don't disable it, the assimp module from the sources will be used
instead of none. Unfortunately, it currently doesn't build so let's
disable it when BR2_PACKAGE_ASSIMP is not set such that one can still
build qt53d.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit bc1a1dfece634e434b7f80bb4739ea8e4e7ff185)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/qt5/qt53d/qt53d.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 8d9babd704..459b019902 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -11,8 +11,14 @@ QT53D_DEPENDENCIES = qt5declarative
 QT53D_INSTALL_STAGING = YES
 QT53D_SYNC_QT_HEADERS = YES
 
+# command line argument separator
+QT53D_CONF_OPTS = --
+
 ifeq ($(BR2_PACKAGE_ASSIMP),y)
 QT53D_DEPENDENCIES += assimp
+else
+QT53D_CONF_OPTS += \
+	-no-feature-assimp
 endif
 
 QT53D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
