Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3805C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 15:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69A6781188;
	Mon, 17 Feb 2025 15:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28sbKKU8a9_V; Mon, 17 Feb 2025 15:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EE82811CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EE82811CC;
	Mon, 17 Feb 2025 15:20:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B0C64DE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A83C54045A
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLv21qGIVzFO for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 15:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B7F3640C27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7F3640C27
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7F3640C27
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:20:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.115.144]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVvL5-1ttdiV41tl-00Z2hh; Mon, 17
 Feb 2025 16:19:59 +0100
Message-ID: <1d486798-ed6a-464a-974e-6bc2ada40819@gmx.de>
Date: Mon, 17 Feb 2025 16:19:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
References: <cover.1739615626.git.yann.morin.1998@free.fr>
 <d2e8acab3a2df2ff91de48072407ce7977c4fc8d.1739615626.git.yann.morin.1998@free.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <d2e8acab3a2df2ff91de48072407ce7977c4fc8d.1739615626.git.yann.morin.1998@free.fr>
X-Provags-ID: V03:K1:EOqtoAd+bONX+R2h9ZRnXSYVfoal0TSHZPtPTrQSy9qRSmdrRt9
 Wv4UkZhckijmksc961fTxvRT+uG07Ry8ga04RzswIg+mw9IrgNKDBQVJqpnffx3XrQkdHGW
 hQ846TC3MqEOMAYbT6ERsUmT9kNFSMp9FAnQFay8dRRF9fRHHA0cam8LkP18vKWhV8taZxC
 oknPoYRJxyWxhyIrMmTHg==
UI-OutboundReport: notjunk:1;M01:P0:QULdM4sTwBs=;CgiNDxVp1WasKfQuiXeefR1SpGd
 rcfmpy9XpaD2hbYZ+f21KRtHuI0fqMQ1VfgNfImYBVMEpVqmx+WdDjmfX6d29jMv3DzF0kzA0
 +qFip298M79RHi00y/pM68/orVu3gtyfpzr3pnSX/eNF1lS90PAyfPPgKsEWA3q5Cjl8oloqZ
 5cnS0G+pfwWGDwRgDP2UU4cPkVdF46o83ySSv0plM4i3mZeO6VcTFNeLXJYESg1cewhOe8g0E
 R6FIV1TqE18t2612CsAPiNsjB6fuw3BGvKVl3QscpvVtLe7hX/yEA/DgBZtxrFszcDPrgtxqL
 IxN72n36T5/NszefV5Vpm4mong6KK/patYspnDJZAa08MOiI759qPaTAsaQvuLO0UkhW4VCXD
 1tuYNYxwsL7P/+Mrhmk6bpammKKU+rhoC9azCqcACc7xjM0VgVS+ZI4YjnoGoQ2/6iTo28t6d
 ySYtITPx7lOvMwAylShSWEFG5yeYlhMBR8yJ+h3y/kEaOQBdBtdIvTxA2ZA2erONsCut3PAgY
 iCQihkDykBMAlSKXgjVy5hUiKbxdqvOsJOSic4yJLbGIZOSaFVfeO5KDYTiHPefq/9MS21LtI
 ECYYcHbh3ESd2lWvNBA6Wqi3jKmnuzBE/Fy1yZ/+EBLAUioSPxpHTko/XM2S9gHIzZX3b2fiy
 Giw4105yK1a4vrGofFgSjtTgn2ea8fE0OMKvJacpxIdwTypdHYJQLvQKpoHT6Z0ir4GIRspgZ
 rCrazSOjLDn8aVG4ESMu68HxyFAHYt//klsN55ldGMeV53l8EojhrUWBNlatrUlSQPnf6BDF7
 memj9H7U6dsPuWDXhQoU8UDmFhlH2txYUhZbK1vvs0Atwuz4DbgTN1WgxpbMApIE2oYG2k2N1
 i9dLNpGDS7yoeqKmIB4OaKSq7hrn2XQPDhwJvpdSYbKPWY/3yTIignWL8+yVnE+jhLfcMA54C
 Ga3gQqZ5+qe8cg6MBq7g1epN2lMM9XEXSmfRdLHgeXg/DNaJHN84fR+9RaiQ9b9vDGnSysg1Z
 zDq3hkJk5bHa8Wmt6ufpij4X6NqX7uZVZpgRByUxs0eUryWPTkG/L+PwQOaxPsweMD0mXww+M
 iQzcMyXmaCsxK4xmpJUmb6IUIYgeOZwPRx6Rw4xanzQU4BMuUFrQmiZ6tI1BHQ4a8MNTMJ6Zo
 kIX27SPCszPYv6uovmiHDaL/X1bkoU5UPgrEtpnK4UasxlA6+zI0UHHOwodTzJ9kPcvxTTDA4
 CP9Ne8qM2vXYPh6M144TKZ1DlFuOlMxJDEsQ7BcZwPUcZI+307XQm1expdfH7DJq4BEiCAr79
 ygO7ZDwLBN+QM2JsESuC85da+69DmF5ZYVrtQhhuP98H8HxWwUrQ6NNCW0JHQ+50vJIYhYBWa
 XB6N3zx88/VJ6N2Y19Gjl4w9+umPE+i6qLiIhIYLfi9MpwExVSG6ewEoG3EMGNQxL7LVxlgT2
 prSxUJC/QtaWJChdtvi2u7DsR15WJlnO7hlgdNmJmhnY2xJzd
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1739805599; x=1740410399; i=fiona.klute@gmx.de;
 bh=Od9oie2n4DnA/Qd/Ubq3OtjubXoXTibHsrzivumQzJk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Mvsv+I/yugFhwnTiVC8cq5pIWVRncdimKgKwA7XwvtH80Gw+QQWrV8PWv7bzLcQO
 mb/PfVklbUS16RZtIbv8neBP5+LwTW5Z0GYG3V9VnlVXq/BUQQqG5wLXvDcnXCsTS
 XoU1KjIkWO8XS64kZlVUMCD4Qdv03BYOcQuUNgQaltEZBaueJSzjO1lk+SglhmLsf
 cGNeD1HWeZIDMtGKd50+Pn/fSKqF3GvI4N3NKNhk+PzYu3r4i9hRTgLiEjko+Y/mv
 2Di6IPtfQlyNqU7Xk7AM/IOgbHfa8a8IB91J3VJsMjK1oG7fp5LrvRqBqlNXxMTNK
 /k35/5UwAyv2U03xPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Mvsv+I/y
