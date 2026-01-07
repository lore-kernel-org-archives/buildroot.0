Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500F4D185CC
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CAF460E2D;
	Thu,  8 Jan 2026 11:00:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2D7hHNPRywCz; Thu,  8 Jan 2026 11:00:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEF2760E18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870043;
	bh=Cur3gK5oLRWghRhoXYEWFWx72A/H5BYbJo2R6S+Y/18=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PRlUvvsIBAP6EOBx4BwVECYSS1rCuz1cGgVk6i6haj/l7mPxZlYRA+0OL/JcR+iDP
	 Ta/cAZ6ofHT29Or6VzfUG2zf6RlRWx0/SOTFYSZPWiq+KLZvc4OjPVLb30QOw8VFQ2
	 OqOUR33IJemtTKV8YJW/ll4hdDb5CBH/QeHPlkB3zVDXC2YfmjZ2fesK36lga+/i2j
	 SSP9yDanS+jHmKaYp99TbCmEa/vgYL7Q2HtiUOpTIBe7ZcHZBALwq87Ee29T9Hik4E
	 UcL0c+dZs5EMgHd2pXLWqdwefWSFe1L9B63gs5iLwnezgQLxxKtW4xNPE9tiuB2xSd
	 HROMKzHY3xTsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEF2760E18;
	Thu,  8 Jan 2026 11:00:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AFC0F436
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA2934004E
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7rMFEOLmaQ1Y for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38B744066D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38B744066D
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 370E4883B6; Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 23:34:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d5e93f14f9b87650e5a9a284f5d584337310462
X-Git-Newrev: ab52feec52ecac3e085518981f54703b1a8799af
X-Patchwork-Hint: ignore
Message-Id: <20260108110024.370E4883B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-module-runtime: bump to
 version 0.018
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ab52feec52ecac3e085518981f54703b1a8799af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-perl-module-build is no longer a dependency
(Build.PL was removed, so Makefile.PL is used)

now, this module has its own LICENSE file

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-module-runtime/perl-module-runtime.hash | 8 ++++----
 package/perl-module-runtime/perl-module-runtime.mk   | 7 +++----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/perl-module-runtime/perl-module-runtime.hash b/package/perl-module-runtime/perl-module-runtime.hash
index c87963bfb0..e30040c7d5 100644
--- a/package/perl-module-runtime/perl-module-runtime.hash
+++ b/package/perl-module-runtime/perl-module-runtime.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  d3d47222fa2e3dfcb4526f6cc8437b20  Module-Runtime-0.016.tar.gz
-sha256  68302ec646833547d410be28e09676db75006f4aa58a11f3bdb44ffe99f0f024  Module-Runtime-0.016.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  455eedb62183b9d9e437c59c375c1054  Module-Runtime-0.018.tar.gz
+sha256  0bf77ef68e53721914ff554eada20973596310b4e2cf1401fc958601807de577  Module-Runtime-0.018.tar.gz
 
 # computed by scancpan
-sha256  ad1761020436687e8493208336ef53e84589fdba212da59b05b8111cca75ddc1  README
+sha256  03b1feed0e190459ef83b42518a970e8ed576c4f5bb5156d047a2edc4e469427  LICENSE
diff --git a/package/perl-module-runtime/perl-module-runtime.mk b/package/perl-module-runtime/perl-module-runtime.mk
index dcf045cf18..c698300b40 100644
--- a/package/perl-module-runtime/perl-module-runtime.mk
+++ b/package/perl-module-runtime/perl-module-runtime.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-PERL_MODULE_RUNTIME_VERSION = 0.016
+PERL_MODULE_RUNTIME_VERSION = 0.018
 PERL_MODULE_RUNTIME_SOURCE = Module-Runtime-$(PERL_MODULE_RUNTIME_VERSION).tar.gz
-PERL_MODULE_RUNTIME_SITE = $(BR2_CPAN_MIRROR)/authors/id/Z/ZE/ZEFRAM
-PERL_MODULE_RUNTIME_DEPENDENCIES = host-perl-module-build
+PERL_MODULE_RUNTIME_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_MODULE_RUNTIME_LICENSE = Artistic or GPL-1.0+
-PERL_MODULE_RUNTIME_LICENSE_FILES = README
+PERL_MODULE_RUNTIME_LICENSE_FILES = LICENSE
 PERL_MODULE_RUNTIME_DISTNAME = Module-Runtime
 
 $(eval $(perl-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
