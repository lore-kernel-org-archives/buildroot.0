Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2BBC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 19:47:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7A4260F02
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 19:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7A4260F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BC61405BD;
	Sat,  9 Oct 2021 19:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EpRBYlJHAheD; Sat,  9 Oct 2021 19:47:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D227B405A3;
	Sat,  9 Oct 2021 19:47:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11A001BF31A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 19:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6EA24058B
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 19:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5k9Tbhchfzkc for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 19:47:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E0F140588
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 19:47:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2D7D4FF802;
 Sat,  9 Oct 2021 19:47:00 +0000 (UTC)
Date: Sat, 9 Oct 2021 21:46:59 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211009214659.30a58c90@windsurf>
In-Reply-To: <20211009170242.486738-1-fontaine.fabrice@gmail.com>
References: <20211009170242.486738-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/transmission: fix build with
 autoconf >= 2.71
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sat,  9 Oct 2021 19:02:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump of autoconf to version
> 2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:
> 
> ERROR: 'IT_PROG_INTLTOOL' must appear in configure.ac for intltool to work.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e8bea26f6b12adf16335b24836a7c5c31911af6a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ac-fix-autoreconf-with-autoconf-2.71.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/transmission/0003-configure.ac-fix-autoreconf-with-autoconf-2.71.patch
> 
> diff --git a/package/transmission/0003-configure.ac-fix-autoreconf-with-autoconf-2.71.patch b/package/transmission/0003-configure.ac-fix-autoreconf-with-autoconf-2.71.patch
> new file mode 100644
> index 0000000000..9522f611ba
> --- /dev/null
> +++ b/package/transmission/0003-configure.ac-fix-autoreconf-with-autoconf-2.71.patch
> @@ -0,0 +1,39 @@
> +From 857ac91a03a096601f62b358fc61355d4cc25b9b Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 9 Oct 2021 18:51:13 +0200
> +Subject: [PATCH] configure.ac: fix autoreconf with autoconf >= 2.71
> +
> +Remove the whitespace before IT_PROG_INTLTOOL as suggested in
> +https://www.mail-archive.com/bug-autoconf@gnu.org/msg04851.html
> +to avoid the following build failure with autoconf >= 2.71:
> +
> +ERROR: 'IT_PROG_INTLTOOL' must appear in configure.ac for intltool to work.
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/e8bea26f6b12adf16335b24836a7c5c31911af6a
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: not upstreamable as upstream swicthed to cmake (
> +https://github.com/transmission/transmission/issues/1573)]

I am rather confused, because I don't see any changes between autoconf
2.70 and 2.71 that seem to explain this, and the message "ERROR:
'IT_PROG_INTLTOOL' must appear in configure.ac for intltool to work"
comes from intltoolize.in, which is in host-intltool, which has not
been updated for at least 2 years in Buildroot.

> +@@ -555,9 +555,7 @@ dnl it should be safe to re-edit 0.40 back down to 0.23
> + use_nls=no
> + if test "x$enable_nls" = "xyes" ; then
> +     use_nls=yes
> +-    m4_ifdef([IT_PROG_INTLTOOL],
> +-             [IT_PROG_INTLTOOL([0.35.0],[no-xml])],
> +-             [AC_MSG_ERROR("--enable-nls requires intltool to be installed.")])
> ++IT_PROG_INTLTOOL([0.35.0],[no-xml])
> +     AC_CHECK_HEADERS([libintl.h])
> +     GETTEXT_PACKAGE=transmission-gtk
> +     AC_SUBST(GETTEXT_PACKAGE)

So you're getting rid of the IT_PROG_INTLTOOL m4_ifdef test ? I guess
it's OK in the context of Buildroot, because transmission
unconditionally depends on host-intltool, so IT_PROG_INTLTOOL will
always be available.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
