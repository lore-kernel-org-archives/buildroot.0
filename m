Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A121A606A32C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 17:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FmhneyHh
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 712F240695;
	Fri,  6 Nov 2026 17:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-TV6-97MRLT; Fri,  6 Nov 2026 17:21:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3224E406E7
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793985712;
	b=d7WT3aY7DYB5SpFQzZzoe6f/HYFAJa9P/G1D7Wej4Xc2bwf2QXUcSlTQRkxzKP8fYS/s
	 g5093dn9dYSvw+OwAuzf6fHnrHNQYDkIqJR1rpB7YFnLcjvd1COXHw0WZjzjfWE1c+RNq
	 k8/lAhDxmARHhTyS9l4/yss8XUpXIJQbabjzMsQhZZl9wYk2W3CSRPjcBrsMEaO+4WdbP
	 q/woOg2IbGobGHQfLMq36nVt164lUAfBxzZ+oCsQ1/gJcboRnP8kB5z/zLvQgyRTOJmj7
	 kbhSiz76jSfqkaiPmKguVIGCx/dE9e+fBbfu9w0Ml1O17UjdxPaWoLmMfXYnF9YWIdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793985712;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=WXO4Q631Rabq/89rRe1UcBLlpVmyvtO3JO6WBwxgWQM=;
	b=OToYoHVEVQhBTp98cNYPDQeTuMVMjWZkwN7MktiCeZH9EK+3v9E5d3dqyHUEa7UFN/Tj
	 jS4WjXl/puysz/alMfl/eS7jSXC9Vthw2+t4IR8q4LaTtZ/vXDXdfk2oAFQLhooJ02Sb8
	 T8u1G5Ky+bzhDeC5OX88dsVYdIn85Spyt1VNtgz9irU443x+ttoAlsva6iKYzd9suYppw
	 jMyTape9xGFG4WgdCU9eIN7HBYK/Fop82xs+Yk5pgF0XVKJliWgxfpr6LlkyRAfACRHoT
	 DKHFRl1rjBKEoQA87TGhbkOOhHLVrnOMQhkUAqM9X06j9H/Bz6OFctpIInb7PgTOA4Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793985712;
	bh=WXO4Q631Rabq/89rRe1UcBLlpVmyvtO3JO6WBwxgWQM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FmhneyHhyV4Zvk+HNgrdVdM2ZD9eqH6hJz6nFoEiYwq72yKh28rklapOPJdM6md/I
	 0nRoXAhjMF5aamV7XxdYYbdjnza8PNa7pGC2xa1GLQ0q6X2nLFy+f+tx3j4jdXbwvJ
	 SLbUFsfFbooU5ZbMjeqz1G1TCxdCrusqxxvGH1wPdE22WWcbcg9iiIvSABcDxn+yE3
	 eMunPB4ihJ7fbkVo69gjw4sMO6JbhYwWUkLUMie+lMOI1NmhlJIAwBTnv9X8ppMamH
	 GnM5RnSACJhNmEJwq0VIu4PfDMxrD0vHo0lBIpRVgyv3HtLD/xQTQmGjTkcfH/6527
	 NtUSXI3Rlhdtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3224E406E7;
	Fri,  6 Nov 2026 17:21:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FA8732A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 056D7401EC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kxRX62IhoaAv for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 17:21:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B5506400AF
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5506400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:21:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA9EC9E0B7; Fri,  6 Nov 2026 17:20:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 18:19:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0426cc2f58ad51366bfdb6a03b24cb9a70ba190
X-Git-Newrev: b86f2c2fc9bdbdaa4683ee20f33e84e21073a4d7
X-Patchwork-Hint: ignore
Message-Id: <20261106172016.CA9EC9E0B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bitcoin: bump version to 32.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3156690111389998762=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3156690111389998762==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b86f2c2fc9bdbdaa4683ee20f33e84e21073a4d7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://bitcoincore.org/en/releases/32.1/
https://bitcoincore.org/en/releases/31.2/
https://bitcoincore.org/en/releases/31.1/

Removed patch 0001 due to the upstream removal of the libevent
dependency in version 32.1.
Also removed the dependency on the libevent package.

Renumbered and rebased remaining patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...keLists.txt-Don-t-force-fstack-protector.patch} |  3 +-
 .../bitcoin/0001-Fix-static-link-of-libevent.patch | 36 ----------------------
 package/bitcoin/Config.in                          |  1 -
 package/bitcoin/bitcoin.hash                       |  6 ++--
 package/bitcoin/bitcoin.mk                         |  4 +--
 5 files changed, 7 insertions(+), 43 deletions(-)

