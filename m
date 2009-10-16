From: Matuschka, Sebastian <Sebastian.Matuschka@gcd-solutions.de>
Date: Fri, 16 Oct 2009 08:56:21 +0200
Subject: [Buildroot] Missing 'make install' option ?
In-Reply-To: <4AD73F06.8070106@mimc.co.uk>
References: <4AD6ED89.6020902@mimc.co.uk>
	<1255601357.3933.4.camel@sven><4AD6F907.6070106@mimc.co.uk>
	<4AD6FCE0.6080005@gmail.com> <4AD73F06.8070106@mimc.co.uk>
Message-ID: <49ED01FC03EE524BB7BB258E8F93BFF34047A6@bfl-exchange-1.BFL.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Subject: Re: [Buildroot] Missing 'make install' option ?
> 
> tike64 at gmail.com wrote:
> > Mark Jackson wrote:
> >> A sort of 'make install' which would:-
> >>
> >> (a) delete the output/target contents
> >> (b) copy target_skeleton to output/target
> >> (c) run 'make install' on all selected packages (re-compiling if
> >> required)
> >>
> >> I'd find that *most* useful !!
> > 
> > I would also find it useful but, while we are waiting it, 
> this might 
> > be of some value:
> > 
> > rm -rf output/build/.root output/target `find -name 
> *target_installed`
> 
> Seems like a sledgehammer to crack a nut, and it still 
> recompiles uclibc
> *but* it's almost exactly what I was thinking about.
> 
> I'd still like a more formal approach to doing this, and I 
> can't believe that my requirements differ widely from most 
> other developers !?!
> 
> Mark

I'm missing that too.
Every time I add/change/remove a file in my target_skeleton/ i have to
"make distclean;make menuconfig;make" or i have to add it to
project_<arch>/project/root/ too and run make.
I would love to see something like that you have described in buildroot.
I have not enough experience with Makefiles and buildroot to write it,
otherwise i would have done so, that would have saved me hours of
compile time. Especially the toolchain tooks very very long.

Sebastian 
