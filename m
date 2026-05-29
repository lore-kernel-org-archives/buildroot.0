Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE68CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 270B842115;
	Fri, 29 May 2026 08:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NyWEhuH3DJ9y; Fri, 29 May 2026 08:28:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B23C42132
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043296;
	bh=7mauXNUOd9slpVIBqZR9wEqSDCmgMWlgRG9JbyK4zTY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gJwja/rEwqHLDMu53gj77xW8HrNKJJ77NsXdLc0ju+BiYDHT8VAVydKbLhlRZ7AgV
	 Dzarokzn3QkPCdKkqsiM8KavtdK4yDo0uD0bkm1d0w0vyNe2/OgQqxv/w2LQYdC/uP
	 lCpEw4wp//dUyjiy5Bk5F9Q4WLgdacmcEjeCr4k+1DDCgvlxb3DzFofV+JzJHgjmpJ
	 9jDNyUE13CKvJOPsRbsV/3qMnHOPgrH9fgFaVqgGF/ANr6F3XU3rHl0wTOFM9xfoft
	 eBOOGzt9fqYR04JKMX8KMc/9swWMPh45A7/w8rDJVtNos9twl55KqLtoegIiRtN91z
	 6Tcbi0Spg+uCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B23C42132;
	Fri, 29 May 2026 08:28:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02A4728E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43EA560E0A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UX_7RLDiRhj for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A160B61360
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A160B61360
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F3BD873A6; Fri, 29 May 2026 08:27:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:26:10 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 3c502cc273246fa47e98beb9450b3cca9726b4f3
X-Git-Newrev: 66127b61bb7e226e2ea55371572875a8dd7fab12
X-Patchwork-Hint: ignore
Message-Id: <20260529082748.3F3BD873A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/sed: security
 bump version to 4.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/66127b61bb7e226e2ea55371572875a8dd7fab12
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://lists.gnu.org/archive/html/sed-devel/2026-04/msg00027.html
"'sed --follow-symlinks -i' no longer has a TOCTOU race [...]"

Fixes CVE-2026-5958: https://cert.pl/en/posts/2026/04/CVE-2026-5958/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit eb496bd63ef4a4466f9482fa4b3226e20cfb7f7b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sed/sed.hash | 4 ++--
 package/sed/sed.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sed/sed.hash b/package/sed/sed.hash
index 10e2c36d8f..1f1a578813 100644
--- a/package/sed/sed.hash
+++ b/package/sed/sed.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/sed/sed-4.9.tar.xz.sig
+# https://ftp.gnu.org/gnu/sed/sed-4.10.tar.xz.sig
 # with the key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  6e226b732e1cd739464ad6862bd1a1aba42d7982922da7a53519631d24975181  sed-4.9.tar.xz
+sha256  b8e72182b2ec96a3574e2998c47b7aaa64cc20ce000d8e9ac313cc07cecf28c7  sed-4.10.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 8165083658..cf6d263b06 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SED_VERSION = 4.9
+SED_VERSION = 4.10
 SED_SOURCE = sed-$(SED_VERSION).tar.xz
 SED_SITE = $(BR2_GNU_MIRROR)/sed
 SED_LICENSE = GPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
