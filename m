From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Sep 2009 23:27:41 +0200
Subject: [Buildroot] [RFC] [PATCH 0/5] Buildroot cleanup
In-Reply-To: <1252440948.19600.4.camel@bender> (Sven Neumann's message of
	"Tue\, 08 Sep 2009 22\:15\:48 +0200")
References: <4AA62DD20200000D00128C56@gwia.alliedtelesyn.co.nz>
	<4AA75F310200007000017827@gwia.alliedtelesyn.co.nz>
	<4AA75F310200007000017827@gwia.alliedtelesyn.co.nz>
	<1252440948.19600.4.camel@bender>
Message-ID: <87vdjt160i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Hi,
 Sven> On Wed, 2009-09-09 at 07:54 +1200, angus salkeld wrote:

 >> Another suggestion would be to completely separate out the toolchain
 >> into a new package "buildcross.git" that only builds the cross
 >> toolchain and then buildroot always uses the external toolchain.
 >> It would make buildroot's toolchain setup simpler (one toolchain mode).
 >> And make sharing toolchains more obvious.

 Sven> I like that idea. Can't really judge if it would be a success, but it
 Sven> seems like a nice solution that has the potential to simplify things.

I have been thinking about it myself. *REALLY* supporting toolchains for
all the different architectures / variants, uclibc and (e)glibc and
following up on compiler bugs takes quite some effort (and noone seems
willing to do it for buildroot), so maybe the best long term solution is
simply to deprecate the toolchain building stuff and just recommend
crosstool-ng instead?

This would make BR less selfcontained / one-stop-shop though.

-- 
Bye, Peter Korsgaard
