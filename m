Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8B5C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:49:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A6AE60EE8
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A6AE60EE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E985A60B1C;
	Wed,  4 Aug 2021 00:49:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lOO4ob0Kdiwi; Wed,  4 Aug 2021 00:49:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EE5F6F921;
	Wed,  4 Aug 2021 00:49:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FEFF1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE14940F8E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A_fRNy7Ozo5l for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADEE640E96
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 11C9487884; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 21:14:57 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7b103c50eb3eaddad4ea81b9cd0c7deee1d9d9d5
X-Git-Newrev: 06771d2694e1bb29e047c055b049a0999906e66a
X-Patchwork-Hint: ignore
Message-Id: <20210803211022.11C9487884@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/daq3: needs threads
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=06771d2694e1bb29e047c055b049a0999906e66a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

daq3 depends on threads since its addition in commit
6e75a990ae35580800f24f3ddc4573c6bc38fa05

Fixes:
 - http://autobuild.buildroot.org/results/b56defe97c0bd56d9a887beeb183ed9bb660b72a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/daq3/Config.in   | 6 ++++--
 package/snort3/Config.in | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/daq3/Config.in b/package/daq3/Config.in
index ad7d55db5b..b53e5508fd 100644
--- a/package/daq3/Config.in
+++ b/package/daq3/Config.in
@@ -3,12 +3,14 @@ config BR2_PACKAGE_DAQ3
 	depends on !BR2_PACKAGE_DAQ
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  DAQ is a Data Acquisition library for packet I/O from the
 	  Snort project.
 
 	  https://www.snort.org
 
-comment "daq3 needs a toolchain w/ dynamic library, gcc >= 4.9"
+comment "daq3 needs a toolchain w/ dynamic library, gcc >= 4.9, threads"
 	depends on !BR2_PACKAGE_DAQ
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/snort3/Config.in b/package/snort3/Config.in
index 75923c3c20..dcc29b820a 100644
--- a/package/snort3/Config.in
+++ b/package/snort3/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_SNORT3
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # daq3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
-	depends on BR2_TOOLCHAIN_HAS_THREADS # hwloc
+	depends on BR2_TOOLCHAIN_HAS_THREADS # daq3, hwloc
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_DAQ3
 	select BR2_PACKAGE_FLEX
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
