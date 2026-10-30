Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D74606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BlpjCtk9
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E760F81A50;
	Fri, 30 Oct 2026 15:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqNCx6ku9c56; Fri, 30 Oct 2026 15:29:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C76518196A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374173;
	b=sI3I/ZfKfxD9PUQ8xh8FoApzDRqP6QX0YTumkefjt9YQr4pH5DOA3LJRKCUh48Agx7cL
	 EnmiUV7XkMwq3RoaUti3jFDVUxLJt3yE8QFdlJfMihzcO7BXuOm8nZKT/bhqy6QdcV5Co
	 GL5+9aB5XJIzcUcUUMHH1StnxTKwlKQjWwQwqcqiy0CkL2IP6XRF6VELIiNS+78NCelda
	 jUQ4nmZBvJSNV3P/CDgby0TFw9/wosYltpATk9wBlL5qKb4bO6W0Zp8GKG2KXkCiPcZAj
	 w1kgYLTif1ewFo5pnfVfj+P0thwx6HbCYHxlR1990Ta0MjecCW3Xu44DTqFuVPNiz8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374173;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vuq5bblIa57M0VCN1DjZ7tYpuxA8os9zSp/ro87qn7Y=;
	b=NC1C5AbhWNLahY2zNIENFhlUwfaQocrJh+lg4pGTRwb9ClEV0+GFOKsC63qnoE6sNJFq
	 kP7SzOsLA6eWkQqidwhXgQNFPF1qV3LKNZbqxDPmen2Ir0l3iMo02PQ1RlisIAJOKxDLN
	 0urErDbeOc7SCI5DWv9eK0KQ6i1YJgtcHIlGkMZGKyOUvbkW5iG6FVDRG05648SaBTjjH
	 +5sBlOywdgsTik0gibPezhZ34UiR60Lj7+YRKKCL774fQ7/KVn/nu4pM61UhvmNtv/tU4
	 36E/kd5e5Pmt/dfeCmJWajtQ3iMIuSvhkpSsANP+P3ZGfqd2p3UNN3lXJvyVX6ewAGg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374173;
	bh=vuq5bblIa57M0VCN1DjZ7tYpuxA8os9zSp/ro87qn7Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BlpjCtk9GyLsdHcb8KnDih6JtAYwWRqk/57MNf0/yf/DfVPdRTgn0LVSLY6e1YmIC
	 MQbY6KcaO6VXSn2SOv3rgpt3LwBFhX3GrpQujlO5HfcROVA10M6GjuLOTJKOleEbbJ
	 XFlz/KtP7s5cAKfieqnAS2UfY84oWLphSTR1hzmybTM93QphtEIPmuW4RwtjXFURRK
	 o4pj98B0aXRdQreoAogyzE25sA0FPEoxjIwFx/cSI6Oc460OSTiWk59RfK6eZpOOYu
	 Xc1LfI5bKdGllr9pNdNZZgHyG0ZGteZ3LJkPq9+3j0wbt5C/SNM0pBOREFJwcEgkTj
	 VVMcdv8s+DkXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C76518196A;
	Fri, 30 Oct 2026 15:29:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 443E3D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29EF640C39
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HShYfOayP6Vv for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:28:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F248440C2C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374132;
 b=cTLNjgtHvqVu8wrFaaHYNvPPntUC3dgYKaK+EtddI4j6EEQg4dXw9uanyjzi9daefO1Q
 gcX9TmIMUvWwFSB123bemnZdOGwMaX78g+v1CAmZsGm+5Ll6BbJkmugbeoOSfZjOBoWCQ
 fK+XBsCYp7LOvlzeuh1MxwVaAkEP88Lfvy9QX/l6/fHpv+pE6rN5KAewz8oGBmkGU3CoJ
 kaSnzleRTozBSIKblS4kPi7tjHIve7fRTgTg+LXdKAaLKL3da7XQcIc0v3fA8YVd/KphG
 RT3usJMr51FQZ3QnhWaqiHBD9Q7LidtjMoq5CSnLJr8LAmj/V3O9bx5kfsvLB8llL5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374132;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=OKy67v9/vHhsLkxvb3+q6i/Qw6SzERuL6i4iGmFAAJc=;
 b=tbbEg5C73qlTnzmI6l/1hEW9Ze0e39nDp7NnU1y9ecJjWf6mhx7TCCnE+k25zKFSX2qE
 2uXR7tD9U7cyTjT0bms+QL9BiacW71jvd9/g6Nez5UuECdlLu41TuHRNZHlGkFTUCEYPy
 0/uLEI1BJ5gQtNO73d6PIuPX9GO/qFKpahaSZJm4kqHLVE3FtzcpIxmISA3ZW+hZ/WICo
 zusv+AcAnVsim8EXypCGVgzFe+JonZ0YoVA8Muiv4QaFAUZ+vzpIWxrYbBuwuVjR4qbad
 6MtDnAKjcra0yKDWLMPop95Qeca0EHWY4Sqxxdipf1NMCHg6U+bLuLVqHgI1/E73mRQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=K9toSVIp; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F248440C2C
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:51 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso8184585e9.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374129; x=1793978929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OKy67v9/vHhsLkxvb3+q6i/Qw6SzERuL6i4iGmFAAJc=;
 b=IwrR7+R7jXhbJBBHIZpyUK4/rwYI+pncVzcuBm7qEgO3m1eI99epe3XrLhicX99ulL
 LJ1ax4BSdmJrITa9Y5oaO+mPL+USLElfhFgWqXoL4XOHhbj7P6mIaFWBneRPcXDealfu
 PkG9ZOgojsiwd2cj2Vm6CvngIchZikitDWNbp4MmASbaXZGI3mjt8R4lcJ3uxv4IyKtw
 Htr+ecS6SOpLXtQrB9XL2xoomvceLhQYzePTjGKlOFWGEOhezIaJ9iS447P7bE6mr5xr
 Jis7IGWMEk8GPga839r1gdxNdqI1AEoz1QcA/Twj1LORDcy6Uyblac3sZ8Ep5zHFml4J
 GqfQ==
