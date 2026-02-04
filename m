Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CB0E83EF9
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 09:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3893606AA;
	Wed,  4 Feb 2026 09:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ze9xAew-RUYS; Wed,  4 Feb 2026 09:13:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B74C36077E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770196384;
	bh=Z6aNLehMTjTP8Pr9ZGV5luFhAixfEYb9yx6o+51Tc8E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U0P/BvFYjbDE/LJ46/PnlGJ5hUytq0Y0t27DNq/O/b9u/f2zZ50i8oNLktOwqkQHL
	 w/Wh/XkWpNJdctqnDyBvTb134c7ps8yFymwu5r6bwOUdPaMF78ZZ39JZb9SDeH4JFy
	 QrxJVadRTkPQZzsP4VtMOgXA4p+TcRepytLZzF/p6V4IN784vPQT5efmHH8Nk/3xUZ
	 ALAUNCfViQDblP+bGuE3/rd2kZTOkif8B5H2gdv+IXXHTN0R0Up4f1qN+XA9jAAx+z
	 VgPppgX86wnkUXqhOTTXJHg+kkZ7TWdmq99ZukpoB+717DU7kOdVoLBrJjsB7obQrE
	 thP37rJ6k7KUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B74C36077E;
	Wed,  4 Feb 2026 09:13:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FA0DF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FC84816DF
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkJxAFqLVgGK for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 09:13:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31D29816D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31D29816D9
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:13:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40F68867EB; Wed,  4 Feb 2026 09:13:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 10:12:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22ec30b5149bb9966c6d2b67b90ad80f4ca175e8
X-Git-Newrev: ef9f0a07ed40970a7de4c608a5708ef6ceb75131
X-Patchwork-Hint: ignore
Message-Id: <20260204091301.40F68867EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-cmake.mk: add
 Platform/Buildroot-Initialize.cmake
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ef9f0a07ed40970a7de4c608a5708ef6ceb75131
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since commit [1] (core/pkg-cmake: provide our own platform
description), Buildroot is setting its own CMake platform
description. This description applies minor changes on top of
the CMake Linux platform, see [2] and [3]. The CMake system specific
script tries to include an initialization script, if present.
See [4].

Since in commit [1] we set the CMAKE_SYSTEM_NAME to "Buildroot"
(rather than "Linux"), CMake will search for a
"Platform/Buildroot-Initialize.cmake" which does not exist, and
continue normally, since the include is optional.

The "Platform/Linux-Initialize.cmake" file is the one setting the
LINUX [6] and UNIX [7] variables, which are expected to be true on
a linux compatible system. In Buildroot, it is currently not
included, so those variables are unset.

If a CMake package in Buildroot has a construct such as:

    if(LINUX)
        # ...do things...
    else()
        message(FATAL_ERROR "System not supported")
    endif()

It will fail at configuration time.

This situation happened when trying to add the btop++ package
in Buildroot. See [8].

Since the initial intent of commit [1] was to make the Buildroot
CMake system inherit from Linux plus some fixups, this commit simply
adds a Buildroot-Initialize.cmake file that includes the
Linux-Initialize.cmake one from CMake. This will have the effect
to properly define the LINUX and UNIX variables.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/c69b14fe2f72d8134057b115884c04a2bf27d410
[2] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/support/misc/Buildroot.cmake#L1-4
[3] https://cmake.org/cmake/help/v4.2/variable/CMAKE_SYSTEM_NAME.html
[4] https://gitlab.kitware.com/cmake/cmake/-/blob/v4.2.1/Modules/CMakeSystemSpecificInitialize.cmake#L35
[5] https://gitlab.kitware.com/cmake/cmake/-/blob/v4.2.1/Modules/Platform/Linux-Initialize.cmake
[6] https://cmake.org/cmake/help/v4.2/variable/LINUX.html
[7] https://cmake.org/cmake/help/v4.2/variable/UNIX.html
[8] https://github.com/aristocratos/btop/blob/v1.4.6/CMakeLists.txt#L76

Reported-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Tested-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-cmake.mk                    | 2 ++
 support/misc/Buildroot-Initialize.cmake | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index ba287d244a..f572bdebb3 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -287,6 +287,8 @@ define TOOLCHAIN_CMAKE_INSTALL_FILES
 		> $(HOST_DIR)/share/buildroot/toolchainfile.cmake
 	$(Q)$(INSTALL) -D -m 0644 support/misc/Buildroot.cmake \
 		$(HOST_DIR)/share/buildroot/Platform/Buildroot.cmake
+	$(Q)$(INSTALL) -D -m 0644 support/misc/Buildroot-Initialize.cmake \
+		$(HOST_DIR)/share/buildroot/Platform/Buildroot-Initialize.cmake
 endef
 
 TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_CMAKE_INSTALL_FILES
diff --git a/support/misc/Buildroot-Initialize.cmake b/support/misc/Buildroot-Initialize.cmake
new file mode 100644
index 0000000000..3451562f08
--- /dev/null
+++ b/support/misc/Buildroot-Initialize.cmake
@@ -0,0 +1 @@
+include(Platform/Linux-Initialize)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
