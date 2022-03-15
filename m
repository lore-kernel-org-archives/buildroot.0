Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7584C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68117416FA;
	Tue, 15 Mar 2022 21:05:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jxElHCm_aEX5; Tue, 15 Mar 2022 21:05:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CBD7416F5;
	Tue, 15 Mar 2022 21:05:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2C8E1BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A14814019F
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KrjW-6hM5KNF for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:05:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CFDF416F5
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:05:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 50CCE200003;
 Tue, 15 Mar 2022 21:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647378332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K+5ymYw3dNPZxFEDzau7//vnnNs7qUDOQr+0nQTeCxI=;
 b=Y2iN8DzPz28fBun7VOzJhvnN99X9MX0j01TwFrkROCgDRg17YsQvCOQnFfdAOuBh5Sw2zd
 z30SOIiFBvY0IYmdn50E9Rk6How4jS4Y/G2pflIjzo6Q+Vy4FAcj2am6nyoOkq+tv1Kug6
 +iRmJTvka6U/LGegX+6SczshQ5an9tmcEzAZ/Ih3iqgFhACBmtpGlea0OXWFKiTt++LGOA
 gQeR+K/Diwh4YfycVjbPF9zfKLJzrvnX/InhSq62jGw6Qvqu7XrzZR4hF93QRgy25Ye6V3
 jtKVKYOm1YGeS8MlqYksdnjGyAotUSH4eqZ3x3Q5tb6oD/dn+uRPGGlSxXkGMg==
Date: Tue, 15 Mar 2022 22:05:31 +0100
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220315220531.2bac9c2d@windsurf>
In-Reply-To: <20220311065042.8687-1-ps.report@gmx.net>
References: <20220311065042.8687-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/wget: bump version to 1.21.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter,

On Fri, 11 Mar 2022 07:50:42 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - explicit set some default options (--without-metalink, --enable-opie,
>   --enable-digest, --enable-ntlm, --disable-debug, --disable-valgrind-tests,
>   --disable-assert)
> 
> - add optional libpsl dependency
> 
> - remove legacy --with-libidn option (see [1]), replace with
>   new --enable-iri option in case libiconv and libidn2 are available
> 
> - use explicit --with-libuuid option
> 
> - add optional c-ares dependency
> 
> For details see [2].
> 
> [1] https://git.savannah.gnu.org/cgit/wget.git/commit/configure.ac?id=a24e67e239ef949cc77a4c4e5a0beb703026a296
> [2] https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00017.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

You're mixing up a minor version bump with a significant rework of the
package, which is unrelated to the version bump. This really needs
separate commit. Also, see below.


> +WGET_CONF_OPTS = \
> +	--without-metalink \
> +	--enable-opie \
> +	--enable-digest \
> +	--enable-ntlm \

So opie, digest and ntlm enabled is the default?

> +	--disable-debug \
> +	--disable-valgrind-tests \
> +	--disable-assert
> +
> +ifeq ($(BR2_PACKAGE_LIBPSL),y)
> +WGET_CONF_OPTS += --with-libpsl
> +WGET_DEPENDENCIES += libpsl
> +else
> +WGET_CONF_OPTS += --without-libpsl
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GNUTLS),y)
>  WGET_CONF_OPTS += --with-ssl=gnutls
>  WGET_DEPENDENCIES += gnutls
> @@ -22,19 +38,18 @@ else
>  WGET_CONF_OPTS += --without-ssl
>  endif
>  
> -ifeq ($(BR2_PACKAGE_LIBICONV),y)
> -WGET_DEPENDENCIES += libiconv
> -endif
> -
> -ifeq ($(BR2_PACKAGE_LIBIDN2),y)
> -WGET_CONF_OPTS += --with-libidn
> -WGET_DEPENDENCIES += libidn2
> +ifeq ($(BR2_PACKAGE_LIBICONV)$(BR2_PACKAGE_LIBIDN2),yy)

This is very likely wrong. Indeed BR2_PACKAGE_LIBICONV=y is only
possible when the toolchain does *not* have locale support. When the
toolchain has locale support, iconv support is provided by the
toolchain itself.

Could you revisit this, and also clarify the interaction between
--enable-iri/--disable-iri on one side and
--with-libidn/--without-libidn on the other side?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
