From: Daniel James Laird <daniel.j.laird@nxp.com>
Date: Mon, 12 Jan 2009 17:30:36 +0100
Subject: [Buildroot] Some issues I have found in buildroot today.
In-Reply-To: <87eiz8h6tz.fsf@macbook.be.48ers.dk>
References: <20090112152242.565A7766E4@busybox.osuosl.org>
	<C13DBBE85AD6974B85C118C35890CA5F1A85066FB6@EU1RDCRDC1WX029.exi.nxp.com>
	<87eiz8h6tz.fsf@macbook.be.48ers.dk>
Message-ID: <C13DBBE85AD6974B85C118C35890CA5F1A85067046@EU1RDCRDC1WX029.exi.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My thoughts on the BR2_ENABLE_LOCALE were this:

Should the BR2_ENABLE_LOCALE options be moved from the uclibc/Config.in file so that they are globally available.  I could then set that I have a LOCALE enabled toolchain.  If I set that I did not have a LOCALE enabled toolchain then it would build libiconv like it does now.

Or do I just add the same options to the external-toolchain/Config.in?

Cheers,
Daniel Laird

-----Original Message-----
From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter Korsgaard
Sent: 2009 Jan 12 15:39
To: Daniel James Laird
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] Some issues I have found in buildroot today.

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
