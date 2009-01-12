From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Jan 2009 16:39:20 +0100
Subject: [Buildroot] Some issues I have found in buildroot today.
In-Reply-To: <C13DBBE85AD6974B85C118C35890CA5F1A85066FB6@EU1RDCRDC1WX029.exi.nxp.com>
	(Daniel James Laird's message of "Mon\,
	12 Jan 2009 16\:34\:13 +0100")
References: <20090112152242.565A7766E4@busybox.osuosl.org>
	<C13DBBE85AD6974B85C118C35890CA5F1A85066FB6@EU1RDCRDC1WX029.exi.nxp.com>
Message-ID: <87eiz8h6tz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel James Laird <daniel.j.laird@nxp.com> writes:

Hi,

 Daniel> I have found that libcurl is not properly dependent on
 Daniel> host-sed so if I build this package alone it does not work.

And it needs it internally for the build?

 Daniel> I have also found that autoconf can not be built with multi
 Daniel> jobs (i.e -j X).

Ok, that should be fixable with a simple s/MAKE/MAKE1/

 Daniel> I have also found that for external toolchains you cannot set
 Daniel> that you have LOCALE/WCHAR support this limits options
 Daniel> somewhat and means libiconv is always built and I would
 Daniel> rather not do this.  Can anyone explain the LOCALE support
 Daniel> options and what it means for an external toolchain instead
 Daniel> of a uclibc built toolchain.

I guess the LOCALE stuff for external toolchain should just match what
the toolchain has, but I don't use the external stuff.

-- 
Bye, Peter Korsgaard
