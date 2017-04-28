From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Apr 2017 14:31:34 +0200
Subject: [Buildroot] [PATCH] libsndfile: security bump to version 1.0.28
In-Reply-To: <20170426115214.8152-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 26 Apr 2017 13:52:14 +0200")
References: <20170426115214.8152-1-peter@korsgaard.com>
Message-ID: <87tw58hfx5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > CVE-2017-7585 - In libsndfile before 1.0.28, an error in the
 > "flac_buffer_copy()" function (flac.c) can be exploited to cause a
 > stack-based buffer overflow via a specially crafted FLAC file.

 > CVE-2017-7586 - In libsndfile before 1.0.28, an error in the "header_read()"
 > function (common.c) when handling ID3 tags can be exploited to cause a
 > stack-based buffer overflow via a specially crafted FLAC file.

 > CVE-2017-7741 - In libsndfile before 1.0.28, an error in the
 > "flac_buffer_copy()" function (flac.c) can be exploited to cause a
 > segmentation violation (with write memory access) via a specially crafted
 > FLAC file during a resample attempt, a similar issue to CVE-2017-7585.

 > CVE-2017-7742 - In libsndfile before 1.0.28, an error in the
 > "flac_buffer_copy()" function (flac.c) can be exploited to cause a
 > segmentation violation (with read memory access) via a specially crafted
 > FLAC file during a resample attempt, a similar issue to CVE-2017-7585.

 > Dop undocumented patch adjusting SUBDIRS in Makefile.in as it no longer
 > applies.  Instead pass --disable-full-suite to disable man pages,
 > documentation and programs, as that was presumably the reason for the patch.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
