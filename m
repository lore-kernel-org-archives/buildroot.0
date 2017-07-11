From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Jul 2017 21:31:57 +0200
Subject: [Buildroot] [PATCH] mpg123: security bump to version 1.25.2
In-Reply-To: <20170711102857.24770-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 11 Jul 2017 12:28:57 +0200")
References: <20170711102857.24770-1-peter@korsgaard.com>
Message-ID: <87vamysrbm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > From the release notes:
 >  - Extend pow tables for layer III to properly handle files with i-stereo and
 >    5-bit scalefactors. Never observed them for real, just as fuzzed input to
 >    trigger the read overflow. Note: This one goes on record as CVE-2017-11126,
 >    calling remote denial of service. While the accesses are out of bounds for
 >    the pow tables, they still are safely within libmpg123's memory (other
 >    static tables). Just wrong values are used for computation, no actual crash
 >    unless you use something like GCC's AddressSanitizer, nor any information
 >    disclosure.
 >  - Avoid left-shifts of negative integers in layer I decoding.

 > While we're at it, add a hash for the license file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
