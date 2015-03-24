From: github at wilberforce.co.nz <github@wilberforce.co.nz>
Date: Tue, 24 Mar 2015 22:36:31 +1300
Subject: [Buildroot] [PATCH v3] lirc-tools: new package
Message-ID: <6ca4104b$164a68c3$5a5357dd$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


1. What I was trying to say, that there is no point in using this package 
unless the lirc kernel package has been selected.

Should this be added as a dependency, rather than just on 
BR2_LINUX_KERNEL?


2. Noted re the personal notes.

3. I'll look at added the license details

4.
>Please remove this part 
Is this the part you mean?

 >. > +# lcdproc
> +#

Thanks
Rhys

----------------------------------------
From: "Baruch Siach" <baruch@tkos.co.il>
Sent: Tuesday, March 24, 2015 7:17 PM
To: "Rhys Williams" <github@wilberforce.co.nz>
Subject: Re: [Buildroot] [PATCH v3] lirc-tools: new package 

Hi Rhys,

On Tue, Mar 24, 2015 at 02:40:08AM +1300, Rhys Williams wrote:
> This package adds the userspace tools LIRC - Linux remote control.
> The Kernel package will need to be selected.

In this case the package should depend on BR2_LINUX_KERNEL. But are you 
sure 
of this? The text at http://www.lirc.org/html/install.html#compiling says:

	As of 0.9.1+, lirc uses the kernel modules from the official kernel. Some 

	of these are formerly lirc modules which are now part of the kernel. Thus, 

	building lirc does not involve building kernel modules (as it used to 
be).

> Thanks to Baruch for help so far.

This line should not be part of the commit log that is kept forever in the 

Buildroot git history. You may add "personal" comments below the --- 
separator...

> Signed-off-by: Rhys Williams 
> ---

... here.

>  package/Config.in                  |  1 +
>  package/lirc-tools/Config.in       | 15 +++++++++++++++
>  package/lirc-tools/S25lircd        | 38 
++++++++++++++++++++++++++++++++++++++
>  package/lirc-tools/lirc-tools.hash |  2 ++
>  package/lirc-tools/lirc-tools.mk   | 20 ++++++++++++++++++++
>  5 files changed, 76 insertions(+)
>  create mode 100644 package/lirc-tools/Config.in
>  create mode 100755 package/lirc-tools/S25lircd
>  create mode 100644 package/lirc-tools/lirc-tools.hash
>  create mode 100644 package/lirc-tools/lirc-tools.mk

[...]

> diff --git a/package/lirc-tools/lirc-tools.mk 
> b/package/lirc-tools/lirc-tools.mk
> new file mode 100644
> index 0000000..791ed8d
> --- /dev/null
> +++ b/package/lirc-tools/lirc-tools.mk
> @@ -0,0 +1,20 @@
> 
+###########################################################################
#####
> +#
> +# lirc-tools
> +#
> 
+###########################################################################
#####
> +
> +LIRC_TOOLS_VERSION = 0.9.2
> +LIRC_TOOLS_SOURCE = lirc-$(LIRC_TOOLS_VERSION).tar.bz2
> +LIRC_TOOLS_SITE = 
http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)/

I forgot to mention that earlier, but please add license information here. 
See 
the description of _LICENSE and _LICENSE_FILES in the manual at 
http://nightly.buildroot.org/manual.html#_infrastructure_for_packages_with_s
pecific_build_systems.

> +
> +LIRC_TOOLS_CONF_OPTS = --without-x --enable-sandboxed 
--with-driver=userspace
> +
> +define LIRC_TOOLS_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 package/lirc-tools/S25lircd 
$(TARGET_DIR)/etc/init.d/
> +endef
> +
> +$(eval $(autotools-package))
> +#
> +# lcdproc
> +#

Please remove this part.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open 
Systems
=}------------------------------------------------ooO--U--Ooo------------{=


   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
