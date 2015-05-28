From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Thu, 28 May 2015 17:48:56 +0200
Subject: [Buildroot] [PATCH v2 2/2] fcgiwrap: new package
In-Reply-To: <1432827404-1096-3-git-send-email-thomas.claveirole@green-communications.fr>
References: <1432827404-1096-1-git-send-email-thomas.claveirole@green-communications.fr>
 <1432827404-1096-3-git-send-email-thomas.claveirole@green-communications.fr>
Message-ID: <2180182.WAXogVfu7L@hardbit>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> [...]
> diff --git a/package/fcgiwrap/fcgiwrap.mk
> b/package/fcgiwrap/fcgiwrap.mk new file mode 100644
> index 0000000..844f1a3
> --- /dev/null
> +++ b/package/fcgiwrap/fcgiwrap.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# fcgiwrap
> +#
> +################################################################################
> +
> +FCGIWRAP_VERSION = 1.1.0
> +FCGIWRAP_SITE = $(call github,gnosek,fcgiwrap,$(FCGIWRAP_VERSION))
> +FCGIWRAP_DEPENDENCIES = host-pkgconf libfcgi
> +FCGIWRAP_LICENSE = MIT
> +FCGIWRAP_AUTORECONF = YES
> +
> +$(eval $(autotools-package))

Erf, sorry, this is wrong.  I forgot the

FCGIWRAP_MAKE_OPTS = CC="$(TARGET_CC)" LD="$(TARGET_LD)"

line and now fcgiwrap is not cross-compiled anymore.
Sending a new series soon.  Sorry for the noise.

-- 
Thomas Claveirole <thomas.claveirole@green-communications.fr>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150528/75267de0/attachment.asc>
