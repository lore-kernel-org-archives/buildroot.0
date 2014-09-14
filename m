From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 14 Sep 2014 19:05:44 +0200
Subject: [Buildroot] [PATCH] strace: Disable for MIPS when using a
 uClibc toolchain
In-Reply-To: <1410518438-14544-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1410518438-14544-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140914170543.GN14691@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,
Vicente Olivert Riera wrote,

> A change introduced in strace-4.9 makes it incompatible with MIPS
> architecture when using a uClibc toolchain. This is the failure:
> 
> signal.c: In function 'printsiginfo':
> signal.c:453:9: error: 'siginfo_t' has no member named 'si_timerid'
>       sip->si_timerid, sip->si_overrun);
> 	 ^
> signal.c:453:26: error: 'siginfo_t' has no member named 'si_overrun'
>       sip->si_timerid, sip->si_overrun);
> 
> uClibc needs to be patched in order to fix this problem. In the meantime
> we disable strace for MIPS when using a uClibc toolchain.

Can you sent a patch to uClibc mailing list fixing this issue?
System without strace is had to debug.

best regards
 Waldemar
