From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Jan 2019 16:33:38 +0100
Subject: [Buildroot] [PATCH] package/libsndfile: add upstream
 post-1.0.28 security fixes
In-Reply-To: <20190118085518.7729-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 18 Jan 2019 09:55:18 +0100")
References: <20190118085518.7729-1-peter@korsgaard.com>
Message-ID: <87pnss3bn1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > CVE-2017-14634: In libsndfile 1.0.28, a divide-by-zero error exists in the
 > function double64_init() in double64.c, which may lead to DoS when playing a
 > crafted audio file

 > CVE-2017-17456: The function d2alaw_array() in alaw.c of libsndfile
 > 1.0.29pre1 may lead to a remote DoS attack (SEGV on unknown address
 > 0x000000000000), a different vulnerability than CVE-2017-14245

 > CVE-2017-17457: The function d2ulaw_array() in ulaw.c of libsndfile
 > 1.0.29pre1 may lead to a remote DoS attack (SEGV on unknown address
 > 0x000000000000), a different vulnerability than CVE-2017-14246

 > CVE-2018-13139: A stack-based buffer overflow in psf_memset in common.c in
 > libsndfile 1.0.28 allows remote attackers to cause a denial of service
 > (application crash) or possibly have unspecified other impact via a crafted
 > audio file.  The vulnerability can be triggered by the executable
 > sndfile-deinterleave

 > CVE-2018-19661: An issue was discovered in libsndfile 1.0.28.  There is a
 > buffer over-read in the function i2ulaw_array in ulaw.c that will lead to a
 > denial of service

 > CVE-2018-19662: An issue was discovered in libsndfile 1.0.28.  There is a
 > buffer over-read in the function i2alaw_array in alaw.c that will lead to a
 > denial of service

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
