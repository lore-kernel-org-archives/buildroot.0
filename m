From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2015 21:08:10 +0200
Subject: [Buildroot] [PATCHv2 1/1] board/wandboard: fix perl related
	linux compilation error
In-Reply-To: <20150922154716.0c3fec44@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 22 Sep 2015 15:47:16 +0200")
References: <1442889921-6713-1-git-send-email-imrehg@gmail.com>
 <20150922154716.0c3fec44@free-electrons.com>
Message-ID: <87r3lb22jp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 22 Sep 2015 10:45:21 +0800, imrehg at gmail.com wrote:
 >> From: Gergely Imreh <imrehg@gmail.com>
 >> 
 >> Replace the "timeconst" perl script with a bc script to fix an
 >> error due to syntax changes in perl which resulted in linux
 >> compilation error for the wandboard's 3.8 kernel. The patch is
 >> backported, kernels from 3.9 onward already have this change.
 >> 
 >> Signed-off-by: Gergely Imreh <imrehg@gmail.com>

 > The problem with this patch is that it fixes the problem specifically
 > for the wandboard_defconfig. Any other person building another kernel
 > version affected by the same problem will face the problem.

Presumably only if they have a new enough perl version and/or old enough
make version? (the last shouldn't be an issue as we require make 3.81).

I haven't seen the problem myself (or heard other reports about it), so
it presumably only triggers for a few people.

 > If the problem is serious, I don't really see another option than
 > having some logic in linux.mk to detect if the kernel is affected by
 > the problem, and replacing the perl script by a bc script.

Step 1 must be to understand what the issue is exactly and what version
of perl/make triggers it.

Imreh, can you clarify?

-- 
Bye, Peter Korsgaard
