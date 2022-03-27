Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5854FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FA494109E;
	Sun, 27 Mar 2022 16:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Qc0wfYluZwd; Sun, 27 Mar 2022 16:29:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B35240904;
	Sun, 27 Mar 2022 16:29:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59CCB1BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46C7940423
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id geqeq0HEHfl3 for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:29:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09C5740647
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:29:42 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id o10so24173614ejd.1
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 09:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eB+B1/HA+UBiSNWcaAoxyX5+RbGCAeKdcqLe7Zgg7IY=;
 b=KLueUrnxJA7q9gGBVVeoxCPU0GiY1a/AswsOBqsxPAoanmDUwod7dGdG5pOSCCzT4L
 tvMuBMhCMbv5REFOzMHDdfgyG3VCnJQA+vARZTBe4adtb4FlbjOV8TUN0ZH664F+2OWD
 cCTrR79FYC40qje3PSq7fgKZJgdoW310lowE95IDIGmZ9pRJTzRB+6+lv0zsCrsq1K53
 OHV5Uh8t6wjNxJgQeIIG0hxQLEwqRSLH4ICs/xWwXFJ1OoebPP1Np+9EvyCQAk4mNDnf
 itYjyqDFBjSt1jRZpt8MQoSaKoiuTlqYrqolqCObeUyaHjUEJHUOurqXSCjdODuG+P0m
 4xOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eB+B1/HA+UBiSNWcaAoxyX5+RbGCAeKdcqLe7Zgg7IY=;
 b=E7r+rAjn4mh/qFqYstWsZijLlkQ5bZ/qvdgzdoMZh4S7RErN93MQ5eniMA7TR0sMch
 DrnRBebp6qliv7D5CKnin4q2zNFLRisqmBY+u8VSSEhs3VFnPJTStczVPM8LeOfUpqTr
 AxrjwapRj0XyFeFvnMhpFi1JQlrZzKJJtVGaLtGn0dUVwCUl/gxGsR5syQX4Ftt56VN5
 JoFfTpr51/4JYFXPrJqGT1QWxMx33vwhmKv36pJbVp5Qa/3Bo16b3O9Rf1t+QNAaOtrr
 uHcmnd6M3UMZdAuKqI0AZhO07qDqhWMy2dCwn7bCkWOg1x2G2P7LJ1//tIyfHNVEaCAX
 qxYQ==
X-Gm-Message-State: AOAM532V0y3J/5k5GV2SYukbbbLRRJUVYwGqmkd3lJA3SasWS+sKg2SN
 NE6ydEtQMJFnFXhcb2FeokhI7NZxbfmAOQ==
X-Google-Smtp-Source: ABdhPJzWPlygJ7zpG7LDzVTFUMU+wAdYzSY+en5FVbJ1DzXky9YY35ffOGT+EhBE/AGcLNSOj9EeNg==
X-Received: by 2002:a17:907:6d11:b0:6df:f38b:b698 with SMTP id
 sa17-20020a1709076d1100b006dff38bb698mr23118856ejc.711.1648398581174; 
 Sun, 27 Mar 2022 09:29:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a17090677d000b006dfb0684545sm4811165ejn.29.2022.03.27.09.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 09:29:40 -0700 (PDT)
