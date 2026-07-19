Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A20C44512
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 19:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF6B960652;
	Sun, 19 Jul 2026 19:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgU7UuLdGHAg; Sun, 19 Jul 2026 19:28:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E05056066F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784489316;
	bh=ahUl5TV7YXQ+esBz1UIxfuarO9XR7Jw+QoGpniNyRQs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KpV43wBdyhbigUUaIKG+oyTQIe/UyzxJx6P/t7t0CqgJDr3UxQejAIybWMkobxc6o
	 iBsDWGDrVnii4xrR0/10WJOx2irvdJsmTP6YwKKcPcoSWiz0qjhWuwzKRdew/femgX
	 2R3pL5KPFmQczlk9TXcaTnAbCJrjfRlnWLOyF5YHlOgUANMJFno5GpRbyAPH0u69Jn
	 hSi1IPsdZOHso1X0cqHZBc2EUUXRtc9AdLQ0i4Uy9uN8mUjoCqX6KQgtR5D9CdE+U2
	 MPyHeCncD4Ff6XkpOUwFl+7bh7tq00VIdQ1ZHkjLZjMW5jSRU9EP3Va9NDQTOCxu2g
	 edmKVEQ3bL0bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E05056066F;
	Sun, 19 Jul 2026 19:28:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A68D31F6
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9864840533
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZDYcDigZBnm for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 19:28:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEC8D4052E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEC8D4052E
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:28:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4817488FBD; Sun, 19 Jul 2026 19:27:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Jul 2026 15:31:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32485f8bcc72cb099c99b7af75ec9d3b07585651
X-Git-Newrev: a95039f8a3e2642277e76ab6e60b7e9cea03a27d
X-Patchwork-Hint: ignore
Message-Id: <20260719192756.4817488FBD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-fm-ucode: bump version to
 lf-6.18.20-2.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a95039f8a3e2642277e76ab6e60b7e9cea03a27d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

No change.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qoriq-fm-ucode/qoriq-fm-ucode.hash | 2 +-
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
index 1f6bd01b64..9b4546dfc6 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a3ee2bd375c90de1249ff49e6185874583edd92aa2e2bfb4ccf25b7d8a563205  qoriq-fm-ucode-lf-6.12.34-2.1.0.tar.gz
+sha256  771cee1fa5fc947af2ffe6e5ff565d76d0df32b9c2554252f24e67bac0f63040  qoriq-fm-ucode-lf-6.18.20-2.0.0.tar.gz
 sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  LICENSE
diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
index 3c197346ca..86d0679214 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_FM_UCODE_VERSION = lf-6.12.34-2.1.0
+QORIQ_FM_UCODE_VERSION = lf-6.18.20-2.0.0
 QORIQ_FM_UCODE_SITE = $(call github,nxp-qoriq,qoriq-fm-ucode,$(QORIQ_FM_UCODE_VERSION))
 QORIQ_FM_UCODE_LICENSE = NXP Binary EULA
 QORIQ_FM_UCODE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
