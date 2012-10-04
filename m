From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Oct 2012 22:50:45 +0200
Subject: [Buildroot] [PATCH v3 RESEND-2] pkg-infra: make sure cross
	compiling is enabled when host == target
In-Reply-To: <1349256390-9956-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Wed, 3 Oct 2012 11:26:30 +0200")
References: <1349256390-9956-1-git-send-email-arnout@mind.be>
Message-ID: <87626q0xne.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> When compiling for the same architecture and libc as the host,
 Arnout> GNU_TARGET_NAME and GNU_HOST_NAME are equal.  configure scripts use
 Arnout> these to detect cross-compilation, and will decide that we're doing
 Arnout> native compilation.  This may trigger running of executables,
 Arnout> which fail because of missing libraries in the host environment.

 Arnout> To solve this, set the vendor part in GNU_TARGET_NAME to buildroot.

 Arnout> This problem exists for instance in xserver_xorg-server on x86_64.

Committed, thanks.

-- 
Bye, Peter Korsgaard
