Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1992C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70D68409F7;
	Tue,  1 Feb 2022 22:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L2aPwtEZbPnL; Tue,  1 Feb 2022 22:03:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49D0841521;
	Tue,  1 Feb 2022 22:03:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 051471BF424
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0158B41521
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x6Bbcxn1cR4A for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:03:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 969DB409F7
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:03:46 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id a8so58371847ejc.8
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 14:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=883HDtFM/KXalpZ4mMAsajaiOuee9LFH/+854glHppg=;
 b=dKqsr5O3+5ixoR6eUCGaJganVT11az6hcAy6RYFwmt0j8e76K7N71UET4eWwFATUVS
 R4mnYCrSl49H2zRCh3SBHRpi0Vx/RSqPuhkKOtAgZkcB/NCoZyZ8g1PRclfw4PAAtmYR
 /kpQVfS1lQ12+e7Ti6IeopcfAvDptn5BaekAxCdr2cvWghrEF07eS4uMF0i8eVlEgkjV
 DujWs2VVTompXktyayEEqhaO631P59p9QTcIUTYQuZMC+tSsyjYyVSm9z/ROfMocfFPb
 JcnNhpa/cSZoTjBYvtkxkCwDCEaWQNbAjycTm1TEWCZy6Uw7TnDm0eD29fZ5TCvvZE1j
 9c3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=883HDtFM/KXalpZ4mMAsajaiOuee9LFH/+854glHppg=;
 b=ayatHPflddhHE2XlERJCU2W8F4kx2QGdAzTPpKJQKLj75injxrH5L5XwYTYwr2pgoQ
 JiDAeJnte8zKRvAI8QzjihjbHh0W+a4MmstnTINtWExqDJ58YVxjgOqo+lnB+ilcLYo9
 yPPdWHO5aVOcixRAN8IHZuZ4aajhoaeeLD4xGpVofkd/5g9x5FpL8v5UWQdOeKugSkw4
 AW2Y7C0DtbxdX9a4fXaQAVgMUC66NAig/Ky7zEVsLNhhpAk61stCAj8EYLIohk0v/PCC
 GzeTEFQ5HiBz6Zzpmpv9rAModdfQ/PkQXuDldIDnsbnsEhTGmmDygEOJYIm4qXl+IGuu
 RjZw==
X-Gm-Message-State: AOAM530wywdSil2u1JgU9Q/I/dQ+GGvfvFY2zgvcHNJGEO+pcILLcUif
 4UXoG+jhOzaQ3XzEnlDysuFzNA==
X-Google-Smtp-Source: ABdhPJxPF3T1zjXBKKP8bvmjnBYuzpmKHnyr2W4J4OZJkJOJQD/oeh+Bc6hJsfUc2b9Do5qsishqhA==
X-Received: by 2002:a17:907:868e:: with SMTP id
 qa14mr22835790ejc.672.1643753024796; 
 Tue, 01 Feb 2022 14:03:44 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id rv28sm14600954ejb.71.2022.02.01.14.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 14:03:44 -0800 (PST)
Message-ID: <3d918cc7-c716-e867-f393-9418d08e7efb@mind.be>
Date: Tue, 1 Feb 2022 23:03:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20220126193431.17777-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220126193431.17777-1-ps.report@gmx.net>
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
 Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/01/2022 20:34, Peter Seiderer wrote:
