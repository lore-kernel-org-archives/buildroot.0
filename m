Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C5FC46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 13:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A4BF408A2;
	Sat,  6 Jan 2024 13:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A4BF408A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tHoGGZ-j2hf4; Sat,  6 Jan 2024 13:10:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 774CD4174C;
	Sat,  6 Jan 2024 13:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 774CD4174C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 336F71BF59A
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 13:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08402405F7
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 13:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08402405F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANcPWaIM0LmL for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 13:10:43 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72198401CC
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 13:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72198401CC
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6356B13F86E;
 Sat,  6 Jan 2024 14:10:39 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 14:10:26 +0100
Message-ID: <20240106131026.127457-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704546640;
 bh=fQcV3gnhP41ILr15i+P1joWY//mvtlNj1Sihm4cHZmc=;
 h=From:To:Cc:Subject:Date:From;
 b=fRWkK1Lu/eCncMxyTa1/RmhmdstBxuueF5wQCu5/ZB4Hx1d03Zuv66AHbglJdgrn0
 G9lAKLXWlB3fZnk0/LU4koDNPUCN9WzsGq2s9Dm2j+B2BI5t6L/3YLwurajbNhW6vK
 cTeeE8XdaKsF9RikOvHWQC9HUrYDYcqjJ50Ymg8SNSgsAdmq6pJ15Lrw+2kmZh6VQk
 J0NfKYFT8BD21VARbqqobcs+bjiHda89LFL+WpJtcq04292KOCHe5sjfSp9Ju2e1CX
 ujqmX1HgkfhJH6L9i3Rbrh8fdlBc9n0XFQszw/IDG9dcOTe+yRFWlLJrwArC1nCD1A
 loVPFOx2eACQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fRWkK1Lu
Subject: [Buildroot] [PATCH v2 1/1] package/octave: add libreadline search
 prefix
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GNU Octave changed its detection of readline library in [1]. This
commit was first included in version 8.1.0.

GNU Octave was updated to 8.1.0 in Buildroot in commit b36e4b10f3
"package/octave: bump to version 8.1.0".

Since this commit, Octave can fail to find readline automatically in
some specific situations. For example, when host system is Fedora 39
and the host "readline-devel" package is installed (see detailed
explanation below).

Octave is now using a m4 macro from gnulib to detect readline.
See [2].

This macro is calling AC_LIB_LINKFLAGS_BODY([readline]). Note that
this macro will look into $libdir and $includedir by default. See [3].

Buildroot is calling target autotools configure command with
--prefix=/usr and --exec-prefix=/usr arguments. See [4].

Autotools derives libdir='${exec_prefix}/lib' and
includedir='${prefix}/include'.

Finally, gnulib will also search automatically into alternate library
directories (i.e. lib32, lib64). See [5].

All of this will make the configure script searching the readline
library by default (i.e. if the library prefix is not provided) into
the host "/usr/lib", "/usr/lib32" and "/usr/lib64", when configuring
for target.

This issue is not happening on the Buildroot docker reference image,
because the package "libreadline-dev" is not present in this image.

Even if the package "libreadline-dev" is installed on a Debian based
host systems, the issue is still not happening because libraries are
installed in the path "/usr/lib/x86_64-linux-gnu", which is not
searched by gnulib macros.

On host systems which installs libraries into one of the
"/usr/lib{,32,64}" directories, the Octave configuration script will
fail, because it will detect the host library and try to link against
it with target architecture and compilation flags and will fail. Since
the --enable-readline configure option is present, the configuration
script will fail because it cannot find a working readline library.

This can be seen in the octave configuration log, in file:
output/build/octave-8.4.0/config.log

    configure:73671: checking for readline
    configure:73705: /buildroot/output/host/bin/aarch64-none-linux-gnu-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -pthread -fopenmp -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lpthread -lm  /usr/lib64/libreadline.so >&5
    /buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-none-linux-gnu/13.2.1/../../../../aarch64-none-linux-gnu/bin/ld: /usr/lib64/libreadline.so: error adding symbols: file in wrong format
    collect2: error: ld returned 1 exit status

This situation can be reproduced on a Fedora 39 x86_64 host system,
with the "readline-devel" package installed. Note: uninstalling the
"readline-devel" will work around the issue.

The issue can be reproduced with a Buildroot configuration such as:

    cat > .config <<EOF
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PACKAGE_OCTAVE=y
    BR2_PACKAGE_READLINE=y
    EOF
    make olddefconfig
    make

In order to avoid those host/target readline detection mix-ups, the
readline search prefix need to be explicitly passed during octave
configuration. This commit adds this search prefix to fix this build
issue.

Fixes:

    checking for readline... (cached) no
    checking for readline/readline.h... (cached) yes
    checking for readline/history.h... (cached) yes
    configure: WARNING: I need GNU Readline 4.2 or later
    configure: error: this is fatal unless you specify --disable-readline

[1] https://github.com/gnu-octave/octave/commit/3645c78658c4c66f2bc346fdbc5c7c77d8d8dd12
[2] https://git.savannah.gnu.org/cgit/gnulib.git/tree/m4/readline.m4?id=2cdc1bafb20b187ad067056e090fcb4396ed9099
[3] https://git.savannah.gnu.org/cgit/gnulib.git/tree/m4/lib-link.m4?id=2cdc1bafb20b187ad067056e090fcb4396ed9099#n190
[4] https://gitlab.com/buildroot.org/buildroot/-/blob/2023.11/package/pkg-autotools.mk#L175
[5] https://git.savannah.gnu.org/cgit/gnulib.git/tree/m4/lib-prefix.m4?id=2cdc1bafb20b187ad067056e090fcb4396ed9099#n276

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
- Rewrote the commit log to include the full analysis.
  The root cause was more complex that initially thought,
  and the issue was not reproduced in Buildroot reference
  docker image.
  The patch content is exactly the same as v1.
---
 package/octave/octave.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index cae0de7620..f240a5057c 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -20,7 +20,9 @@ OCTAVE_DEPENDENCIES = \
 	pcre2
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
-OCTAVE_CONF_OPTS += --enable-readline
+OCTAVE_CONF_OPTS += \
+	--enable-readline \
+	--with-libreadline-prefix=$(STAGING_DIR)/usr
 OCTAVE_DEPENDENCIES += readline
 else
 OCTAVE_CONF_OPTS += --disable-readline
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
