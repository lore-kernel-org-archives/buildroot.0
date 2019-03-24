From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 09:01:24 +0100
Subject: [Buildroot] [PATCH] package/libseccomp: security bump to
 version 2.4.0
In-Reply-To: <20190321074043.15989-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 21 Mar 2019 08:40:43 +0100")
References: <20190321074043.15989-1-peter@korsgaard.com>
Message-ID: <87va08bt0r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > From the advisory:
 > Jann Horn  identified a problem in current versions of
 > libseccomp where the library did not correctly generate 64-bit syscall
 > argument comparisons using the arithmetic operators (LT, GT, LE, GE).
 > Jann has done a search using codesearch.debian.net and it would appear
 > that only systemd and Tor are using libseccomp in such a way as to
 > trigger the bad code.  In the case of systemd this appears to affect
 > the socket address family and scheduling class filters.  In the case
 > of Tor it appears that the bad filters could impact the memory
 > addresses passed to mprotect(2).

 > The libseccomp v2.4.0 release fixes this problem, and should be a
 > direct drop-in replacement for previous v2.x releases.

 > https://www.openwall.com/lists/oss-security/2019/03/15/1

 > v2.4.0 adds a new scmp_api_level utility, so update 0001-remove-static.patch
 > to match.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
