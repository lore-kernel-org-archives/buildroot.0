From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Dec 2010 23:21:24 +0100
Subject: [Buildroot] [PATCH 07/15] ltp-testsuite: bump version and use
	autotargets
In-Reply-To: <20101212123150.77a2569e@surf> (Thomas Petazzoni's message of
	"Sun, 12 Dec 2010 12:31:50 +0100")
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<c3f16255f702a6cdd4936c2c91d13ac61db35c82.1291541115.git.thomas.petazzoni@free-electrons.com>
	<87bp4slyo4.fsf@macbook.be.48ers.dk> <20101212123150.77a2569e@surf>
Message-ID: <87aakaljiz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On Sat, 11 Dec 2010 23:42:03 +0100
 Thomas> Peter Korsgaard <jacmet@uclibc.org> wrote:

 >> Does it really not work on uClibc? This is afaik the first package we
 >> have that is glibc only.

 Thomas> ltp-testsuite uses sigset(), which is obsolete. uClibc can
 Thomas> implement it, but not with our default configuration. I thought
 Thomas> ltp-testsuite was not of sufficiently general usage to decide
 Thomas> to make the change of our default uClibc configuration. The
 Thomas> option is UCLIBC_HAS_OBSOLETE_BSD_SIGNAL.

Ok.

 Thomas> BTW, I have the same problem with the mrouted package, which
 Thomas> needs UCLIBC_SUPPORT_AI_ADDRCONFIG enabled in uClibc to
 Thomas> compile. For this package, I just added a comment in the
 Thomas> Config.in help text mentionning this. Should I do the same with
 Thomas> ltp-testsuite ?

Yeah, I would say this is good enough.

 Thomas> I'm not sure how to handle those types of packages, that can
 Thomas> work with uClibc, but not with our default uClibc
 Thomas> configuration, and who are probably not of enough general use
 Thomas> to require a change of our default uClibc configuration.

We could ofcourse add toolchain knobs for all of these, but as you say
they are probably not worth the effort / extra complexity. I think just
leaving them like this is good enough.

-- 
Bye, Peter Korsgaard
