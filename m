From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 22 Aug 2010 21:52:19 +0200
Subject: [Buildroot] [pull request] Pull request for branch for-2010.08
In-Reply-To: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 22 Aug 2010 12:51:52 +0200")
References: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87bp8ujuh8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello Peter, hello all,
 Thomas> Here is the stack of patches I've accumulated for the 2010.08
 Thomas> release. They either fix bugs reported by users, fix various build
 Thomas> issues, or deprecate things such as the Cris architecture.

Thanks a lot Thomas, much appreciated. I'm just back from vacation and
trying to dig though the mail pile, but from a quick look this all seems
fine.

I'll have a closer look tomorrow and pull.


 Thomas> There are a few remaining issues that I think should be fixed before
 Thomas> 2010.08 is released:

 Thomas>  * The ldconfig problem on Fedora 13. I've been able to reproduce it
 Thomas>    after installing Fedora 13 in a VM, but I haven't had the time to
 Thomas>    figure out the correct solution for it.

I haven't looked at that yet either.

 Thomas>  * Several configuration cache related issues. It seems to me that
 Thomas>    sharing the configuration cache between different packages is in
 Thomas>    fact hard to achieve in a reliable way. Maybe we should revert back
 Thomas>    to the configuration cache disabled by default.

Yeah, might just be the safest indeed.

 Thomas>  * The gcc 4.2 build problem. gcc 4.2 used to build properly, but has
 Thomas>    been broken by the new gcc build process introduced to support NPTL
 Thomas>    in uClibc. Khem has sent a patch that fixes this problem by adding
 Thomas>    a couple of #ifndef inhibit_libc ... #endif, but I'm not sure about
 Thomas>    it, so I preferred to get your opinion.

I haven't looked at it in detail, but from a quick look it seems OK.

 Thomas>  * The uClibc 0.9.31 / C++ / locale problem, for which Khem has also
 Thomas>    sent a patch.

OK.

 Thomas> Regards,

 Thomas> Thomas

 Thomas> The following changes since commit 2ef83b42b97e7a098c9bef34109c5a8896a17b76:
 Thomas>   Peter Korsgaard (1):
 Thomas>         update for 2010.08-rc1

 Thomas> are available in the git repository at:

 Thomas>   git://git.busybox.net/~tpetazzoni/git/buildroot for-2010.08

 Thomas> Francois Perrad (2):
 Thomas>       Add new patches Lua upstream patches rename old ones

That's a strange sentence.
 Thomas>       Make uClibc gen_wc8bit shows an error when no locale support available

s/shows/show/


-- 
Bye, Peter Korsgaard
