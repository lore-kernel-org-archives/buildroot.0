From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 23:26:10 +0200
Subject: [Buildroot] [PATCH 1/1] pinentry: link with libatomic when
 needed
In-Reply-To: <20180614180204.17438-1-fontaine.fabrice@gmail.com>
References: <20180614180204.17438-1-fontaine.fabrice@gmail.com>
Message-ID: <20180617232610.2c365acb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Jun 2018 20:02:04 +0200, Fabrice Fontaine wrote:
> Following errors might occur on architectures required to use gcc
> libatomics:
> sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding
> symbols: DSO missing from command line
> 
> This is often the case for sparcv8 32 bit toolchains.
> 
> See d28591a2ee39704f6795c8aa1d0a3db7e909facc,
> 55a9d6d55888b04ec6c476399e5b98a2412995f5 and
> 03f6e005e6a9617767b24a9026da9477848020cc.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/fd6bee70ff20bee9607a9f6f557a3a793d00cd9f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pinentry/pinentry.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Same comment as the patch for the tor package, I've applied with the
same fixes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
