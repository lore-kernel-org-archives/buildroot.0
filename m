Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2946AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 08:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77BCD40515;
	Fri, 28 Jan 2022 08:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xfYzx2iyS4bx; Fri, 28 Jan 2022 08:11:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0121B40570;
	Fri, 28 Jan 2022 08:11:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 07AD61BF867
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 08:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EADAD416CC
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 08:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nKdpim6m3m4Z for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 08:11:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77AE6409B1
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 08:11:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D3C6A829F4; Fri, 28 Jan 2022 08:04:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 09:10:44 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 3da77e6b2555a35ead4807e39c5520822f7142df
X-Git-Newrev: 08b34bc3920106a78c6b0cdfb17ceb5b86621aec
X-Patchwork-Hint: ignore
Message-Id: <20220128080408.D3C6A829F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/erlang: bump to
 version 22.3.4.22
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

commit: https://git.buildroot.net/buildroot/commit/?id=08b34bc3920106a78c6b0cdfb17ceb5b86621aec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

- Drop third patch (already in version)
- Fix build failure with autoconf >= 2.70 raised since commit
  ecd54b65c1f998a7ccd91f7c523e4ff38c4781da

Fixes:
 - http://autobuild.buildroot.org/results/4f52b2f194dcfd619fefb192d1c0fd070d5bd408

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2ad6a3a428831b343823ee3bd95d8d5813a0697c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-avoid-ODR-violation-of-ei_default_socket.patch | 54 ----------------------
 package/erlang/erlang.hash                         |  9 ++--
 package/erlang/erlang.mk                           |  7 +--
 3 files changed, 9 insertions(+), 61 deletions(-)

