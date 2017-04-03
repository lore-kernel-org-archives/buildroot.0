From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Apr 2017 10:32:50 +0200
Subject: [Buildroot] [PATCH 1/5] audiofile: add security patch for
	CVE-2017-6827 / CVE-2017-6828 / CVE-2017-6832 / CVE-2017-6833
	/ CVE-2017-6835 / CVE-2017-6837
In-Reply-To: <20170330210335.16858-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 30 Mar 2017 23:03:31 +0200")
References: <20170330210335.16858-1-peter@korsgaard.com>
Message-ID: <87efx9vqkt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > CVE-2017-6827: A heap-based buffer overflow in the
 > MSADPCM::initializeCoefficients function in MSADPCM.cpp in audiofile (aka
 > libaudiofile and Audio File Library) 0.3.6 allows remote attackers to have
 > unspecified impact via a crafted audio file.

 > https://blogs.gentoo.org/ago/2017/02/20/audiofile-heap-based-buffer-overflow-in-msadpcminitializecoefficients-msadpcm-cpp
 > https://github.com/mpruett/audiofile/issues/32

 > CVE-2017-6828: A Heap-based buffer overflow in the readValue function in
 > FileHandle.cpp in audiofile (aka libaudiofile and Audio File Library) 0.3.6
 > allows remote attackers to have unspecified impact via a crafted WAV file.

 > https://blogs.gentoo.org/ago/2017/02/20/audiofile-heap-based-buffer-overflow-in-readvalue-filehandle-cpp
 > https://github.com/mpruett/audiofile/issues/31

 > CVE-2017-6832: A Heap-based buffer overflow in the decodeBlock in
 > MSADPCM.cpp in Audio File Library (aka audiofile) 0.3.6 allows remote
 > attackers to cause a denial of service (crash) via a crafted file.

 > https://blogs.gentoo.org/ago/2017/02/20/audiofile-heap-based-buffer-overflow-in-msadpcmdecodeblock-msadpcm-cpp
 > https://github.com/mpruett/audiofile/issues/36

 > CVE-2017-6833: The runPull function in libaudiofile/modules/BlockCodec.cpp
 > in Audio File Library (aka audiofile) 0.3.6 allows remote attackers to cause
 > a denial of service (divide-by-zero error and crash) via a crafted file.

 > https://blogs.gentoo.org/ago/2017/02/20/audiofile-divide-by-zero-in-blockcodecrunpull-blockcodec-cpp
 > https://github.com/mpruett/audiofile/issues/37

 > CVE-2017-6835: The reset1 function in libaudiofile/modules/BlockCodec.cpp in
 > Audio File Library (aka audiofile) 0.3.6 allows remote attackers to cause a
 > denial of service (divide-by-zero error and crash) via a crafted file.

 > https://blogs.gentoo.org/ago/2017/02/20/audiofile-divide-by-zero-in-blockcodecreset1-blockcodec-cpp
 > https://github.com/mpruett/audiofile/issues/39

 > CVE-2017-6837: WAVE.cpp in Audio File Library (aka audiofile) 0.3.6 allows
 > remote attackers to cause a denial of service (crash) via vectors related to
 > a large number of coefficients.

 > http://blogs.gentoo.org/ago/2017/02/20/audiofile-multiple-ubsan-crashes/
 > https://github.com/mpruett/audiofile/issues/41

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed all 5 to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
