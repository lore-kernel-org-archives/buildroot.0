Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D605EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36FED6170C;
	Fri, 13 Feb 2026 19:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1GkW-3jkJiO; Fri, 13 Feb 2026 19:39:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ED9861701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011575;
	bh=/Ev2hHN3N/kF6Ga2EON0QZRmRBU6x9qnQjtGe6V1V3w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sAswXps9yeLSdslCahCBzhOrGRI0hsgkiHljhxtKGbD3nt9wBg2ghqOFiUjEU/4IM
	 AIhgX1G79p4OpIz5hqP0YTIh4bfGon194WUrgwFCIT6yzUlhm4q2Ge07lgAUqSUT1z
	 GjkvJqV8Xj5XgrVv9Ne6EUJ4emmFjQRApvgFbSfIHOnl6+y/I+UN/JE9gLSfmzvHac
	 N6L0EUxizYswCCk+TOSffRXBM7HhGc1cyiMfLBGIEzUslcI9N/DY6HwlMFBBrJz7Py
	 ysmoEXWqKlCd+29xSMjGO2WNnfLxEH2TnGcIeOlr9NJ1pZHY0buQYgYqxAXce0IF6X
	 XHP3od3filaaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ED9861701;
	Fri, 13 Feb 2026 19:39:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DCD069
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB3E1412E3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id opFVywmWs77b for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73E32413E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73E32413E6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 695EA825CC; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:32 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 0c963c5d31d1465c5411778dbde197d6b65f54bd
X-Git-Newrev: 53f8d285f664396ec41d14182dc91cedc2f804f1
X-Patchwork-Hint: ignore
Message-Id: <20260213193705.695EA825CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/uclibc: also
 install utils to STAGING_DIR
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/53f8d285f664396ec41d14182dc91cedc2f804f1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

When BR2_UCLIBC_INSTALL_UTILS is enabled, utils such as getconf, ldd,
locale get installed to TARGET_DIR. However, they do not get installed
to STAGING_DIR, which is annoying as it means that they are not part
of external toolchains built by Buildroot.

This commit adjusts the uclibc package to make sure those tools also
get installed to STAGING_DIR.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 272d281ba9a06cfdb802ff13d5ca32ef06166cce)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/uclibc/uclibc.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index dea5445b16..69eb73510e 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -449,6 +449,14 @@ define UCLIBC_INSTALL_UTILS_TARGET
 		PREFIX=$(TARGET_DIR) \
 		utils install_utils
 endef
+
+define UCLIBC_INSTALL_UTILS_STAGING
+	$(MAKE1) -C $(@D) \
+		CC="$(TARGET_CC)" CPP="$(TARGET_CPP)" LD="$(TARGET_LD)" \
+		ARCH="$(UCLIBC_TARGET_ARCH)" \
+		PREFIX=$(STAGING_DIR) \
+		utils install_utils
+endef
 endif
 
 define UCLIBC_INSTALL_TARGET_CMDS
@@ -479,6 +487,7 @@ define UCLIBC_INSTALL_STAGING_CMDS
 		RUNTIME_PREFIX=/ \
 		install_runtime install_dev
 	$(UCLIBC_INSTALL_HOST_UTILS)
+	$(UCLIBC_INSTALL_UTILS_STAGING)
 endef
 
 # Checks to give errors that the user can understand
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