Message-ID: <56dfbfb1-c67a-211f-55ce-00df980cfa9c@mind.be>
Date: Sun, 27 Mar 2022 18:29:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220325212852.713531-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220325212852.713531-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: bump to version 8.2.2
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
Cc: Vadim Kochan <vadim4j@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/03/2022 22:28, Fabrice Fontaine wrote:
> Drop patches (already in version)
> 
> https://frrouting.org/release/8.2.2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...001-configure.ac-fix-enable_bmp-typo.patch | 29 -----------------
>   ...-lib-fix-elf_py-TLS-section-handling.patch | 31 -------------------
>   package/frr/frr.hash                          |  2 +-
>   package/frr/frr.mk                            |  2 +-
>   4 files changed, 2 insertions(+), 62 deletions(-)
>   delete mode 100644 package/frr/0001-configure.ac-fix-enable_bmp-typo.patch
>   delete mode 100644 package/frr/0002-lib-fix-elf_py-TLS-section-handling.patch
> 
> diff --git a/package/frr/0001-configure.ac-fix-enable_bmp-typo.patch b/package/frr/0001-configure.ac-fix-enable_bmp-typo.patch
> deleted file mode 100644
> index c8ce500dfc..0000000000
> --- a/package/frr/0001-configure.ac-fix-enable_bmp-typo.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From bacabf2476553d0e873b827359e1c8a4216c2f8c Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Thu, 16 Dec 2021 20:10:26 +0100
> -Subject: [PATCH] configure.ac: fix enable_bmp typo
> -
> -enable_bmp doesn't exist, use enable_bgp_bmp
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/FRRouting/frr/pull/10236]
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 1bcc42ef8..c7a5f1286 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1806,7 +1806,7 @@ if test "$enable_bgp_vnc" != "no";then
> - fi
> -
> - bgpd_bmp=false
> --case "${enable_bmp}" in
> -+case "${enable_bgp_bmp}" in
> -   no)
> -     ;;
> -   yes)
> ---
> -2.33.0
> -
> diff --git a/package/frr/0002-lib-fix-elf_py-TLS-section-handling.patch b/package/frr/0002-lib-fix-elf_py-TLS-section-handling.patch
> deleted file mode 100644
> index d491cb1a7d..0000000000
> --- a/package/frr/0002-lib-fix-elf_py-TLS-section-handling.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 3942ee1f7bc754dd0dd9ae79f89d0f2635be334f Mon Sep 17 00:00:00 2001
> -From: David Lamparter <equinox@opensourcerouting.org>
> -Date: Wed, 10 Nov 2021 15:30:07 +0100
> -Subject: [PATCH] lib: fix elf_py TLS section handling
> -
> -... need to ignore TLS sections, their address is effectively
> -meaningless but can overlap other sections we actually need to access.
> -
> -Signed-off-by: David Lamparter <equinox@opensourcerouting.org>
> -
> -[Retrieved from:
> -https://github.com/FRRouting/frr/commit/3942ee1f7bc754dd0dd9ae79f89d0f2635be334f]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - lib/elf_py.c | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/lib/elf_py.c b/lib/elf_py.c
> -index 1c306893ad8..f230add6957 100644
> ---- a/lib/elf_py.c
> -+++ b/lib/elf_py.c
> -@@ -636,6 +636,9 @@ static Elf_Scn *elf_find_addr(struct elffile *ef, uint64_t addr, size_t *idx)
> - 		Elf_Scn *scn = elf_getscn(ef->elf, i);
> - 		GElf_Shdr _shdr, *shdr = gelf_getshdr(scn, &_shdr);
> -
> -+		/* virtual address is kinda meaningless for TLS sections */
> -+		if (shdr->sh_flags & SHF_TLS)
> -+			continue;
> - 		if (addr < shdr->sh_addr ||
> - 		    addr >= shdr->sh_addr + shdr->sh_size)
> - 			continue;
> diff --git a/package/frr/frr.hash b/package/frr/frr.hash
> index bb6c32b7bb..9bb2b75b8f 100644
> --- a/package/frr/frr.hash
> +++ b/package/frr/frr.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  9d82c11b304ab89a30627fcbb4150f51e639f473f8563976e14101e796240599  frr-8.1.tar.gz
> +sha256  33e974e2a622618e139983f65d93e92e7f1a735936ef18b18244403b15be002f  frr-8.2.2.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/frr/frr.mk b/package/frr/frr.mk
> index 0e6ab7a815..aa36387a3a 100644
> --- a/package/frr/frr.mk
> +++ b/package/frr/frr.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -FRR_VERSION = 8.1
> +FRR_VERSION = 8.2.2
>   FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
>   FRR_LICENSE = GPL-2.0
>   FRR_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
