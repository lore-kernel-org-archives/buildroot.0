Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CF3C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D815F810E7;
	Tue,  2 Jul 2024 19:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nnh72RHiivYG; Tue,  2 Jul 2024 19:40:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D71C81132
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D71C81132;
	Tue,  2 Jul 2024 19:40:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D5D2E1BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0331405CC
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJcnz2NlawAG for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:40:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A24F404FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A24F404FE
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A24F404FE
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:40:41 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-36742cc9c12so3036817f8f.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 12:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719949239; x=1720554039;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gdeNdLjuVeHBR7Hv9gBGnNVgKy9MojJN/MoSStx3gXc=;
 b=KPHLTyPTBUY/vDcnZ5HcT9xWQ6Ap4OTYNCrFNSRfZr/Nq7dHUq4wAxxR3a/kBf3wNJ
 kYAXcK7YJq+czMSt5pp3kqKFA8FySHVWdS+8Mclz6Z+uwP09Jdjih3gy21pjhGjeX8O2
 pU3ExMFjreYw/aqN7aWC0T6bzSiY0QAiprl205/z6OFp8fWt9Q7sfGoFBSEZzq53+Skm
 vQmUTuH+oZMgTVCMZT434+OyB44M0tayxq3ZT2htjn25u8vlfEa452SCqdYNjCZEJBhe
 Q1dEaNPzG8nvIavz6mSSopMqzJsRBZUC/5jd2JyfdYa+2j45F0xltZWoYhWU27fFX75I
 Tjnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTl/WlTY8Jm1/bKbJJx52mTPh+YRjsy/TYy9NwtMbaVN2ynMLqF7Kmz+Syk3v9dSadrFkTv9flGkR9yJR5uusFft/iQ8tJhg==
X-Gm-Message-State: AOJu0YzeAeI10IFrWT+mtJjSueEm7i8wvMawjkKn6xENuJ8Fnse8PyUe
 DC7cRf5j+aw9X3kicbkgAJMQ28oqUONe7lMPBjseZ09qGhbcSgD5C96wrrYgKotNbgNAEe5jp0X
 /
X-Google-Smtp-Source: AGHT+IGFGFnxhmaeIbolTdqkPj7FxLcP0KYNMXREB94YGZNoLgC5PBNIMQvM6QEKnEYaJF/DxqzsTA==
X-Received: by 2002:a5d:4946:0:b0:367:8fb5:ef87 with SMTP id
 ffacd0b85a97d-3678fb5f0c7mr878634f8f.37.1719949239051; 
 Tue, 02 Jul 2024 12:40:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fc4c9sm14050651f8f.86.2024.07.02.12.40.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 12:40:38 -0700 (PDT)
Message-ID: <1a92093f-3469-4a24-8ba8-65b4417fadce@mind.be>
Date: Tue, 2 Jul 2024 21:40:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240702113219.122631-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20240702113219.122631-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719949239; x=1720554039; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gdeNdLjuVeHBR7Hv9gBGnNVgKy9MojJN/MoSStx3gXc=;
 b=Twkb2fW+C4D1W/s4ldaQl2EXrlnpWmWq5uqt7MuRdac46d9G9OSYQ5gAk7UwfEh7/u
 xbff1bfoBkg2x9xzKSGmmMesYdN6QsQKrYnZe+ZRfIm+RL5wcG5Nzl1Rpgr/hlK9Ov4s
 B4pVERrRXVSOtkzi8GiTf12q7mF3RrfqCXcf3oN2cM96bt0H7uEXt31mNBriq/cmQGEw
 RrV2M/SCNEC8LiHS4MihQGH2cdu/v0FBDh90n9LwC+AcjYjDzymvfYweF6b1fB/BQ1nk
 kfO2gjlpf6LdT8SOLSsflbp1klJiez2jwRT21R4N47po2IfzOL0lFFIsohJ+dHHo91OM
 +ulA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Twkb2fW+
