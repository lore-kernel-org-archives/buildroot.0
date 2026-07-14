Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63E9C43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 09:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F4F0608DB;
	Tue, 14 Jul 2026 09:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mxVdQpeNjUfZ; Tue, 14 Jul 2026 09:24:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFC0A608D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784021093;
	bh=UY1FR/hD0eka2ptckAFDov7mgLJaxgMwQjW1ecH15hg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WNxYC3igg2WWTMxJKGVrJ9UY5UGEnCrb+UwGqJJb5Z++fxtdHarw7MGpgk66dq7MO
	 1TB/hWlZz1dHUWxVWBi1EBWah+qXY92bkGAPYzJqbX/mpgZCJlx1VViqJSKphO2pw2
	 UDpwyTHCEAkEFF3ZZsX0OG/vM920M5eEPEMVxm62clV27Hc0ZbSDYXUZ7NHbGvs95v
	 N93eqCe6+88KycVRuAthK8mzwgA7QyNXPMUNywREmB7UaTU4ANRPXDIMybgeew01Uo
	 O3zCDoVxde8YVTYxCLwx5hT6hgibmqtusGpX2AyBmGhM97+R4nt4xKxrSw8hwujkj1
	 f0x9V+0p9qqCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFC0A608D5;
	Tue, 14 Jul 2026 09:24:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0228696C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCB5A80EDC
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSEjRQBfXbU6 for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 09:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1519480E39
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1519480E39
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:24:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C01C88845; Tue, 14 Jul 2026 09:24:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 11:12:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6fc5f19f1d4a255dd19265693f8ce967beb4b87
X-Git-Newrev: 5f543cfcda61d54e5007a885ee630cd218f1591c
X-Patchwork-Hint: ignore
Message-Id: <20260714092414.6C01C88845@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnpupnp: needs gcc >= 7
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3181429389372900389=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3181429389372900389==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5f543cfcda61d54e5007a885ee630cd218f1591c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 2774502344f35b587ea8f1a2f43ec2398c3ebdad bumped the
package from 4.2.2 to 6.2.3. Upstream added the usage of
std::scoped_lock in version 6.2.0:
https://framagit.org/medoc92/npupnp/-/commit/a760b3278aee06408d9f50d0c54942f5ba9df989

causing a build error detected by the Gitlab pipelines for the
bootlin-aarch64-glibc-old defconfig:

../src/inc/upnpapi.h:132:22: error:
 ‘scoped_lock’ is not a member of ‘std’

scoped_lock was introduced in gcc 7.1:
https://gcc.gnu.org/onlinedocs/libstdc++/manual/status.html#status.iso.2017

so we raise the minimum required gcc version accordingly.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnpupnp/Config.in | 6 +++---
 package/libupnpp/Config.in  | 6 +++---
 package/upmpdcli/Config.in  | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/libnpupnp/Config.in b/package/libnpupnp/Config.in
index cea5bd5c06..846bfe5217 100644
--- a/package/libnpupnp/Config.in
+++ b/package/libnpupnp/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBNPUPNP
 	bool "libnpupnp"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBMICROHTTPD
@@ -13,6 +13,6 @@ config BR2_PACKAGE_LIBNPUPNP
 
 	  https://www.lesbonscomptes.com/upmpdcli/libnpupnp.html
 
-comment "libnpupnp needs a toolchain w/ C++, threads, gcc >= 4.9"
+comment "libnpupnp needs a toolchain w/ C++, threads, gcc >= 7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/libupnpp/Config.in b/package/libupnpp/Config.in
index 41afa9300f..634527622d 100644
--- a/package/libupnpp/Config.in
+++ b/package/libupnpp/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBUPNPP
 	bool "libupnpp"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnpupnp
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libnpupnp
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBNPUPNP
@@ -12,5 +12,5 @@ config BR2_PACKAGE_LIBUPNPP
 
 	  http://www.lesbonscomptes.com/upmpdcli/
 
-comment "libupnpp needs a toolchain w/ C++, threads, gcc >= 4.9"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+comment "libupnpp needs a toolchain w/ C++, threads, gcc >= 7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index 74eb768830..562d27db37 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_UPMPDCLI
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11, libupnpp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libnpupnp -> libupnpp
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_LIBMICROHTTPD
 	select BR2_PACKAGE_LIBMPDCLIENT
@@ -15,8 +15,8 @@ config BR2_PACKAGE_UPMPDCLI
 
 	  http://www.lesbonscomptes.com/upmpdcli/
 
-comment "upmpdcli needs a toolchain w/ C++, NPTL, gcc >= 4.9"
+comment "upmpdcli needs a toolchain w/ C++, NPTL, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7

--===============3181429389372900389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3181429389372900389==--
