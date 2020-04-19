From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 14:49:03 +0200
Subject: [Buildroot] [PATCH v2 3/5] package/dmraid: use modules-load to
 load the kernel module
In-Reply-To: <20200419104239.GV5853@scaer>
References: <20200418221411.1549783-1-unixmania@gmail.com>
 <20200418221411.1549783-4-unixmania@gmail.com>
 <20200419104239.GV5853@scaer>
Message-ID: <20200419144903.2a3bbc78@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Apr 2020 12:42:39 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Can't we simply have a modules table, like we have the device amd user
> tables? Something like:
> 
>     define DMRAID_MODULES
>         dm-stuff
>         dm-blurb
>         dm-blabla
>     endef
> 
> And then have the package and rootfs infrastructures handle that like
> the other tables?

If we're going to do that, then we don't need an infra at all,
package/dmraid/ can simply contain a file with the list of modules,
which gets installed to /usr/lib/modules-load.d/.

I think the idea here was to avoid maintaining the list of dmraid
modules, and ensure it is generated automatically from the list of
installed modules. But even that is not guaranteed to work 100%, for
example if one day dmraid adds a module that doesn't match the
dm[_-]mod.ko* expression.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
