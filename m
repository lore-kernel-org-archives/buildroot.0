From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Dec 2012 21:00:27 +0100
Subject: [Buildroot] [PATCH 05/19] package/cegui06: new package
In-Reply-To: <7cf98889cd57261ddf6c4c5889bc768bb0fefd42.1355676845.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 16 Dec 2012 17:56:12 +0100")
References: <cover.1355676845.git.yann.morin.1998@free.fr>
 <cover.1355676845.git.yann.morin.1998@free.fr>
 <7cf98889cd57261ddf6c4c5889bc768bb0fefd42.1355676845.git.yann.morin.1998@free.fr>
Message-ID: <87vcc1daxw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Although there are more recent versions of CEGUI, we are stuck
 Yann> with 0.6.2b for use by spice.

 Yann> +source "package/cegui06/Config.in"
 Yann>  source "package/directfb/Config.in"
 Yann>  source "package/directfb-examples/Config.in"
 Yann>  source "package/divine/Config.in"
 Yann> diff --git a/package/cegui06/Config.in b/package/cegui06/Config.in
 Yann> new file mode 100644
 Yann> index 0000000..7648922
 Yann> --- /dev/null
 Yann> +++ b/package/cegui06/Config.in
 Yann> @@ -0,0 +1,18 @@
 Yann> +comment "cegui06 needs a toolchain with threads"
 Yann> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
 Yann> +
 Yann> +config BR2_PACKAGE_CEGUI06
 Yann> +	bool "cegui06"
 Yann> +	depends on BR2_TOOLCHAIN_HAS_THREADS
 Yann> +	select BR2_PACKAGE_EXPAT
 Yann> +	select BR2_PACKAGE_FREETYPE
 Yann> +	select BR2_PACKAGE_PCRE
 Yann> +	help
 Yann> +	  Crazy Eddie's GUI System is a free library providing windowing and
 Yann> +	  widgets for graphics APIs / engines where such functionality is not
 Yann> +	  natively available, or severely lacking. The library is object
 Yann> +	  orientated, written in C++, and targeted at games developers who

So it presumably needs to depend on BR2_INSTALL_LIBSTDCPP as well. I've
corrected that and committed, thanks.
 Yann> +
 Yann> +---
 Yann> +Patch not sent upstream, it's a no-longer-maintained branch.
 Yann> +To be noted, however, is that the current devel branch is
 Yann> +still missing that include.

Could be good to get it fixed in the devel branch then for when/if spice
gets updated.

 Yann> +CEGUI06_CONF_OPT =              \
 Yann> +    --enable-expat              \
 Yann> +    --disable-external-tinyxml  \
 Yann> +    --disable-xerces-c          \
 Yann> +    --disable-libxml            \
 Yann> +    --disable-tinyxml           \
 Yann> +    --disable-opengl-renderer   \
 Yann> +    --disable-external-glew     \
 Yann> +    --disable-irrlicht-renderer \
 Yann> +    --disable-directfb-renderer \
 Yann> +    --disable-samples           \
 Yann> +    --disable-lua-module        \
 Yann> +    --disable-toluacegui        \
 Yann> +    --disable-external-toluapp  \

It would be good to have optional support for the stuff we have in BR
(xerces, libxml, directfb, lua, ..)

-- 
Bye, Peter Korsgaard
