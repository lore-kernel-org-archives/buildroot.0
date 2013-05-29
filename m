From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 May 2013 21:22:24 +0200
Subject: [Buildroot] [PATCH 2/2] libtirpc: prevent selection when ADI
	Blackfin external toolchains are used
In-Reply-To: <1369770335-6995-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 28 May 2013 21:45:35 +0200")
References: <1369770335-6995-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369770335-6995-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ehcp6173.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> libtirpc fails to build with the Blackfin external toolchains provided
 Thomas> by Analog Devices, because their uClibc configuration doesn't include
 Thomas> AI_ADDRCONFIG. In order to prevent such build failures to happen, we
 Thomas> simply prevent libtirpc from being selected when such toolchains are
 Thomas> used. This is not a big problem, since they provide native RPC
 Thomas> support.

 Thomas> Also, since they provide native RPC, we don't have to propagate this
 Thomas> new dependency to the reverse dependencies of libtirpc, because they
 Thomas> all use native RPC when available. The exception to this rule is the
 Thomas> rpcbind package, which can only use the libtirpc implementation of
 Thomas> RPCs, and not the native one of C libraries. Therefore, the dependency
 Thomas> is propagated to the rpcbind package.

 Thomas> Fixes:

 Thomas>   http://autobuild.buildroot.org/results/58b/58b16449065c16afce11ba120db56839efb2b1ea/build-end.log

Committed, thanks.

-- 
Bye, Peter Korsgaard
