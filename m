Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0C3D2A532
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF17340439;
	Thu,  4 Dec 2025 20:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrQcSwmwrMQM; Thu,  4 Dec 2025 20:42:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F192D40428
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764880944;
	bh=6U3A5557buwcG8sOLfIx4JysLDTuHg6U89g6R7i5Z6Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QrpHJ6sX/2lq6sVJaQR3VJGmJMsv6pdiHDj1W9s8HnS8s/xztO6B1q9iQEVXm8C5v
	 A9iLnJJtGQaHQhOxCcD+1o/WIiP763OaHbgTzS5B5WxO0UxaFbb/jQDBGO0oId4HnO
	 QR0ggHTDZ2YR1ATuWumRDZeIM6LPcWnIBmxfGOmIRwzjXY43rafKp/6OdYRgS1IbD3
	 OmwCKTjULVAOV6Zww3dyLcVN7u6vADIqWxpzHP0o2MU8cbmsb57YWldwIpdNT9lMIm
	 l46XwzQ+q2pfNEwnV8+d9rJ5yY/w34nKsbHL/1QG4ZWyL6mkP0z8Oosnqkm+cOk3kE
	 krtRhXtb0T4Xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F192D40428;
	Thu,  4 Dec 2025 20:42:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C31E4D3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9A9D40242
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0x08vO498PR for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:42:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFF4C4020A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFF4C4020A
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:42:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDEC18653E; Thu,  4 Dec 2025 20:42:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 21:34:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 55961e952df4cd4d229f9325fecf141aae15b521
X-Git-Newrev: c7437415a56fdb054b77b5a7f1944d9728aaf75d
X-Patchwork-Hint: ignore
Message-Id: <20251204204221.BDEC18653E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ustreamer: bump
 version to 6.42
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7437415a56fdb054b77b5a7f1944d9728aaf75d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://github.com/pikvm/ustreamer/compare/v6.41...v6.42

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ustreamer/ustreamer.hash | 2 +-
 package/ustreamer/ustreamer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
index 9084f9109e..e2196b5b77 100644
--- a/package/ustreamer/ustreamer.hash
+++ b/package/ustreamer/ustreamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  592fab2eb10ccb768e19b4e6631e1279d415f23d268a4b45b9d440378beaa570  ustreamer-6.41.tar.gz
+sha256  40c10b522c34bcb95bda9844a5a2a06173fea9a5d948882d70740cbe1fe7a8b4  ustreamer-6.42.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
index ef5ac09eeb..bf87dc8abd 100644
--- a/package/ustreamer/ustreamer.mk
+++ b/package/ustreamer/ustreamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAMER_VERSION = 6.41
+USTREAMER_VERSION = 6.42
 USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))
 USTREAMER_LICENSE = GPL-3.0+
 USTREAMER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
