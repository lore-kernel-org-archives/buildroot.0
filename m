From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 26 Jun 2016 06:53:17 +0300
Subject: [Buildroot] [Patch v3 2/3] python-meson: new package
In-Reply-To: <1466796149-25218-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1466796149-25218-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1466796149-25218-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160626035317.GC2319@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

On Fri, Jun 24, 2016 at 09:22:28PM +0200, Eric Le Bihan wrote: 
> diff --git a/package/python-meson/cross-compilation.conf.in b/package/python-meson/cross-compilation.conf.in
> new file mode 100644
> index 0000000..fc9f1dd
> --- /dev/null
> +++ b/package/python-meson/cross-compilation.conf.in
> @@ -0,0 +1,20 @@
> +# Generated file - do not edit

This is not correct for this file. This is the source file that you sed to 
generate the generated one. Though I understand it's convenient to have this 
comment in the source file, it is also misleading.

Also, as there are many other generated files under $(HOST_DIR), I'm not sure 
this comment is helpful.

baruch

> +#
> +# Note that, in Meson terminology, what Buildroot calls the "host" system is the
> +# "build" system and the "target" system is called the "host" system.
> +
> +[host_machine]
> +system = 'linux'
> +cpu_family ='@TARGET_ARCH@'
> +cpu = 'generic'
> +endian = '@TARGET_ENDIAN@'
> +
> +[properties]
> +
> +[binaries]
> +c = '@TARGET_CROSS at gcc'
> +cpp = '@TARGET_CROSS at g++'
> +ar = '@TARGET_CROSS at ar'
> +strip = '@TARGET_CROSS at strip'
> +exe_wrapper = '@HOST_DIR@/usr/bin/meson-exe-wrapper'
> +pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
