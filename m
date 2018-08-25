From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Aug 2018 09:03:07 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] chrony: backport
 upstream patch to fix blocking on getrandom() at startup with recent
 kernels
In-Reply-To: <1535134708.2283.420.camel@impinj.com> (Trent Piepho's message of
 "Fri, 24 Aug 2018 18:18:29 +0000")
References: <20180824072511.DD93D8E55C@busybox.osuosl.org>
 <1535134708.2283.420.camel@impinj.com>
Message-ID: <87lg8vapxw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trent" == Trent Piepho <tpiepho@impinj.com> writes:

Hi,

 > Why it's true the non-fully-initialized urandom is less secure, it's
 > not any different than the previous getrandom() behavior when it didn't
 > block but now will.

 > So this really restores the previous level of security, rather than
 > making things worse.  The kernel change to getrandom(), in this case,
 > has provided no net improvement in security and make user space more
 > complex with deal the behavior.

Yeah, I also dislike all the fallout from the getrandom() behaviour
changes in the (stable!) kernel upgrades :/


-- 
Bye, Peter Korsgaard
