Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C7BC433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:40:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB8A261107
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB8A261107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 703F060771;
	Tue,  9 Nov 2021 10:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uvP0VXjvMqHr; Tue,  9 Nov 2021 10:40:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C14D3606CA;
	Tue,  9 Nov 2021 10:40:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A8711BF2C0
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3947D40128
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:40:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LHDGj1yF26tC for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:40:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6A27400BA
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:40:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:710f:610b:602a:e07])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 2B6732003DD;
 Tue,  9 Nov 2021 11:40:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636454436;
 bh=vyA5749q1Dy8kOqHpEtELzhY68QbLpBiI3loG51XLgY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lfiYEkgf9dHYhga+OWewL5Ybaq6isJwjZ+B7/AlnC8vJNnYdf/nQ4ZY4i+H0IFfkg
 jiL491TMADb1DEEbzjR6udPRL2H+vEfBO3voNlfecyfhdTwtOsa7B3OrQPjvriQQny
 IYbe8a5nDiGefqGVLvS850GX14Tm77OBqVi6n63OOPrfQLklFc/INI1GKeKd44pndS
 cGESaj6etyv7YCiZ9//Elsh5TEqEKnxVSLPloH3s3WZqdkNfNot5fYgMd7KOdj3YPS
 QpoKEsyEHPv4IFrcOzNUgAt7d6aYDO91HJYHYKeskp+rQjKAFFygutFtSydTfqN7fW
 Pouku9SWMwVcg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 09 Nov 2021 11:40:31 +0100
Date: Tue, 9 Nov 2021 11:40:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211109104031.GG680793@scaer>
References: <20211109071001.3866765-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211109071001.3866765-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/tpm2-tss: fix build on host
 without useradd
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-11-09 08:10 +0100, Fabrice Fontaine spake thusly:
> Override check for useradd as already done for setfacl since commit
> d9123dd79956124ab1b39427764882b61fe44261 to avoid the following build
> failure:
> 
> checking for useradd... no
> configure: error: Missing required program 'useradd': ensure it is installed and on PATH.

It is also looking for systemd_sysusers and systemd_tmpfiles, but those
two are not mandatory. However, it might find those from the host.

But that is not an issue in the end, because they are only used to
instanciate the users and create the tmpfiles. At build time on the
host, we do not need them, and on the target, if systemd is being used,
then they will be instanciated/created at boot.

If they are not found, then the fallback paths are taken, and those
fallback paths are those using the setfacl and groupadd and useradd
tools, which we already know are going to fail but that we do not care.

So, we can safely force those two to =no to avoid the install trying to
use the system-wide tools, or even the ones we build as part of
host-systemd ourselves.

Applied to master with those two added to the list, plus a comment to
explain why, also in t e commit log. Thanks!

Regards,
Yann E. MORIN.

> Fixes:
>  - http://autobuild.buildroot.org/results//97bfa8f7dcb12e36bd63c9d06fb39418070d840b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/tpm2-tss/tpm2-tss.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
> index f2b5f32171..f35e994a5c 100644
> --- a/package/tpm2-tss/tpm2-tss.mk
> +++ b/package/tpm2-tss/tpm2-tss.mk
> @@ -19,6 +19,7 @@ TPM2_TSS_AUTORECONF = YES
>  TPM2_TSS_CONF_OPTS = \
>  	ac_cv_prog_result_groupadd=yes \
>  	ac_cv_prog_result_setfacl=yes \
> +	ac_cv_prog_result_useradd=yes \
>  	--with-crypto=ossl \
>  	--disable-doxygen-doc \
>  	--disable-defaultflags
> -- 
> 2.33.0
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
