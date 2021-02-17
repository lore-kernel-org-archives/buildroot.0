From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 11:27:22 +0100
Subject: [Buildroot] [PATCH] package/tzdate: use classic 'fat' format
 for uClibc/glibc compatibility
In-Reply-To: <20210215185709.27648-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 15 Feb 2021 19:57:09 +0100")
References: <20210215185709.27648-1-peter@korsgaard.com>
Message-ID: <87czwz3s6t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/1019385940

 > FAIL: test_run (tests.core.test_timezone.TestGlibcNonDefaultLimitedTimezone)
 > ----------------------------------------------------------------------
 > Traceback (most recent call last):
 >   File "/builds/buildroot.org/buildroot/support/testing/tests/core/test_timezone.py", line 66, in test_run
 >     self.assertEqual(tz[0].strip(), "EST")
 > AssertionError: '' != 'EST'

 > Commit 7868289fd5348 (package/zic: bump version to 2020f) bumped the zic
 > version to 2020f, which changed the default output format from the classic
 > "fat" format to the new "slim" format:

 > https://github.com/eggert/tz/commit/6ba6f2117b95eab345a7ed9159cef939e30c4cd3

 > The slim format is unfortunately not supported by glibc < 2.28 or uClibc, so
 > explicitly request the classic "fat" format.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