X-Gm-Message-State: AFq9FYKVjsHKKtqG25/h9NgnAUjzbjspb1nryf4R7cW1MOMaIZAKL6Xe
 jnkeRPEn6KgpyEfE2FwzM1TuTGObcSHHU1L1hnmqhJvX6sf0iJ2cnzxrYW420u92B8ePCAhNBjf
 N771jbUI=
X-Gm-Gg: AYBFou0AIE7Y+8MrexQ/VR2pJdnHS7ap7WYNnZ3yPayqYnpY0E/zPJWVuuzbwm5gh2l
 h2li4a5aGb7N/fwjqw2NmYDWmJgLf9sR88kWsRKkBsTHxCGJuZQRQ5lbiqVfuUAEW3TIgzVmnxd
 Uzv25pnGMOhenL8mzRxxn7VeShb33/ZCpMhKu06MRlqdJr+hGoR258Vuh3ppYkTiQY49NEMM7JB
 TtiGmiodi0UyMsLVd0KAdr2sucsI79JxHIeL/bT9BAsnox06XK38e69TyRQ/NhxTj4tAobRDqV2
 s8mOHx3wvbjPu7BE3UvIPbvdU/PtZNfG2LR3Yu7JIU+Uen6o7kjOY0nAQcC1w4Ju4rnZ1LkBuN9
 KtXloOjritYNFF19/qbn6KzCI+9j7A1oEFR0j4YxuUlpfIbwqI3GI9nHXaLhxIlarPHoqr4HR8O
 BqSGgNzqL+LY9Y6HTW4iCD0HEBkVJOdAD1GkfnZaUNGDsszjUh91R+cxqNoWWy0wXIwIP6DT3se
 /tr+cgRiLhHa/UQ/e0jAOM8TKQKkTDlv7GyAwVOfYNXD02FLbfMhzYIqpnH5tk1jMiy/JVxbNwy
 TTv3/CnC6KymzbUtooh2GcU8CqT7IMog+VTrkVc9+DauOZe9/Crh0hSVHJxHSzVQ3mNr5qXo
X-Received: by 2002:a05:600c:871a:b0:4a7:d9b1:b684 with SMTP id
 5b1f17b1804b1-4ac14ec7947mr55101695e9.2.1793374129593; 
 Fri, 30 Oct 2026 08:28:49 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac09cc3e9asm26642205e9.3.2026.10.30.08.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:28:49 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:28:46 +0100
