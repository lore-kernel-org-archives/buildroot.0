From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2015 23:09:01 +0200
Subject: [Buildroot] [PATCH] binutils: fix xtensa gas trampolines
	regression
In-Reply-To: <1431265429-32419-1-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Sun, 10 May 2015 16:43:49 +0300")
References: <1431265429-32419-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <87r3qojg2a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > xtensa trampolines relaxation optimization caused the following build
 > errors:
 >   Error: operand 1 of 'j' has out of range value '131643'
 >   Error: operand 1 of 'j' has out of range value '4294836162'
 >   Error: operand 1 of 'j' has out of range value '4294836072'

 > Extra condition 'abs (addr - trampaddr) < J_RANGE / 2' for trampoline
 > selection results in regressions: when relaxable jump is little longer
 > than J_RANGE so that single trampoline makes two new jumps, one longer
 > than J_RANGE / 2 and one shorter, correct trampoline cannot be found.

 > Drop that condition.

 > Upstream status: patch submitted.
 > Fix squashed into the optimization patch.
 > Fixes:
 >   http://autobuild.buildroot.net/results/5ba7d18262ce6a2dfd69db07d064a971267f1128/

 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
