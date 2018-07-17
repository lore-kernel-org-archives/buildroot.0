From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Jul 2018 21:57:06 +0200
Subject: [Buildroot] [PATCH] package/elf2flt: fix build with Binutils >=
 2.31
In-Reply-To: <1531845102-20058-1-git-send-email-romain.naour@smile.fr> (Romain
 Naour's message of "Tue, 17 Jul 2018 18:31:42 +0200")
References: <1531845102-20058-1-git-send-email-romain.naour@smile.fr>
Message-ID: <87muupk54d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Binutils added diagnostics.h to bfd.h [1], so elf2flt must create a
 > symlink for this header.

 > Fixes:
 > https://gitlab.com/free-electrons/toolchains-builder/-/jobs/82284139

 > [1]
 > https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=95da9854466ada2572b42f5528711a06a2d42db1

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 > ---
 > Note: for Binutils < 2.31 elf2flt create a broken symlink diagnostics.h
 > in bfd-headers:
 > diagnostics.h -> output/build/host-binutils-2.30/include/diagnostics.h

 > We can add a HOST_ELF2FLT_POST_INSTALL_HOOKS to remove it if necessary.

Committed, thanks.

-- 
Bye, Peter Korsgaard