Message-ID: <20261030152848.1907541-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023085925.1104974-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/parted: security bump to version 3.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Fixes the following security issues:
> 
> - CVE-2026-89085
> - CVE-2026-89088
> 
> Other changes in 3.7 and 3.8 include ExFAT detection support, several
> libparted fixes for corrupted/unhandled disklabels and a gcc 15 build
> fix. See the NEWS file for details:
> https://cgit.git.savannah.gnu.org/cgit/parted.git/tree/NEWS?h=v3.8
> 
> Drop 0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch,
> which is included in this release.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  ...CH-parted-fix-do_version-declaration.patch | 44 -------------------
>  package/parted/parted.hash                    |  2 +-
>  package/parted/parted.mk                      |  2 +-
>  3 files changed, 2 insertions(+), 46 deletions(-)
>  delete mode 100644 package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
> 
> diff --git a/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch b/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
> deleted file mode 100644
> index 78709e07ad..0000000000
> --- a/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 16343bda6ce0d41edf43f8dac368db3bbb63d271 Mon Sep 17 00:00:00 2001
> -From: Rudi Heitbaum <rudi@heitbaum.com>
> -Date: Wed, 20 Nov 2024 12:22:22 +0000
> -Subject: [PATCH] bug#74444: [PATCH] parted: fix do_version declaration
> -
> -With gcc 15-20241117 compile fails with the below error, update the
> -do_version declaration to match the header in command.h
> -
> -../../parted/parted.c: In function '_init_commands':
> -../../parted/parted.c:2469:9: error: passing argument 2 of 'command_create' from incompatible pointer type [-Wincompatible-pointer-types]
> - 2469 |         do_version,
> -      |         ^~~~~~~~~~
> -      |         |
> -      |         int (*)(void)
> -In file included from ../../parted/parted.c:28:
> -../../parted/command.h:35:39: note: expected 'int (*)(PedDevice **, PedDisk **)' {aka 'int (*)(struct _PedDevice **, struct _PedDisk **)'} but argument is of type 'int (*)(void)'
> -   35 |                                 int (*method) (PedDevice** dev, PedDisk** diskp),
> -      |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -
> -Upstream: https://cgit.git.savannah.gnu.org/cgit/parted.git/commit/?id=16343bda6ce0d41edf43f8dac368db3bbb63d271
> -
> -Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> -Signed-off-by: Brian C. Lane <bcl@redhat.com>
> -Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ----
> - parted/parted.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/parted/parted.c b/parted/parted.c
> -index 3abb52f..fc2aeba 100644
> ---- a/parted/parted.c
> -+++ b/parted/parted.c
> -@@ -2172,7 +2172,7 @@ do_unit (PedDevice** dev, PedDisk** diskp)
> - }
> - 
> - static int
> --do_version ()
> -+do_version (PedDevice** dev, PedDisk** diskp)
> - {
> -     printf ("\n%s\n%s",
> -             prog_name,
> --- 
> -2.34.1
> -
> diff --git a/package/parted/parted.hash b/package/parted/parted.hash
> index 6643ba9fbe..9218deb39b 100644
> --- a/package/parted/parted.hash
> +++ b/package/parted/parted.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -sha256  3b43dbe33cca0f9a18601ebab56b7852b128ec1a3df3a9b30ccde5e73359e612  parted-3.6.tar.xz
> +sha256  a2b7811f47b0ddb1f7b1d0aa456f7c1270da70708ce231c2fe054c7199eafa63  parted-3.8.tar.xz
>  
>  # Locally calculated
>  sha256  0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING
> diff --git a/package/parted/parted.mk b/package/parted/parted.mk
> index 5b55a9f21e..314bd0d3c4 100644
> --- a/package/parted/parted.mk
> +++ b/package/parted/parted.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PARTED_VERSION = 3.6
> +PARTED_VERSION = 3.8
>  PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
>  PARTED_SITE = $(BR2_GNU_MIRROR)/parted
>  PARTED_DEPENDENCIES = host-pkgconf util-linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
