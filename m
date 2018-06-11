From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jun 2018 21:01:25 +0200
Subject: [Buildroot] [PATCH] core/sdk: generate the SDK tarball ourselves
In-Reply-To: <1528737656.28705.131.camel@impinj.com>
References: <20180609210607.13259-1-yann.morin.1998@free.fr>
 <e4bbb78b-8301-e576-7e65-f83d55e0da7b@mind.be>
 <1528737656.28705.131.camel@impinj.com>
Message-ID: <20180611210125.108ff027@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Jun 2018 17:20:57 +0000, Trent Piepho wrote:

> Is the problem with using this tarball apparent?  The dockerfile needs
> to be hand edited on every single build to use the correct path to the
> SDK.
> 
> I've already added a "sdk-tar" to my external.mk to do this, but used
> the tarbomb approach.  While annoying for those who extract it in their
> home dir, it's much easier to use in an automated processes since there
> is no unknown path name component.

You want to use the --strip-components=1 option of tar, which Buildroot
is already using when extracting the tarballs of upstream packages into
the output/build/<package>-<version>/ directories.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
