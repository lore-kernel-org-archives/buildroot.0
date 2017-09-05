From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Sep 2017 23:04:26 +0200
Subject: [Buildroot] [PATCH] package/binutils: fix crash caused by buggy
	xtensa overlay
In-Reply-To: <1501699220-3055-1-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Wed, 2 Aug 2017 11:40:20 -0700")
References: <1501699220-3055-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <87vakwluw5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > In some xtensa configurations there may be system/user registers in
 > xtensa-modules with negative index. ISA initialization for such config
 > may clobber heap and result in program termination.
 > Don't update lookup table entries for register with negative indices.

 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed to 2017.02.x after dropping the 2.28.1/2.29 patches, thanks.

Is this patch also needed for the older 2.25.1 / 2.26.1 variants we have
in 2027.02.x? If so, could you send a patch?

-- 
Bye, Peter Korsgaard
