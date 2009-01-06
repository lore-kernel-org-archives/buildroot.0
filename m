From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Jan 2009 20:23:32 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <1231268970.32308.230.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Tue\, 06 Jan 2009 20\:09\:30 +0100")
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<20090106140140.GA22854@zelow.no> <87aba4pj4w.fsf@macbook.be.48ers.dk>
	<20090106183243.GA28479@zelow.no> <873afwnu6n.fsf@macbook.be.48ers.dk>
	<1231268970.32308.230.camel@elrond.atmel.com>
Message-ID: <87prj0me6j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> WCHAR, LOCALE and LARGEFILE all defaults to off, so that's imho a
 >> pretty well tested.

 Ulf> I have been running with them on for a long time, since when I
 Ulf> last tried them OFF, there were a lot of packages which did
 Ulf> seemed to require at least WCHAR to build properly for ARM.

Don't know about ARM, but the ~10 PPC configs I regularly build all
have WCHAR off.

 Ulf> A typical issue that pops up from time to time is that
 Ulf> people build the toolchain with a certain configuration
 Ulf> and then finds that they need a different configurtion
 Ulf> to build a package, and do not realize that they 
 Ulf> need to rebuild the toolchain for the changes to take effect.

That's why those things depends on those toolchain features, instead
of select'ing them like what we do for libraries.

 Ulf> It would be good to resolve this, and this is why I have
 Ulf> proposed to separate toolchain build.
 Ulf> With SYSROOT in gcc-4 there is really no reason 
 Ulf> to induce people to rebuild the toolchain,
 Ulf> and we might want to support downloading a binary toolchain as well.

A binary toolchain sounds to me like a serious support headache, but
if you want to do it, feel free.

-- 
Bye, Peter Korsgaard
