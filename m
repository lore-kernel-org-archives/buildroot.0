From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 24 Jan 2016 21:25:50 +0100
Subject: [Buildroot] [PATCH 0/8] Remove uClibc version selection: always
 use uClibc-ng
In-Reply-To: <1453148701-10036-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453148701-10036-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56A5334E.7070203@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 18/01/2016 21:24, Thomas Petazzoni a ?crit :
> Hello,
> 
> Since April 2015, the uClibc-ng has done very regular releases of the
> uClibc C library, and is the de-facto active replacement of the now
> defunct uClibc project.
> 
> uClibc 0.9.33 is going to be 4 years old in the coming months, and we
> already need 50+ patches to make it somewhat usable.
> 
> It is therefore time to simply offer uClibc-ng as our only supported
> uClibc version, and remove the options of using uClibc 0.9.33 and
> uClibc-snapshot. To achieve this, this patch series:
> 
>  - Removes references to the BR2_UCLIBC_VERSION_SNAPSHOT option from
>    various packages: libunwind, lttng-babeltrace, mongrel2, vlc and
>    samba4. The dependencies of those packages are updated, and will
>    now allow in many cases to build such packages with uClibc-ng, and
>    sometimes with musl when possible.
> 
>  - Removes the uClibc 0.9.33 and uClibc snapshot options.
> 
>  - Removes the support for version selection in the uclibc package.

You can also remove
package/util-linux/0003-c.h-define-mkostemp-for-older-version-of-uClibc.patch
which was added for uClibc 0.9.33.

https://git.busybox.net/buildroot/commit/?id=a5a4b38c6a43d9da46cdd0244b1aae07d7bcce5c

Best regards,
Romain

> 
> Best regards,
> 
> Thomas
