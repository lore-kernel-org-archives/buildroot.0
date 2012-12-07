From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Dec 2012 09:14:26 +0100
Subject: [Buildroot] Support of iMX6 hardware ?
In-Reply-To: <50C198AD.8030703@wanadoo.fr>
References: <50C06206.6060905@wanadoo.fr> <20121206124855.796d4d38@skate>
 <50C198AD.8030703@wanadoo.fr>
Message-ID: <20121207091426.316173d6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Fri, 07 Dec 2012 08:20:13 +0100, Thierry Bultel wrote:

> As soon as I have something working, I will obviously submit
> a patch for it.

Great!

> Thanks for the tip.
> I have (at least) 2 packages to build.
> 
> - The first one was the imx6-lib, that I have added under the Graphics
> section, as a generic-package, and
> 
> define IMX6_LIB_BUILD_CMDS
>       $(MAKE) -C $(@D) all PLATFORM=IMX6Q
> CROSS_COMPILE=$(TARGET_CROSS) INCLUDE=$(INCLUDE)
> endef

Sounds good. We'll do a complete review when you post the entire patch,
but it sounds ok in principle.

> The second one is the xdriver_xf86-video-imx
> It is built as an autotools-package
> But since the 'configure' intrisincs are not really my favorite food,
> I am looking how to add the needed INCLUDE to the CFLAGS that are
> automatically given to it.
> Could you please advise me on how to do it in the cleanest way ?

Depends on whether you need to pass this environment variables at
configure time or at build time.

For configure time:

<foobar>_CONF_ENV = \
	INCLUDE="blabla" \
	CFLAGS="$(TARGET_CFLAGS) -blabla"

For build time:

<foobar>_MAKE_ENV = \
	INCLUDE="blabla" \
	CFLAGS="$(TARGET_CFLAGS) -blabla"

See also
http://buildroot.org/downloads/manual/manual.html#_infrastructure_for_autotools_based_packages

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
