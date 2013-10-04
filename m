From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 4 Oct 2013 10:30:36 -0500
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <20131004110704.78f5b1a6@skate>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
 <20131002172307.0d6f02ea@skate> <524C4AD4.9040902@lucaceresoli.net>
 <CAAXf6LXWf34Amx44pdixKL0m87jq_FMBxN8BJO9TBDbQ58Po1Q@mail.gmail.com>
 <524D9DE2.7090509@mind.be>
 <CAAXf6LUTTX0OFNaP4NxVWXKC4OFBROXK-PFiumL8zYrumkbtog@mail.gmail.com>
 <20131004110704.78f5b1a6@skate>
Message-ID: <OFD293F65F.D1285988-ON86257BFA.00549871-86257BFA.0055339A@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 
10/04/2013 04:07:04 AM:

> Dear Thomas De Schampheleire,
> 
> On Fri, 4 Oct 2013 10:54:55 +0200, Thomas De Schampheleire wrote:
> 
> > To come back on the comment ThomasP made about 'FOO =' and not
> > defining FOO leading to the same empty FOO variable: this does not
> > mean we cannot differentiate both cases: with $(origin FOO) you can.
> 
> You can also use "ifdef" I believe. But still, I believe that having:
> 
> BLEH_LICENSE_FILES =
> 
> in a package looks somewhat strange. I found find it more
> explicit/readable to have:
> 
> BLEH_LICENSE_FILES = N/A
> BLEH_LICENSE_FILES = none
> BLEH_LICENSE_FILES = NONE
> 
> (pick your choice).

What if the license files are only available from a website?

For example, I'm looking to add a new package, tornado (python webserver)
to buildroot- http://www.tornadoweb.org/en/stable/ . However the license
isn't apart of the distribution itself but it points me to a website for
the license.

http://www.apache.org/licenses/LICENSE-2.0.html

Would we then put N/A for the license file? Or how do we want to handle 
this?

This is the second time in about a week that I've run into this well 
adding
a new package?

Eventually in my release process, I will have to go to that website and 
get
that license, be it Apache, or whatever license it may be and package that
up so supporting a URL method of getting a license would be nice.

[...]

Thanks,
-Ryan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131004/da956356/attachment.html>
