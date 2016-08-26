From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 11:26:10 +0200
Subject: [Buildroot] [PATCH v1 4/9] board / intel: Add SPI peripherals
 for Minnowboard MAX
In-Reply-To: <20160826090917.GL1812@lahna.fi.intel.com>
References: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1472133887-34746-5-git-send-email-andriy.shevchenko@linux.intel.com>
 <20160825234715.1e500fc5@free-electrons.com>
 <20160826090917.GL1812@lahna.fi.intel.com>
Message-ID: <20160826112610.47226d76@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Aug 2016 12:09:17 +0300, Mika Westerberg wrote:

> > Is there some upstream project for those ACPI tables? I wouldn't want
> > to have them all in Buildroot, I'd very much prefer to have a Buildroot
> > package download them, compile them using the acpica compiler, and
> > install them in the proper place.  
> 
> Currently there is no upstream project for these but we have plans to do
> so eventually. The idea is to have only one per-device ASL template and
> then tune that to work with the target board, but the template format is
> not yet crystal clear.

So you're storing those files in both Yocto Project recipes, and intend
to do so in Buildroot? And every other build system wanting to support
your platforms would have to carry those files as well. Doesn't seem
like a solution that will make it easy for you to update those files.

What about having some Git repo hosted somewhere to host those files?
We could then have a Buildroot package that fetches them and does the
acpica compilation process.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
