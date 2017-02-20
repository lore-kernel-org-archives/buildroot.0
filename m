From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 09:44:43 +0100
Subject: [Buildroot] [PATCH 00/58] python pypi library mass version bump.
In-Reply-To: <CAFSsvmrv9m80RA+tc5YMwgbLpHs8-R0hw4ivmxHiNo++Nnyujg@mail.gmail.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
 <20170219211718.42744cc8@free-electrons.com>
 <20170219212054.2x6hosogfxbztldl@localhost.localdomain>
 <CAFSsvmrv9m80RA+tc5YMwgbLpHs8-R0hw4ivmxHiNo++Nnyujg@mail.gmail.com>
Message-ID: <20170220094443.01a75e76@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Feb 2017 17:41:07 -0500, Adam Duskett wrote:

> Fair enough; I ran through and imported every single package I updated, and
> if there was an example I ran the example as well.
> 
> I rejected any of them that didn't work in the set.  Hopefully that's enough!

OK, thanks.

> > In general I wonder if this python package situation is going to be
> > maintainable in buildroot in the long run. There are nearly 200 python
> > packages at the moment on the master branch, more than 10% of all
> > buildroot packages.
> >  
> I agree, it's also a nightmare looking at the packages/ folder when such
> a large amount are prefixed with python-.

Why is that a "nightmare" ? Since when a list of directories is a
"nightmare" ?

> I noticed this as well while writing this small utility.  Some of these packages
> are outdated by 5+ point revisions!

Just like many other non-Python packages, so this point is not at all
Python specific.

> I was thinking, would it be possible to run pypi as a host?

Because:

 - No reproducibility (pypi downloads the latest available versions of
   the modules, as far as I know)

 - No integration with our download logic: use of a primary mirror, use
   of a backup mirror, local cache of downloads.

 - No integration with our legal information tooling.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
