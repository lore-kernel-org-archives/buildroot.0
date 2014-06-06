From: Mike Zick <minimod@morethan.org>
Date: Fri, 6 Jun 2014 11:31:48 -0500
Subject: [Buildroot] autoconf caching
In-Reply-To: <CAE9DZURp2teR8p5WP3OQEZyZ71qD=8U97q03cRd0yHbTsz8FwA@mail.gmail.com>
References: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
 <20140605224222.0184a9b7@free-electrons.com>
 <CAE9DZURmNL1iOcY4UR4CrDkg5DOT46-yy-e1+Ftax1_W0faing@mail.gmail.com>
 <20140606091548.53f07f90@free-electrons.com>
 <CAE9DZURp2teR8p5WP3OQEZyZ71qD=8U97q03cRd0yHbTsz8FwA@mail.gmail.com>
Message-ID: <20140606113148.464ff3c8@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 6 Jun 2014 11:14:15 -0500
Dallas Clement <dallas.a.clement@gmail.com> wrote:

> > Seems a fairly decent setup. You have enough RAM, and a good storage
> > system (ideally based on SSDs) ?  
> 
> Yep, very speedy SSDs and 64 GB for RAM.  Because of all the
> serialization in this build process,
> building from a large ram disk seems to make little difference.
>

Having 7 of your 8 cores sitting in their idle loop is probably your
#1 thing to address. . . .

With a very large selection of packages, perhaps you could split them
into several (8, 9?) Buildroot trees.
Then run those buildroot instances as jobs at the same time.

Or...

At least pull the really big time consumers out, into their own BR
instance, and use your idle cores on those.

Mike
