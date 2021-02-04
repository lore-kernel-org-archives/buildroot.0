From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Feb 2021 10:22:12 +0100
Subject: [Buildroot] [PATCH 19/25] support/config-fragments/autobuild:
 use Bootlin toolchain for SH4 uclibc
In-Reply-To: <20210203212753.GI2384@scaer>
References: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
 <20210202225339.2157480-20-thomas.petazzoni@bootlin.com>
 <20210203212753.GI2384@scaer>
Message-ID: <20210204102212.4db73a8b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 3 Feb 2021 22:27:53 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > diff --git a/support/config-fragments/autobuild/bootlin-sh4-uclibc.config b/support/config-fragments/autobuild/bootlin-sh4-uclibc.config
> > new file mode 100644
> > index 0000000000..3d8f69b3e4
> > --- /dev/null
> > +++ b/support/config-fragments/autobuild/bootlin-sh4-uclibc.config
> > @@ -0,0 +1,4 @@
> > +BR2_sh=y
> > +BR2_sh4=y  
> 
> BR2_sh4 is the default, so I dropped it from the fragment when applying.

In fact, I intentionally re-added it to be sure that whatever the
default SuperH arch variant, this configuration is for SH4.

I in fact also included some "extra" options in a few of those other
.config files. For example, for some platforms, the Bootlin toolchain
is the only external toolchain available, and therefore the default.
But I nevertheless made that explicit in the .config file.

Thanks for taking a look at the patch series, and merging it!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
