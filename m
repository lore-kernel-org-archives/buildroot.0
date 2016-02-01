From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 22:17:47 +0100
Subject: [Buildroot] [PATCH 08/10] libimxvpuapi: add new package
In-Reply-To: <CAAMH-yscefcieOucmeT2ZpuqG44LBYvKha9VV93=wN_KJCBh-A@mail.gmail.com>
References: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454154357-31625-9-git-send-email-gary.bisson@boundarydevices.com>
 <20160201214218.3eb39852@free-electrons.com>
 <CAAMH-yscefcieOucmeT2ZpuqG44LBYvKha9VV93=wN_KJCBh-A@mail.gmail.com>
Message-ID: <20160201221747.761bb1c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 1 Feb 2016 22:07:35 +0100, Gary Bisson wrote:

> >> diff --git a/package/Config.in b/package/Config.in
> >> index 09c2b40..d3e5e30 100644
> >> --- a/package/Config.in
> >> +++ b/package/Config.in
> >> @@ -1033,6 +1033,7 @@ menu "Multimedia"
> >>       source "package/libfslparser/Config.in"
> >>       source "package/libfslvpuwrap/Config.in"
> >>       source "package/libhdhomerun/Config.in"
> >> +     source "package/libimxvpuapi/Config.in"
> >
> > Why isn't it part of the package/freescale/ directory ? Because it
> > isn't sourced from the same site ?
> 
> No actually my thought process was that this package is the equivalent
> of libfslvpuwrap which, for some reason, isn't part of the
> freescale-imx folder. Not sure why, I'm sure there's an historical
> reason behind it.

The main reason to have a sub-folder is to be able to share variables,
such as _VERSION and _SITE. So if they are not shared with your
package, there's indeed little reason to have it under
package/freescale-imx/.

Now, the question is where it should appear in the menuconfig. I don't
have a strong opinion here, but if libfslvpuwrap is in Multimedia, then
I think your choice is OK. And indeed, libfslvpuwrap also selects
BR2_PACKAGE_FREESCALE_IMX and BR2_PACKAGE_IMX_VPU, so let's do the same
for your package.


> >> +LIBIMXVPUAPI_VERSION = 0.10.1
> >> +LIBIMXVPUAPI_SITE = $(call github,Freescale,libimxvpuapi,$(LIBIMXVPUAPI_VERSION))
> >> +LIBIMXVPUAPI_LICENSE = LGPLv2.1
> >
> > License seems to be LGPLv2.1+.
> 
> The LICENSE file says LGPLv2.1 but indeed the source code headers
> state the LGPLv2.1+. Who wins then?
> https://github.com/Freescale/libimxvpuapi/blob/master/imxvpuapi/imxvpuapi_jpeg.c#L7
> https://github.com/Freescale/libimxvpuapi/blob/master/LICENSE

It's not a question of who wins. All software under GPLvX+ or LGPLvX+
will have the license text of GPLvX or LGPLvX in its COPYING/LICENSE
file. It doesn't change the fact that the source is distributed under
GPLvX+ / LGPLvX+, which means that the recipient can chose either GPLvX
or any later version of the GPL (ditto LGPLvX).

> > Also, you forgot to include a hash file. Could you fix those issues and
> > send an updated version?
> 
> I might have missed an update, are we providing hash even for Github
> projects now?

As explained on IRC, Github changed the way they generate tarballs, and
they now seem to generate stable tarballs (i.e tarballs that have the
exact same contents for a given tag/commit of a given project).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