diff --git a/package/erlang/0003-ei_portio.h-avoid-ODR-violation-of-ei_default_socket.patch b/package/erlang/0003-ei_portio.h-avoid-ODR-violation-of-ei_default_socket.patch
deleted file mode 100644
index 69b6fae81f..0000000000
--- a/package/erlang/0003-ei_portio.h-avoid-ODR-violation-of-ei_default_socket.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From de870d7f9f36b3e68f280057851a4585a67ab219 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyfox@gentoo.org>
-Date: Tue, 14 Jan 2020 23:15:01 +0000
-Subject: [PATCH] ei_portio.h: avoid ODR violation of
- 'ei_default_socket_callbacks'
-
-Noticed as a build failure against fresh gcc-master:
-
-```
-LD otp/lib/erl_interface/bin/x86_64-unknown-linux-gnu/erl_call
-ld: otp/lib/erl_interface/obj/x86_64-unknown-linux-gnu/libei.a(eirecv.o):otp/lib/erl_interface/src/misc/ei_portio.h:50: multiple definition of `ei_default_socket_callbacks'; otp/lib/erl_interface/obj/x86_64-unknown-linux-gnu/libei.a(ei_connect.o):otp/lib/erl_interface/src/misc/ei_portio.h:50: first defined here
-ld: otp/lib/erl_interface/obj/x86_64-unknown-linux-gnu/libei.a(send.o):otp/lib/erl_interface/src/misc/ei_portio.h:50: multiple definition of `ei_default_socket_callbacks'; otp/lib/erl_interface/obj/x86_64-unknown-linux-gnu/libei.a(ei_connect.o):otp/lib/erl_interface/src/misc/ei_portio.h:50: first defined here
-ld: otp/lib/erl_interface/obj/x86_64-unknown-linux-gnu/libei.a(send_reg.o):otp/lib/erl_interface/src/misc/ei_portio.h:50: multiple definition of `ei_default_socket_callbacks'; otp/lib/erl_interface/obj/x86_64-unknown-linux-gnu/libei.a(ei_connect.o):otp/lib/erl_interface/src/misc/ei_portio.h:50: first defined here
-ld: otp/lib/erl_interface/obj/x86_64-unknown-linux-gnu/libei.a(epmd_port.o):otp/lib/erl_interface/src/misc/ei_portio.h:50: multiple definition of `ei_default_socket_callbacks'; otp/lib/erl_interface/obj/x86_64-unknown-linux-gnu/libei.a(ei_connect.o):otp/lib/erl_interface/src/misc/ei_portio.h:50: first defined here
-ld: otp/lib/erl_interface/obj/x86_64-unknown-linux-gnu/libei.a(ei_portio.o):otp/lib/erl_interface/src/misc/ei_portio.h:50: multiple definition of `ei_default_socket_callbacks'; otp/lib/erl_interface/obj/x86_64-unknown-linux-gnu/libei.a(ei_connect.o):otp/lib/erl_interface/src/misc/ei_portio.h:50: first defined here
-collect2: error: ld returned 1 exit status
-make[3]: *** [x86_64-unknown-linux-gnu/Makefile:669: otp/lib/erl_interface/bin/x86_64-unknown-linux-gnu/erl_call] Error 1
-```
-
-The failure looks legitimate: `ei_default_socket_callbacks` is a
-struct defined in 'ei_portio.h' and in 'ei_portio.c'.
-
-The change flips 'ei_portio.h' definition to declaration.
-
-gcc-10 will change the default from -fcommon to fno-common:
-https://gcc.gnu.org/PR85678.
-
-The error also happens if CFLAGS=-fno-common passed explicitly.
-
-Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
-
-Patch taken from upstream: https://github.com/erlang/otp/commit/de870d7f9f36b3e68f280057851a4585a67ab219
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- lib/erl_interface/src/misc/ei_portio.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/erl_interface/src/misc/ei_portio.h b/lib/erl_interface/src/misc/ei_portio.h
-index 84ebc5039a..5172d085b4 100644
-
---- a/lib/erl_interface/src/misc/ei_portio.h
-+++ b/lib/erl_interface/src/misc/ei_portio.h
-@@ -47,7 +47,7 @@ int ei_writev_fill_ctx_t__(ei_socket_callbacks *cbs, void *ctx, const struct iov
- int ei_socket_callbacks_have_writev__(ei_socket_callbacks *cbs);
- #endif
- 
--ei_socket_callbacks ei_default_socket_callbacks;
-+extern ei_socket_callbacks ei_default_socket_callbacks;
- 
- #define EI_FD_AS_CTX__(FD)                                              \
-     ((void *) (long) (FD))
--- 
-2.20.1
-
diff --git a/package/erlang/erlang.hash b/package/erlang/erlang.hash
index 3c2f039496..338545a0ba 100644
--- a/package/erlang/erlang.hash
+++ b/package/erlang/erlang.hash
@@ -1,4 +1,5 @@
-# md5 from http://www.erlang.org/download/MD5, sha256 locally computed
-md5 b2b48dad6e69c1e882843edbf2abcfd3  otp_src_22.2.tar.gz
-sha256 89c2480cdac566065577c82704a48e10f89cf2e6ca5ab99e1cf80027784c678f  otp_src_22.2.tar.gz
-sha256 809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0  LICENSE.txt
+# From https://github.com/erlang/otp/releases/download/OTP-22.3.4.22/SHA256.txt
+sha256  e7f0793e62f8da4f7551dc9c1c0de76c40f19773ba516121fc56315c840f60cc  otp_src_22.3.4.22.tar.gz
+
+# Hash for license file
+sha256  809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0  LICENSE.txt
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 527eb15a00..ac2c204a49 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -5,8 +5,9 @@
 ################################################################################
 
 # See note below when updating Erlang
-ERLANG_VERSION = 22.2
-ERLANG_SITE = http://www.erlang.org/download
+ERLANG_VERSION = 22.3.4.22
+ERLANG_SITE = \
+	https://github.com/erlang/otp/releases/download/OTP-$(ERLANG_VERSION)
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
 ERLANG_DEPENDENCIES = host-erlang
 
@@ -37,7 +38,7 @@ HOST_ERLANG_PRE_CONFIGURE_HOOKS += ERLANG_RUN_AUTOCONF
 
 # Whenever updating Erlang, this value should be updated as well, to the
 # value of EI_VSN in the file lib/erl_interface/vsn.mk
-ERLANG_EI_VSN = 3.13.1
+ERLANG_EI_VSN = 3.13.2.2
 
 # The configure checks for these functions fail incorrectly
 ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
