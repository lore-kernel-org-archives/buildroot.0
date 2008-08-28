From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Aug 2008 07:02:09 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/fltk
In-Reply-To: <20080828002656.GB10828@cloud.net.au> (Hamish Moffatt's message
	of "Thu\, 28 Aug 2008 10\:26\:56 +1000")
References: <20080827201919.E9B3DF8006@busybox.net>
	<20080828002656.GB10828@cloud.net.au>
Message-ID: <87vdxlu3zi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 >> -comment "fltk		- disabled (requires Xorg(7))"
 >> -	depends on !(BR2_PACKAGE_XORG || BR2_PACKAGE_XORG7)
 >> 

 Hamish> I think those comments are kind of helpful. Otherwise, if you know a
 Hamish> package exists but can't find it in menuconfig, you need to open up
 Hamish> Config.in to find the dependencies.

Sometimes they are, but having tons of those lines listed for all X
programs when you haven't selected X is imho not.

We should probably move X applications / libraries to it's own sub
menu.

 Hamish> Alternatively the package could use select instead of depends.

Yeah, but that wouldn't work here as there's multiple providers of X
(and anyway, including a monster like X behind your back isn't really
userfriendly either).

But in general I agree - Use select for hard dependencies and only
print those comment lines for stuff like toolchain settings (locales,
wchar, ..).

-- 
Bye, Peter Korsgaard
