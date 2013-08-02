From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Aug 2013 10:28:51 +0200
Subject: [Buildroot] [PATCH 1 of 2 v2] infra: introduce
 suitable-extractor helper function
In-Reply-To: <b277803240198c7900d9.1375390547@BEANTN0L019720>
References: <patchbomb.1375390546@BEANTN0L019720>
 <b277803240198c7900d9.1375390547@BEANTN0L019720>
Message-ID: <20130802102851.388356b2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 01 Aug 2013 22:55:47 +0200, Thomas De Schampheleire wrote:

> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -62,6 +62,8 @@ INFLATE.tbz2 = $(BZCAT)
>  INFLATE.tgz  = $(ZCAT)
>  INFLATE.xz   = $(XZCAT)
>  INFLATE.tar  = cat
> +# suitable-extractor(filename): returns extractor based on suffix
> +suitable-extractor = $(firstword $(INFLATE$(suffix $(1))))

Do you know why we need this $(firstword ...) call here? In all places
in was using directly $(INFLATE$(...)), except in the package
infrastructure where it was doing this firstword additional call.

It was added by Peter in 2c6390a5d0c01420879e9f23bc89afb19976da4a.

Ideas?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