diff --git a/package/bitcoin/0002-CMakeLists.txt-Don-t-force-fstack-protector.patch b/package/bitcoin/0001-CMakeLists.txt-Don-t-force-fstack-protector.patch
similarity index 94%
rename from package/bitcoin/0002-CMakeLists.txt-Don-t-force-fstack-protector.patch
rename to package/bitcoin/0001-CMakeLists.txt-Don-t-force-fstack-protector.patch
index 40370d1bf7..cca0b2c92b 100644
--- a/package/bitcoin/0002-CMakeLists.txt-Don-t-force-fstack-protector.patch
+++ b/package/bitcoin/0001-CMakeLists.txt-Don-t-force-fstack-protector.patch
@@ -8,6 +8,7 @@ not, for example to support toolchains that don't have SSP support.
 
 Upstream: N/A Buildroot specific
 
+[Bernd: rebased for 32.1]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  CMakeLists.txt | 1 -
@@ -17,7 +18,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index 892f30d94b..93ccbf71ec 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -532,7 +532,6 @@ else()
+@@ -551,7 +551,6 @@ else()
    unset(cxx_supports_fortify_source)
  
    try_append_cxx_flags("-Wstack-protector" TARGET core_interface SKIP_LINK)
diff --git a/package/bitcoin/0001-Fix-static-link-of-libevent.patch b/package/bitcoin/0001-Fix-static-link-of-libevent.patch
deleted file mode 100644
index 8c8e95bd0f..0000000000
--- a/package/bitcoin/0001-Fix-static-link-of-libevent.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 28c3533e5fb350fe1c27cf06dee6928825bc7bf2 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sat, 18 Jul 2026 07:46:09 +0200
-Subject: [PATCH] Fix static link of libevent
-
-Change link order to fix build error
-
-/home/thomas/autobuild/instance-2/output-1/host/lib/gcc/i686-buildroot-linux-musl/14.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
- /home/thomas/autobuild/instance-2/output-1/host/i686-buildroot-linux-musl/sysroot/usr/lib/libevent_extra.a(http.o):
- in function `evhttp_connection_retry':
-http.c:(.text+0x1f7b): undefined reference to `bufferevent_socket_get_conn_address_'
-
-Upstream: Not applicable (libevent support was removed in master branch)
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index ad18115bbc..8e2a7bfcce 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -355,8 +355,8 @@ if(BUILD_CLI)
-     bitcoin_cli
-     bitcoin_common
-     bitcoin_util
--    libevent::core
-     libevent::extra
-+    libevent::core
-   )
-   install_binary_component(bitcoin-cli HAS_MANPAGE)
- endif()
--- 
-2.47.3
-
diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index 835961718c..f1d6e560c3 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -21,7 +21,6 @@ config BR2_PACKAGE_BITCOIN
 	depends on BR2_USE_WCHAR
 	select BR2_HOST_CMAKE_AT_LEAST_3_22
 	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_LIBEVENT
 	help
 	  Bitcoin Core is an open source project which maintains and
 	  releases Bitcoin client software called “Bitcoin Core”.
diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
index 3adfc7a5d0..72b2957879 100644
--- a/package/bitcoin/bitcoin.hash
+++ b/package/bitcoin/bitcoin.hash
@@ -1,7 +1,7 @@
-# Hash from: https://bitcoincore.org/bin/bitcoin-core-31.1/SHA256SUMS
+# Hash from: https://bitcoincore.org/bin/bitcoin-core-32.1/SHA256SUMS
 # After checking pgp signature from:
-# https://bitcoincore.org/bin/bitcoin-core-31.1/SHA256SUMS.asc
-sha256  50411d5b43c7e4c90099394759eb6c2add6e7c2dbe728840893d638b6fc6afc9  bitcoin-31.1.tar.gz
+# https://bitcoincore.org/bin/bitcoin-core-32.1/SHA256SUMS.asc
+sha256  a5f2f61e32cf7f790641c9ec306a3c88ca7b5a556946956b1f35ffd7e27813f9  bitcoin-32.1.tar.gz
 
 # Hash for license file
 sha256  b028769f3852a9368ab10bd754ff01ebb741f84a2fa658c9aff82a631bc6ecfc  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index 857768eba8..810f8d3c29 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-BITCOIN_VERSION = 31.1
+BITCOIN_VERSION = 32.1
 BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
 BITCOIN_LICENSE = MIT
 BITCOIN_LICENSE_FILES = COPYING
 BITCOIN_CPE_ID_VENDOR = bitcoin
 BITCOIN_CPE_ID_PRODUCT = bitcoin_core
-BITCOIN_DEPENDENCIES = host-pkgconf boost libevent
+BITCOIN_DEPENDENCIES = host-pkgconf boost
 BITCOIN_SUPPORTS_IN_SOURCE_BUILD = NO
 BITCOIN_MAKE_ENV = BITCOIN_GENBUILD_NO_GIT=1
 BITCOIN_CONF_OPTS = \

--===============3156690111389998762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3156690111389998762==--
