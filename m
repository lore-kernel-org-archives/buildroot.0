Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C457C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 09:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F77E41EB3;
	Sun,  7 May 2023 09:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F77E41EB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yVjilrLoaCUf; Sun,  7 May 2023 09:11:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4356441E36;
	Sun,  7 May 2023 09:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4356441E36
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B33D81BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 09:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99A2960F21
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 09:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99A2960F21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mnYRo4vVqacZ for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 09:11:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68D7C60BA7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68D7C60BA7
 for <buildroot@buildroot.org>; Sun,  7 May 2023 09:11:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6D90B19F5AF;
 Sun,  7 May 2023 11:11:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 11:11:29 +0200
Date: Sun, 7 May 2023 11:11:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230507091129.GC252090@scaer>
References: <20230503161756.741506-1-bernd.kuhls@t-online.de>
 <20230503161756.741506-2-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230503161756.741506-2-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683450692;
 bh=CISsF2UduHsy85bgcHUtkF2i8+o5X3Wui6wFnXGfdBc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PV8TXmYvzVU2sawb5eU0+o9LxfzTjPqzYG7W6GGDd/IpsQv6fPQ8TNp8sJx1IKpzR
 tqPcGlLc6flicwcDFLt/xLS+3nOk4rum2iIuglLrLFRqvKh+1UFEEt+u75AN8H5dF0
 cxXAk7Wl/eg96nIvg21Ew/7uuNH4ZbnGuCvir2XeUlCvqd40mpbpArJmQEiZGtHcc5
 nhHIYvdcCLzyuWV2hE/oTQaa9R47dS6Do55ubTqZA2AULwyo9na9LeyeyMukL8G7Ql
 ZUeESg9mb0kKqaDId07M72cnxIaAC1fspSM0b9KQUkcU32y/dx2digPHVhN9MBzEpX
 UrgoMDQQ1QhzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PV8TXmYv
Subject: Re: [Buildroot] [PATCH 2/2] package/samba4: bump version to 4.18.2
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

Bernd, All,

On 2023-05-03 18:17 +0200, Bernd Kuhls spake thusly:
> Removed patches which were applied upstream, rebased remaining patches.
> Added patch 0004 to avoid dependency to perl package JSON:PP.
> 
> This bump depends on bumping heimdal, see previous patch of this series.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
[--SNIP--]
> diff --git a/package/samba4/0004-perl-json-pp.patch b/package/samba4/0004-perl-json-pp.patch
> new file mode 100644
> index 0000000000..caab58bad2
> --- /dev/null
> +++ b/package/samba4/0004-perl-json-pp.patch
> @@ -0,0 +1,27 @@
> +Use perl module JSON, part of core, instead of JSON:PP package
> +
> +Downloaded from
> +https://github.com/openwrt/packages/blob/master/net/samba4/patches/105-perl-json-pp.patch
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

    $ ./utils-docker-run make check-package
    package/samba4/0004-perl-json-pp.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)

Support for the Upstream tag was added after you submnitted your patch,
so I've fixed that by adding an 'Upstream: unknown' tag.

Also, samba is managed in a git tree, so the patches should be git
formatted. I've fixed that as well.

Please, submit this change upstream and update the status.

I also updated the .checkpackageignore list while at it, as the two
patches you removed were ignored from check-package (because of missing
Upstream tags).

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +--- a/third_party/heimdal/cf/make-proto.pl
> ++++ b/third_party/heimdal/cf/make-proto.pl
> +@@ -4,7 +4,7 @@
> + use Getopt::Std;
> + use File::Compare;
> + 
> +-use JSON;
> ++use JSON::PP;
> + 
> + my $comment = 0;
> + my $doxygen = 0;
> +@@ -70,7 +70,7 @@ if($opt_x) {
> +     my $EXP;
> +     local $/;
> +     open(EXP, '<', $opt_x) || die "open ${opt_x}";
> +-    my $obj = JSON->new->utf8->decode(<EXP>);
> ++    my $obj = JSON::PP->new->utf8->decode(<EXP>);
> +     close $EXP;
> + 
> +     foreach my $x (keys %$obj) {
> diff --git a/package/samba4/0005-samba-4.16.2-fix-build-without-innetgr.patch b/package/samba4/0005-samba-4.16.2-fix-build-without-innetgr.patch
> deleted file mode 100644
> index b338596d7a..0000000000
> --- a/package/samba4/0005-samba-4.16.2-fix-build-without-innetgr.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -# Gentoo bug 855047
> -
> -Fixes uClibc build when uClibc was build without netgroup support.
> -Upstream enables netgroup support based on getdomainname() being
> -present:
> -https://github.com/samba-team/samba/commit/f179184a2be2ddd38f463fcc12252f8d24e529f8#diff-b8d1bc25b89846e70ecb61cb296a8f5c50c9a0a1b62e46790fae81aa9d5bfaaeR632
> -
> -Downloaded from
> -https://gitweb.gentoo.org/repo/gentoo.git/tree/net-fs/samba/files/samba-4.16.2-fix-musl-without-innetgr.patch
> -
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> -
> ---- a/lib/util/access.c
> -+++ b/lib/util/access.c
> -@@ -115,7 +115,7 @@ static bool string_match(const char *tok,const char *s)
> - 			return true;
> - 		}
> - 	} else if (tok[0] == '@') { /* netgroup: look it up */
> --#ifdef HAVE_NETGROUP
> -+#if defined(HAVE_NETGROUP) && defined(HAVE_INNETGR)
> - 		DATA_BLOB tmp;
> - 		char *mydomain = NULL;
> - 		char *hostname = NULL;
> ---- a/source3/auth/user_util.c
> -+++ b/source3/auth/user_util.c
> -@@ -135,7 +135,7 @@ static void store_map_in_gencache(TALLOC_CTX *ctx, const char *from, const char
> -
> - bool user_in_netgroup(TALLOC_CTX *ctx, const char *user, const char *ngname)
> - {
> --#ifdef HAVE_NETGROUP
> -+#if defined(HAVE_NETGROUP) && defined(HAVE_INNETGR)
> - 	char nis_domain_buf[256];
> - 	const char *nis_domain = NULL;
> - 	char *lowercase_user = NULL;
> diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
> index 18ec63e07a..20390fb6b4 100644
> --- a/package/samba4/samba4.hash
> +++ b/package/samba4/samba4.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://download.samba.org/pub/samba/stable/samba-4.15.13.tar.asc
> -sha256  c412e3536a5265d04e52983e643bae9e047bcc3eac08683a945b1057ecdf4968  samba-4.15.13.tar.gz
> +# https://download.samba.org/pub/samba/stable/samba-4.18.2.tar.asc
> +sha256  5bf87e179616cd12a52d85fb8b26eec709f13709a2b67fe42b1fb0213f7e8106  samba-4.18.2.tar.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index b979aaf09f..2799dbe2f7 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SAMBA4_VERSION = 4.15.13
> +SAMBA4_VERSION = 4.18.2
>  SAMBA4_SITE = https://download.samba.org/pub/samba/stable
>  SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
>  SAMBA4_INSTALL_STAGING = YES
> @@ -120,7 +120,7 @@ define SAMBA4_CONFIGURE_CMDS
>  		PERL="$(HOST_DIR)/bin/perl" \
>  		$(TARGET_CONFIGURE_OPTS) \
>  		$(SAMBA4_CONF_ENV) \
> -		./buildtools/bin/waf configure \
> +		./configure \
>  			--prefix=/usr \
>  			--sysconfdir=/etc \
>  			--localstatedir=/var \
> -- 
> 2.39.2
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
