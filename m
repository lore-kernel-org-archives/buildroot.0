From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Mar 2012 22:28:13 +0100
Subject: [Buildroot] Remove clean and uninstall targets [was: Re: [PATCH
 1/2] Add (Freescale) elftosb host package]
In-Reply-To: <201203152206.35139.arnout@mind.be>
References: <1331643131-31435-1-git-send-email-eric.jarrige@armadeus.org>
 <20120314104146.0e75b488@skate> <4F607CD9.2080300@lucaceresoli.net>
 <201203152206.35139.arnout@mind.be>
Message-ID: <20120315222813.5d1e5113@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 15 Mar 2012 22:06:34 +0100,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  Uninstall doesn't really work, as Thomas pointed out, so I'm all for 
> removing it.
> 
>  For the clean target I can imagine a use case, but it's not very
> convincing.  Say you're preparing a package patch the painful way 
> (i.e. save a copy the source tree, modify the files of the source tree, 
> and if all is well run a diff).  Then you may have some modifications 
> which are not detected by make (e.g. when you're actually editing the 
> Makefile).  So you want to run a make clean.  make foo-dirclean is not
> possible because then you loose your changes.  This is where a clean
> target could be useful.
> 
>  However, it's such a corner case that I don't think it's important.
> And if you're hacking away at a package, you can afford to run
> 'make -C output/build/foo-0.1 clean' manually.

Or, better, you can do:

	make <pkg>-rebuild

Why would you need to do a 'make clean'? If you did some changes in the
package source code, running 'make' is sufficient to get things
rebuilt, unless the package has a broken build system, no?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
