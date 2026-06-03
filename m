Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D4ACD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E583E61B05;
	Wed,  3 Jun 2026 18:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWJCY988qnge; Wed,  3 Jun 2026 18:49:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E03EB6157F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512592;
	bh=p9kuQJ9HMxhovXCztYCBIv5blE71+6vMlT+Ksc4BN7c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e6tebQjeBX5pwZSHnib1SI9tyIuaJRuHce64uXUh8FvyLypaV0qXtvb+4bfNMCmdr
	 cPafo9JHGCkyCzLtHuJ4VB/9DxbN1i0ovURuSadmGJUe02bXiErhk6Q53dYSjnCK56
	 8jQzvtw6PjDk9+aQeZCkf5asQhp04vg43XVJnqitESY9qKTRhUbBEXaGYmhz0UzHyu
	 ukQsXByGXG5quG0fQQZp9L4WTG2/gB6z7pyGRC65FealqDAD4yBbOf2gvbaTQWmEN6
	 mYBLzjEO4ROdl/nRqQEvbThhrL0AONwrtmtVlwcOb0Y/5cQ1F27dJSTQIWV/HV2eBY
	 Eg2LWgipnMXPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E03EB6157F;
	Wed,  3 Jun 2026 18:49:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2275B2F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF502427E1
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGARLK4eiApi for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36C24427E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36C24427E0
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F04F87991; Wed,  3 Jun 2026 18:49:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 20:23:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e013e2df84fb36985261d7b3c6e6af06afd40f93
X-Git-Newrev: dd72456fc6af3266319f5ff15c5530d7e7097b10
X-Patchwork-Hint: ignore
Message-Id: <20260603184932.2F04F87991@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeipmi: security bump version to
 1.6.18
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dd72456fc6af3266319f5ff15c5530d7e7097b10
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.gnu.org/archive/html/freeipmi-announce/2026-06/msg00000.html
https://savannah.gnu.org/news/?id=10898

Fixes CVE-2026-50031: https://seclists.org/oss-sec/2026/q2/794

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
