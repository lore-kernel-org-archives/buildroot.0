Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50CAEB28FE
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 09:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77C2D840D4;
	Fri,  6 Feb 2026 09:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yq6hQD_W96OO; Fri,  6 Feb 2026 09:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E3A3840D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770371571;
	bh=bYo4CdJDO58RYXOyj/uc8kZbOBO9gnKRB8ixJSR9QMA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YocjtPoXPpzhGUwN3N31vAcZkbGyXrf0xzx/48CyRtHFlty38bYvausimXz3tC6sD
	 OW0Ym1FvM9pC/eovIp1sy7X9RCsmBYyoRGrXTU21CpI1b4Su86umeYoPFTN+/yrixt
	 tjVMrN9zCAI4lhStCF/MkENqOwCJXo9VqYUQAjNsAUE1Vyn+Ln8WhEywINcwVVdumg
	 4fCyVoNmWX89k+rgHzapuJNx3hDhH8S7jqeYVUqPV/gjjohBfZLXrB3W1mugGWJ7pG
	 I2xWZ+dNYnFQsa8PAdDrThduj77cMvIAUyZbTRRXnY6hFTb0N/Vb1Wma7oXPQT4xW0
	 i1homncyREgbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E3A3840D7;
	Fri,  6 Feb 2026 09:52:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C0CBA173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 09:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5AC440906
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 09:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UGOitDjYZQHi for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 09:52:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1FCA6408FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FCA6408FD
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FCA6408FD
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 09:52:47 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from pc-1 ([82.135.81.177]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNbox-1wCoaH48t9-00WxIh; Fri, 06
 Feb 2026 10:52:43 +0100
Date: Fri, 6 Feb 2026 10:52:42 +0100
To: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Cc: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Marcus Folkesson
 <marcus.folkesson@gmail.com>
Message-ID: <20260206105242.0f66fb07@pc-1>
In-Reply-To: <20260206085907.55734-1-pyk@foss.peewhy.fr>
References: <dadf142b65d555320d468640356df43b@free.fr>
 <20260206085907.55734-1-pyk@foss.peewhy.fr>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:7oegFW0OCP0Knl9z+XaKxAorpk6SddoyzU5Ou1+dyH1/A59n8e2
 0eodh2DfWjoYea4FMKS9CDXr1vDWELED7zcXpu4h6GeGQpxukARfbUXRix5A0bBdaZiCMJ7
 56k7fJN8F6pT8zNWIEaYI7AhCnvgKi8i2lqstnsotVNaYDrh6vnMo9VED2U96dPMKssXJG2
 WfDAbFqJI5rKjJCq1fqTA==
UI-OutboundReport: notjunk:1;M01:P0:VG2k8YRSjac=;ch3Pk7mDgGnOcQdUDyNXIehqde2
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1770371563; x=1770976363; i=ps.report@gmx.net;
 bh=e+dWlTSwiNCQTHIq53SyTd5WvVMLZMKFwpbcHVsi8mI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=doQT+lyJ9T8t0v3SSwog7xJE1XtJnH3atRhTPHMggRy8gMbq8KzJd2wlD1r0GXRW
 vwpUca4LQocBdadvsMAzReFXO5CI1bV+eeyxIhwidLzAlq1bVJQKZDsK7LMJeLkOG
 3+jNj50ipal/eoibPvxFe5IG2DrT3niVrn28fgD6tR40oWU/KsoqrFw4tGlzGD0u9
 tPm4M4eRwMpDv8mEyDTqyV9kE1NtUkb1biv9CCCq4pbNb1jyArkGuux/LlO+TWfrq
 rkhbHm/AuuMmBl31B0ab5HHZW/nl822d8D/lhIVdfA9S8KCllXw4vpPP0SxNr1pqw
 T65ZN0SYcJMy4lyPhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=doQT+lyJ
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: bump to v0.7.0
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Pierre-Yves,

On Fri,  6 Feb 2026 09:59:07 +0100, Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org> wrote:

> Changelog:
> https://git.linuxtv.org/libcamera.git/tag/?h=v0.7.0
> 
> Add missing licenses hash:
> - LICENSES/Apache-2.0.txt
> Added with: https://git.linuxtv.org/libcamera.git/commit/LICENSES/Apache-2.0.txt?id=ce02faa088dd3128a097b0f7ac6ce4e507e89f98

License was not added with this commit, but only renamed, see [1]...

This license was omitted back in 2020 with the comment (see [2]):
	'Apache-2.0 omitted - applies only for android code'

Not sure if this is still valid with the current version (and apologize for not
leaving a comment in libcamera.mk)...

> - LICENSES/CC-BY-4.0.txt
> Added with: https://git.linuxtv.org/libcamera.git/commit/LICENSES/CC-BY-4.0.txt?id=b4e31a88d304e09e200af9d1e00760074cc854c2

According to the commit 'Documentation: theme: Specify license of search.png' this one is only for the file 'search.png'....

Regards,
Peter

[1] https://git.linuxtv.org/libcamera.git/commit/?id=ce02faa088dd3128a097b0f7ac6ce4e507e89f98
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/f63d6b54591680e11e7f5c7e129ea6b08aaf3f0d

> 
> Signed-off-by: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
> 
> ---
> Changes v1 -> v2:
> - add missing licenses libcamera.mk
> - reorder licenses entries alphabetically
> ---
>  package/libcamera/libcamera.hash |  4 +++-
>  package/libcamera/libcamera.mk   | 29 +++++++++++++++++------------
>  2 files changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> index 4e79be844e60..bddff77cda21 100644
> --- a/package/libcamera/libcamera.hash
> +++ b/package/libcamera/libcamera.hash
> @@ -1,10 +1,12 @@
>  # Locally computed
> -sha256  85d85409d6e04bcf2e1ed57d9b59ebcc9fb770e5d39690d7ac233e9784835b89  libcamera-v0.6.0-git4.tar.gz
> +sha256  9e684bfcb8679e5e7ec7fb0da9dec68e71f0b75a6b0c8edcd892b26a92726a92  libcamera-v0.7.0-git4.tar.gz
>  
>  # license files
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSES/Apache-2.0.txt
>  sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
>  sha256  e11af671c491efac2f94c1d752bea92f4308ca2450c7d11e582e4b48c40e4de1  LICENSES/BSD-3-Clause.txt
>  sha256  6a573fb2f9082662978cf21fb153096df0a1981deaea7dbc10a11046fe005d9f  LICENSES/CC0-1.0.txt
> +sha256  d557539df68e771cc1eedcc91d13f70fca930e508d11eedcafa4b15db49e3744  LICENSES/CC-BY-4.0.txt
>  sha256  ec3732087acf8c52429a020d6bba362ff578705bdb53365a21744485ec15b0e6  LICENSES/CC-BY-SA-4.0.txt
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
>  sha256  606aa26338f69ce178f1cbc648b7574aec4b5bbaeb20f4df36ff49010cb8fbbd  LICENSES/GPL-2.0-or-later.txt
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index e86e05328c1c..67a4bdaeb1dd 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> -LIBCAMERA_VERSION = v0.6.0
> +LIBCAMERA_VERSION = v0.7.0
>  LIBCAMERA_SITE_METHOD = git
>  LIBCAMERA_DEPENDENCIES = \
>  	host-openssl \
> @@ -23,23 +23,28 @@ LIBCAMERA_CONF_OPTS = \
>  	-Dwerror=false
>  LIBCAMERA_INSTALL_STAGING = YES
>  LIBCAMERA_LICENSE = \
> -	LGPL-2.1+ (library), \
> -	GPL-2.0+ (utils), \
> -	MIT (qcam/assets/feathericons), \
> +	Apache-2.0 (library),\
>  	BSD-2-Clause (raspberrypi), \
> -	GPL-2.0 with Linux-syscall-note or BSD-3-Clause (linux kernel headers), \
> +	BSD-3-Clause (utils library), \
> +	CC-BY-4.0 (doc), \
> +	CC-BY-SA-4.0 (doc), \
>  	CC0-1.0 (meson build system), \
> -	CC-BY-SA-4.0 (doc)
> +	GPL-2.0 with Linux-syscall-note or BSD-3-Clause (linux kernel headers), \
> +	GPL-2.0+ (utils), \
> +	LGPL-2.1+ (library), \
> +	MIT (qcam/assets/feathericons)
>  LIBCAMERA_LICENSE_FILES = \
> -	LICENSES/LGPL-2.1-or-later.txt \
> -	LICENSES/GPL-2.0-or-later.txt \
> -	LICENSES/MIT.txt \
> +	LICENSES/Apache-2.0.txt \
>  	LICENSES/BSD-2-Clause.txt \
> -	LICENSES/GPL-2.0-only.txt \
> -	LICENSES/Linux-syscall-note.txt \
>  	LICENSES/BSD-3-Clause.txt \
> +	LICENSES/CC-BY-4.0.txt \
> +	LICENSES/CC-BY-SA-4.0.txt \
>  	LICENSES/CC0-1.0.txt \
> -	LICENSES/CC-BY-SA-4.0.txt
> +	LICENSES/GPL-2.0-only.txt \
> +	LICENSES/GPL-2.0-or-later.txt \
> +	LICENSES/LGPL-2.1-or-later.txt \
> +	LICENSES/Linux-syscall-note.txt \
> +	LICENSES/MIT.txt
>  
>  ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_7),y)
>  LIBCAMERA_CXXFLAGS = -faligned-new

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
