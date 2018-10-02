From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Oct 2018 16:29:35 +0200
Subject: [Buildroot] [git commit] toolchain-external: drop no longer
 needed CC_TARGET_<foo>_ variables
In-Reply-To: <cfa54f82-a1bb-9416-e9c9-2adb096b281a@embecosm.com>
References: <20181001125331.C5E498A5DE@busybox.osuosl.org>
 <cfa54f82-a1bb-9416-e9c9-2adb096b281a@embecosm.com>
Message-ID: <20181002162935.5a5eac58@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 1 Oct 2018 15:12:35 +0100, Mark Corbin wrote:

> > +ifneq ($(GCC_TARGET_ARCH),)
> > +TOOLCHAIN_EXTERNAL_CFLAGS += -march=$(CC_TARGET_ARCH)
> > +TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ARCH='"$(GCC_TARGET_ARCH)"'  
> 
> ...isn't there a 'G' missing in front of the 'CC_TARGET_ARCH' in the
> inserted TOOLCHAIN_EXTERNAL_CFLAGS line above?

Indeed, sorry for the mess here. Seems like I messed up the
search/replace. Good that we have people reviewing the patches! :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
