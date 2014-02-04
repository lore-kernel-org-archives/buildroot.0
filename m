From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Tue, 4 Feb 2014 19:23:16 -0200
Subject: [Buildroot] nios2: to strace or to !strace
Message-ID: <CAAEAJfDK4_XyJz-4e24Y83G7sCNBizA-c2vcHXf=JOxVKjp8AA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello guys,

After some head-smashing, I've managed to add nios2 support for strace [1]
However, we have a little trouble upstreaming that. Problem is, the architecture
is not mainlined, and never will be in its current form. To reach
upstream quality,
it's needed to convert the ABI to the generic ABI framework.

However, this also means the toolchain will have to be switched to the new ABI
(and of course, this breaks binary userspace compatibility, in case
that matters).

So the strace people seem a bit reluctant [2] to take the nios2
support, and suggested
to wait until the kernel support is upstreamed.

Given all the above, would you still take a patch against strace for nios2 ?

PS: I really have no idea about Altera's plans for nios2, so all I can
do is get some
support done and push it upstream (or here).

[1] https://www.mail-archive.com/strace-devel at lists.sourceforge.net/msg03468.html
[2] https://www.mail-archive.com/strace-devel at lists.sourceforge.net/msg03471.html
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
