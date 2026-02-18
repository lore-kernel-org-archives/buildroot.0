Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64DBE9A055
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C544D60F1A;
	Thu, 19 Feb 2026 17:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id InTlUpjzE_3z; Thu, 19 Feb 2026 17:24:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C469E60E48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521856;
	bh=xYsTd044FlVU7glGjsVqhVOdLomNlOIFTBbmnH1xWmY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I4ItKh8KVXNT2xpW69rg/1VIIl5L807T8TTjT05pMTP6O0DZvaXbco4JsVAC5+77H
	 uUnL/L/Gp1TPyuyOnT5hyq9u902NrVUtBZ0M1ztpfeSmXamGkZqfJK/eRI/+RrktVU
	 Cm+t6Dng5olgh3GN9Ty2PGlX5pJkSdmaD2Mx2q7nj3TDKo2F/C0NE5R9sscE0PIUVK
	 RS5MvUAmkGV8SH18X7kCSHqnviUklYJAmQ1MKOwjiM3h6vR88Bl4CWHCbSdOeBe/XW
	 tNrKGKuvG0h8rnphpeyhJ8TZuPrwTw9hdToEJGJ1OnGWm4wb1gVfwXDbm3DSax1ab5
	 l6JE9WwxrjBUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C469E60E48;
	Thu, 19 Feb 2026 17:24:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A904C355
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97CCA4084C
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a6V7R1FIxQI9 for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2B9B403E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2B9B403E5
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 940EB8704D; Thu, 19 Feb 2026 17:24:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:10:19 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: deb793934e5d51196327910b7b18e577d3d9ea5c
X-Git-Newrev: 041af1f3ca30f55301238843a90f19e3cc9afef2
X-Patchwork-Hint: ignore
Message-Id: <20260219172413.940EB8704D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/m4: bump version
 to 1.4.21
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/041af1f3ca30f55301238843a90f19e3cc9afef2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

https://lists.gnu.org/archive/html/m4-announce/2026-02/msg00000.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 875d6aedbc639484e9203c5bcda1a55ecb7ad4c9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/m4/m4.hash | 2 +-
 package/m4/m4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/m4/m4.hash b/package/m4/m4.hash
index a5b8456cc2..b6dcca6c7d 100644
--- a/package/m4/m4.hash
+++ b/package/m4/m4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  e236ea3a1ccf5f6c270b1c4bb60726f371fa49459a8eaaebc90b216b328daf2b  m4-1.4.20.tar.xz
+sha256  f25c6ab51548a73a75558742fb031e0625d6485fe5f9155949d6486a2408ab66  m4-1.4.21.tar.xz
 # License files, locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 396c2bbee2..d498754b35 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-M4_VERSION = 1.4.20
+M4_VERSION = 1.4.21
 M4_SOURCE = m4-$(M4_VERSION).tar.xz
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 M4_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
