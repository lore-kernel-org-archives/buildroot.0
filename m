From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 22:06:14 +0200
Subject: [Buildroot] [PATCH v2] boot/barebox: fix target bareboxenv
 command compile
In-Reply-To: <20201003095902.16248-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 3 Oct 2020 11:59:02 +0200")
References: <20201003095902.16248-1-ps.report@gmx.net>
Message-ID: <87eem5g821.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > The buildroot custom bareboxenv compile command
 > misses the additional include path 'scripts/include'
 > to gain access to the local copy of the kernel header
 > files (which leads to compile error when using an
 > older toolchain).

 > This could be fixed by enhancing the custom bareboxenv
 > compile command (see [1]) or by using the barebox
 > build system by simply enabling the CONFIG_BAREBOXENV_TARGET
 > option (available since April 2012, see [2]) instead (as
 > suggested by Yann E. MORIN).

 > Fixes (with BR2_TARGET_BAREBOX_BAREBOXENV enabled):

 >   build/barebox-2019.12.0/scripts/bareboxenv.c:100:10: fatal error: linux/list.h: No such file or directory

 > [1] http://lists.busybox.net/pipermail/buildroot/2020-January/270942.html
 > [2] https://git.pengutronix.de/cgit/barebox/commit/?id=afb03d7a554a2911a3742e316f011319fcb416f1

 > Reported-by: Frederick Gotham <cauldwell.thomas@gmail.com>
 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Changes v1 -> v2:
 >   - change to barebox CONFIG_BAREBOXENV_TARGET config option
 >     (suggested by Yann E. MORIN)

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
