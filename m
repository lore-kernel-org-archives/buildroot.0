Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94C0C2BA4C
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 20:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8842F400C7;
	Wed, 26 Jan 2022 20:09:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1s2ckc41pfLH; Wed, 26 Jan 2022 20:09:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29E07400E3;
	Wed, 26 Jan 2022 20:09:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B9611BF4D5
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38C1260DC2
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:09:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dFEWenkXKOd1 for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 20:09:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AEB760B1B
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:09:36 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id x193so1889912oix.0
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 12:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LJ7XvsEgbBjcrAvF3qTbR6xx1z0fkcReJPfOVqtWE7c=;
 b=K0q8P1PNI0uOLAyy2f0vc5+CXfnRMwqVAJfkE/yCgj1YbuemLVa0vfTssuZSQegaKG
 xQzo57dCn8bRvAE+CivG9Eq71rJHLyCe0YpCjFgE5R4JxXtv7a+EZkS32Ixhj7+z33S3
 BgwsWtSsTEIFd4Si7v1PnydnAnZKFdmA3jKkzKAZydhfZFLwTcELzlIxlKUhSXwnVe76
 7s7OugK9tQt8CFdvzxMc6HJGUnJtX5/tCmIFF3QKHR1kQ4YRgVVNtQfUpi/9Rn64B9ZK
 4feoO4QCDvBgg8C7v70tj8IGqjxSAYU9q0PftDzs6QfbX7OQsdQoYQ88CXudJ123iort
 D8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LJ7XvsEgbBjcrAvF3qTbR6xx1z0fkcReJPfOVqtWE7c=;
 b=YVFL+iyASpohQwKqddvIZDJgqGuIp4sPKtjHDLN8NCiLcmi/6AZjF3UOx0wDAS21q1
 hWcmI4CfmQ9THc1Sh1emnk2UzX1i5VC9A1yjQhLy0ReIIkS7gGck0YnAK6K7Azg2R6UC
 S0ZtdmI9ge+ZH3eSBJDQpkGhmFtV+/Ktgd7JlRn1kJvydQq09UkWZGsajm3tEbWCFaE9
 bVlaKCFeXpDMIyNLDxd9jgcILhJzx9UPgmjCHFr0Gm7Jv+uwzWjYjJAXFNrGSAvVQHGa
 I+T9umGhBrnGogLYQ8jmH1N/b/Qi8yh339pn3JOLam0OPd2h7/zKNSylecl18YaOyIlw
 CuFw==
X-Gm-Message-State: AOAM5324d/FyNFcO4mpI8ycs0JLMQv6n7+v4adoizHYKybGq8lF/Wyi9
 ZGRAYA0mzhO11QRA0tYUxENbmx0v8OvKW9FHyKk=
X-Google-Smtp-Source: ABdhPJxbOQd0oOXdAKfN/uwObzhB59DKSNcshzhuZ02RcA72Mz6lfDfxpEQ2h3JCvz+oej51JjytP4JxCC/mpzuoKTI=
X-Received: by 2002:a05:6808:1184:: with SMTP id
 j4mr152259oil.73.1643227775589; 
 Wed, 26 Jan 2022 12:09:35 -0800 (PST)
