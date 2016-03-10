From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 23:19:55 +0100
Subject: [Buildroot] [PATCH] gcc: fix dynamic linker path for mips
	soft-float
In-Reply-To: <1457472055-7083-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 8 Mar 2016 22:20:55 +0100")
References: <1457472055-7083-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87h9gej7qs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit updates the gcc musl patches for gcc 4.7, 4.8 and 4.9 so
 > that the path to the dynamic linker encoded as "program interpreter"
 > in the generated binaries actually matches the symbolic link installed
 > by musl when building for mips soft-float.

 > Indeed, musl installs a symlink called ld-musl-mipsel-sf.so.1, but gcc
 > currently generates binaries that use /lib/ld-musl-mips.so as program
 > interpreter.

 > The fix is simply the one from
 > https://bitbucket.org/GregorR/musl-cross/commits/825219202365, i.e
 > adjust MUSL_DYNAMIC_LINKER in our musl gcc patches.

 > Thanks to these patches:

 > $ ./host/usr/bin/mipsel-linux-readelf -a ./target/bin/busybox
 > [...]
 >       [Requesting program interpreter: /lib/ld-musl-mipsel-sf.so.1]
 > [...]

 > gcc 5.x doesn't need any fix because the musl patches already use the
 > right value.

 > Fixes bug #7562.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
