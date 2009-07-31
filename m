From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 31 Jul 2009 15:30:30 +0200
Subject: [Buildroot] [PATCH 1/3] Fix PROGRAM_INVOCATION handling with
	external toolchains
In-Reply-To: <8d880c3e5c68bea752c2a075d0ef0c64805df93f.1249045362.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Fri\,
	31 Jul 2009 15\:02\:45 +0200")
References: <cover.1249045362.git.thomas.petazzoni@free-electrons.com>
	<cover.1249045362.git.thomas.petazzoni@free-electrons.com>
	<8d880c3e5c68bea752c2a075d0ef0c64805df93f.1249045362.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ab2lugi1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> BR2_UCLIBC_PROGRAM_INVOCATION is a toolchain configuration option,
 Thomas> like BR2_INET_IPV6, BR2_INET_RPC, on which some packages
 Thomas> depend. Therefore, it should be handled like BR2_INET_IPV6 and
 Thomas> BR2_INET_RPC in order to work properly with external toolchains.

 Thomas> Since we move it out of toolchain/uClibc/Config.in into
 Thomas> toolchain/Config.in.2, we rename the option to BR2_PROGRAM_INVOCATION
 Thomas> (since BR2_INET_RPC and others don't have UCLIBC in their name).

Thanks. We should probably also update the defconfigs that sets this -
I'll do that.

-- 
Bye, Peter Korsgaard
