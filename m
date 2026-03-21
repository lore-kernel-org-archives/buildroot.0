Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F2DF483D7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCE5260829;
	Mon, 23 Mar 2026 19:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0h_hMhG0uhY3; Mon, 23 Mar 2026 19:55:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD2126082B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295709;
	bh=UG8WTVQhxx6qP0YlpN7d0HOm1crYSVBeJjc0Jf0zYFU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sBOB84fUNW70Xr1euS0nC6q1E4RBpXnmHljpiyTOZmPD78K+yEv0V66U/VTb3GhPh
	 ZvAN8X+oJPOOwQkd5daGAr8h8o0g6dtLO20+jmxVaqA84gQx/TW378ka4a05tTXL/S
	 I8VeBDZtrqAGgoVLPX5IGMMNcMMxJyGY3Z5rYKA3QwX7wBZ+9W5hbUUEgf3kAqVzzV
	 /why2jfP/LTxYwkP1EIA4SLB0rlPr2SxuXay3a/OoILx5IV8WCzPFDdA3QJSrPJI3i
	 63UgnOmbq2l3WiSGeR/YVqQs9xnqEIMy7mwVCJZ8geBRBsLg4XM3PZNTFKfSWT2TUD
	 +71oT0p5nA31Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD2126082B;
	Mon, 23 Mar 2026 19:55:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C7DF1356
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9CB540287
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwlC5bRqAuok for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:55:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F07A4027F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F07A4027F
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:55:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB23F846FD; Mon, 23 Mar 2026 19:47:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 21 Mar 2026 21:23:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f2ff71c749eb48ca950f331b5f9a25058456404
X-Git-Newrev: 4f5f360350ec98ebbe775323d50b532e500d9915
X-Patchwork-Hint: ignore
Message-Id: <20260323194745.AB23F846FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpqxx: switch to CMake
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4f5f360350ec98ebbe775323d50b532e500d9915
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The upcoming version bump of gerbera includes optional PostgreSQL
support using libpqxx which will only be detected if libpqxx was built
with CMake:

Quoting the error message with libpqxx being built with autoconf:

CMake Error at CMakeLists.txt:685 (find_package):
  By not providing "Findlibpqxx.cmake" in CMAKE_MODULE_PATH this project has
  asked CMake to find a package configuration file provided by "libpqxx", but
  CMake did not find one.

  Could not find a package configuration file provided by "libpqxx" with any
  of the following names:

    libpqxxConfig.cmake
    libpqxx-config.cmake

  Add the installation prefix of "libpqxx" to CMAKE_PREFIX_PATH or set
  "libpqxx_DIR" to a directory containing one of the above files.  If
  "libpqxx" provides a separate development package or SDK, be sure it has
  been installed.

usr/lib/pkgconfig/libpqxx.pc is still provided by the CMake build system.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libpqxx/libpqxx.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index f19420dc41..492370f7f5 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -11,8 +11,4 @@ LIBPQXX_DEPENDENCIES = postgresql
 LIBPQXX_LICENSE = BSD-3-Clause
 LIBPQXX_LICENSE_FILES = COPYING
 
-LIBPQXX_CONF_ENV = \
-	ac_cv_path_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config \
-	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++17"
-
-$(eval $(autotools-package))
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
