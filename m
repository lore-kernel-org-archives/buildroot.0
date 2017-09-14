From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 14 Sep 2017 06:29:58 +0300
Subject: [Buildroot] [RFC v0] libvirt: new package
In-Reply-To: <20170914022425.3009-1-casantos@datacom.ind.br>
References: <20170914022425.3009-1-casantos@datacom.ind.br>
Message-ID: <20170914032958.kvzbnq4t3knwfcc4@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

On Wed, Sep 13, 2017 at 11:24:25PM -0300, Carlos Santos wrote:
> diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
> new file mode 100644
> index 0000000000..c8792eaa14
> --- /dev/null
> +++ b/package/libvirt/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_LIBVIRT
> +	bool "libvirt"
> +	depends on !BR2_STATIC_LIBS # libnl, lvm2
> +	depends on BR2_USE_MMU # needs fork()
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl, libtirpc
> +	select BR2_PACKAGE_LIBNL
> +	select BR2_PACKAGE_LIBTIRPC
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_LVM2
> +	select BR2_PACKAGE_YAJL
> +	help
> +	  Libvirt is collection of software that provides a convenient
> +	  way to manage virtual machines and other virtualization
> +	  functionality, such as storage and network interface
> +	  management. These software pieces include an API library, a
> +	  daemon (libvirtd), and a command line utility (virsh).
> +
> +	  http://libvirt.org/
> +
> +comment "libvirt needs a glibc or uClibc toolchain w/ threads, dynamic library"
> +        depends on BR2_USE_MMU
> +        depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL

The musl incompatibility is because of lvm2, right? This part is missing from 
the dependencies listed above.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
