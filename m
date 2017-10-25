From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Oct 2017 09:41:46 +0200
Subject: [Buildroot] [PATCH] lame: security bump to version 3.100
In-Reply-To: <20171022111508.5361-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 22 Oct 2017 13:15:08 +0200")
References: <20171022111508.5361-1-peter@korsgaard.com>
Message-ID: <871slr65dx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2017-9410: fill_buffer_resample function in libmp3lame/util.c heap-based
 > buffer over-read and ap

 > CVE-2017-9411: fill_buffer_resample function in libmp3lame/util.c invalid
 > memory read and application crash

 > CVE-2017-9412: unpack_read_samples function in frontend/get_audio.c invalid
 > memory read and application crash

 > Drop patches now upstream or no longer needed:

 > 0001-configure.patch: Upstream as mentioned in patch description

 > 0002-gtk1-ac-directives.patch: Upstream as mentioned in patch
 > description/release notes:

 > Resurrect Owen Taylor's code dated from 97-11-3 to properly deal with GTK1.
 > This was transplanted back from aclocal.m4 with a patch provided by Andres
 > Mejia. This change makes it easy to regenerate autotools' files with a simple
 > invocation of autoconf -vfi.

 > 0003-msse.patch: Not needed as -march <x86-variant-with-msse-support>
 > nowadays implies -msse.

 > With these removed, autoreconf is no longer needed.

 > Also add a hash for the license file while we're at it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
