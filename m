From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Apr 2009 16:18:10 +0200
Subject: [Buildroot] pkgconfig confusion
In-Reply-To: <1239962164.6397.6.camel@sven> (Sven Neumann's message of "Fri\,
	17 Apr 2009 11\:56\:04 +0200")
References: <1239962164.6397.6.camel@sven>
Message-ID: <87prfb8iu5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@phase-zero.de> writes:

 Sven> Hi,
 Sven> I've tried to update to the latest buildroot snapshot today and ran into
 Sven> a problem with pkg-config:

 >>>> pkgconfig undefined Extracting
 Sven> gzip: /home/sven/buildroot-new/dl/pkgconfig-undefined.tar.gz: No such
 Sven> file or directory
 Sven> tar: This does not look like a tar archive

This is pkg-config for the target. Is that really what you want?

 Sven> So I had a look at package/pkgconfig/pkgconfig.mk and found that it
 Sven> defines all variables with the PKG_CONFIG prefix instead of using
 Sven> PKGCONFIG. Changing this seems to fix the problem (see attached diff).
 Sven> Alternatively one could rename pkgconfig/pkgconfig.mk to
 Sven> pkg-config/pkg-config.mk.

Yes, the correct fix looks to be renaming the dir / file and the
AUTOTARGETS line.

Will fix.

-- 
Bye, Peter Korsgaard
