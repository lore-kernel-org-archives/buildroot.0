From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 May 2020 21:58:24 +0200
Subject: [Buildroot] [PATCH] package/bind: security bump to version
 9.11.19
In-Reply-To: <20200525061528.18998-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 25 May 2020 08:15:28 +0200")
References: <20200525061528.18998-1-peter@korsgaard.com>
Message-ID: <877dwzkcrj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - (9.11.18) DNS rebinding protection was ineffective when BIND 9 is
 >   configured as a forwarding DNS server.  Found and responsibly reported by
 >   Tobias Klein.  [GL #1574]

 > - (9.11.19) To prevent exhaustion of server resources by a maliciously
 >   configured domain, the number of recursive queries that can be triggered
 >   by a request before aborting recursion has been further limited.  Root and
 >   top-level domain servers are no longer exempt from the
 >   max-recursion-queries limit.  Fetches for missing name server address
 >   records are limited to 4 for any domain.  This issue was disclosed in
 >   CVE-2020-8616.  [GL #1388]

 > - (9.11.19) Replaying a TSIG BADTIME response as a request could trigger an
 >   assertion failure.  This was disclosed in CVE-2020-8617.  [GL #1703]

 > Also update the COPYRIGHT hash for a change of copyright year and adjust the
 > spacing for the new agreements.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
