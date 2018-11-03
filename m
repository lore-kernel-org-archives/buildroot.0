From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 14:48:01 +0100
Subject: [Buildroot] [PATCH 1/1] xerces: fix static linking with mbedtls
In-Reply-To: <CAPi7W804TLyLN-sFX5USYT5M9ppY1FuO7nzELzZAYssmM8S5-g@mail.gmail.com>
References: <20181025205402.10649-1-fontaine.fabrice@gmail.com>
 <20181102223056.668a3c81@windsurf>
 <CAPi7W804TLyLN-sFX5USYT5M9ppY1FuO7nzELzZAYssmM8S5-g@mail.gmail.com>
Message-ID: <20181103144801.1ac80511@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 2 Nov 2018 23:56:36 +0100, Fabrice Fontaine wrote:

> The fullpath to mbedtls library in libcurl.pc was added by
> https://patchwork.ozlabs.org/patch/917565. This patch was merged
> upstream.
> This fullpath in libssh2.pc was added by
> http://patchwork.ozlabs.org/patch/888395.
> This patch to libssh2 was not yet merged upstream so indeed we could
> find an other solution.
> For example, instead of adding $LIBMBEDCRYPTO (which contains the full
> library path returned by AC_LIB_HAVE_LINKFLAGS) to LIBS, an other
> solution would be to simply add -lmbedcrypto to LIBS.
> If you agree, I can test this proposal and send a new patch to libssh2.

Use LTLIBMBEDCRYPTO instead of LIBMBEDCRYPTO. We had the same problem
in the past, and that's how Romain Naour solved it:
http://lists.busybox.net/pipermail/buildroot/2017-May/192294.html

> > BTW, do you have a minimal defconfig that exhibits this problem?  
> Nope, I used the autobuilder defconfig but I think you need
> BR2_PACKAGE_LIBSSH2_MBEDTLS=y to build libssh2 with mbedtls instead of
> openssl.

It was set in my configuration, even if not visible in the minimal
defconfig.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
