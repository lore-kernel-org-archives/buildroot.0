From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Dec 2017 14:33:41 +0100
Subject: [Buildroot] [PATCH] glibc: security bump to the latest 2.26
 branch
In-Reply-To: <4f77d70e07b0ed078d79e0358ec3ff3d49ccb093.1512717176.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 8 Dec 2017 09:12:56 +0200")
References: <4f77d70e07b0ed078d79e0358ec3ff3d49ccb093.1512717176.git.baruch@tkos.co.il>
Message-ID: <87efo5z6mi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > List of fixes from the 2.26 branch NEWS files:
 >   CVE-2017-15670: The glob function, when invoked with GLOB_TILDE,
 >   suffered from a one-byte overflow during ~ operator processing (either
 >   on the stack or the heap, depending on the length of the user name).
 >   Reported by Tim R?hsen.

 >   CVE-2017-15671: The glob function, when invoked with GLOB_TILDE,
 >   would sometimes fail to free memory allocated during ~ operator
 >   processing, leading to a memory leak and, potentially, to a denial
 >   of service.

 >   CVE-2017-15804: The glob function, when invoked with GLOB_TILDE and
 >   without GLOB_NOESCAPE, could write past the end of a buffer while
 >   unescaping user names.  Reported by Tim R?hsen.

 >   CVE-2017-17426: The malloc function, when called with an object size near
 >   the value SIZE_MAX, would return a pointer to a buffer which is too small,
 >   instead of NULL.  This was a regression introduced with the new malloc
 >   thread cache in glibc 2.26.  Reported by Iain Buclaw.

 > Cc: Waldemar Brodkorb <wbx@openadk.org>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
