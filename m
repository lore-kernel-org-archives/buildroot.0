Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A42C433FE
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 19:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD33E60D72;
	Fri, 21 Oct 2022 19:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD33E60D72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t29iL9YcXAlQ; Fri, 21 Oct 2022 19:10:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E195A60BC1;
	Fri, 21 Oct 2022 19:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E195A60BC1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF7F11BF846
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 19:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AABA060BC1
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 19:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AABA060BC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r6kJvJ3ruBE3 for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 19:10:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7D8B60B83
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7D8B60B83
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 19:10:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e722:2033:afe6:a970])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A3C315FF95;
 Fri, 21 Oct 2022 21:10:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 21 Oct 2022 21:10:05 +0200
Date: Fri, 21 Oct 2022 21:10:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yann.morin@orange.com
Message-ID: <20221021191005.GE2992523@scaer>
References: <9796_1665746309_63494585_9796_388_2_2b0b6b796ff36967c963ba90f138a03d467ee5cf.1665746266.git.yann.morin@orange.com>
 <8818_1665746314_6349458A_8818_181_1_964b37c54bd0ea2c0ca9a24787249f3276aec699.1665746266.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8818_1665746314_6349458A_8818_181_1_964b37c54bd0ea2c0ca9a24787249f3276aec699.1665746266.git.yann.morin@orange.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1666379412;
 bh=Ynzyj3GlMY7AVfy4LI0Kc1Wn1vzWQIpfrHs+2lEi8c8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aEuk/j0lTboo5Bs8I3JTOSHqZqO88nwUWsvx19C6vSgm4abCaoGhNtr7hL4AzAGb7
 ikoE/9ubeLjsiLK0lkcv5enS1oqJ8IKLEXjjPg93ZRMvZ7Au9CqieAnsEiOD6IxI6J
 1avyXNTx/Z6MkKga2Fmjvc8f7R13K14rUr2QhEnOr2VzLhlkLUnut6TBxlL7dGIlnH
 0zIH5wOARPbUadk/+OC+BT21x6FptSSOrYAiKIWep+Pav9AH4AMK/8dhSe9SgldTb5
 LxBgZ7p2lv7A+eUHwu5T7oudqZewPwv2bAxCGvd8EhRpJfJmlVTOuNppEn4wjkq8EX
 F+TdVvMFaJ7mQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aEuk/j0l
Subject: Re: [Buildroot] [PATCH 3/3] toolchain: suppot gconv modules fro
 mglibc >= 2.34
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, All,

In the title: *support, from glibc

Also, many typoes in the commit log...

On 2022-10-14 13:18 +0200, yann.morin@orange.com spake thusly:
> Startig with glibc 2.34, the gconv modules description has been split in
> two:
>   - a common definition in the old location, /usr/lib/gconv/gconv-modules
>   - specific defitions in a subdirectory, /usr/lib/gconv/gconv-modules.d/
> 
> This is done so as to simplify the handling of glibc gconv modules, and
> eventually to segregate those outside of glibc, and so that third-parties
> may also provide their own gconv converters and their definitions.
> 
> And starting with that same glibc version, most of the gconv modules
> definition is moved to an extra configuration file in that
> sub-directory.
> 
> It is thus no longer possible to use special code pages, like cp850,
> which are very usefull to access FAT-formatted devices.
> 
> Add suppot for this new gconv layout, while keeping support for older
> glibc versions. Note that the modules themselves are not moved or
> renaed, just the definition files have changed.
> 
> Instead of passing the one old gonv modules definitions file on stdin,
> we pass the base directory to that file, and move into the script the
> responsibility to find all the gconv definition files.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master with the many typoes fixed, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/scripts/expunge-gconv-modules | 22 ++++++++++++++++------
>  toolchain/toolchain.mk                |  9 +++++++--
>  2 files changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/support/scripts/expunge-gconv-modules b/support/scripts/expunge-gconv-modules
> index bc60fc0ce4..e9ac48ca3f 100755
> --- a/support/scripts/expunge-gconv-modules
> +++ b/support/scripts/expunge-gconv-modules
> @@ -1,11 +1,17 @@
>  #!/usr/bin/env bash
>  
>  # This script is used to generate a gconv-modules file that takes into
> -# account only the gconv modules installed by Buildroot. It receives
> -# on its standard input the original complete gconv-modules file from
> -# the toolchain, and as arguments the list of gconv modules that were
> -# actually installed, and writes on its standard output the new
> -# gconv-modules file.
> +# account only the gconv modules installed by Buildroot, and generates
> +# a stripped-down gconv-moduels file on its stdout.
> +# It takes two arguments:
> +#   $1: the directory where to look for gconv modules definitions
> +#   $2: a space-separated list of gconv modules that were actually
> +#       installed
> +
> +# Starting with glibc-2.34, modules definitions are located in multiple
> +# files:
> +#   ${1}/gconv-modules
> +#   ${1}/gconv-modules.d/*.conf
>  
>  # The format of gconv-modules is precisely documented in the
>  # file itself. It consists of two different directives:
> @@ -19,7 +25,11 @@
>  # we handle each with slightly different code, since the second never has
>  # associated aliases.
>  
> -awk -v files="${2}" '
> +for f in ${1}/gconv-modules ${1}/gconv-modules.d/*.conf; do
> +    [ -e "${f}" ] || continue
> +    cat "${f}"
> +done \
> +|awk -v files="${2}" '
>  $1 == "alias" {
>      aliases[$3] = aliases[$3] " " $2;
>  }
> diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
> index 08d1649603..fe87a72ed4 100644
> --- a/toolchain/toolchain.mk
> +++ b/toolchain/toolchain.mk
> @@ -27,6 +27,10 @@ define TOOLCHAIN_GLIBC_COPY_GCONV_LIBS
>  		$(INSTALL) -m 0644 $(STAGING_DIR)/usr/lib/$${d}/gconv/*.so \
>  				   $(TARGET_DIR)/usr/lib/gconv \
>  		|| exit 1; \
> +		if [ -d $(STAGING_DIR)/usr/lib/$${d}/gconv/gconv-modules.d ]; then \
> +			cp -a $(STAGING_DIR)/usr/lib/$${d}/gconv/gconv-modules.d \
> +				$(TARGET_DIR)/usr/lib/gconv/ || exit 1; \
> +		fi; \
>  	else \
>  		for l in $(TOOLCHAIN_GLIBC_GCONV_LIBS); do \
>  			$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/$${d}/gconv/$${l}.so \
> @@ -41,8 +45,9 @@ define TOOLCHAIN_GLIBC_COPY_GCONV_LIBS
>  				 || exit 1; \
>  			done; \
>  		done; \
> -		./support/scripts/expunge-gconv-modules "$(TOOLCHAIN_GLIBC_GCONV_LIBS)" \
> -			<$(STAGING_DIR)/usr/lib/$${d}/gconv/gconv-modules \
> +		./support/scripts/expunge-gconv-modules \
> +			$(STAGING_DIR)/usr/lib/$${d}/gconv \
> +			"$(TOOLCHAIN_GLIBC_GCONV_LIBS)" \
>  			>$(TARGET_DIR)/usr/lib/gconv/gconv-modules; \
>  	fi
>  endef
> -- 
> 2.25.1
> 
> 
> _________________________________________________________________________________________________________________________
> 
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
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
