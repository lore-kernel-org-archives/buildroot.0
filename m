Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08715C433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 20:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A840061BFC;
	Wed,  1 Dec 2021 20:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xovb3t7md0C7; Wed,  1 Dec 2021 20:40:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D264361BFF;
	Wed,  1 Dec 2021 20:40:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 541601BF34C
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 20:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 429C361BFF
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 20:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I8KrSAWIA829 for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 20:40:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27A9061BFC
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 20:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638391221;
 bh=ukA8pcLv9F5FWpADqg5ZFnJuzwx3Wb3WsfOL845FgcI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=E5N3uFCReiAzw4cT9si7o90FLWlIdvzJYH/NQJruvKW3+//B26mcXQ3LRM0bWR4tk
 CstpqXzLuXhmA5Q9tU18X5oqMrxHQVUg4zcmX+gnySJFUVD6gJXcIrrc+3VSMyE+gW
 ylWDDAClTkXfcZnBvAR3ZjcCBWQH//seVtRutNek=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.208.65]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mw9Q6-1mZc0G3K6O-00s5gn; Wed, 01
 Dec 2021 21:40:20 +0100
Date: Wed, 1 Dec 2021 21:40:19 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211201214019.02ae1b4d@gmx.net>
In-Reply-To: <20211201095225.90511-2-james.hilliard1@gmail.com>
References: <20211201095225.90511-1-james.hilliard1@gmail.com>
 <20211201095225.90511-2-james.hilliard1@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:a5dw2SVU6hlcaFAdWfmI+c5YkuHvyqcL/jeKe8SkB/voIonDeAR
 rECX8wCkvFNKMdrDkRB/0oOfPVbKoRNLoy8k0+1q7jC20q4UAUvQPeAQBOXtYh7AshY6/Pl
 2pxCK2bD2gI9eHgyKxGPFlPYJJ3iuyClPuleDelsMStGZKnhhV/MEGrlyqji2sH7CSY+mU0
 vvwWpp+nlybEshbVLc+og==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xLuOhAlH+cc=:uBROGrsG0N50TRxDXMJj6w
 mOLO7nodsB1Mpl2TuEPyEDYur0fIdoAZd50CeowWYfwS+6caWhRFaJdilkDfFo1oWUq0xR60j
 KA2Cb8OKwQOoha2W90ONWhL6FpvTFMOJalFi0gQHoM9weEQ3Lg6DcwDXrQik8nzo92OyaxIdq
 QUJugpgoXzrERKP/wf8g9uk2SoHQDE9wmFzxk0EvS3m8VzY/1u+uVEH/IyOchYdWzOigyuV7P
 Qyldb7XqsE+Dct2lycwtzeDX78OnAOZAKmKurivl720zq78kFpnrcU3WAVySfmg1F7NpA8VsE
 mogYbxnQXrJZIkGMSXoc6bgAwj9jjEBawmeodS4EqgUzv/7GoqX9scOOgV3sqECksoH2525ew
 XAALJxkcmTc2jk/mHBZLV1oj+yyp8DHOAeG1hGy208DptMXOi9DO7nDkkzyeynZDzU/mHD28c
 ynQzeCxdR29mpJCLOThwyIRfudu/GEdZNnDDbm+6CdVThPdNX0CIzQEgrDEGRYki9tXrpo/bv
 gAdaG44ZzLd7prXocMxC6S3o4BT1QL+by8wYIL1GUvQLcSVoOXF4LQ+aqXtj8BO3Tff3f06id
 PNT8eJ4PcBnUe3atnR94Ji7c+VZgXwxEC51XQeZUFWSc4ThjpoQrUdYuACaEK2v6t0O/NLik8
 wj/L5OBtWQ38YaFru75jDsnGoB1Xpf32+8jb2ZfifYmsE35tM+3g5VVrp+qq2qewKatzTiIfV
 g3zlyf/ZbpzJcS2ISsfDAcXJ2xnJvRA4nNZj+ZLUgO7D1VMcSkAuuPGeBULGolklmy7xQKSE6
 oErxqBeQRc1sF/+gR/m2RSbVaLUPxQZXv4ZGJ6WDXfcb5xMJVGDQBBpjLvbQXRMCwpk9a9kLc
 0KmepUDT89x5HeYVWj3or5pfxmXtDT6dzM4HgWvwtcf8GAqeqhgl23cSz4+4YXvbRxyRPjhuF
 6WkSEG1ykiTEVjXBad8H9HescN39+JB25KOl+/adW8w8zQ4mY/3UE05e8U+etFYx2xsMphQwa
 QhHG0bA/eZJK//ZlD4UgM57/dWrwmd7s5MeYymoq828Wd65PpLRtsA2v9g9DtLx0mitx80bAU
 S1Gyk0sBnATfA0=
Subject: Re: [Buildroot] [PATCH 2/2] package/iwd: bump to version 1.20
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

thanks for the patch....

On Wed,  1 Dec 2021 02:52:25 -0700, James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop patches that are now upstream

Same as for ell regarding master vs. next...

Changelog is a nice to have, see [1] for example...

Regards,
Peter

[1] https://git.buildroot.net/buildroot/commit/?h=next&id=ff0d53405157ce82f6b56c74654c75c07b9ce92d

