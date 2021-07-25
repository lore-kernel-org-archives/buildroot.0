Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B92C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 08:03:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD57E60F23
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 08:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD57E60F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FF026FAF9;
	Sun, 25 Jul 2021 08:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qd4CL2_UmJIs; Sun, 25 Jul 2021 08:03:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABD706FAF7;
	Sun, 25 Jul 2021 08:03:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FA171BF37B
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 08:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7ACCB6FAF7
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 08:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UxQ633H93abK for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 08:03:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92C946FAF6
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 08:03:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4802:7ee4:40b0:1519])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0C70A78034D;
 Sun, 25 Jul 2021 10:02:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627200183;
 bh=5kOZJwua/QW6WN5NM5DVg7iivCr+z4i4oytkKhwOq+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i8kypUHjAx7RGTLHwwOl7cyAHS8Yli8bIQviCvbkc01kQDnHzbVd+LeG6pyAmbKZS
 dkVxInME1gszbpZ28G2WKuCC4N0CY3CtWMRMduiLTIidN/0wyxOrSvyt1SLv+dEtHX
 34VZ1vZOoy4I4q8CNE1Sbspm5gew3FkSanmCL1+wBZ5XwLFGc0iqGN8jbS09e+XbSf
 y3VX/SajLjl8mRhaAtM7BR7O9P613CVNeZULNUckEQbvoZS3s9+7buNAKReqVEaq6L
 hgCYVUk/bUlENQ6hgpnYOZVDjPbuPN0CejGSyVTFWhV58yxt2D8bdOOSij8ZF2ljHw
 4RrpgOyryAmlQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Jul 2021 10:02:58 +0200
Date: Sun, 25 Jul 2021 10:02:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210725080258.GR2382418@scaer>
References: <20210725074855.855272-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210725074855.855272-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/netsnmp: fix legal info
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-07-25 09:48 +0200, Fabrice Fontaine spake thusly:
> Commit 87bef179222ee8a0b0f39c8f96113a4ecf813085 wrongly removed hash of
> COPYING
> 
> Fixes:
>  - No autobuilder failures
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/netsnmp/netsnmp.hash | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/netsnmp/netsnmp.hash b/package/netsnmp/netsnmp.hash
> index e3adb28c6d..9d196c8bee 100644
> --- a/package/netsnmp/netsnmp.hash
> +++ b/package/netsnmp/netsnmp.hash
> @@ -2,3 +2,6 @@
>  # https://sourceforge.net/projects/net-snmp/files/net-snmp/5.9/net-snmp-5.9.tar.gz.asc
>  # using key D0F8F495DA6160C44EFFBF10F07B9D2DACB19FD6
>  sha256  04303a66f85d6d8b16d3cc53bde50428877c82ab524e17591dfceaeb94df6071  net-snmp-5.9.tar.gz
> +
> +# Hash for license file
> +sha256  ed869ea395a1f125819a56676385ab0557a21507764bf56f2943302011381e59  COPYING
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
