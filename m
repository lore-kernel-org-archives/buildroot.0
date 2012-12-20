From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Dec 2012 11:50:04 +0100
Subject: [Buildroot] [PATCH RFC 5/6] libfslcodec: new package
In-Reply-To: <50D2E9B2.70808@mind.be> (Arnout Vandecappelle's message of "Thu, 
 20 Dec 2012 11:34:26 +0100")
References: <1355960256-10786-1-git-send-email-arnout@mind.be>
 <1355960256-10786-6-git-send-email-arnout@mind.be>
 <653065179.1471991.1355965563202.JavaMail.root@advansee.com>
 <50D2CA07.1060503@mind.be> <87a9t9ytss.fsf@dell.be.48ers.dk>
 <50D2E9B2.70808@mind.be>
Message-ID: <874njhyp43.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> I don't know the specifics of this package, but presumably it only
 >> works with glibc and a specific soft/softfp/hard floating point
 >> mode? If so, we could atleast catch some of these dependencies in
 >> Config.in.

 Arnout>  Yes, but how to know what the dependencies are (except by
 Arnout> run-testing with all the different toolchains on all the
 Arnout> different SoCs)?

Doesn't Freescale document this anyware, or atleast mention what
toolchain they have used to build it?

 Arnout>  I'd also like to find a way to decide which of the _arm9,
 Arnout> _arm11 or _arm12 libraries to use (they all have the same ABI
 Arnout> flags...).

Can't you decide based on the selected ARM subarchitecture? If we need
to do this in a bunch of places we could centralize it by adding some
BR2_ARM_Vx symbols and select the correct one from the subarch choice.

-- 
Bye, Peter Korsgaard
