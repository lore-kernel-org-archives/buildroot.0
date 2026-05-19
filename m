Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF642CD4F3C
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 19:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4E2160A70;
	Tue, 19 May 2026 19:13:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIjkqQYOU_b9; Tue, 19 May 2026 19:13:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B821760B7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779218006;
	bh=k2d/+GJtrq5UJFjizZ8UKqndlSn5iUiFDT3bFHRcmXg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Le8ezn0pvmeOYlCPYmqJi7WQWShexCG+nOR48pMkdZNAZeE3aOJ6cpvi2Nqli+Q/b
	 Dv7QL9OttfbNzqF0jfqZJpNKoDfFc2RhWiUvzFWQdlZS56XuSBDiELFdNm7L3jI2Wk
	 xPvnx3gDw4DDd26kTEBnnxMfquaLhf2so7kX3NckbP3gYoRRAEN34B8/XHKTXl3Hkg
	 HTULwN388pG+HAqDWjrLHwy8VDt05mMgc4gVRrUGYa94S+NqNqaorjp7rSZ1PTMkAY
	 gttFOrmnA5iUh9wWM2zmtkAuCSjkw5bL2cZ++6kDFBxkaGbgvgw4qcKynOn8sHcBhN
	 DkW3IahGpqnCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B821760B7C;
	Tue, 19 May 2026 19:13:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D6A1357
 for <buildroot@buildroot.org>; Tue, 19 May 2026 19:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3ED760B7C
 for <buildroot@buildroot.org>; Tue, 19 May 2026 19:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QK95xugfUu8s for <buildroot@buildroot.org>;
 Tue, 19 May 2026 19:13:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00E2F60A70
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00E2F60A70
 for <buildroot@buildroot.org>; Tue, 19 May 2026 19:13:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3578C867A9; Tue, 19 May 2026 19:13:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 19 May 2026 21:11:07 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7c887cd87866c7c7453ec07cc4a89cf41fb3a880
X-Git-Newrev: 04371efa4416388a0d3962b8cd17359b257b9f78
X-Patchwork-Hint: ignore
Message-Id: <20260519191316.3578C867A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/utfcpp: bump version
 to 4.1.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/04371efa4416388a0d3962b8cd17359b257b9f78
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/nemtrif/utfcpp/releases/tag/v4.1.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/utfcpp/utfcpp.hash | 2 +-
 package/utfcpp/utfcpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/utfcpp/utfcpp.hash b/package/utfcpp/utfcpp.hash
index 4b43eb330b..bde4a223f4 100644
--- a/package/utfcpp/utfcpp.hash
+++ b/package/utfcpp/utfcpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  397a9a2a6ed5238f854f490b0177b840abc6b62571ec3e07baa0bb94d3f14d5a  utfcpp-4.0.9.tar.gz
+sha256  9a45cbeefacf512879971eaf57fe52133b73a0152d5354f3adeaf8d103cff0f3  utfcpp-4.1.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/utfcpp/utfcpp.mk b/package/utfcpp/utfcpp.mk
index 72a590eeb3..de6d6f6f86 100644
--- a/package/utfcpp/utfcpp.mk
+++ b/package/utfcpp/utfcpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTFCPP_VERSION = 4.0.9
+UTFCPP_VERSION = 4.1.0
 UTFCPP_SITE = $(call github,nemtrif,utfcpp,v$(UTFCPP_VERSION))
 UTFCPP_LICENSE = BSL-1.0
 UTFCPP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
