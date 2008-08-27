From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 10:28:57 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
In-Reply-To: <20080827081559.GA25436@mx.loc> (Bernhard Reutner-Fischer's
	message of "Wed\, 27 Aug 2008 10\:15\:59 +0200")
References: <20080827072921.BE910F8014@busybox.net>
	<20080827081559.GA25436@mx.loc>
Message-ID: <874p5650ae.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 >> -avahi: uclibc libdaemon $(AVAHI_TARGETS)
 >> +avahi: uclibc libdaemon $(AVAHI_TARGETS) $(if $(BR2_ENABLE_LOCALE),gettext libintl)

 Bernhard> are you sure that the order is correct? Getting this proper for toplevel
 Bernhard> parallel make would be fun:

 Bernhard> # make sure to set JLEVEL=1
 Bernhard> $ make oldconfig
 Bernhard> $ rm -rf {toolchain,build,project}_*
 Bernhard> $ make -j avahi

No it isn't, but neither is the rest of buildroot ;) That's why we
don't support parallel toplevel make. For it to work we would have to
make the configure steps depend on the staging install of the user
libs, and so on.

-- 
Bye, Peter Korsgaard
