From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 14 Jan 2011 16:27:49 -0500
Subject: [Buildroot] [PATCH 3/7] toolchain: add a USE_MMU build option
In-Reply-To: <87y66nvfcd.fsf@macbook.be.48ers.dk>
References: <1294669718-5339-1-git-send-email-vapier@gentoo.org>
	<1294669725-5379-3-git-send-email-vapier@gentoo.org>
	<87y66nvfcd.fsf@macbook.be.48ers.dk>
Message-ID: <201101141627.50341.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, January 14, 2011 07:29:06 Peter Korsgaard wrote:
> >>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:
>  Mike> Some packages need to know whether the MMU is in play, so add a
> toolchain Mike> option to expose the feature to them.
> 
>  Mike> +++ b/toolchain/toolchain-common.in
>  Mike> @@ -66,6 +66,13 @@ config BR2_NEEDS_GETTEXT_IF_LOCALE
>  Mike>  	bool
>  Mike>  	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
> 
>  Mike> +config BR2_USE_MMU
>  Mike> +	bool "Enable MMU support"
>  Mike> +	default y
>  Mike> +	help
>  Mike> +	  If your target has a MMU, you should say Y here.  If you
>  Mike> +	  are unsure, just say Y.
> 
> I think it makes sense to only show this option on archs where nommu
> makes sense to not confuse users. - E.G.:
> 
> bool "Enable MMU support" if BR2_arm || BR2_armeb ...
> 
> What archs currently have working nommu support in uClibc?

any arch can be built as "nommu".  it simply means certain functions are not 
enabled (like fork) while others are not as complicated (like malloc).  so 
there is no technical limitation that only certain arches support nommu.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110114/33f46c08/attachment.asc>
