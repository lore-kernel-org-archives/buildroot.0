From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 May 2018 17:47:18 +0200
Subject: [Buildroot] [PATCH] wavpack: add upstream security fixes
In-Reply-To: <20180521132720.17915-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 21 May 2018 15:27:20 +0200")
References: <20180521132720.17915-1-peter@korsgaard.com>
Message-ID: <87a7stj9ix.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2018-10536: An issue was discovered in WavPack 5.1.0 and earlier.  The
 > WAV parser component contains a vulnerability that allows writing to memory
 > because ParseRiffHeaderConfig in riff.c does not reject multiple format
 > chunks.

 > CVE-2018-10537: An issue was discovered in WavPack 5.1.0 and earlier.  The
 > W64 parser component contains a vulnerability that allows writing to memory
 > because ParseWave64HeaderConfig in wave64.c does not reject multiple format
 > chunks.

 > CVE-2018-10538: An issue was discovered in WavPack 5.1.0 and earlier for WAV
 > input.  Out-of-bounds writes can occur because ParseRiffHeaderConfig in
 > riff.c does not validate the sizes of unknown chunks before attempting
 > memory allocation, related to a lack of integer-overflow protection within a
 > bytes_to_copy calculation and subsequent malloc call, leading to
 > insufficient memory allocation.

 > CVE-2018-10539: An issue was discovered in WavPack 5.1.0 and earlier for
 > DSDiff input.  Out-of-bounds writes can occur because
 > ParseDsdiffHeaderConfig in dsdiff.c does not validate the sizes of unknown
 > chunks before attempting memory allocation, related to a lack of
 > integer-overflow protection within a bytes_to_copy calculation and
 > subsequent malloc call, leading to insufficient memory allocation.

 > CVE-2018-10540: An issue was discovered in WavPack 5.1.0 and earlier for W64
 > input.  Out-of-bounds writes can occur because ParseWave64HeaderConfig in
 > wave64.c does not validate the sizes of unknown chunks before attempting
 > memory allocation, related to a lack of integer-overflow protection within a
 > bytes_to_copy calculation and subsequent malloc call, leading to
 > insufficient memory allocation.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
