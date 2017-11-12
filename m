From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sun, 12 Nov 2017 21:49:02 +0100
Subject: [Buildroot] [PATCH v6] libostree: new package
In-Reply-To: <j4rldexder.ln2@ID-313208.user.individual.net>
References: <20171102112722.19414-1-marcus.folkesson@gmail.com>
 <j4rldexder.ln2@ID-313208.user.individual.net>
Message-ID: <20171112204902.GA6808@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, Nov 12, 2017 at 01:24:19PM +0100, Bernd Kuhls wrote:
> Hi Marcus,
> 
> Am Thu, 02 Nov 2017 12:27:22 +0100 schrieb Marcus Folkesson:
> 
> > diff --git a/package/libostree/Config.in b/package/libostree/Config.in
> > new file mode 100644
> > index 0000000000..d4a802a6b6
> > --- /dev/null
> > +++ b/package/libostree/Config.in
> > @@ -0,0 +1,20 @@
> > +config BR2_PACKAGE_LIBOSTREE
> > +	bool "libostree"
> > +	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpgme
> > +	depends on !BR2_STATIC_LIBS # libfuse
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> > +	depends on BR2_USE_WCHAR # libglib2
> > +	depends on BR2_USE_MMU # e2fsprogs, libfuse,libglib2, libgpgme
> > +
> > +	# doesn't build with musl due to lack of TEMP_FAILURE_RETRY()
> > +	depends on !BR2_TOOLCHAIN_USES_MUSL
> > +
> > +	select BR2_PACKAGE_E2FSPROGS
> > +	select BR2_PACKAGE_LIBFUSE
> > +	select BR2_PACKAGE_LIBGLIB2
> > +	select BR2_PACKAGE_LIBGPGME
> > +	select BR2_PACKAGE_XZ
> > +	help
> > +	  OSTree is an upgrade system for Linux-based operating systems.
> > +
> > +	  https://ostree.readthedocs.io/en/latest/
> 
> please add a comment which is displayed when the dependencies
> are not met by the current config to help users to enable this
> package:
> 
> comment "libostree needs a uClibc or glibc toolchain w/ threads, dynamic library, wchar"
>         depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
>                 || !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_MUSL
>         depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
>         depends on BR2_USE_MMU
> 
> > diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
> > new file mode 100644
> > index 0000000000..b8bdd974c4
> > --- /dev/null
> > +++ b/package/libostree/libostree.hash
> > @@ -0,0 +1 @@
> > +sha256 fc409f04c9fd440b83b4fa324f3b912cbf61145389378d44254b8b191c9fef08  libostree-2017.12.tar.xz
> > diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
> 
> Please add the hash of the license file as well.
> 
> Regards, Bernd
> 

Again, thank you for your comments.
I will send a new patch later tonight.

Best regards
Marcus Folkesson
