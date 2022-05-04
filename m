Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14776C433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 12:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD0BC40BB3;
	Wed,  4 May 2022 12:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id veIc3yO_0rS1; Wed,  4 May 2022 12:28:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C222B40B08;
	Wed,  4 May 2022 12:28:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23C9C1BF3FC
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 12:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1233340ABA
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 12:28:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ghaTeSjMG0jw for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 12:28:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07DEB40B08
 for <buildroot@buildroot.org>; Wed,  4 May 2022 12:28:20 +0000 (UTC)
Received: from pwmachine.localnet (154.pool92-186-13.dynamic.orange.es
 [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 04D9520EB0D7;
 Wed,  4 May 2022 05:28:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 04D9520EB0D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1651667299;
 bh=sO6thqMnNrqkuwgYejUxHuNWxwFuv+j5qYRx6tRL4wA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Sda3l8AfLemFyRPKaJL6NslwgJ7iwBReaz1joVPLF/KmupTmjcK+nQH6/N8pAQY/+
 XlPJavDJLxKVfRvRzaIFr9h1WHTGEb7c5CL3zjy3tjbR3pGaxDaqolnt421YqGMr8f
 kPfTCL4xzg8Ns0kiSgj3NTqivOdjB4wHBdx1bGAg=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 04 May 2022 13:28:16 +0100
Message-ID: <2628018.mvXUDI8C0e@pwmachine>
Organization: Microsoft
In-Reply-To: <20220503192216.GB2575@scaer>
References: <20220503142701.14397-1-flaniel@linux.microsoft.com>
 <20220503142701.14397-3-flaniel@linux.microsoft.com>
 <20220503192216.GB2575@scaer>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/sysdig: bump to version 0.29.2
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi!

Le mardi 3 mai 2022, 20:22:16 BST Yann E. MORIN a =E9crit :
> Francis, All,
> =

> On 2022-05-03 15:27 +0100, Francis Laniel spake thusly:
> > Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> > ---
> > =

> >  package/sysdig/sysdig.hash | 2 +-
> >  package/sysdig/sysdig.mk   | 5 +++--
> >  2 files changed, 4 insertions(+), 3 deletions(-)
> > =

> > diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
> > index 380c9dce1e..c953421f27 100644
> > --- a/package/sysdig/sysdig.hash
> > +++ b/package/sysdig/sysdig.hash
> > @@ -1,3 +1,3 @@
> > =

> >  # sha256 locally computed
> > =

> > -sha256  3721c97f0da43c1a68d2962d30363525d8532ab5f2534dfefc86d175e17e42=
3e =

> > sysdig-0.29.1.tar.gz +sha256 =

> > 38ea602085f706af5d07630189216fa240064122650a81456cb092579313ae8e =

> > sysdig-0.29.2.tar.gz> =

> >  sha256  a88fbf820b38b1c7fabc6efe291b8259e02ae21326f56fe31c6c9adf374b27=
02 =

> >  COPYING> =

> > diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
> > index 318746d44a..2d57c0043f 100644
> > --- a/package/sysdig/sysdig.mk
> > +++ b/package/sysdig/sysdig.mk
> > @@ -4,7 +4,7 @@
> > =

> >  #
> >  ######################################################################=
###
> >  #######> =

> > -SYSDIG_VERSION =3D 0.29.1
> > +SYSDIG_VERSION =3D 0.29.2
> > =

> >  SYSDIG_SITE =3D $(call github,draios,sysdig,$(SYSDIG_VERSION))
> >  SYSDIG_LICENSE =3D Apache-2.0
> >  SYSDIG_LICENSE_FILE =3D COPYING
> > =

> > @@ -32,6 +32,7 @@ SYSDIG_CONF_OPTS +=3D
> > -DFALCOSECURITY_LIBS_SOURCE_DIR=3D$(FALCOSECURITY_LIBS_SRCDIR)> =

> >  	-DENABLE_DKMS=3DOFF \
> >  	-DUSE_BUNDLED_DEPS=3DOFF \
> >  	-DWITH_CHISEL=3DON \
> > =

> > -	-DVALIJSON_INCLUDE=3D$(BUILD_DIR)/valijson-0.6/include/valijson
> > +	-DVALIJSON_INCLUDE=3D$(BUILD_DIR)/valijson-0.6/include/valijson \
> > +	-DSYSDIG_VERSION=3D$(SYSDIG_VERSION)
> =

> I've extended the commit log to explain why we need to explicitly set
> the version string.
> =

> Applied to master, thanks.

Thank you a lot for the merges and still sorry for the nit in previous =

commit...
I will take more care next time!

> Regards,
> Yann E. MORIN.
> =

> >  $(eval $(cmake-package))




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