>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...-build-Add-reallocarray-to-missing-h.patch | 55 -------------------
>  ...nfig-Remove-usage-of-in6_addr__in6_u.patch | 32 -----------
>  package/iwd/iwd.hash                          |  2 +-
>  package/iwd/iwd.mk                            |  2 +-
>  4 files changed, 2 insertions(+), 89 deletions(-)
>  delete mode 100644 package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
>  delete mode 100644 package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
>
> diff --git a/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch b/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
> deleted file mode 100644
> index ef6114f1af..0000000000
> --- a/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From ec1c348b4fd67619fa0c2f55ae644f6a8014d971 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sun, 19 Sep 2021 21:17:44 +0200
> -Subject: build: Add reallocarray to missing.h
> -
> -reallocarray has been added to glibc relatively recently (version 2.26,
> -from 2017) and apparently not all users run new enough glibc. Moreover,
> -reallocarray is not available with uclibc-ng. So use realloc if
> -reallocarray is not available to avoid the following build failure
> -raised since commit 891b78e9e892a3bcd800eb3a298e6380e9a15dd1:
> -
> -/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: src/sae.o: in function `sae_rx_authenticate':
> -sae.c:(.text+0xd74): undefined reference to `reallocarray'
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/c6d3f86282c44645b4f1c61882dc63ccfc8eb35a
> -
> -[Retrieved from:
> -https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=ec1c348b4fd67619fa0c2f55ae644f6a8014d971]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - configure.ac  | 1 +
> - src/missing.h | 7 +++++++
> - 2 files changed, 8 insertions(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index c6250401..51d9da93 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -129,6 +129,7 @@ AC_DEFINE_UNQUOTED(WIRED_STORAGEDIR, "${wired_storagedir}",
> -
> - AC_CHECK_FUNCS(explicit_bzero)
> - AC_CHECK_FUNCS(rawmemchr)
> -+AC_CHECK_FUNCS(reallocarray)
> -
> - AC_CHECK_HEADERS(linux/types.h linux/if_alg.h)
> -
> -diff --git a/src/missing.h b/src/missing.h
> -index 2cc80aee..a5b92952 100644
> ---- a/src/missing.h
> -+++ b/src/missing.h
> -@@ -37,3 +37,10 @@ _Pragma("GCC diagnostic ignored \"-Wstringop-overflow=\"")
> - _Pragma("GCC diagnostic pop")
> - }
> - #endif
> -+
> -+#ifndef HAVE_REALLOCARRAY
> -+static inline void *reallocarray(void *ptr, size_t nmemb, size_t size)
> -+{
> -+	return realloc(ptr, nmemb * size);
> -+}
> -+#endif
> ---
> -cgit 1.2.3-1.el7
> -
> diff --git a/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch b/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
> deleted file mode 100644
> index f6b3d24516..0000000000
> --- a/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 42bd5ba7c2665c5bf95ba102a8115c4cf01d31d7 Mon Sep 17 00:00:00 2001
> -From: Andrew Zaborowski <andrew.zaborowski@intel.com>
> -Date: Thu, 16 Sep 2021 01:58:29 +0200
> -Subject: netconfig: Remove usage of in6_addr.__in6_u
> -
> -in6_addr.__in6_u.__u6_addr8 is glibc-specific and named differently in
> -the headers shipped with musl libc for example.  The POSIX compliant and
> -universal way of accessing it is in6_addr.s6_addr.
> -
> -[Retrieved from:
> -https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=42bd5ba7c2665c5bf95ba102a8115c4cf01d31d7]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - src/netconfig.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/netconfig.c b/src/netconfig.c
> -index ce95db0b..421270c9 100644
> ---- a/src/netconfig.c
> -+++ b/src/netconfig.c
> -@@ -171,7 +171,7 @@ static inline char *netconfig_ipv6_to_string(const uint8_t *addr)
> - 	struct in6_addr in6_addr;
> - 	char *addr_str = l_malloc(INET6_ADDRSTRLEN);
> -
> --	memcpy(in6_addr.__in6_u.__u6_addr8, addr, 16);
> -+	memcpy(in6_addr.s6_addr, addr, 16);
> -
> - 	if (L_WARN_ON(unlikely(!inet_ntop(AF_INET6, &in6_addr, addr_str,
> - 						INET6_ADDRSTRLEN)))) {
> ---
> -cgit 1.2.3-1.el7
> -
> diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
> index 7c010ed891..58224170e6 100644
> --- a/package/iwd/iwd.hash
> +++ b/package/iwd/iwd.hash
> @@ -1,5 +1,5 @@
>  # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
> -sha256  0225ab81579f027e0fcbf255517f432fcf355d14f3645c36813c71a441dfab55  iwd-1.18.tar.xz
> +sha256  7d51e2ccabe7c500e44061ac725dbd4f6b0fb518b5e3de1681063d0f15d3050f  iwd-1.20.tar.xz
>
>  # License files
>  sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
> diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
> index 96bdc56e93..7b122811c5 100644
> --- a/package/iwd/iwd.mk
> +++ b/package/iwd/iwd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -IWD_VERSION = 1.18
> +IWD_VERSION = 1.20
>  IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
>  IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
>  IWD_LICENSE = LGPL-2.1+

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
