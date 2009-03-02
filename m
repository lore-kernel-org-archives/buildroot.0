From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Mar 2009 13:24:47 +0100
Subject: [Buildroot] depend or select in Config.in & Autotarget question
In-Reply-To: <20090302124019.106a2593@bandomeer.europe.flane.local> (Olaf
	Rempel's message of "Mon\, 2 Mar 2009 12\:40\:19 +0100")
References: <20090302124019.106a2593@bandomeer.europe.flane.local>
Message-ID: <87ocwkjenk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Olaf" == Olaf Rempel <razzor@kopf-tisch.de> writes:

Hi,

 Olaf> what is the preferred method to resolve package dependencies in
 Olaf> Config.in?  eg. when package-B needs package-A to build, should
 Olaf> B "select" A or should B "depend" on A?

We normally use select for dependencies to libraries, and depends on
toolchain configuration settings (E.G. C++ support).

The reason for this is that it isn't always obvious what you need to
enable to be able to select a certain program, and people normally
think in terms of applications and not libraries.

Changes to the toolchain on the other hand has a lot bigger impact, so
that shouldn't be done behind the back of the user (E.G. with a
select).

 Olaf> And when using "depend" should there be an info when A is not
 Olaf> active (like ipsec-tools => openssl)?

ipsec-tools should select openssl instead - Will fix.

 Olaf> I've started with the Makefile.autotools.in conversion of some
 Olaf> packages that I use.  When should a AUTORECONF:=yes be used? So
 Olaf> far it had no affect in my tests?

Autoreconf is normally only used if you change the auto* source files
(configure.ac, Makefile.am, ..) and want to regenerate the derived files.

-- 
Bye, Peter Korsgaard
