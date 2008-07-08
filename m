From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 8 Jul 2008 22:03:54 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
In-Reply-To: <4873351E.807@atmel.com>
References: <20080708064006.1998A3C674@busybox.net> <4873351E.807@atmel.com>
Message-ID: <20080708120354.GA30117@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 08, 2008 at 11:36:30AM +0200, Ulf Samuelsson wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> hamish at uclibc.org skrev:
> > Author: hamish
> > Date: 2008-07-07 23:40:05 -0700 (Mon, 07 Jul 2008)
> > New Revision: 22683
> > 
> > Log:
> > Don't $(CONFIG_UPDATE) openssl as it doesn't use autotools anyway
> > 
> 
> Have you built an AVR32 rootfs without this?
> 
> I think you just broke openssl for the AVR32 architecture
> 
> Please revert, if you have not successfully tested on the AVR32.

I built it for armeb ok (non-avr32).

There are no config.guess and config.sub in the package when it is
unpacked. Copying them over, which $(CONFIG_UPDATE) does, will not help
- the package just doesn't use autoconf!!

cheers
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
