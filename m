From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Feb 2011 14:34:51 +0100
Subject: [Buildroot] [PATCH 1/1] openssl: pass LDFLAGS to fix incorrect
	link
In-Reply-To: <932c49a0153146151c027de0a05fd688fbab23f7.1297072495.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Mon, 7 Feb 2011 10:55:04 +0100")
References: <cover.1297072495.git.thomas.petazzoni@free-electrons.com>
	<cover.1297072495.git.thomas.petazzoni@free-electrons.com>
	<932c49a0153146151c027de0a05fd688fbab23f7.1297072495.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ei7kvuh0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> We already pass the LD variable to openssl in order to use gcc as the
 Thomas> driver for the link process, instead of directly using the ld
 Thomas> linker. However, we were not passing LDFLAGS so that the compiler
 Thomas> flags are passed, which means that with multilib toolchains, the
 Thomas> incorrect library variant could be used at link time, leading to
 Thomas> invalid binaries (partly ARMv4, partly ARMv5) or broken compilation
 Thomas> (when the build took place in soft-float, but the link stage takes
 Thomas> place against hard-float libraries).

Committed, thanks.

-- 
Bye, Peter Korsgaard
