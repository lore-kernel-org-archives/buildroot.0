Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8361C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 08:45:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 415226137F
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 08:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 415226137F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 188B781A50;
	Sun,  7 Nov 2021 08:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GbxG2zZGxnSW; Sun,  7 Nov 2021 08:45:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7024C81A47;
	Sun,  7 Nov 2021 08:45:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 748BD1BF3A8
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 08:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FC0B4023E
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 08:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gXjBuAR444TB for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 08:45:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE990400D2
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 08:45:32 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout04.t-online.de (Postfix) with SMTP id 89BCBEE6;
 Sun,  7 Nov 2021 09:45:29 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.204.142]) by fwd85.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mjdnr-1MCoYT0; Sun, 7 Nov 2021 09:45:27 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:49364)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mjdnq-0003Qk-Qo;
 Sun, 07 Nov 2021 09:45:27 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 09:45:26 +0100
Message-Id: <20211107084526.2073471-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1636274727-00001449-7F2C64E2/0/0 CLEAN NORMAL
X-TOI-MSGID: 62078aeb-d939-4e15-945c-cbeaee8fd4aa
Subject: [Buildroot] [PATCH 1/1] package/boinc: needs at least gcc 4.8 for
 c++11 features
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/ed3/ed3656f443364f01895600f332816d20e340f315/

hostinfo_unix.cpp:1695:37: error: range-based 'for' loops are not allowed in C++98 mode
         for (const string &ignore : ignore_list) {

Adding -std=c++11 to CXXFLAGS is done in _MAKE_OPTS due to the Makefiles
not passing CXXFLAGS from _CONV_ENV down to client/Makefile.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/boinc/Config.in | 4 +++-
 package/boinc/boinc.mk  | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/boinc/Config.in b/package/boinc/Config.in
index 5239019a57..72d5440131 100644
--- a/package/boinc/Config.in
+++ b/package/boinc/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_BOINC
 	bool "boinc"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBCURL
@@ -16,7 +17,8 @@ config BR2_PACKAGE_BOINC
 
 	  https://boinc.berkeley.edu
 
-comment "boinc needs a toolchain w/ dynamic library, C++, threads"
+comment "boinc needs a toolchain w/ dynamic library, C++, threads, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 567ffc923c..7f78c427ea 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -45,6 +45,8 @@ else
 BOINC_CONF_OPTS += --disable-fcgi
 endif
 
+BOINC_MAKE_OPTS = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+
 # Remove boinc-client because it is incompatible with buildroot
 define BOINC_REMOVE_UNNEEDED_FILE
 	$(RM) $(TARGET_DIR)/etc/init.d/boinc-client
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
