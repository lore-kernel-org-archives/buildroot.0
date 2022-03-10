Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E19C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 20:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 582B384792;
	Thu, 10 Mar 2022 20:15:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rx6syBxF8D3T; Thu, 10 Mar 2022 20:15:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78F9E8478F;
	Thu, 10 Mar 2022 20:15:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F0BB81BF331
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC5ED60D94
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:15:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7V_CV-atPQCY for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 20:15:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A114060B8D
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:15:44 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id c20so8419570edr.8
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 12:15:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X40iV/KBHjpEBc8U2jXNyTTf/8+kCa54v+J8bVptVlE=;
 b=mxcfCo0tu+DdtFQxeDdn0Fa4KM5/ZE7Zm0pIP5e8Ij5n9POVzzSvZRKY8mCcdtT/TP
 9Z/kq4q95uFPUgiOzGLLRadoUQljFPqacL3BQVFw9taeRsgJw81NEiY5/YfTJXb8GU24
 pIzEOMoPY+FfkIsB5bqL5dd2LKz1alZffQoSKzP2FsnxTPEKod+O3gVSmuoaTmaPxdSh
 cj0rp6J4USLcXhaDEK6QENN1f/lUCIWx9xwEVSlYObuFtXeXKUudnGTVQvMlJoDX2+VK
 uA/Ce/7azws4nueikhcNPX27iBVKzMSbL304LqonYy6EpHBSgVq3WmT1QtaBr9UNIUVj
 w5tw==
X-Gm-Message-State: AOAM5330kkCq7eeN9RpaeRlcqFKmZCdOhbidWyTOcesJ1ddyastC2F5x
 TC09OgiPuPybXe+VNLmSbwE=
X-Google-Smtp-Source: ABdhPJydRCexsz4X8Sczq67N5Pqge4M1ACF3VD1m9KUYfmmmfZtNQJ0NwgQBYlFj10VQfzzBkaYcBQ==
X-Received: by 2002:a50:e60f:0:b0:415:9509:32a2 with SMTP id
 y15-20020a50e60f000000b00415950932a2mr5988847edm.235.1646943342748; 
 Thu, 10 Mar 2022 12:15:42 -0800 (PST)
Received: from localhost (tmo-098-218.customers.d1-online.com. [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id
 lj2-20020a170906f9c200b006da6f29bc01sm2092887ejb.158.2022.03.10.12.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 12:15:41 -0800 (PST)
Date: Thu, 10 Mar 2022 21:15:32 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Message-ID: <20220310211532.51f8d789@tuxfamily.org>
In-Reply-To: <20220309215639.786189-1-fontaine.fabrice@gmail.com>
References: <20220309215639.786189-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/kvm-unit-tests: bump to version
 2022-03-08
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
Cc: Matt Weber <matthew.weber@collins.com>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Wed,  9 Mar 2022 22:56:39 +0100
schrieb Fabrice Fontaine <fontaine.fabrice@gmail.com>:

> - Switch site:
>   https://git.kernel.org/pub/scm/virt/kvm/kvm-unit-tests.git/commit/?id=f271e1b630a1b8b5f4eae2331654fc1e70abfd66
> - Update first and second patches
> - Drop third and fourth patches (already in version)
> - This bump will fix the following build failure with powerpc and gcc 11
>   thanks to
>   https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/commit/0c111b370ad3c5a89e11caee79bc93a66fd004f2
> 
> /tmp/ccSlivNE.s:348: Error: `lswx' invalid when little-endian
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/746e87892ac545e8fb97c17d4bfd7bd7bbc9d8be
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...emove-Werror-to-avoid-build-failures.patch | 17 +++---
>  ...vm-unit-tests-test-for-rdseed-rdrand.patch | 24 ++++----
>  ...3-Makefile-fix-stack-protector-tests.patch | 36 -----------
>  ...issue-with-the-linker-from-Fedora-32.patch | 61 -------------------
>  package/kvm-unit-tests/kvm-unit-tests.hash    |  2 +-
>  package/kvm-unit-tests/kvm-unit-tests.mk      |  6 +-
>  6 files changed, 27 insertions(+), 119 deletions(-)
>  delete mode 100644 package/kvm-unit-tests/0003-Makefile-fix-stack-protector-tests.patch
>  delete mode 100644 package/kvm-unit-tests/0004-Fix-powerpc-issue-with-the-linker-from-Fedora-32.patch
> 
> diff --git a/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch b/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
> index cbfa3a87e6..d07b9b6912 100644
> --- a/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
> +++ b/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
> @@ -6,6 +6,8 @@ Subject: [PATCH] Makefile: remove -Werror to avoid build failures
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  [Matthew: Refactoring of Thomas Petazzoni's original.]
>  Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> +[Fabrice: updated for 2022-03-08]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  ---
>   Makefile | 1 -
>   1 file changed, 1 deletion(-)
> @@ -14,14 +16,15 @@ diff --git a/Makefile b/Makefile
>  index 7231334..d9ad42b 100644
>  --- a/Makefile
>  +++ b/Makefile
> -@@ -53,7 +53,6 @@ cc-option = $(shell if $(CC) $(1) -S -o /dev/null -xc /dev/null \
> - COMMON_CFLAGS += -g $(autodepend-flags)
> - COMMON_CFLAGS += -Wall -Wwrite-strings -Wclobbered -Wempty-body -Wuninitialized
> - COMMON_CFLAGS += -Wignored-qualifiers -Wunused-but-set-parameter
> --COMMON_CFLAGS += -Werror
> +@@ -53,7 +53,7 @@ cc-option = $(shell if $(CC) $(1) -S -o /dev/null -xc /dev/null \
> + 
> + COMMON_CFLAGS += -g $(autodepend-flags) -fno-strict-aliasing -fno-common
> + COMMON_CFLAGS += -Wall -Wwrite-strings -Wempty-body -Wuninitialized
> +-COMMON_CFLAGS += -Wignored-qualifiers -Werror -Wno-missing-braces
> ++COMMON_CFLAGS += -Wignored-qualifiers -Wno-missing-braces
> +
>   frame-pointer-flag=-f$(if $(KEEP_FRAME_POINTER),no-,)omit-frame-pointer
>   fomit_frame_pointer := $(call cc-option, $(frame-pointer-flag), "")
> - fnostack_protector := $(call cc-option, -fno-stack-protector, "")
> --- 
> +- 
>  2.14.2
>  
> diff --git a/package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch b/package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch
> index 1a1a90ce99..80549fd32a 100644
> --- a/package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch
> +++ b/package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch
> @@ -13,6 +13,8 @@ Upstream:
>  https://marc.info/?l=kvm&m=151580743523259&w=2

If I've get that old patch description right, this patch 0002 was only there
for supporting old binutils versions < 2.23 ... but buildroot does not
support those versions anymore, so I think you could simply drop the 0002
patch completely instead?

Apart from that, your patch looks fine to me.

 Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
