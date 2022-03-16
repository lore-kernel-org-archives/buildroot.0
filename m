Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7512C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 20:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B452841F5;
	Wed, 16 Mar 2022 20:39:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J85Zhi37t5u2; Wed, 16 Mar 2022 20:39:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52F6F841BF;
	Wed, 16 Mar 2022 20:39:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8DAF1BF38A
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 20:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3AF640ADF
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 20:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fJFjvO1SVwyT for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 20:39:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A65C540018
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 20:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647463159;
 bh=FwgfIPEFwg0wyol3b67ap7T1imQVQ86N6qA+3x0MqLI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=i7nnsSsfH0EK4jzU+Dbwbd27/fk4MYmd7TVwsLVUiGiL+D9MgKDcfI/Do93fjSXzn
 JCs6HEJYs2kXYZggLIYIXE7qjHfk7xEFRKJSNMrGwBP/EPughMJ5SPLSLdz/Bef4jw
 jmVEny3eoTyjwN03lLgGVPv7MhILbHkw47r6o1Iw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.226]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWAOW-1nabk52OXi-00XYgz; Wed, 16
 Mar 2022 21:39:19 +0100
Date: Wed, 16 Mar 2022 21:39:18 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220316213918.67ea4d94@gmx.net>
In-Reply-To: <20220315220531.2bac9c2d@windsurf>
References: <20220311065042.8687-1-ps.report@gmx.net>
 <20220315220531.2bac9c2d@windsurf>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:sI5ganzjYSoY4/HuP2bda4dEj8aN5b+hmXrex1mXdrOT1vVJWH5
 eg7YJF/PiD9dexm8EDWxc9xbp1fzCcEpaEU6VeZGRjVZS+qoawtUXKxEiovM/3F0HMYwjOM
 Iqcm9v/Fg75vSZKuH7RrJLn01X+lBnIM7Tvjihnf590X8TNP/MD1UeSVx308nr0SMf0GL9b
 kND/zGYASwc8JGDA+owZg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:N9Riy0oPAFA=:5jq6NY7iNZ2okiAz6npK//
 weVNYDlegZ91WJvHQtPWk9KFSJmWTDyCqOBDU9qevAsbhqZ2Ua+6FhWPSYVATUeUKPAHYt5gq
 /1mCMmPJVtYA2OYZOGYoYRhdtGGCK3rwFlBFX4lFT/fVeWAVqDmoU4TTk1xBuw1bvPd2o4KXw
 ckplhXpeb1Jot7Wz748mqToXIzgv6ySXaE4hR0W48Bc+xHyKH54XEf7j0NR3c6dEZ1TTd9lhz
 Cj7Nsvvo3x6dNtuf0gWRiHi8ECqqC3q4jng5NWth8vGlmesrazGd41ZZ9Zg1biRlst7wrRdkC
 r1KXf98+d4VcqkBNnus2R/i5RZ8uOKm3gskh06zzuSiD2LQdWHqUhqpo6tdFrBkWjZl9mzg1D
 MdCWZJl7Otir/U/iI8SRIoWVXCUEhftG9GoHpwNuz/dRreSZDv4XCDk8XKmuyGfcb6CvpTY2i
 V2kaONi/NZ07hfcXkUH3E/6HczhFU6r1/a4ehjbPm3EdpEyyD+xfcQYeglNfNqxqBoYi3HnZJ
 7ANgoljqtbbEHrMXjTlLBjFcxI7G7JsdUcLvsj/wGmtIlM04Xtsfe0YMo13hRavfcuEVLqah8
 k9qR0+ZCqC6FziAgCKhUjjs52Qb1U1cjGoLXp0QtTnYW/9Jf2ihw4nNEVI9IklBaRQJbl8Owc
 m4B1PC3DkJ+jj/HYXlvvMsWQQlpKw7pFAB8aRcL1+2GqQBg++lgjYC0SCdCV309O1MWVaMwdu
 LmKkBk7BLX4qhPXrOkE7m80RQTUj55SO/bQpjlMGoW7y/VyZ5FC0Z1KgPnuuEfyr1uYPoqfNJ
 4v3SKYBm6jGgRKDpKBXA/WdHW902VMh//pmIgFteAzrEml77Wn2C9WUJmNr/COHPT2xoUqxbn
 AYr+QG1bIfsONQEwgR+0vq0Ut2aUf6XFjfojwlXm3KG7QYvRmpMBMT10pihWyejWet09d/Noz
 N+P8rBHmJQRqY+r/SKJf5zcTuN2smZRL9AzXoVTFEEUthOwiHnDtkoPz0E9UN42Y+T2LBEW+6
 cJYG4ioxBq1hjwL7rv1ug2eZqy9v29djkth5nGyIGtKEYmD5V1flMs7szvquokNTDma325JML
 lEUEelGkeNyE+Y=
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Tue, 15 Mar 2022 22:05:31 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Peter,
>
> On Fri, 11 Mar 2022 07:50:42 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > - explicit set some default options (--without-metalink, --enable-opie,
> >   --enable-digest, --enable-ntlm, --disable-debug, --disable-valgrind-tests,
> >   --disable-assert)
> >
> > - add optional libpsl dependency
> >
> > - remove legacy --with-libidn option (see [1]), replace with
> >   new --enable-iri option in case libiconv and libidn2 are available
> >
> > - use explicit --with-libuuid option
> >
> > - add optional c-ares dependency
> >
> > For details see [2].
> >
> > [1] https://git.savannah.gnu.org/cgit/wget.git/commit/configure.ac?id=a24e67e239ef949cc77a4c4e5a0beb703026a296
> > [2] https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00017.html
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> You're mixing up a minor version bump with a significant rework of the
> package, which is unrelated to the version bump. This really needs
> separate commit. Also, see below.

