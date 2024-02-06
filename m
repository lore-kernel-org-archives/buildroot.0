Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C361BC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 09:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FBEF81E03;
	Tue,  6 Feb 2024 09:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WYQpTLoHnBhv; Tue,  6 Feb 2024 09:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B33281E08
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B33281E08;
	Tue,  6 Feb 2024 09:44:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55D861BF27C
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 09:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CDD24152A
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 09:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CDD24152A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D4pTSz_OZ7Pv for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 09:44:55 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DC4041A22
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 09:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DC4041A22
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE12120010;
 Tue,  6 Feb 2024 09:44:51 +0000 (UTC)
Date: Tue, 6 Feb 2024 10:44:50 +0100
To: Matt Silva <dev@matt-silva.com>
Message-ID: <20240206104450.23163730@windsurf>
In-Reply-To: <20240126024914.13825-1-dev@matt-silva.com>
References: <20240126024914.13825-1-dev@matt-silva.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707212691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApVDxUC+AScXK+0CyJqll38RaRGURq3hl/QlrdhgPxQ=;
 b=D9LyWjS3ysRoOk9olnjVZlYULn252O6QFKkdWyAoF9wgZTNDVLfPUvAUJDp1xdBeVmLUwX
 +TG4l9YJDn2edRc2ZZNzCG451DN6PDGb9uBCgHuI7jpLKzc+PIUXjPoaCqgUeQ3H5yTlQb
 R9tEJkhC+lQIfKyIqVBvzGaGqonl0S6nhZK6rCafaG74CYPZjkg1odZ0I8HVPzTuP0xCxQ
 29Y4J81PQUlY2pmRTj9pMfaXFMoaHrbUNa5Q7AgvJW3bhh2YwScOJTxA1A0R3jtDkMoJKJ
 rU4gv5CGcSdWiRwZMwLLCqL4hwP5vZwnJAX6mDAoObaoH3/S/pQ+5vixn8HNBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D9LyWjS3
Subject: Re: [Buildroot] [PATCH 1/1] package/rlwrap: new package
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

Hello Matt,

On Thu, 25 Jan 2024 21:49:14 -0500
Matt Silva <dev@matt-silva.com> wrote:

> Signed-off-by: Matt Silva <dev@matt-silva.com>

Thanks a lot for your contribution! I applied your patch to our master
branch, after doing a number of changes, see below for the details.

>  package/Config.in          |  1 +
>  package/rlwrap/Config.in   | 58 ++++++++++++++++++++++++++++++++++++++
>  package/rlwrap/rlwrap.hash |  6 ++++
>  package/rlwrap/rlwrap.mk   | 48 +++++++++++++++++++++++++++++++
>  4 files changed, 113 insertions(+)

For all new packages, we require to have an entry in the DEVELOPERS
file, so that you get notified if there are build failures for this
package, or if the package needs to be update for security issues, or
when there's a new release upstream.

> +config BR2_PACKAGE_RLWRAP_DEBUG
> +	bool "enable debug"

This option is not needed, it should be controlled by
BR2_ENABLE_RUNTIME_DEBUG. Actually, I thought BR2_ENABLE_RUNTIME_DEBUG
was automatically passing --enable-debug to all packages, but it's not
the case. So if you care about debugging, we would need a follow-up
patch that passes --enable-debug when BR2_ENABLE_RUNTIME_DEBUG is set.

> +config BR2_PACKAGE_RLWRAP_PROC_MOUNTPOINT
> +	string "proc mountpoint"
> +	default "/proc"

This option is not needed: Buildroot will always mount proc in /proc,
and things will anyway break in all sorts of ways if proc is mounted
elsewhere.

> diff --git a/package/rlwrap/rlwrap.mk b/package/rlwrap/rlwrap.mk
> new file mode 100644
> index 0000000000..6f9de8281c
> --- /dev/null
> +++ b/package/rlwrap/rlwrap.mk
> @@ -0,0 +1,48 @@
> +################################################################################
> +#
> +# rlwrap
> +#
> +################################################################################
> +
> +# https://github.com/hanslub42/rlwrap/releases/download/0.46.1/rlwrap-0.46.1.tar.gz

This comment is not needed.

> +
> +RLWRAP_VERSION = 0.46.1
> +RLWRAP_SOURCE = rlwrap-$(RLWRAP_VERSION).tar.gz

This line is not needed, and actually triggers a "make check-package"
warning.

> +RLWRAP_SITE = https://github.com/hanslub42/rlwrap/releases/download/$(RLWRAP_VERSION)
> +RLWRAP_LICENSE = GPL-2.0

The license really is GPL-2.0+.

> +RLWRAP_LICENSE_FILES = AUTHORS COPYING
> +
> +RLWRAP_DEPENDENCIES = readline
> +
> +# --enable-spy-on-readline
> +ifeq ($(BR2_PACKAGE_RLWRAP_SPY_ON_READLINE),y)
> +RLWRAP_CONF_OPTS += --enable-spy-on-readline
> +else
> +RLWRAP_CONF_OPTS += --disable-spy-on-readline
> +endif
> +
> +# --enable-homegrown-redisplay
> +ifeq ($(BR2_PACKAGE_RLWRAP_HOMEGROWN_REDISPLAY),y)
> +RLWRAP_CONF_OPTS += --enable-homegrown-redisplay
> +else
> +RLWRAP_CONF_OPTS += --disable-homegrown-redisplay
> +endif
> +
> +# --enable-debug
> +ifeq ($(BR2_PACKAGE_RLWRAP_DEBUG),y)
> +RLWRAP_CONF_OPTS += --enable-debug
> +else
> +RLWRAP_CONF_OPTS += --disable-debug
> +endif

I dropped this part.

> +# --enable-proc-mountpoint
> +RLWRAP_CONF_OPTS += --enable-proc-mountpoint=$(BR2_PACKAGE_RLWRAP_PROC_MOUNTPOINT)

And this part.

Also, I added this:

+define RLWRAP_REMOVE_FILTERS
+       $(RM) -rf $(TARGET_DIR)/usr/share/rlwrap/filters
+endef
+RLWRAP_POST_INSTALL_TARGET_HOOKS += RLWRAP_REMOVE_FILTERS

Indeed, those filters are written in Python or Perl, and your package
does not depend on them. In addition, the documentation says:

   Filters are `perl` or `python` plugins that enable complete (albeit
   somewhat fragile) control over `rlwrap`'s input and output, echo,
   prompt, history and completion. They aren't used a lot, and remain
   therefore somewhat untested. `rlwrap -z listing` lists the installed
   filters, `rlwrap -z <somefilter>` displays a short help text for
   `<somefilter>`

"They aren't used a lot". So for now, we drop them unconditionally. We
can always revisit if someone needs them later.

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
