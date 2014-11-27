From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Nov 2014 22:47:43 +0100
Subject: [Buildroot] [PATCH] toolchain/external: fix building the
	wrapper on MIPS
In-Reply-To: <1417025350-18199-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 26 Nov 2014 19:09:10 +0100")
References: <1417025350-18199-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87tx1knwn4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Some crazy folks use MIPS machines as build machines. ;-)
 > On MIPS, the only acceptable hash-style is 'sysv', because the MIPS ABI
 > defines that the GOT ordering to be the same as the symbols ordering,
 > while GNU hash requires symbols to be sorted by their hash.

 > Looking at binutils' code, it seems that only MIPS suffers from that
 > limitation.

 > Currently, we force the toolchain wrapper to be linked with both hash
 > styles, which breaks on MIPS.

 > So, fix that but singling out MIPS, and use sysv in that case, and both

s/but/by/

Committed, thanks.

-- 
Bye, Peter Korsgaard
