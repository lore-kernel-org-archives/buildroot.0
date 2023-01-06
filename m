Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937DEC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 375BE4694A;
	Tue, 21 Feb 2023 00:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 375BE4694A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7I6MDKUh8jAi; Tue, 21 Feb 2023 00:20:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83EE84F27B;
	Tue, 21 Feb 2023 00:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83EE84F27B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 886411BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 133956FAC8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 133956FAC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GN8f3dsCk6E0 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 341FA61099
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 341FA61099
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 215328648F; Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Jan 2023 08:38:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f70149c80cda5d2f6bbe2266b247d52818391cda
X-Git-Newrev: 4aca99f51cc97cfc3bcd3affa65f4694004dd444
X-Patchwork-Hint: ignore
Message-Id: <20230220205227.215328648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wireshark: bump to
 version 4.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=4aca99f51cc97cfc3bcd3affa65f4694004dd444
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- pcre2 is mandatory since version 3.7.0 and
  https://github.com/wireshark/wireshark/commit/b9f2e4b7fa091719b93f6256ac34be8e32bd8e94
- Set HAVE_C99_VSNPRINTF to avoid a build failure due to
  check_c_source_runs
- DISABLE_WERROR was renamed to ENABLE_WERROR

4.x series is the new stable release

https://www.wireshark.org/news/20221207.html
https://www.wireshark.org/docs/relnotes/wireshark-4.0.2.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/Config.in      | 1 +
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 6 ++++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index cd92beb1d1..8b05599ecb 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_WIRESHARK
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_SPEEXDSP
 	help
 	  Network traffic sniffer and protocol decoder.
diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 56363e717f..ae06ab09b7 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.16.txt
-sha1  b0e64d5fdd6701106d94bdc8f59dd40a34c7c807  wireshark-3.4.16.tar.xz
-sha256  6acb3155b89b65bcdbcdac7a9e6a59013a6e21d8ae6a8249a9af4fe9ce3d91ba  wireshark-3.4.16.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.2.txt
+sha1  0127180ff18515b086fe5603f767f53ddaa64c1a  wireshark-4.0.2.tar.xz
+sha256  f35915699f2f9b28ddb211202d40ec8984e5834d3c911483144a4984ba44411d  wireshark-4.0.2.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index d9314fb211..ee3d6b1905 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.4.16
+WIRESHARK_VERSION = 4.0.2
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
@@ -18,13 +18,15 @@ WIRESHARK_DEPENDENCIES = \
 	libgcrypt \
 	libglib2 \
 	libpcap \
+	pcre2 \
 	speexdsp
 
 WIRESHARK_CONF_OPTS = \
-	-DDISABLE_WERROR=ON \
 	-DENABLE_ILBC=OFF \
 	-DENABLE_PCAP=ON \
 	-DENABLE_SMI=OFF \
+	-DENABLE_WERROR=OFF \
+	-DHAVE_C99_VSNPRINTF=ON \
 	-DLEMON_C_COMPILER=$(HOSTCC_NOCCACHE)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
