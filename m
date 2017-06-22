From: Mason <slash.tmp@free.fr>
Date: Thu, 22 Jun 2017 11:23:02 +0200
Subject: [Buildroot] Policy for upgrading toolchains in LTS version
Message-ID: <232c0fde-c837-ccfd-949c-eeec82a24fdb@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Providing an LTS version is an interesting idea.

I was wondering about the policy for upgrading toolchains
in LTS versions (I use Linaro).

Case in point: 2017.02.x branch is set up to use gcc-linaro-6.2.1-2016.11

Since then, Linaro has released two bug-fix versions:

https://releases.linaro.org/components/toolchain/binaries/6.1-2016.08/
https://releases.linaro.org/components/toolchain/binaries/6.2-2016.11/
https://releases.linaro.org/components/toolchain/binaries/6.3-2017.02/
https://releases.linaro.org/components/toolchain/binaries/6.3-2017.05/

AFAIU, these releases are all on the same branch, i.e. they
keep the packages (mostly) stable:
gcc 6, glibc 2.23, newlib 2.4, binutils 2.27, gdb 7.12
NB: Apparently gdb got bumped from 7.11 to 7.12 in 2016.11
(IIUC, this is a cross-debugger, when using remote gdb.)

For example, this bug seems likely to affect current BR LTS:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=78253
(It was fixed in Linaro 2017.02)

I think there is a case for upgrading the toolchain in the LTS
branch (while staying on the same Linaro branch of course.)

What do you think?

Regards.
