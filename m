From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 May 2010 15:23:15 +0200
Subject: [Buildroot] [PATCH] package: Add support for clex filemanager
 (v 3.19)
In-Reply-To: <201005130115.00927.PeterHuewe@gmx.de>
References: <201005130115.00927.PeterHuewe@gmx.de>
Message-ID: <20100513152315.322e934f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Thanks for your contribution!

On Thu, 13 May 2010 01:15:00 +0200
Peter Huewe <PeterHuewe@gmx.de> wrote:

>  package/clex/clex.mk                |  103 +++++++++++++++++++++++++++++++++++

clex seems to use the autotools as their build system, therefore
your .mk file should use the Buildroot autotools infrastructure. See
http://buildroot.uclibc.org/downloads/buildroot.html#autotools-tutorial
for details.

> +++ b/package/clex/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_CLEX
> +	bool "clex filemanager"
> +	default n

You can remove this "default n", this is the default value.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
