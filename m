From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Feb 2009 12:06:53 +0100
Subject: [Buildroot] gcc 4.3.3 anyone?
In-Reply-To: <1233827954.6323.3.camel@sven> (Sven Neumann's message of "Thu\,
	05 Feb 2009 10\:59\:14 +0100")
References: <1233594146.6464.6.camel@sven>
	<873aewhadh.fsf@macbook.be.48ers.dk> <1233827954.6323.3.camel@sven>
Message-ID: <871vudcfci.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@phase-zero.de> writes:

 Sven> Hi,
 Sven> On Mon, 2009-02-02 at 21:06 +0100, Peter Korsgaard wrote:

 Sven> I've ran into what appears to be a bug in gcc 4.3.2 and reported it
 Sven> here: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=39076

 Sven> The gcc people have fixed this problem in the gcc-4.3 branch. I verified
 Sven> that the patch fixes the compiler segfault when compiling flac. Attached
 Sven> is a patch for buildroot that incorporates this fix for gcc 4.3.2.

Thanks, will apply.

 Sven> I also noticed that two of the patches in toolchain/gcc/4.3.2 don't end
 Sven> in .patch and thus are not applied. Is this intentional?

No, not afaik. The 995-short-enums.diff comes from Bernhard and is a
fix for PR34205 which got tagged WONTFIX upstream
(http://gcc.gnu.org/bugzilla/show_bug.cgi?id=34205), and afaik
shouldn't be needed now we don't use abi=iwmmxt anymore - Bernhard,
correct me if I'm wrong - Otherwise I'll remove it.

The 306-arm-funroll-loops.patch.arm is from Ulf (r24993), and not just
the name is wrong, it doesn't apply (wrong patch level). I've fixed
that up and am now doing a test build to check if it fixes the mplayer
ICE. If so, then I'll commit, otherwise I'll remove it.

Thanks for noticing!

-- 
Bye, Peter Korsgaard
