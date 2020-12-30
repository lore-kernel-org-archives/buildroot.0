From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 30 Dec 2020 15:32:20 +0100
Subject: [Buildroot] [RFC v1 3/6] package/vulkan-tools: new package
In-Reply-To: <20201230090004.GH1680670@scaer>
References: <20201223224553.8570-1-ps.report@gmx.net>
 <20201223224553.8570-4-ps.report@gmx.net>
 <20201230090004.GH1680670@scaer>
Message-ID: <20201230153220.16333832@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Wed, 30 Dec 2020 10:00:04 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> On 2020-12-23 23:45 +0100, Peter Seiderer spake thusly:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> [--SNIP--]
> > diff --git a/package/vulkan-tools/vulkan-tools.mk b/package/vulkan-tools/vulkan-tools.mk
> > new file mode 100644
> > index 0000000000..9a20ddf36b
> > --- /dev/null
> > +++ b/package/vulkan-tools/vulkan-tools.mk
> > @@ -0,0 +1,25 @@
> > +################################################################################
> > +#
> > +# vulkan-tools
> > +#
> > +################################################################################
> > +
> > +VULKAN_TOOLS_VERSION = 1.2.162
> > +VULKAN_TOOLS_SITE = $(call github,KhronosGroup,Vulkan-Tools,v$(VULKAN_TOOLS_VERSION))
> > +VULKAN_TOOLS_LICENSE = Apache-2.0 License
>
> Something I forgot to comment on on the other Vulkan packages: the SPDX
> short identifier is: Apache-2.0

O.k, will fix it on next patch iteration...

>
> > +VULKAN_TOOLS_LICENSE_FILES = LICENSE.txt
> > +
> > +VULKAN_TOOLS_DEPENDENCIES = vulkan-headers vulkan-loader
> > +
> > +VULKAN_TOOLS_CONF_OPTS += \
> > +	-DBUILD_CUBE=OFF \
> > +	-DBUILD_VULKANINFO=ON \
> > +	-DBUILD_ICD=ON \
> > +	-DINSTALL_ICD=ON \
> > +	-DBUILD_WSI_XCB_SUPPORT=OFF \
> > +	-DBUILD_WSI_XLIB_SUPPORT=OFF \
> > +	-DBUILD_WSI_WAYLAND_SUPPORT=OFF \
> > +	-DBUILD_WSI_DIRECTFB_SUPPORT=OFF \
>
> I guess those will be conditional on the udnerlying libraries, e.g. when
> libxcb is enabled, we enable WSI_XCB, and so on, right?

Yes, stuff for follow-up patches...

Regards,
Peter

>
> Regards,
> Yann E. MORIN.
>
> > +	-DUSE_CCACHE=OFF
> > +
> > +$(eval $(cmake-package))
> > --
> > 2.29.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
