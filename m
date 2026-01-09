Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1BCD2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADB6E84036;
	Tue, 13 Jan 2026 19:42:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3uy8wiLTIezb; Tue, 13 Jan 2026 19:42:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5391C83FF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333320;
	bh=DICN4mIMB17WSsxhEugYUtQ8UxzX1K7xVMQclgS4ZuI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q4I8ptli5L+T4iGF6yTDlNHvxnYbsEJHA2Jib7wbDSb3OdJCf/6xIbDokbUeteV3r
	 mcAmE68bv5s1/aDILzCtKn2y+LFcUEcMC4q0btgSgHCOezMX65EAjtqUbNd498Sqhq
	 Faq24Jzp27nk/Aaoabei0/o6FfQCXzwOTnEmh/2Mkcwiz4Xe2vLisbkDr4sW3YgZoF
	 QiIuzMYqS9kTtDX8TfsKlw/JNsWRyyNh8E4jBMoFp8wdxFrrDHpBBDOdjcQvu7qyrC
	 AN/XkdalRGxfnCrUaUvDXum6r9y/6sf5/6Q3nkBchxanX/EijmsUBhghUYatxfilOt
	 Zjk3e3i+RLKZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5391C83FF0;
	Tue, 13 Jan 2026 19:42:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A2401C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B1D4829DC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JRzGDltcOFpJ for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11A3182AA2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11A3182AA2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FBEA81385; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:54:14 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 16ae65733364f02458017d1a619e5d81861e4bf6
X-Git-Newrev: 82c003dbee1de23468edf38e796725bd52d04165
X-Patchwork-Hint: ignore
Message-Id: <20260113194034.0FBEA81385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/atf: update
 project URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=82c003dbee1de23468edf38e796725bd52d04165
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

The old URL redirects to the new URL.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9d334c4abf4dadfab73d6bc7cdc171bca1ad5dcc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/atf/Config.in | 2 +-
 package/atf/atf.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atf/Config.in b/package/atf/Config.in
index 43a5d4f2c9..800b488945 100644
--- a/package/atf/Config.in
+++ b/package/atf/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_ATF
 	  ATF, or Automated Testing Framework, is a collection of
 	  libraries to write test programs in C, C++ and POSIX shell.
 
-	  https://github.com/jmmv/atf
+	  https://github.com/freebsd/atf
 
 comment "atf needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/atf/atf.mk b/package/atf/atf.mk
index 27c25c8b27..91d2fb5567 100644
--- a/package/atf/atf.mk
+++ b/package/atf/atf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ATF_VERSION = 0.23
-ATF_SITE = https://github.com/jmmv/atf/releases/download/atf-$(ATF_VERSION)
+ATF_SITE = https://github.com/freebsd/atf/releases/download/atf-$(ATF_VERSION)
 ATF_INSTALL_STAGING = YES
 ATF_LICENSE = BSD-2-Clause, BSD-3-Clause
 ATF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