> Add upstream patch ([1]) for v2.37 fixing linkig of thin archives (see [2] for
> details).
> 
> Fixes:
> 
>    .../host/bin/arm-buildroot-linux-gnueabihf-g++ [...] -o libQt5WebEngineCore.so.5.15.2 [...]
>    .../arm-buildroot-linux-gnueabihf/bin/ld: .../build/qt5webengine-5.15.2/src/core/release/obj/third_party/boringssl/libboringssl.a: error adding symbols: malformed archive
>    collect2: error: ld returned 1 exit status
>    make[5]: *** [Makefile.core_module:90: ../../lib/libQt5WebEngineCore.so.5.15.2] Error 1
>    make[4]: *** [Makefile:124: sub-core_module-pro-make_first] Error 2
>    make[3]: *** [Makefile:79: sub-core-make_first] Error 2
>    make[2]: *** [Makefile:49: sub-src-make_first] Error 2
>    make[1]: *** [package/pkg-generic.mk:295: .../build/qt5webengine-5.15.2/.stamp_built] Error 2
>    make: *** [Makefile:23: _all] Error 2
> 
> [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=1c611b40e6bfc8029bff7696814330b5bc0ee5c0
> [2] https://sourceware.org/bugzilla/show_bug.cgi?id=28138
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Notes:
>    - maybe the same failure as
> 
>      http://autobuild.buildroot.net/results/55c3c66c6c909853d47a470e0bbbab7186c83793
> 
>      .../host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/11.2.0/../../../../x86_64-buildroot-linux-gnu/bin/ld: src/intel/dev/libintel_dev.a: error adding symbols: malformed archive
> 
>      with BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
> ---
>   ...le-descriptor-if-there-is-no-archive.patch | 236 ++++++++++++++++++
>   1 file changed, 236 insertions(+)
>   create mode 100644 package/binutils/2.37/0006-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch
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
> +	PR ld/28138
> +	* plugin.c (bfd_plugin_close_file_descriptor): Close the file
> +	descriptor there is no archive plugin file descriptor.
> +
> +ld/
> +
> +	PR ld/28138
> +	* testsuite/ld-plugin/lto.exp: Run tmpdir/pr28138 only for
> +	native build.
> +
> +	PR ld/28138
> +	* testsuite/ld-plugin/lto.exp: Run ld/28138 tests.
> +	* testsuite/ld-plugin/pr28138.c: New file.
> +	* testsuite/ld-plugin/pr28138-1.c: Likewise.
> +	* testsuite/ld-plugin/pr28138-2.c: Likewise.
> +	* testsuite/ld-plugin/pr28138-3.c: Likewise.
> +	* testsuite/ld-plugin/pr28138-4.c: Likewise.
> +	* testsuite/ld-plugin/pr28138-5.c: Likewise.
> +	* testsuite/ld-plugin/pr28138-6.c: Likewise.
> +	* testsuite/ld-plugin/pr28138-7.c: Likewise.
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
> + 	     && !bfd_is_thin_archive (abfd->my_archive))
> + 	abfd = abfd->my_archive;
> +
> ++      /* Close the file descriptor if there is no archive plugin file
> ++	 descriptor.  */
> ++      if (abfd->archive_plugin_fd == -1)
> ++	{
> ++	  close (fd);
> ++	  return;
> ++	}
> ++
> +       abfd->archive_plugin_fd_open_count--;
> +       /* Dup the archive plugin file descriptor for later use, which
> + 	 will be closed by _bfd_archive_close_and_cleanup.  */
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
> ++	"Build pr28138.a" \
> ++	"-T" "" \
> ++	{pr28138-1.c pr28138-2.c pr28138-3.c pr28138-4.c pr28138-5.c \
> ++	 pr28138-6.c pr28138-7.c} {} "pr28138.a" \
> ++    ] \
> ++    [list \
> ++	"Build pr28138.o" \
> ++	"" "" \
> ++	{pr28138.c} {} \
> ++    ] \
> ++]
> ++
> ++set exec_output [run_host_cmd "sh" \
> ++			      "-c \"ulimit -n 20; \
> ++			      $CC -Btmpdir/ld -o tmpdir/pr28138 \
> ++			      tmpdir/pr28138.o tmpdir/pr28138.a\""]
> ++set exec_output [prune_warnings $exec_output]
> ++if [string match "" $exec_output] then {
> ++    if { [isnative] } {
> ++	set exec_output [run_host_cmd "tmpdir/pr28138" ""]
> ++	if [string match "PASS" $exec_output] then {
> ++	    pass "PR ld/28138"
> ++	} else {
> ++	    fail "PR ld/28138"
> ++	}
> ++    } else {
> ++	pass "PR ld/28138"
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
