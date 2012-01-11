From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 12 Jan 2012 00:03:22 +0100
Subject: [Buildroot] Can't use output/host/ as "SDK" with external
	toolchain
In-Reply-To: <CAJpxd065CgUHOd=RN7gU-G+T+HoJT-iD4REwwJedwGjVsSROdw@mail.gmail.com>
 (Bryce Schober's message of "Wed, 11 Jan 2012 11:49:31 -0800")
References: <CAJpxd07HP8j=A15yW-PKg_SbMVw3tCeMvTodx2BdcCjR7-7rmQ@mail.gmail.com>
 <CAAXf6LWZu9B0ndF+1QYXXg6eU9-et2cY-7tAP7Hoq4mAJkeBmg@mail.gmail.com>
 <CAJpxd05O47LQDdsEcG=VOdunYr7NGsKhirEe+LADi8WDNLhbOA@mail.gmail.com>
 <CAAXf6LVOnJ25zLqdBwoLXX0XORPwNp_pGab_+6xB9Zsi2TJhig@mail.gmail.com>
 <CAJpxd065CgUHOd=RN7gU-G+T+HoJT-iD4REwwJedwGjVsSROdw@mail.gmail.com>
Message-ID: <87mx9t970l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bryce" == Bryce Schober <bryce.schober@gmail.com> writes:

Hi,

 Bryce> I just tried that, and I get the same results. Both the binutils
 Bryce> symbolic links and?ext-toolchain-wrapper?still use absolute
 Bryce> paths. These patches don't touch the logic used to assemble a
 Bryce> full sysroot with the compiler and buildroot host outputs in the
 Bryce> same place.

 Bryce> It seems that the current importing and wrapping of any type of
 Bryce> external toolchain would have to be fundamentally re-worked in
 Bryce> order to be relocatable.

Sorry, I haven't read the entire thread, but are you aware of the
discussions we had at the Buildroot developers day in October?

Thomas made a nice summary of it:

http://lists.busybox.net/pipermail/buildroot/2011-November/047229.html

 Bryce> It seems that two things would need to change:
 Bryce> 1. Any symbolic links created would have to have any absolute paths converted
 Bryce> to relative.
 Bryce> 2. Any paths used in the ext-toolchain-wrapper would have to be relative, and
 Bryce> the wrapper itself would have to determine the path to itself in order to
 Bryce> correctly exec the programs it wraps.

Other things need to be fixed as well (as listed in the summary):

 - Host tools
 - .la files / cmake / qmake configuraiton
 - pkg-config
 - ..

So it's a fairly major change.

-- 
Bye, Peter Korsgaard
