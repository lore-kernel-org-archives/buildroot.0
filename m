From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2010 17:02:38 +0100
Subject: [Buildroot] Copying extra libs into image using external
 toolchain
In-Reply-To: <1265241688.2045.48.camel@coalu.atr>
References: <39a5.4b68b030.ecb50@getafix.xdna.net> <hkaeil$bis$1@ger.gmane.org>
	<6267.4b69f4f6.222b@getafix.xdna.net>
	<1265241688.2045.48.camel@coalu.atr>
Message-ID: <20100206170238.345e1bd8@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 04 Feb 2010 01:01:28 +0100
Lionel Landwerlin <llandwerlin@gmail.com> wrote:

> With external toolchains, buildroot assumes that libstdc++ is
> installed in $(SYSROOT)/lib/ which isn't always the case.
> For example the STLinux toolchain has its libstdc++ installed in
> $(SYSROOT)/usr/lib like your toolchain.

Yes, correct.

> We should rather fix the buildroot script that copies the libraries
> than adding extra scripts outside of buildroot. It's in
> toolchain/external-toolchain/ext-tool.mk

This is something I already have a patch for in my
codesourcery-toolchain-support branch:

 http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=codesourcery-toolchain-support&id=e6eec872c5720be4438f1d0db28f69ed50620b58

Unfortunately, the changes needed to get the libraries from either /lib
or /usr/lib are mixed with other changes related to multilib support,
and these latter changes are not ready for submission.

I'll try to split the /lib - /usr/lib thing from the rest and submit a
proper patch.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
