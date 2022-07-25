Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F003C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 21:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0274483487;
	Mon, 25 Jul 2022 21:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0274483487
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xGDiGiBqhvcV; Mon, 25 Jul 2022 21:26:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1C058331B;
	Mon, 25 Jul 2022 21:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1C058331B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C6871BF2FB
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 21:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7619E8331B
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 21:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7619E8331B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZxyDKlVXJLwO for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 21:26:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0D8382E19
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 21:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0D8382E19
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6D59E85DBC; Mon, 25 Jul 2022 21:12:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 23:24:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdd0260d4b5802f1d57832b29b8621cb9ecaf1cf
X-Git-Newrev: adbfb71ee468a020b2d8b6babc023a97838bc330
X-Patchwork-Hint: ignore
Message-Id: <20220725211220.6D59E85DBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpcap: add host variant
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=adbfb71ee468a020b2d8b6babc023a97838bc330
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-libpcap is needed to build host-zeek. It is not actually used for
anything, so we can disable all features.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libpcap/libpcap.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 1e02ec56e0..21422b2c0a 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -11,6 +11,7 @@ LIBPCAP_LICENSE_FILES = LICENSE
 LIBPCAP_CPE_ID_VENDOR = tcpdump
 LIBPCAP_INSTALL_STAGING = YES
 LIBPCAP_DEPENDENCIES = host-flex host-bison host-pkgconf
+HOST_LIBPCAP_DEPENDENCIES = host-flex host-bison host-pkgconf
 
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
 # provided by autoconf relies on wchar_t.
@@ -23,6 +24,13 @@ LIBPCAP_CONF_OPTS = --disable-yydebug --with-pcap=linux --without-dag \
 	--without-dpdk
 # Disable dbus to break recursive dependencies
 LIBPCAP_CONF_OPTS += --disable-dbus
+HOST_LIBPCAP_CONF_OPTS = \
+	--disable-bluetooth \
+	--disable-dbus \
+	--disable-yydebug \
+	--with-pcap=linux \
+	--without-dag \
+	--without-libnl
 LIBPCAP_CONFIG_SCRIPTS = pcap-config
 
 # Omit -rpath from pcap-config output
@@ -50,3 +58,4 @@ LIBPCAP_CFLAGS += -fPIC
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
