From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2020 23:32:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/musl: move riscv64 register
 index constant definitions
In-Reply-To: <20200211151453.4972-1-mark@dibsco.co.uk> (Mark Corbin's message
 of "Tue, 11 Feb 2020 15:14:53 +0000")
References: <20200211151453.4972-1-mark@dibsco.co.uk>
Message-ID: <878sl8iwls.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Corbin <mark@dibsco.co.uk> writes:

 > The riscv64 build of libsigsegv using musl fails due to a missing
 > definition for REG_SP. This constant is used to index the __gregs
 > array in the ucontext_t structure.

 > This fix moves the musl defintion of REG_SP (and others) from
 > arch/riscv64/bits/reg.h to arch/riscv64/bits/signal.h
 > so that it is picked up correctly.

 > The patch was downloaded from upstream:
 > https://git.musl-libc.org/cgit/musl/commit/?id=329e79299daaa994b8e75941331a1093051ea5d9

 > Fixes:
 > http://autobuild.buildroot.org/results/8fcd5cb912e513ac08a81e3ee726e29ac22212bb/

 > Signed-off-by: Mark Corbin <mark@dibsco.co.uk>

Committed, thanks.

-- 
Bye, Peter Korsgaard
