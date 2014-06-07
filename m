From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Jun 2014 11:04:32 +0200
Subject: [Buildroot] autoconf caching
In-Reply-To: <CAE9DZURp2teR8p5WP3OQEZyZ71qD=8U97q03cRd0yHbTsz8FwA@mail.gmail.com>
References: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
 <20140605224222.0184a9b7@free-electrons.com>
 <CAE9DZURmNL1iOcY4UR4CrDkg5DOT46-yy-e1+Ftax1_W0faing@mail.gmail.com>
 <20140606091548.53f07f90@free-electrons.com>
 <CAE9DZURp2teR8p5WP3OQEZyZ71qD=8U97q03cRd0yHbTsz8FwA@mail.gmail.com>
Message-ID: <20140607110432.3e52d064@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dallas Clement,

On Fri, 6 Jun 2014 11:14:15 -0500, Dallas Clement wrote:

> Hi Thomas.  Thanks very much for looking at my configuration.  I think you
> certainly nailed it.
> I have a lot of packages, and perl and mysql especially are taking a long
> time.  My build recipes
> for both of these are a year or two out of date.  In fact, my perl recipe
> is still using qemu to build
> instead of perl cross.  Hopefully updating this recipe will help some,
> though as you pointed out
> it is still using MAKE1.

Right. I'll send a separate e-mail to Fran?ois Perrad about this (our
Perl guy), because it seems like other build systems are building Perl
in parallel.

> Yep, very speedy SSDs and 64 GB for RAM.  Because of all the serialization
> in this build process,
> building from a large ram disk seems to make little difference.

Right. So you have a good build configuration, there's not much we can
do here.

> > There is another thing that strikes out in your configuration: there
> > are many packages that we don't have in Buildroot, and that don't seem
> > to be specific to your company or project. What about submitting your
> > new packages upstream?
> 
> Yes, I can certainly do that.  There's a lot here.  Much of it is obscure.
> Please let me know which ones you are most
> interested in.

Could you make a list of the packages that you've added, and that are
open-source? I'm pretty sure a majority of them could potentially be
useful to have in Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