Subject: Re: [Buildroot] [PATCH 1/1] package/xfsprogs: fix patch fuzz
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/07/2024 13:32, Julien Olivain wrote:
> Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0" reduced the fuzz factor.
> 
> Due to this change, xfsprogs fails to build with output:
> 
>      Applying 0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch using patch:
>      patching file mdrestore/Makefile
>      Hunk #1 FAILED at 10.
>      1 out of 1 hunk FAILED -- saving rejects to file mdrestore/Makefile.rej
>      patching file scrub/Makefile
>      Hunk #1 FAILED at 70.
>      1 out of 1 hunk FAILED -- saving rejects to file scrub/Makefile.rej
> 
> This commit refreshes the package patches on the current package
> version. Note: the patch 0001 file name is changed because it was
> regenerated with the "git format-patch" command.
> 
> The patch 0001 had an "Upstream:" tag in brackets. The tag was not
> detected as such by check-package. This commit updates this tag. The
> patch 0002 is also marked with an alternative upstream commit, so it
> can be easily dropped at the next bump.
> 
> With those changes, the ".checkpackageignore" entries are no longer
> needed, so this commit removes those.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Note: this patch only fixes patches to fix the current v6.4.0 version.
> At the time of this patch, there is an upstream v6.8.0 available, but
> is not compiling in all situations, and need extra work. This is the
> reason why this patch is not proposing a bump.
> ---
>   .checkpackageignore                           |  2 --
>   ...o-not-do-dynamic-linking-of-libtool.patch} | 20 ++++++++++--------
>   ...-do-not-try-to-run-the-crc32selftest.patch | 21 +++++++++++--------
>   3 files changed, 23 insertions(+), 20 deletions(-)
>   rename package/xfsprogs/{0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch => 0001-mdrestore-scrub-do-not-do-dynamic-linking-of-libtool.patch} (74%)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 76b1c3c49ba..b7725077d3f 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1576,8 +1576,6 @@ package/xen/0004-libs-light-fix-tv_sec-fprintf-format.patch lib_patch.Upstream
>   package/xenomai/3.0.10/0001-lib-boilerplate-iniparser-Allow-building-with-GCC-10-2-2020101.patch lib_patch.Upstream
>   package/xenomai/3.0.10/0002-Add-disable-demo-testsuite-options.patch lib_patch.Upstream
>   package/xenomai/3.0.10/0003-lib-cobalt-copperplate-Use-valid-addresses-for-pthread_setspecific.patch lib_patch.Upstream
> -package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch lib_patch.Upstream
> -package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch lib_patch.Upstream
>   package/xinetd/0001-ar.patch lib_patch.Upstream
>   package/xinetd/0002-destdir.patch lib_patch.Upstream
>   package/xinetd/0003-rpc-fix.patch lib_patch.Upstream
> diff --git a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch b/package/xfsprogs/0001-mdrestore-scrub-do-not-do-dynamic-linking-of-libtool.patch
> similarity index 74%
> rename from package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
> rename to package/xfsprogs/0001-mdrestore-scrub-do-not-do-dynamic-linking-of-libtool.patch
> index 9030a2aac32..cb30e68db48 100644
> --- a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
> +++ b/package/xfsprogs/0001-mdrestore-scrub-do-not-do-dynamic-linking-of-libtool.patch
> @@ -1,4 +1,4 @@
> -From d5cbb4f43cc9c30100fbf18a3e0d1fb95e1c1b0a Mon Sep 17 00:00:00 2001
> +From fa3a4e036c8c78325216ed21eff6145aeb186686 Mon Sep 17 00:00:00 2001
>   From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>   Date: Wed, 25 Nov 2015 10:50:00 +0000
>   Subject: [PATCH] mdrestore, scrub: do not do dynamic linking of libtool
> @@ -11,23 +11,25 @@ linking for libuuid only. Otherwise the build will fail like this:
>   ld: attempted static link of dynamic object `/usr/lib/libuuid.so'
>   
>   Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> -[Sent upstream: https://www.spinics.net/lists/xfs/msg36149.html]
> +Upstream: Proposed: https://www.spinics.net/lists/xfs/msg36149.html
>   [baruch: update for v4.15.1; extend to include scrub]
>   Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>   [matt: update for v4.16.1; adjusted libunistring -> libicu]
>   Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> +[Julien: rebased on v6.4.0]
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
>   ---
>    mdrestore/Makefile | 2 +-
>    scrub/Makefile     | 2 +-
>    2 files changed, 2 insertions(+), 2 deletions(-)
>   
>   diff --git a/mdrestore/Makefile b/mdrestore/Makefile
> -index 136ae716d691..75ff1bad78e9 100644
> +index 4a932efb..7ea1fd45 100644
>   --- a/mdrestore/Makefile
>   +++ b/mdrestore/Makefile
>   @@ -10,7 +10,7 @@ CFILES = xfs_mdrestore.c
>    
> - LLDLIBS = $(LIBXFS) $(LIBFROG) $(LIBRT) $(LIBPTHREAD) $(LIBUUID)
> + LLDLIBS = $(LIBXFS) $(LIBFROG) $(LIBRT) $(LIBUUID) $(LIBURCU) $(LIBPTHREAD)
>    LTDEPENDENCIES = $(LIBXFS) $(LIBFROG)
>   -LLDFLAGS = -static
>   +LLDFLAGS = -static-libtool-libs
> @@ -35,12 +37,12 @@ index 136ae716d691..75ff1bad78e9 100644
>    default: depend $(LTCOMMAND)
>    
>   diff --git a/scrub/Makefile b/scrub/Makefile
> -index 063279400262..949f6fd8ba94 100644
> +index aba14ed2..f0ef492f 100644
>   --- a/scrub/Makefile
>   +++ b/scrub/Makefile
> -@@ -70,7 +70,7 @@ xfs_scrub.c
> -
> - LLDLIBS += $(LIBHANDLE) $(LIBFROG) $(LIBPTHREAD) $(LIBICU_LIBS) $(LIBRT)
> +@@ -71,7 +71,7 @@ xfs_scrub.c
> + LLDLIBS += $(LIBHANDLE) $(LIBFROG) $(LIBICU_LIBS) $(LIBRT) $(LIBURCU) \
> + 	$(LIBPTHREAD)
>    LTDEPENDENCIES += $(LIBHANDLE) $(LIBFROG)
>   -LLDFLAGS = -static
>   +LLDFLAGS = -static-libtool-libs
> @@ -48,5 +50,5 @@ index 063279400262..949f6fd8ba94 100644
>    ifeq ($(HAVE_MALLINFO),yes)
>    LCFLAGS += -DHAVE_MALLINFO
>   --
> -2.16.2
> +2.45.2
>   
> diff --git a/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch b/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch
> index 6778d069a1d..77bdc191270 100644
> --- a/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch
> +++ b/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch
> @@ -1,4 +1,4 @@
> -From 3a77dfc54271059dcac305384bf6ace34fe1f3d3 Mon Sep 17 00:00:00 2001
> +From 94ae5db7d017480e103aa6f07cc86648b613d114 Mon Sep 17 00:00:00 2001
>   From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>   Date: Sun, 18 Dec 2016 15:37:27 +0100
>   Subject: [PATCH] libxfs: do not try to run the crc32selftest
> @@ -19,17 +19,20 @@ generator is natively built, but with the target CFLAGS.
>   Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>   Signed-off-by: "Fabrice Fontaine" <fontaine.fabrice@gmail.com>
>   [Update for 4.18.0: crc32 has been moved from libxfs to libfrog]
> +[Julien: rebased on v6.4.0]
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> +Upstream: patch to be superseded by https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=e51b89e657af7843d8c7aea3df49fe1f0f1d4ac2
>   ---
> - libxfs/Makefile | 4 ++--
> + libfrog/Makefile | 4 ++--
>    1 file changed, 2 insertions(+), 2 deletions(-)
>   
> -diff --git a/libfrog/Makefile b/libxfs/Makefile
> -index 62608bd..e021625 100644
> +diff --git a/libfrog/Makefile b/libfrog/Makefile
> +index f292afe3..1d0d2083 100644
>   --- a/libfrog/Makefile
>   +++ b/libfrog/Makefile
> -@@ -112,9 +112,9 @@ LTLIBS = $(LIBPTHREAD) $(LIBRT)
> - # don't try linking xfs_repair with a debug libxfs.
> - DEBUG = -DNDEBUG
> +@@ -57,9 +57,9 @@ ifeq ($(HAVE_GETMNTENT),yes)
> + LCFLAGS += -DHAVE_GETMNTENT
> + endif
>    
>   -LDIRT = gen_crc32table crc32table.h crc32selftest
>   +LDIRT = gen_crc32table crc32table.h
> @@ -37,8 +40,8 @@ index 62608bd..e021625 100644
>   -default: crc32selftest ltdepend $(LTLIBRARY)
>   +default: ltdepend $(LTLIBRARY)
>    
> - crc32table.h: gen_crc32table.c
> + crc32table.h: gen_crc32table.c crc32defs.h
>    	@echo "    [CC]     gen_crc32table"
>   --
> -2.7.4
> +2.45.2
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