Started as a minor/patch-level version bump....and did take a look at the
configure.ac changes ;-), will split up the patch on next iteration...
>
>
> > +WGET_CONF_OPTS = \
> > +	--without-metalink \
> > +	--enable-opie \
> > +	--enable-digest \
> > +	--enable-ntlm \
>
> So opie, digest and ntlm enabled is the default?

Yes (this is what I wanted to express in the commit log by 'explicit set some
default options')...

>
> > +	--disable-debug \
> > +	--disable-valgrind-tests \
> > +	--disable-assert

Same here...

> > +
> > +ifeq ($(BR2_PACKAGE_LIBPSL),y)
> > +WGET_CONF_OPTS += --with-libpsl
> > +WGET_DEPENDENCIES += libpsl
> > +else
> > +WGET_CONF_OPTS += --without-libpsl
> > +endif
> > +
> >  ifeq ($(BR2_PACKAGE_GNUTLS),y)
> >  WGET_CONF_OPTS += --with-ssl=gnutls
> >  WGET_DEPENDENCIES += gnutls
> > @@ -22,19 +38,18 @@ else
> >  WGET_CONF_OPTS += --without-ssl
> >  endif
> >
> > -ifeq ($(BR2_PACKAGE_LIBICONV),y)
> > -WGET_DEPENDENCIES += libiconv
> > -endif
> > -
> > -ifeq ($(BR2_PACKAGE_LIBIDN2),y)
> > -WGET_CONF_OPTS += --with-libidn
> > -WGET_DEPENDENCIES += libidn2
> > +ifeq ($(BR2_PACKAGE_LIBICONV)$(BR2_PACKAGE_LIBIDN2),yy)
>
> This is very likely wrong. Indeed BR2_PACKAGE_LIBICONV=y is only
> possible when the toolchain does *not* have locale support. When the
> toolchain has locale support, iconv support is provided by the
> toolchain itself.

Ups, did misread the following configure.ac part:

 780 AS_IF([test "X$iri" != "Xno"],[
 781   if test "X$am_cv_func_iconv" != "Xyes"; then
 782     iri=no
 783     if test "X$force_iri" = "Xyes"; then
 784       AC_MSG_ERROR([Libiconv is required for IRIs support])
 785     else
 786       AC_MSG_NOTICE([disabling IRIs because libiconv wasn't found])
 787     fi
 788   fi
 789 ])

>
> Could you revisit this, and also clarify the interaction between
> --enable-iri/--disable-iri on one side and
> --with-libidn/--without-libidn on the other side?

The old 'with-libidn/without-libidn' option is gone, libidn2 is checked via
pkg-config, the new option is 'enable-iri/disable-iri' (or auto-detect)...

Will update the patch (soon)...., thanks for review!

Regards,
Peter

>
> Thanks!
>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
