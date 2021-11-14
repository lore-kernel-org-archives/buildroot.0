Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF44C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 12:28:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51FD96112E
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 12:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51FD96112E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0B3C4017D;
	Sun, 14 Nov 2021 12:28:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ta9-SbbXRaq4; Sun, 14 Nov 2021 12:28:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7694401C6;
	Sun, 14 Nov 2021 12:28:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDE2F1BF34C
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 12:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B917940233
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 12:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B0C20vq9RZ2E for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 12:28:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D2F24020D
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 12:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636892917;
 bh=il2p5CvCsSLLDiw62k7LIa0aLyExUa50pkZfLEv53yk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=XrwIdxQzYtv1b1bUk+6CK+BMCNRrnPT1wq0bCKK6RiWJtmZIJGxm6pm/UJl7M7eCM
 OsD+XACcl555aqlEU6ZHeCd/21gpZU6KIaum1KC7FFnqu0qpREAvJ/DfpWEWlTdka5
 l1M+zOGhDNNws1asWechVsEgyRCitenC9A500wBw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.16]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M42jK-1mmEcf1QVU-00078Z; Sun, 14
 Nov 2021 13:28:37 +0100
Date: Sun, 14 Nov 2021 13:28:34 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211114132834.18b7ca20@gmx.net>
In-Reply-To: <20211114101554.878427-1-fontaine.fabrice@gmail.com>
References: <20211114101554.878427-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:kBfExzNpLpOmsLf80UVRmDtCITjWl5QDTJkEkXp5NKwhPDB41xe
 HVj7Z0vyL6lSOKj9EmCBTxnhe+dSwpINu0ku8OCH8c00CYZ4np9JGXVF6IFp6PBE9BI1cQe
 707ToXnL3qnNP2u9F3Ymga/9+jKJd6cF+Y2/mUEgdaO1lST2TqCxaGstXHiES3mk5T1JLgK
 uYiSbgdNcAcnuKG9o0Bdw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QxbaTXX/GHo=:zLwA+l6iB22MossnyJNhtr
 h9a2oiCSAkFa0lfqNozFdt9BR58P9LsxJTChRjl0+rRZJzNN8dwmzqit/6V4E5R4hz1z02PvN
 zptdBPOxJjJPu2vM2POrNihWnRJGTiHPX31LrCPut4R0/oICElyh3Kjk8i2RD75ZeLHIVcpja
 h+wYEXc3J73X3I0JKPHn1Cg8mz8eMzkSKwzLwebtHIHc9AyNK2Y8JupI99U726b3CgYIOuaQU
 AWeXTOAYPs/VYX9sHiLbIgM8AnrKHa20iF/A/dvKAE1nH8JqFeono36JQpvHXcfcn8BRfWdcv
 abaM/ICFQ8bxwdOZdAI7XLNpFe0WRdn5zj6bxUbmLhuJswtbJClkWvflZgi2x4lhvbD5gSO7L
 8rZylR5/DhnLVzmlBoTM8p64g54+d96E/F4uKMDzr3otesvQ3bAuUxxOK10UGbGZ2hzYhC4ML
 svwcs28D0FUaSTqs/9h2xBBN6hgp7/R8OiBM0UP3mWrwyihr8rwXcpux/yUsYv/vlZkmBIIMh
 ZKfng81x+B0zqpSRLQBm1En330Xns7C/+Gyvln++WdSjSHw4Q+l/cmrDq2efM3hcxsD3Xm0cy
 7IqxNYcVul4UTyNFlhrcCB2XkKQzaFCAxE99b1tLgVcWTnQfCBSQtF6SW1UOYbzy5U6pcW6vj
 oFlD8A0At7dB9ajCFjk7sn00Mtep1VKCIJ6o2/aVDLpeiJBmvrGVWts/1IXfLBMPjyh5ZvQ5B
 2Br6ZeMc35Rf5l5ZGYvvNWQ/wMfjQdJ3wUCtNgHkYbnlqd80f5b4/i+NweulHYx72XWXOHyYw
 T/iWISNq+SEa9VAJX6bz9mpvG4gLnF+4p3R0dK61FKeYe82CEqmQAvolK9OOaih6cMH/PpaVH
 93F2Mf/GuIvYpYWNj0BUCVG1B32knCNvmuQhIdHplaH5x+Ivfi+p0yvFozRrNQvBjRIj3Wopc
 kr0Eu9IDxoEKijXe2rq1GWM8rr5DVtsEajqx6RWzsTRmJUYugwsvQG2h+C9m4c0XCQBYp1yyp
 Hk/NN6ubCVHwsuF19/YZzkLlLNmU/8B/c/QW9UgmqmGhK/tGn9rGHtZfINtpmGv1Xw91eHEnB
 UfD3C9DAVxlHsY=
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5base: add zstd optional
 dependency
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
Cc: Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sun, 14 Nov 2021 11:15:54 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> zstd is an optional dependency which is enabled by default since version
> 5.13.0 and
> https://github.com/qt/qtbase/commit/f25bc30d8d9d13fffd34213dfbf5e7373a18222a
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>


--- build/qt5base-5.15.2_orig/config.summary     2021-11-14 00:00:33.698378466 +0100
+++ build/qt5base-5.15.2/config.summary 2021-11-14 13:16:42.818139194 +0100
@@ -30,7 +30,7 @@
   Using pkg-config ....................... yes
   udev ................................... no
   Using system zlib ...................... yes
-  Zstandard support ...................... no
+  Zstandard support ...................... yes


Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter


> ---
>  package/qt5/qt5base/qt5base.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 9da3de468a..b04d710d78 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -116,6 +116,13 @@ else
>  QT5BASE_CONFIGURE_OPTS += -no-cups
>  endif
>
> +ifeq ($(BR2_PACKAGE_ZSTD),y)
> +QT5BASE_DEPENDENCIES += zstd
> +QT5BASE_CONFIGURE_OPTS += -zstd
> +else
> +QT5BASE_CONFIGURE_OPTS += -no-zstd
> +endif
> +
>  # Qt5 SQL Plugins
>  ifeq ($(BR2_PACKAGE_QT5BASE_SQL),y)
>  ifeq ($(BR2_PACKAGE_QT5BASE_MYSQL),y)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