MIME-Version: 1.0
References: <20220126193431.17777-1-ps.report@gmx.net>
In-Reply-To: <20220126193431.17777-1-ps.report@gmx.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 26 Jan 2022 13:09:24 -0700
Message-ID: <CADvTj4ojw9cKakHnk062npAX2r1Ou+i09YD+6+S0E-2YdLT0Eg@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/binutils: add upstream patch for
 v2.37 fixing linking of thin archives
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jan 26, 2022 at 12:34 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> Add upstream patch ([1]) for v2.37 fixing linkig of thin archives (see [2] for
> details).
>
> Fixes:
>
>   .../host/bin/arm-buildroot-linux-gnueabihf-g++ [...] -o libQt5WebEngineCore.so.5.15.2 [...]
>   .../arm-buildroot-linux-gnueabihf/bin/ld: .../build/qt5webengine-5.15.2/src/core/release/obj/third_party/boringssl/libboringssl.a: error adding symbols: malformed archive
>   collect2: error: ld returned 1 exit status
>   make[5]: *** [Makefile.core_module:90: ../../lib/libQt5WebEngineCore.so.5.15.2] Error 1
>   make[4]: *** [Makefile:124: sub-core_module-pro-make_first] Error 2
>   make[3]: *** [Makefile:79: sub-core-make_first] Error 2
>   make[2]: *** [Makefile:49: sub-src-make_first] Error 2
>   make[1]: *** [package/pkg-generic.mk:295: .../build/qt5webengine-5.15.2/.stamp_built] Error 2
>   make: *** [Makefile:23: _all] Error 2
>
> [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=1c611b40e6bfc8029bff7696814330b5bc0ee5c0
> [2] https://sourceware.org/bugzilla/show_bug.cgi?id=28138
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Notes:
>   - maybe the same failure as
>
>     http://autobuild.buildroot.net/results/55c3c66c6c909853d47a470e0bbbab7186c83793
>
>     .../host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/11.2.0/../../../../x86_64-buildroot-linux-gnu/bin/ld: src/intel/dev/libintel_dev.a: error adding symbols: malformed archive
>
>     with BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
> ---
>  ...le-descriptor-if-there-is-no-archive.patch | 236 ++++++++++++++++++
>  1 file changed, 236 insertions(+)
>  create mode 100644 package/binutils/2.37/0006-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch
>
> diff --git a/package/binutils/2.37/0006-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch b/package/binutils/2.37/0006-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch
> new file mode 100644
> index 0000000000..46697cc5c8
> --- /dev/null
> +++ b/package/binutils/2.37/0006-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch
> @@ -0,0 +1,236 @@
> +From 1c611b40e6bfc8029bff7696814330b5bc0ee5c0 Mon Sep 17 00:00:00 2001
> +From: "H.J. Lu" <hjl.tools@gmail.com>
> +Date: Mon, 26 Jul 2021 05:59:55 -0700
> +Subject: [PATCH] bfd: Close the file descriptor if there is no archive fd
> +
> +Close the file descriptor if there is no archive plugin file descriptor
> +to avoid running out of file descriptors on thin archives with many
> +archive members.
> +
> +bfd/
> +
> +       PR ld/28138
> +       * plugin.c (bfd_plugin_close_file_descriptor): Close the file
> +       descriptor there is no archive plugin file descriptor.
> +
> +ld/
> +
> +       PR ld/28138
> +       * testsuite/ld-plugin/lto.exp: Run tmpdir/pr28138 only for
> +       native build.
> +
> +       PR ld/28138
> +       * testsuite/ld-plugin/lto.exp: Run ld/28138 tests.
> +       * testsuite/ld-plugin/pr28138.c: New file.
> +       * testsuite/ld-plugin/pr28138-1.c: Likewise.
> +       * testsuite/ld-plugin/pr28138-2.c: Likewise.
> +       * testsuite/ld-plugin/pr28138-3.c: Likewise.
> +       * testsuite/ld-plugin/pr28138-4.c: Likewise.
> +       * testsuite/ld-plugin/pr28138-5.c: Likewise.
> +       * testsuite/ld-plugin/pr28138-6.c: Likewise.
> +       * testsuite/ld-plugin/pr28138-7.c: Likewise.
> +
> +(cherry picked from commit 5a98fb7513b559e20dfebdbaa2a471afda3b4742)
> +(cherry picked from commit 7dc37e1e1209c80e0bab784df6b6bac335e836f2)
> +
> +[Upstream:
> + https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=1c611b40e6bfc8029bff7696814330b5bc0ee5c0]
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + bfd/plugin.c                       |  8 +++++++
> + ld/testsuite/ld-plugin/lto.exp     | 34 ++++++++++++++++++++++++++++++
> + ld/testsuite/ld-plugin/pr28138-1.c |  6 ++++++
> + ld/testsuite/ld-plugin/pr28138-2.c |  6 ++++++
> + ld/testsuite/ld-plugin/pr28138-3.c |  6 ++++++
> + ld/testsuite/ld-plugin/pr28138-4.c |  6 ++++++
> + ld/testsuite/ld-plugin/pr28138-5.c |  6 ++++++
> + ld/testsuite/ld-plugin/pr28138-6.c |  6 ++++++
> + ld/testsuite/ld-plugin/pr28138-7.c |  6 ++++++
> + ld/testsuite/ld-plugin/pr28138.c   | 20 ++++++++++++++++++
> + 10 files changed, 104 insertions(+)
> + create mode 100644 ld/testsuite/ld-plugin/pr28138-1.c
> + create mode 100644 ld/testsuite/ld-plugin/pr28138-2.c
> + create mode 100644 ld/testsuite/ld-plugin/pr28138-3.c
> + create mode 100644 ld/testsuite/ld-plugin/pr28138-4.c
> + create mode 100644 ld/testsuite/ld-plugin/pr28138-5.c
> + create mode 100644 ld/testsuite/ld-plugin/pr28138-6.c
> + create mode 100644 ld/testsuite/ld-plugin/pr28138-7.c
> + create mode 100644 ld/testsuite/ld-plugin/pr28138.c
> +
> +diff --git a/bfd/plugin.c b/bfd/plugin.c
> +index 6cfa2b66470..3bab8febe88 100644
> +--- a/bfd/plugin.c
> ++++ b/bfd/plugin.c
> +@@ -291,6 +291,14 @@ bfd_plugin_close_file_descriptor (bfd *abfd, int fd)
> +            && !bfd_is_thin_archive (abfd->my_archive))
> +       abfd = abfd->my_archive;
> +
> ++      /* Close the file descriptor if there is no archive plugin file
> ++       descriptor.  */
> ++      if (abfd->archive_plugin_fd == -1)
> ++      {
> ++        close (fd);
> ++        return;
> ++      }
> ++
> +       abfd->archive_plugin_fd_open_count--;
> +       /* Dup the archive plugin file descriptor for later use, which
> +        will be closed by _bfd_archive_close_and_cleanup.  */
> +diff --git a/ld/testsuite/ld-plugin/lto.exp b/ld/testsuite/ld-plugin/lto.exp
> +index def69e43ab3..999d911ce6a 100644
> +--- a/ld/testsuite/ld-plugin/lto.exp
> ++++ b/ld/testsuite/ld-plugin/lto.exp
> +@@ -687,6 +687,40 @@ if { [is_elf_format] && [check_lto_shared_available] } {
> +     }
> + }
> +
> ++run_cc_link_tests [list \
> ++    [list \
> ++      "Build pr28138.a" \
> ++      "-T" "" \
> ++      {pr28138-1.c pr28138-2.c pr28138-3.c pr28138-4.c pr28138-5.c \
> ++       pr28138-6.c pr28138-7.c} {} "pr28138.a" \
> ++    ] \
> ++    [list \
> ++      "Build pr28138.o" \
> ++      "" "" \
> ++      {pr28138.c} {} \
> ++    ] \
> ++]
> ++
> ++set exec_output [run_host_cmd "sh" \
> ++                            "-c \"ulimit -n 20; \
> ++                            $CC -Btmpdir/ld -o tmpdir/pr28138 \
> ++                            tmpdir/pr28138.o tmpdir/pr28138.a\""]
> ++set exec_output [prune_warnings $exec_output]
> ++if [string match "" $exec_output] then {
> ++    if { [isnative] } {
> ++      set exec_output [run_host_cmd "tmpdir/pr28138" ""]
> ++      if [string match "PASS" $exec_output] then {
> ++          pass "PR ld/28138"
> ++      } else {
> ++          fail "PR ld/28138"
> ++      }
> ++    } else {
> ++      pass "PR ld/28138"
> ++    }
> ++} else {
> ++    fail "PR ld/28138"
> ++}
> ++
> + set testname "Build liblto-11.a"
> + remote_file host delete "tmpdir/liblto-11.a"
> + set catch_output [run_host_cmd "$ar" "rc $plug_opt tmpdir/liblto-11.a tmpdir/lto-11a.o tmpdir/lto-11b.o tmpdir/lto-11c.o"]
> +diff --git a/ld/testsuite/ld-plugin/pr28138-1.c b/ld/testsuite/ld-plugin/pr28138-1.c
> +new file mode 100644
> +index 00000000000..51d119e1642
> +--- /dev/null
> ++++ b/ld/testsuite/ld-plugin/pr28138-1.c
> +@@ -0,0 +1,6 @@
> ++extern int a0(void);
> ++int
> ++a1(void)
> ++{
> ++  return 1 + a0();
> ++}
> +diff --git a/ld/testsuite/ld-plugin/pr28138-2.c b/ld/testsuite/ld-plugin/pr28138-2.c
> +new file mode 100644
> +index 00000000000..1120cd797e9
> +--- /dev/null
> ++++ b/ld/testsuite/ld-plugin/pr28138-2.c
> +@@ -0,0 +1,6 @@
> ++extern int a1(void);
> ++int
> ++a2(void)
> ++{
> ++  return 1 + a1();
> ++}
> +diff --git a/ld/testsuite/ld-plugin/pr28138-3.c b/ld/testsuite/ld-plugin/pr28138-3.c
> +new file mode 100644
> +index 00000000000..ec464947ee6
> +--- /dev/null
> ++++ b/ld/testsuite/ld-plugin/pr28138-3.c
> +@@ -0,0 +1,6 @@
> ++extern int a2(void);
> ++int
> ++a3(void)
> ++{
> ++  return 1 + a2();
> ++}
> +diff --git a/ld/testsuite/ld-plugin/pr28138-4.c b/ld/testsuite/ld-plugin/pr28138-4.c
> +new file mode 100644
> +index 00000000000..475701b2c5c
> +--- /dev/null
> ++++ b/ld/testsuite/ld-plugin/pr28138-4.c
> +@@ -0,0 +1,6 @@
> ++extern int a3(void);
> ++int
> ++a4(void)
> ++{
> ++  return 1 + a3();
> ++}
> +diff --git a/ld/testsuite/ld-plugin/pr28138-5.c b/ld/testsuite/ld-plugin/pr28138-5.c
> +new file mode 100644
> +index 00000000000..e24f86c363e
> +--- /dev/null
> ++++ b/ld/testsuite/ld-plugin/pr28138-5.c
> +@@ -0,0 +1,6 @@
> ++extern int a4(void);
> ++int
> ++a5(void)
> ++{
> ++  return 1 + a4();
> ++}
> +diff --git a/ld/testsuite/ld-plugin/pr28138-6.c b/ld/testsuite/ld-plugin/pr28138-6.c
> +new file mode 100644
> +index 00000000000..b5b938bdb21
> +--- /dev/null
> ++++ b/ld/testsuite/ld-plugin/pr28138-6.c
> +@@ -0,0 +1,6 @@
> ++extern int a5(void);
> ++int
> ++a6(void)
> ++{
> ++  return 1 + a5();
> ++}
> +diff --git a/ld/testsuite/ld-plugin/pr28138-7.c b/ld/testsuite/ld-plugin/pr28138-7.c
> +new file mode 100644
> +index 00000000000..4ef75bf0f0c
> +--- /dev/null
> ++++ b/ld/testsuite/ld-plugin/pr28138-7.c
> +@@ -0,0 +1,6 @@
> ++extern int a6(void);
> ++int
> ++a7(void)
> ++{
> ++  return 1 + a6();
> ++}
> +diff --git a/ld/testsuite/ld-plugin/pr28138.c b/ld/testsuite/ld-plugin/pr28138.c
> +new file mode 100644
> +index 00000000000..68252c9f382
> +--- /dev/null
> ++++ b/ld/testsuite/ld-plugin/pr28138.c
> +@@ -0,0 +1,20 @@
> ++#include <stdio.h>
> ++
> ++extern int a7(void);
> ++
> ++int
> ++a0(void)
> ++{
> ++  return 0;
> ++}
> ++
> ++int
> ++main()
> ++{
> ++  if (a7() == 7)
> ++    {
> ++      printf ("PASS\n");
> ++      return 0;
> ++    }
> ++  return 1;
> ++}
> +--
> +2.34.1
> +
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
