From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 16:23:35 +0200
Subject: [Buildroot] [PATCH 0/9] Fix internal blackfin toolchain
In-Reply-To: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
References: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130727162335.0e5bf70c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 20 Jul 2013 09:52:06 -0300, Gustavo Zacarias wrote:
> This patchset fixes the internal blackfin toolchain build.
> It's been broken for ages (never worked maybe?)
> Testers wanted, it builds what's supposed to build but i lack hardware
> to see if it really works.
> 
> Gustavo Zacarias (9):
>   gcc/bfin: doesn't support --with-cpu defaults
>   uclibc/bfin: only supports linuxthreads.old
>   uclibc: make target utils optional
>   gcc/bfin: 4.{6,7,8}.x are broken
>   uclibc: use builtin startfiles target
>   uclibc/bfin: set the appropiate binfmt in the configuration
>   uclibc/bfin: don't install host utils if not FDPIC
>   blackfin: set GNU_TARGET_NAME accordingly
>   gcc/mudflap: disable for blackfin, it doesn't build

Committed entire series, with the minor fixes I pointed on the
individual patches.

Note that when you select FLAT format, it is still ELF binaries that
are produced in $(O)/target. Most likely related to our non-working
handling of elf2flt, as discussed recently on the list regarding ARM
noMMU platforms. So this patch series certainly improves the situation,
but doesn't fix the whole thing yet :)

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
