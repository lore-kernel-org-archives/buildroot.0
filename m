From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 30 Oct 2012 22:05:02 +0100
Subject: [Buildroot] [PATCH] strace: fix build for x86_64
In-Reply-To: <1351630798-4390-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 30 Oct 2012 21:59:57 +0100")
References: <1351630798-4390-1-git-send-email-arnout@mind.be>
Message-ID: <87ip9rhds1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> strace fails to build on x86_64 because stat64 is not
 Arnout> available.  This is because the automatic detection of stat64
 Arnout> in configure is overridden by buildroot, by setting
 Arnout> ac_cv_type_stat64.  Just remove that override - current strace
 Arnout> seems to detect it correctly for non-largefile platforms.

Committed, thanks.

-- 
Bye, Peter Korsgaard
