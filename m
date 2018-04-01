From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 00:37:02 +0200
Subject: [Buildroot] [PATCH v2 1/2] iqvlinux: bump to version 1.2.0.3
In-Reply-To: <20171215153830.4864-1-casantos@datacom.ind.br>
References: <20171215153830.4864-1-casantos@datacom.ind.br>
Message-ID: <20180402003702.06275b9b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Dec 2017 13:38:29 -0200, Carlos Santos wrote:
> This package is really annoying since the archive name doesn't contain
> the version. Use a small trick to save it with a better name. Also add
> hashes for license files.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

So back on this driver. We looked at it with Arnout and Peter, and
actually had a lot of fun reading the code. It is ugly as hell, uses
copy_from/to_user inside spinlocks, and does lots of horrible things.

But more importantly, this driver does nothing, except provide a weird
custom ioctl() interface, with no user-space program to use them.

How is this kernel driver meant to be used? Is it used with some
non-public, closed-source, Intel utilities ?

Also, in the bug tracker at https://sourceforge.net/p/e1000/bugs/589/,
the person from Intel said: "I'm not really sure why you're trying to
build this as it's only published here to conform with GPLv2. There's
really no use for it.". So why are you using it ? Why do we have it in
Buildroot ?

Romain, since you originally contributed this driver, perhaps you can
give some details about how you used it ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
