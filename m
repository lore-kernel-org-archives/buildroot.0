Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE30CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 10:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BB6660AE4;
	Sat, 15 Jan 2022 10:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZmY6WxcENYHG; Sat, 15 Jan 2022 10:19:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7AAC60AC0;
	Sat, 15 Jan 2022 10:19:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C69C81BF5DD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFDFE40584
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M-gkbObs6s46 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 10:19:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A57A24056A
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 10:19:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:edb9:18:17ad:29d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D5BAF19F59D;
 Sat, 15 Jan 2022 11:19:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642241974;
 bh=P6G/MSFj197XXkqRwVXwkoAhdQEDdT7AVtcNOBGw2U8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K0/VRlBpJa+AbNbFI6QH4h5jGWtybW4p20fRjdLcBQolBXgfy1CwnrLFu46Ct0jBV
 7iMW2nq33mhzi1FWfrLLmm8da59usXH17V3ySPfHIiUNR4k6Np1JN4v5Gqlje7Vrua
 FFqGAz5UxtnhXYTBJPg7hGuqAViYzQ5gz+z6ldbdEUgjiR5lDoIEVR/2KIaCvPilWf
 PLX/4WfJjjpyffssWzb9pPis34uOJnTWdbcqiwBEbMz+ekSsGdh33t+zdnI+/7xC/7
 DBAT19WO2k3jZNtUOQn3tJMRVBI8TzH46nuMLU7XthYrohYWhPMD6LwMjyy8Bj9SUE
 q8hgHpIu5fobA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jan 2022 11:19:29 +0100
Date: Sat, 15 Jan 2022 11:19:29 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220115101929.GI1945846@scaer>
References: <20220114214526.1153063-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220114214526.1153063-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/ipmitool: add freeipmi optional
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-14 22:45 +0100, Fabrice Fontaine spake thusly:
> freeipmi is an optional dependency which is enabled by default
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ipmitool/ipmitool.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
> index facd97a0b8..801f1ea6b0 100644
> --- a/package/ipmitool/ipmitool.mk
> +++ b/package/ipmitool/ipmitool.mk
> @@ -19,6 +19,13 @@ IPMITOOL_CPE_ID_VENDOR = ipmitool_project
>  # 0013-fru-sdr-Fix-id_string-buffer-overflows.patch
>  IPMITOOL_IGNORE_CVES += CVE-2020-5208
>  
> +ifeq ($(BR2_PACKAGE_FREEIPMI),y)
> +IPMITOOL_DEPENDENCIES += freeipmi
> +IPMITOOL_CONF_OPTS += --enable-intf-free
> +else
> +IPMITOOL_CONF_OPTS += --disable-intf-free
> +endif
> +
>  ifeq ($(BR2_PACKAGE_IPMITOOL_LANPLUS),y)
>  IPMITOOL_DEPENDENCIES += openssl
>  IPMITOOL_CONF_OPTS += --enable-intf-lanplus
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
