Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402E8D0D150
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B4484087C;
	Wed,  7 Jan 2026 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7V_IXPVLJMP; Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62E1B408AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808005;
	bh=qXES2FKJDDjWHq/LkCVJhgFFl9eDbE68h9vqQtqFlJk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qGqRT3kIOVsyV2O7D0U6g3bvyoRAsjK8OYcZ6Rw56q1j2ROtRXxOUpmNHiwJ3O+XJ
	 jSkoy66mNTBOKlbhIUYPeB9slGYFtaELJ2I97uWLAlntFvyDuIiNAVCir9aZnTDr4s
	 Awewa2xfmMwuxt7lj1yq0glFUtLJRo+URxhbFa6UP6X9EJpza+Y0uBZEionMjCtOvb
	 ING8soGpBZl87bB9v5YmySU0/0aFhHWSFcUqcQ8I5ik4v4atNcqTtwHVT9ZDqy6N52
	 d8tnQpzruf2mEv0TidUuMDlz7j2Z1fy4kAWl7du1DlBNKuNfcFI5w6oxXpsUabJxX5
	 HJnphvYhC84eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62E1B408AA;
	Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5560BAEB
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 475B960891
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pkK7hz0Ur_CG for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 718EF6083E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 718EF6083E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7121388354; Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 16:30:37 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 38fdef6b57cb1483a32db96630e185dd1794f26f
X-Git-Newrev: 853f7344f9633ff48877a34c1dc411a03693cd59
X-Patchwork-Hint: ignore
Message-Id: <20260107174640.7121388354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/exim: security
 bump version to 4.99.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=853f7344f9633ff48877a34c1dc411a03693cd59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Release notes:
https://lists.exim.org/lurker/message/20251217.151548.85d1a2bc.en.html

Fixes CVE-2025-67896:
https://code.exim.org/exim/exim/src/branch/exim-4.99+fixes/doc/doc-txt/exim-security-2025-12-09.1/report.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9a058aa701dda250bea2911c2e5db5199929f551)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index dd20fb805a..f9a62e0188 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  5df38b042ffa9a9c8d31b20bc8481558070e361b06f657608622a62a327adcba  exim-4.99.tar.xz
+sha256  eae967bd49a5f879933b8c6ec88c30475a1c6646232135f37f05b55dbc4e3447  exim-4.99.1.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  06521aff437dfe99c015606d2cdde76eaf6e4d2f03779b07fbc0e7d06fe0584366cae9c3fa7d73a86c348f0d25336acd06c42bd5b8f18e5a969de9849088e3aa  exim-4.99.tar.xz
+sha512  41a280673b23a79684124dba9ba1db4da57047eefd7bac8560fab3e399659698160386c5369deb4aabdbcba1ba9278fb0a61fc1667dc2745c280b3004d02f45d  exim-4.99.1.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index d9adfb59d5..47fe17b372 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.99
+EXIM_VERSION = 4.99.1
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