Subject: Re: [Buildroot] [PATCH 3/4] package/catatonit: update to version
 0.2.1
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 15.02.25 um 11:33 schrieb Yann E. MORIN:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Christian Stewart <christian@aperture.us>

Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Thanks!

> ---
>   .../0001-fix-build-with-kernel-5.9.patch      | 49 -------------------
>   package/catatonit/catatonit.hash              |  2 +-
>   package/catatonit/catatonit.mk                |  2 +-
>   3 files changed, 2 insertions(+), 51 deletions(-)
>   delete mode 100644 package/catatonit/0001-fix-build-with-kernel-5.9.patch
>
> diff --git a/package/catatonit/0001-fix-build-with-kernel-5.9.patch b/package/catatonit/0001-fix-build-with-kernel-5.9.patch
> deleted file mode 100644
> index 37def8e546..0000000000
> --- a/package/catatonit/0001-fix-build-with-kernel-5.9.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From 65e1b96bd40cb14b3729ac56bb9f1fcb77254403 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Tue, 1 Nov 2022 14:16:01 +0100
> -Subject: [PATCH] fix build with kernel < 5.9
> -
> -linux/close_range.h is only available since kernel 5.9 and
> -https://github.com/torvalds/linux/commit/60997c3d45d9a67daf01c56d805ae4fec37e0bd8
> -resulting in the following build failure:
> -
> -catatonit.c:39:11: fatal error: linux/close_range.h: No such file or directory
> -   39 | # include <linux/close_range.h>
> -      |           ^~~~~~~~~~~~~~~~~~~~~
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/ed9a847905083175c7fcb2f2df28f9ac5b9c3313
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Upstream: https://github.com/openSUSE/catatonit/commit/663ad1670689143f65af3a288f90cecb7feed54f
> ----
> - catatonit.c  | 2 +-
> - configure.ac | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/catatonit.c b/catatonit.c
> -index a33f4cd..b10d9b0 100644
> ---- a/catatonit.c
> -+++ b/catatonit.c
> -@@ -36,7 +36,7 @@
> - #include <limits.h>
> - #include <dirent.h>
> -
> --#ifdef HAVE_CLOSE_RANGE
> -+#ifdef HAVE_LINUX_CLOSE_RANGE_H
> - # include <linux/close_range.h>
> - #else
> - # include <sys/syscall.h>
> -diff --git a/configure.ac b/configure.ac
> -index 69e89f0..b37f146 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -24,7 +24,7 @@ LT_PREREQ([2.4.2])
> - LT_INIT([disable-shared])
> -
> - AC_CHECK_HEADERS([errno.h fcntl.h signal.h stdarg.h stdio.h stdlib.h unistd.h])
> --AC_CHECK_HEADERS([sys/prctl.h sys/signalfd.h sys/stat.h sys/types.h sys/wait.h])
> -+AC_CHECK_HEADERS([linux/close_range.h sys/prctl.h sys/signalfd.h sys/stat.h sys/types.h sys/wait.h])
> -
> - AC_CHECK_FUNCS([close_range])
> -
> diff --git a/package/catatonit/catatonit.hash b/package/catatonit/catatonit.hash
> index 9940309c76..7b13100a33 100644
> --- a/package/catatonit/catatonit.hash
> +++ b/package/catatonit/catatonit.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  d0cf1feffdc89c9fb52af20fc10127887a408bbd99e0424558d182b310a3dc92  catatonit-0.2.0.tar.gz
> +sha256  771385049516fdd561fbb9164eddf376075c4c7de3900a8b18654660172748f1  catatonit-0.2.1.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/catatonit/catatonit.mk b/package/catatonit/catatonit.mk
> index a308ea6471..aa7e60f697 100644
> --- a/package/catatonit/catatonit.mk
> +++ b/package/catatonit/catatonit.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>
> -CATATONIT_VERSION = 0.2.0
> +CATATONIT_VERSION = 0.2.1
>   CATATONIT_SITE = $(call github,openSUSE,catatonit,v$(CATATONIT_VERSION))
>   CATATONIT_LICENSE = GPL-2.0+
>   CATATONIT_LICENSE_FILES = COPYING

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
