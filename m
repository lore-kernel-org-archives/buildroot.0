Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B13103E168
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 12:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB21260A78;
	Wed, 18 Mar 2026 12:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d9JvTY9Qv_oc; Wed, 18 Mar 2026 12:39:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 399CB6071F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773837573;
	bh=GA1w/5YbOyhwEsfVU38OCcsopyCmnqAiKFXw6ktevYA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IGrVto7NtTfyGygbTtvmQnGorhDxUZpxbDMYWXsilU/F0buGm1gvB3woqDcf/iogp
	 N2HxOkLJbEBa8al4/EV+waEIvST5WwEIER+CLkRjO8iZ/IfCOrXRMAbO32wMCb3Ko6
	 BnRSVQXR5kanWi7ulVmGz1DyBjyAZLC8wZR313+yy/jU3NZCyCbpqxhuYkbS7z1INn
	 hM20cskvd0qpb10Y7oSC/eFSh6izpts0vHKczqfqVEz7EEjT+zCy3GpdL8NS3T6tf/
	 6Pvhdqi7Ne9nJzt19Oq0YTa3Clf4wbjwXjQ+iOFMxN+RFughf1qPX1/xdwulvjvt1M
	 7u7ZLcZKVlKUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 399CB6071F;
	Wed, 18 Mar 2026 12:39:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EE4B1AD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70AB840D29
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kkivZ5mzh2ET for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 12:39:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB6B840D1E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB6B840D1E
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:39:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3CC38469F; Wed, 18 Mar 2026 12:39:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Mar 2026 13:35:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd2ba3ab0fb57af0f2aa94d7f3d0828efdbe4f58
X-Git-Newrev: b538bf02183aae9f6cb1390f0bd73d7218fd7932
X-Patchwork-Hint: ignore
Message-Id: <20260318123930.D3CC38469F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/armadillo: bump to version 15.2.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b538bf02183aae9f6cb1390f0bd73d7218fd7932
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index b830037783..bc6a19a131 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  0182d67d6949e4347a0bc62fc8c2793be7eb203c71f19edff93f8c45fd4a8190  armadillo-15.2.3.tar.xz
+sha256  bb03a16da6b2cca43962b65a2890faf4e6b16607220cf60270436a11e09e6f46  armadillo-15.2.4.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 2df7f10375..8c9c44f89a 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.2.3
+ARMADILLO_VERSION = 15.2.4
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
