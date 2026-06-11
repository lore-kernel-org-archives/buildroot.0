Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6975CD98DA
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A20D760FBC;
	Fri, 12 Jun 2026 11:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ERB5glhYoPnt; Fri, 12 Jun 2026 11:22:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BBC560F8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263369;
	bh=FrutJPcIwArCxAE2/nIeFOivMftatwleRE7GUB1MHhk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Creck6jdsiVDK6QNw9nZvqZ7P8tgt9BOATo2pRH1DIdgngfDtu7UMriu0GBeFrfvN
	 PGgqv0zhZpnEgHyhoe5sqzw9HtKC7xbMlh8PNPljyzeAsR4DfinQsDqZ7HXz77jp1W
	 ipqZ5QtgEIQ4bY3i6LRFJNfxCqCyKRNSn/STHnWDvsURzhXWnZfu474pLhCYeEs7g1
	 DI/N0DpSS/cVfemNss6eImKwZQzUDAAw++VTfI7Yrh4+N6YznPoBJnrzopxPihgXwd
	 5tLJWy62D8clwROyO1cuCrM6ttYPU8FNX1GHXVonisEpR8x3iil4guMnW1wvfG/mJY
	 NEHBHG9L6iLfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BBC560F8C;
	Fri, 12 Jun 2026 11:22:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 193A1F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACB9A8329E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4Oue81y3ePD for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEC6F82CC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEC6F82CC7
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32DA1880D5; Fri, 12 Jun 2026 11:22:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:36:44 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 086b60705442789601a5041325095f37140cb663
X-Git-Newrev: c6d15ebab99748ca3ed86b763bbd9fae43663e5d
X-Patchwork-Hint: ignore
Message-Id: <20260612112208.32DA1880D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/freeipmi:
 security bump version to 1.6.18
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c6d15ebab99748ca3ed86b763bbd9fae43663e5d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://lists.gnu.org/archive/html/freeipmi-announce/2026-06/msg00000.html
https://savannah.gnu.org/news/?id=10898

Fixes CVE-2026-50031: https://seclists.org/oss-sec/2026/q2/794

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dd72456fc6af3266319f5ff15c5530d7e7097b10)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/freeipmi/freeipmi.hash | 2 +-
 package/freeipmi/freeipmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freeipmi/freeipmi.hash b/package/freeipmi/freeipmi.hash
index 9d06be8cf9..97890d3a17 100644
--- a/package/freeipmi/freeipmi.hash
+++ b/package/freeipmi/freeipmi.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  5bcef6bb9eb680e49b4a3623579930ace7899f53925b2045fe9f91ad6904111d  freeipmi-1.6.16.tar.gz
+sha256  8098b23820038ad0aa39abf0f9a012e24683d384d9f91e760acb2a68b465e0fe  freeipmi-1.6.18.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.bmc-watchdog
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmiconsole
diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
index 0581b931b0..38a9adff37 100644
--- a/package/freeipmi/freeipmi.mk
+++ b/package/freeipmi/freeipmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREEIPMI_VERSION = 1.6.16
+FREEIPMI_VERSION = 1.6.18
 FREEIPMI_SITE = $(BR2_GNU_MIRROR)/freeipmi
 FREEIPMI_LICENSE = GPL-3.0+, BSD-like (sunbmc)
 FREEIPMI_LICENSE_FILES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
