From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Jun 2017 00:04:52 +0200
Subject: [Buildroot] [for-next 3/3] package/gcc: remove gcc 4.9
In-Reply-To: <6c88ceb4-94f7-6018-6d3a-ae3e99c8d44e@mind.be> (Arnout
 Vandecappelle's message of "Sun, 11 Jun 2017 22:30:30 +0200")
References: <20170525183457.12169-1-romain.naour@gmail.com>
 <20170525183457.12169-3-romain.naour@gmail.com>
 <20170526151414.11f2d47a@free-electrons.com>
 <6c88ceb4-94f7-6018-6d3a-ae3e99c8d44e@mind.be>
Message-ID: <874lvjbl2z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> I'll wait a little bit for additional feedback on this one. If nobody
 >> complains in the next few days, I'm going to apply it.

 >  GCC 4.9 (or rather, GCC 5) is a bit a special case: libstdc++ had heavy
 > ABI-incompatible changes. E.g. at the time Debian switched to it, it was the
 > only time I had major breakage in sid. So, the switch from gcc 4.9 to gcc 5
 > means that any binary-only C++ program will no longer be usable.

 That probably is a bigger issue for a binary distribution like Debian
 than for Buildroot though.


 >  On top of that, gcc 5 introduces many errors (for non-standard-compliant code)
 > that were accepted before in gcc 4.9, which makes existing codebases sometimes
 > difficult to get built. This, however, happens with each version bump so less of
 > an argument against removal.

True. It also breaks older u-boot and Linux kernel versions that didn't
handle > gcc4.x.


 >  You could say that users with such requirements should keep using their own
 > toolchain, but there are useful (security) fixes in libc as well. They could use
 > an external toolchain, but then how to build it? Crosstool-NG is a *lot* more
 > complicated to use than Buildroot.

But we also don't keep old libc versions around. Would they be Ok with
moving to a new libc version but not to newer gcc version?


 >  Bottom line: I'd tend to keep gcc 4.9 around for a while. If
 > breakage occurs we can disallow it for some architectures. There
 > shouldn't be much more maintenance effort than that, I think.

I can follow you, and it is OK for me to keep 4.9 around for a little
while longer. We always have this tradeoff between stability and adding
new features / cleanups, and I do think people should be moving to the
LTS version (and plan in time for a yearly migration to the new LTS) if
they want stability and fixes for a longer period, just like they
(hopefully) do for their Linux kernel.

We should imho drop 4.9 before the next LTS though.

-- 
Bye, Peter Korsgaard
