Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459E1C44500
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19D2E80BA4;
	Fri,  3 Jul 2026 14:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AUWGvM0pC-hR; Fri,  3 Jul 2026 14:28:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40E8280DE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088915;
	bh=ROo3Sdk6e3dZpJ/tXdQ31piHDwsaCRPSrxEG6x8tiYc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f8bTiZoeRkxH4C6GSZAvUTjr34/PVkJ+Nz0LQQuoAiDBE4kttSqeCGGBdX8CqSdul
	 DTi42/jkbgEsD7SgeGRVU83HOLcd17g2ARuzyjLANTkDVPezX8JmrxJJyNBnKNI3CU
	 Hz1pGtebbHdlFpUn5YSrrGERwy0ZJTLQbmExKaUvxe2R8CnGA8l/aBaEq8bauJwI87
	 /FTmClzze5vp2ZUItwJhwitU0cbreQ/5KdDNvDh8461DobRiNmQ9oE7G28VbKapfKS
	 rDBJ/UEmsllt7lxld1dyNp8gh3dVUC3gEEijq59E6IZNH7DSuvaXW46f1A49tzx2Nm
	 0GrxmckNePTYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40E8280DE1;
	Fri,  3 Jul 2026 14:28:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CAD31363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0E8E40EA8
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DsV9ReOfSXtA for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:28:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABD074117D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABD074117D
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E1EC883A1; Fri,  3 Jul 2026 14:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:33:22 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: bd47a97aeab687fc085ca7e477727c7b810859c6
X-Git-Newrev: c981779d2ab627dafc9e63f386e14b87fcff9cc0
X-Patchwork-Hint: ignore
Message-Id: <20260703142758.4E1EC883A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/mongoose:
 security bump to version 7.22
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c981779d2ab627dafc9e63f386e14b87fcff9cc0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Release notes:
https://github.com/cesanta/mongoose/releases/tag/7.22

Fixes CVE-2026-37635.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8fe41d5506d1d1c7a453be9977a4ffa65d39e886)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 556a438880..1a60b0c89c 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d4ddbd12c12f223abefcc0a74417a638ae5c118d7cf10ba546553c6b0e0b5ada  mongoose-7.21.tar.gz
+sha256  87727cd2c240ff559b16e9710d44b61ba3513dbee50428bd8ee1596d7c58460a  mongoose-7.22.tar.gz
 sha256  f0d9cfd6f7d92f6ec061a5fb2882f67d2521a151bf09a637c33ca6181834b048  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 8250751eb8..207d31cdfa 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.21
+MONGOOSE_VERSION = 7.22
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
