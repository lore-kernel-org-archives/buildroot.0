From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Sep 2017 18:40:49 +0200
Subject: [Buildroot] [PATCH 28/49 v2] package/spandsp: new package
In-Reply-To: <d89d72386ef004f0fdb39074ac4f8814411fe7c8.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
 <d89d72386ef004f0fdb39074ac4f8814411fe7c8.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <7d952133-13ac-56bf-c85c-2aaf37901367@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-09-17 23:39, Yann E. MORIN wrote:
[snip]
> diff --git a/package/spandsp/0001-fix-msse4.x.patch b/package/spandsp/0001-fix-msse4.x.patch
> new file mode 100644
> index 0000000000..ba3a3e55e3
> --- /dev/null
> +++ b/package/spandsp/0001-fix-msse4.x.patch
> @@ -0,0 +1,29 @@
> +diff -durN spandsp-20170713.orig/configure.ac spandsp-20170713/configure.ac
> +--- spandsp-20170713.orig/configure.ac	2014-08-09 10:19:27.000000000 +0200
> ++++ spandsp-20170713/configure.ac	2017-09-07 21:38:36.990854021 +0200
> +@@ -354,10 +354,10 @@

 Missing message + SoB. I'd add it myself but I'm not sure what to add :-)

> +         COMP_VENDOR_CFLAGS="-msse4a $COMP_VENDOR_CFLAGS"
> +     fi
> +     if test "$enable_sse4_2" = "yes" ; then
> +-        COMP_VENDOR_CFLAGS="-msse42 $COMP_VENDOR_CFLAGS"
> ++        COMP_VENDOR_CFLAGS="-msse4.2 $COMP_VENDOR_CFLAGS"

 Are we sure that e.g. GCC 4.3 didn't have the -msse42 flag? So I checked, and
the flag was added in 4.3, so exactly right :-)


[snip]
> +
> +SPANDSP_LICENSE = LGPLv2.1 (library), GPLv2 (test suite)

 Please use SPDX license codes.

> +SPANDSP_LICENSE_FILES = COPYING

 And add license hashes.

 I'm doing that for the other packages while I'm committing, but since you're
going to respin this one...

 Regards,
 Arnout

> +
> +SPANDSP_AUTORECONF = YES
> +SPANDSP_DEPENDENCIES = tiff
> +SPANDSP_INSTALL_STAGING = YES
> +
> +SPANDSP_CONF_OPTS = \
> +	--disable-doc \
> +	--disable-builtin-tiff \
> +	$(if $(BR2_X86_CPU_HAS_MMX),--enable-mmx,--disable-mmx) \
> +	$(if $(BR2_X86_CPU_HAS_SSE),--enable-sse,--disable-sse) \
> +	$(if $(BR2_X86_CPU_HAS_SSE2),--enable-sse2,--disable-sse2) \
> +	$(if $(BR2_X86_CPU_HAS_SSE3),--enable-sse3,--disable-sse3) \
> +	$(if $(BR2_X86_CPU_HAS_SSSE3),--enable-ssse3,--disable-ssse3) \
> +	$(if $(BR2_X86_CPU_HAS_SSE4),--enable-sse4-1,--disable-sse4-1) \
> +	$(if $(BR2_X86_CPU_HAS_SSE42),--enable-sse4-2,--disable-sse4-2)
> +
> +$(eval $(autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
