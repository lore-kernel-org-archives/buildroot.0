From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 22:13:24 +0100
Subject: [Buildroot] [PATCH 1/1] iputils: resolve musl compatibility
In-Reply-To: <1453089044-10391-1-git-send-email-matt@thewebers.ws>
References: <1453089044-10391-1-git-send-email-matt@thewebers.ws>
Message-ID: <20160119221324.74332232@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt,

Some more comments (see below).

On Mon, 18 Jan 2016 03:50:44 +0000, Matt Weber wrote:

> diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
> index 21a2044..fcca52c 100644
> --- a/package/iputils/iputils.hash
> +++ b/package/iputils/iputils.hash
> @@ -1,2 +1,4 @@
> +# Locally computed
> +sha256	0e98cb527fa175d1e08afb969c124e452b30968f10ec2c3b078f1440c8977a94	iputils-c8ff6feaf0442f8efd96ccb415770c54f9e84d47.tar.gz
>  # From http://sourceforge.net/projects/iputils/files/
>  sha1	3e85179746fd93000d6267bd55addfe97f321ba7	iputils-s20121011.tar.bz2

Why are you keeping the hash for the old tarball ?

> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index 7510d99..d427b11 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -4,13 +4,12 @@
>  #
>  ################################################################################
>  
> -IPUTILS_VERSION = s20121011
> -IPUTILS_SITE = http://www.skbuff.net/iputils
> -IPUTILS_SOURCE = iputils-$(IPUTILS_VERSION).tar.bz2
> -IPUTILS_LICENSE = GPLv2+, BSD-3c
> +IPUTILS_VERSION = c8ff6feaf0442f8efd96ccb415770c54f9e84d47
> +IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))

I don't understand why you are moving to github.
http://www.skbuff.net/iputils has some recent tarballs, which
correspond to the releases made on github.
http://www.skbuff.net/iputils/iputils-s20151218.tar.bz2 will most
likely contain the musl fixes.

I'll mark your patch as Changes Requested in patchwork. Can you respin
after fixing the issues raised during the review?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
