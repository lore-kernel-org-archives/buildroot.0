Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18C4C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 11:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F70A4170B;
	Thu, 18 Aug 2022 11:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F70A4170B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d9F_PsGsloq5; Thu, 18 Aug 2022 11:08:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ABF74092B;
	Thu, 18 Aug 2022 11:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ABF74092B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 546AB1BF303
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 11:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F07B84054
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 11:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F07B84054
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R4yp2pmHvwwH for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 11:08:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A77078404F
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A77078404F
 for <buildroot@busybox.net>; Thu, 18 Aug 2022 11:08:21 +0000 (UTC)
Received: from opfednr04.francetelecom.fr (unknown [xx.xx.xx.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr22.francetelecom.fr (ESMTP service) with ESMTPS id 4M7hvR2qQyzyhp;
 Thu, 18 Aug 2022 13:08:19 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Thu, 18 Aug 2022 13:08:16 +0200
Date: Thu, 18 Aug 2022 13:08:16 +0200
From: <yann.morin@orange.com>
To: Michael Fischer <mf@go-sys.de>
Message-ID: <13166_1660820899_62FE1DA3_13166_238_1_20220818110816.GA3169@tl-lnx-nyma7486>
References: <20220818102115.6310-1-mf@go-sys.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220818102115.6310-1-mf@go-sys.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX404.corporate.adroot.infra.ftgroup
 (10.115.26.17) To OPE16NORMBX301.corporate.adroot.infra.ftgroup
 (10.115.26.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1660820899;
 bh=3VuUHTgOgK7yklYr7lFqteEfEHTf/ms/d6cstUABJL0=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=ei2k30AaaDAwYO62KAIuZuCOyGzMxUyXdRVggIP/6XA1JGXpekywn99XWBnLv8fmn
 dwHF/4ZLibx7OTDj9HLrKznhQcSTnjsRJ/fqiLN34ZNDGzaklnjYJafENzhhudMom2
 nbTe5Mc0jBP7v7pqGkAnJSCS21DGaqTBh1dArX3hFxxAbxr73nuSnXgffvyTPun/vm
 XgQT4A4dOtrW12qLw7jGic3aTDFW67BdbZihmLpK8JUOnDtVEW8wM0csInDeaSm/b3
 L9a4AT4wbUyessPdMp/wEOApbA/uqGaUsTAzc7kaLCbE1p/0y/a8NCSzG9fPjJw29f
 Wa2DVs6CYRMgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=ei2k30Aa
Subject: Re: [Buildroot] [PATCH 1/1] package/gdb: add support for gdb 12.x
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michael, All,

On 2022-08-18 12:21 +0200, Michael Fischer spake thusly:
> All patch from gdb 11.2 are kept.

We already have gdb-12.x in the 'next' branch:

    https://git.buildroot.org/buildroot/commit/?h=next&id=a493f6288baf4d4ea71c2ce7b93e7dbe868f926e
    https://git.buildroot.org/buildroot/commit/?h=next&id=5c89b00a205232745aa41e307d44498f325da94a
    https://git.buildroot.org/buildroot/commit/?h=next&id=7b977af16e67c9dfeac943c0c5c59840a8c2f233
    https://git.buildroot.org/buildroot/commit/?h=next&id=c4eddacad79509c9786672a2abab1ba45de600c7
    https://git.buildroot.org/buildroot/commit/?h=next&id=3ae900bcf965b79982a8780d5010ee512576a735

Regards,
Yann E. MORIN.

> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  package/gdb/Config.in      |  1 +
>  package/gdb/Config.in.host |  5 +++++
>  package/gdb/gdb.hash       |  1 +
>  package/gdb/gdb.mk         | 14 ++++++++++++--
>  4 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gdb/Config.in b/package/gdb/Config.in
> index 71fa6f6064..c50c3d517a 100644
> --- a/package/gdb/Config.in
> +++ b/package/gdb/Config.in
> @@ -52,6 +52,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
>  	depends on BR2_USE_WCHAR
>  	depends on !BR2_sh
>  	select BR2_PACKAGE_GMP if BR2_GDB_VERSION_11
> +	select BR2_PACKAGE_GMP if BR2_GDB_VERSION_12
>  	select BR2_PACKAGE_NCURSES
>  
>  comment "full gdb on target needs a toolchain w/ wchar"
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index a294103ca3..9ee0b3f913 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -57,6 +57,9 @@ config BR2_GDB_VERSION_10
>  config BR2_GDB_VERSION_11
>  	bool "gdb 11.x"
>  
> +config BR2_GDB_VERSION_12
> +	bool "gdb 12.x"
> +
>  endchoice
>  
>  endif
> @@ -68,6 +71,7 @@ config BR2_GDB_VERSION
>  	default "9.2"      if BR2_GDB_VERSION_9_2
>  	default "10.2"	   if BR2_GDB_VERSION_10 || !BR2_PACKAGE_HOST_GDB
>  	default "11.2"     if BR2_GDB_VERSION_11
> +	default "12.1"     if BR2_GDB_VERSION_12
>  	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
>  
>  # recent gdb versions (>= 10) have gdbserver moved at the top-level,
> @@ -77,5 +81,6 @@ config BR2_PACKAGE_GDB_TOPLEVEL
>  	default y if BR2_arc
>  	default y if BR2_GDB_VERSION_10
>  	default y if BR2_GDB_VERSION_11
> +	default y if BR2_GDB_VERSION_12
>  	default y if !BR2_PACKAGE_HOST_GDB
>  	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
> diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
> index cb7f4c805d..3a1027dbb5 100644
> --- a/package/gdb/gdb.hash
> +++ b/package/gdb/gdb.hash
> @@ -2,6 +2,7 @@
>  sha512  73635f00f343117aa5e2436f1e1597099e2bfb31ef7bb162b273fa1ea282c3fa9b0f52762e70bfc7ad0334addb8d159e9ac7cbe5998ca4f755ea8cf90714d274  gdb-9.2.tar.xz
>  sha512  3653762ac008e065c37cd641653184c9ff7ce51ee2222ade1122bec9d6cc64dffd4fb74888ef11ac1942064a08910e96b7865112ad37f4602eb0a16bed074caa  gdb-10.2.tar.xz
>  sha512  07e9026423438049b11f4f784d57401ece4e940570f613bd6958b3714fe7fbc2c048470bcce3e7d7d9f93331cdf3881d30dcc964cb113a071143a02b28e5b127  gdb-11.2.tar.xz
> +sha512  425568d2e84672177d0fb87b1ad7daafdde097648d605e30cf0656970f66adc6a82ca2d83375ea4be583e9683a340e5bfdf5819668ddf66728200141ae50ff2d  gdb-12.1.tar.xz
>  
>  # Locally calculated (fetched from Github)
>  sha512  5a2acf2fd33ab2ff589e1037ca40abda54328997dcff26b2b49b874bd3be980be5a63342962254f3c3bda98e32ce7a33af704d37353352833dee193135600458  gdb-arc-2020.09-release-gdb.tar.gz
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 86e57481de..1cf11695ba 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -65,12 +65,16 @@ GDB_DEPENDENCIES += host-flex host-bison
>  HOST_GDB_DEPENDENCIES += host-flex host-bison
>  endif
>  
> -# When BR2_GDB_VERSION_11=y, we're going to build gdb 11.x for the
> +# When BR2_GDB_VERSION_{11,12}=y, we're going to build gdb for the
>  # host (if enabled), so we add the necessary gmp dependency.
>  ifeq ($(BR2_GDB_VERSION_11),y)
>  HOST_GDB_DEPENDENCIES += host-gmp
>  endif
>  
> +ifeq ($(BR2_GDB_VERSION_12),y)
> +HOST_GDB_DEPENDENCIES += host-gmp
> +endif
> +
>  # When gdb sources are fetched from the binutils-gdb repository, they
>  # also contain the binutils sources, but binutils shouldn't be built,
>  # so we disable it (additionally the option --disable-install-libbfd
> @@ -155,7 +159,7 @@ GDB_CONF_OPTS += \
>  	--without-curses
>  endif
>  
> -# When BR2_GDB_VERSION_11=y (because it's enabled for the host) and
> +# When BR2_GDB_VERSION_{11,12}=y (because it's enabled for the host) and
>  # we're building the full gdb for the target, we need gmp as a
>  # dependency. For now the default gdb version in Buildroot doesn't
>  # require gmp.
> @@ -165,6 +169,12 @@ GDB_CONF_OPTS += \
>  GDB_DEPENDENCIES += gmp
>  endif
>  
> +ifeq ($(BR2_GDB_VERSION_12)$(BR2_PACKAGE_GDB_DEBUGGER),yy)
> +GDB_CONF_OPTS += \
> +	--with-libgmp-prefix=$(STAGING_DIR)/usr
> +GDB_DEPENDENCIES += gmp
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
>  GDB_CONF_OPTS += --enable-gdbserver
>  GDB_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
