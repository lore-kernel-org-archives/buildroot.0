From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Jan 2009 13:25:24 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/xerces
In-Reply-To: <1232523074.11888.2.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Wed\, 21 Jan 2009 08\:31\:14 +0100")
References: <20090120213447.41570770AD@busybox.osuosl.org>
	<87y6x5vc74.fsf@macbook.be.48ers.dk>
	<1232523074.11888.2.camel@elrond.atmel.com>
Message-ID: <871vuwu9qj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> How about converting to Makefile.autotools.in format while you're at
 >> it?

 Ulf> I think my priority is to get things to build at all.

Then why were you doing cleanups as well in that commit?
Purely cosmetic cleanups to packages that should be converted to
Makefile.autotools.in seems kind of silly to me - But anyway.

 Ulf> Once all packages build, then it will not be hard
 Ulf> to get most of them into Makefile.autotools.in 

 Ulf> BTW: Makefile.autotools.in does not support compressed
 Ulf> patches *.patch.gz, *.patch.bz2, is that intentional?

Why should it?

find package/ -name '*patch.?z*'

We don't have such files, and for most patches in BR (with the
possible exception of those unfortunate avr32 patches) I don't think
compression will buy us much.

 ulf> xerces-clean:
 ulf> rm -rf $(STAGING_DIR)/usr/include/xercesc
 ulf> rm -f $(STAGING_DIR)/lib/libxerces*
 >> 
 >> TARGET_DIR cleanup stuff seems to be missing.

 Ulf> OK, Have a look at it later.

Thanks.

-- 
Bye, Peter Korsgaard
