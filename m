From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Jan 2013 09:52:50 +0100
Subject: [Buildroot] [PATCH 1/4] Makefile: export a few variables to
	help support scripts
In-Reply-To: <877gngviel.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 13 Jan 2013 23:15:46 +0100")
References: <cover.1358113846.git.yann.morin.1998@free.fr>
 <cover.1358113846.git.yann.morin.1998@free.fr>
 <d9e98990b22abeb96d52d72687ccf52883521e69.1358113846.git.yann.morin.1998@free.fr>
 <877gngviel.fsf@dell.be.48ers.dk>
Message-ID: <87y5fwtacd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
 Yann> Support scripts (in support/) may need to parse the .config file, so give
 Yann> them an easy access to it, by exporting BUILDROOT_CONFIG with the fully-
 Yann> qualified path to .config.

 Yann> Also, post-build scripts may need to reference a few locations, so export
 Yann> those, too.

 Yann> Note: we export both O and BASE_DIR. Although they are the same,
 Yann> BASE_DIR is used internally, while O is used on the command line,
 Yann> which makes it a bit ambiguous to know which to use. As users use
 Yann> O= on the command line, they will probably tend to use that in
 Yann> their post-build scripts.

 Peter> Ok. I guess most people don't need the upper O/BASE_DIR variables, but
 Peter> lets add the for completeness.

And even worse, other projects also use the O=<dir> syntax for out of
tree, and atleast uClibc doesn't check that it gets explictly passed on
the command line, breaking the build.

So I'll remove the O.

-- 
Bye, Peter Korsgaard
