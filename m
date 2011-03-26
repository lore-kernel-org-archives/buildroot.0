From: Gerhard Heift <ml-buildroot-20110324-cba5@gheift.de>
Date: Sat, 26 Mar 2011 15:23:09 +0100
Subject: [Buildroot] Add Package:  htop
In-Reply-To: <4D8D1B88.8040906@AdTran.com>
References: <4D8D1B88.8040906@AdTran.com>
Message-ID: <20110326142309.GB23871@wastebin.kawo1.rwth-aachen.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 25, 2011 at 05:47:36PM -0500, Andy Kennedy wrote:
> Adds package htop.  Changes made based upon e-mails with Mike Frysinger.
> 
> Signed-off-by:  Andy Kennedy <Andy.Kennedy@AdTran.com>
> ---
> diff -Naur a/package/Config.in b/package/Config.in

[snip]

> diff -Naur a/package/htop/htop.mk b/package/htop/htop.mk
> --- a/package/htop/htop.mk      1969-12-31 18:00:00.000000000 -0600
> +++ b/package/htop/htop.mk      2011-03-22 09:31:54.000000000 -0500
> @@ -0,0 +1,12 @@
> +#############################################################
> +#
> +# htop
> +#
> +#############################################################
> +HTOP_VERSION = 0.9
> +HTOP_SOURCE = htop-$(HTOP_VERSION).tar.gz
> +HTOP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/htop/$(HTOP_VERSION)
> +HTOP_DEPENDENCIES = ncurses
> +HTOP_AUTORECONF=yes

The value of *_AUTORECONF has to be an uppercase YES.

> +
> +$(eval $(call AUTOTARGETS,package,htop))

Regards,
  Gerhard
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110326/86f2aa47/attachment.asc>
