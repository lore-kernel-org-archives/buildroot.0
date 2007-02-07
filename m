From: Konstantin Kletschke <kletschke@synertronixx.de>
Date: Wed, 7 Feb 2007 16:29:01 +0100
Subject: [Buildroot] eabi for ARM9
Message-ID: <20070207152901.GA14948@synertronixx3>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Folks!

Actually I am trying to get an eabi Userspace environment running with
2.6.18 and eabi. This is due to the fact that I want to upgrade my
gcc-3.4.6 to gcc-4.x with softfloat support wo hardware FPU. The
gcc-4.x toolchain with this option enabled only compile with
BR2_ARM_EABI=y. So I have a toolchain now with gcc-4.1.2 and
uclibc-0.9.29 (snapshot). The kernel compiles fine, I chose 2.6.18
with 

CONFIG_AEABI=y
CONFIG_OABI_COMPAT=y

enabled.

But my userspace bails out with "Illegal instruction". What I found
out is, that busybox run as init process puts out its compiled in
programs and disclaimer, but running /bin/sh (configured as standalone
shell) gives no output anymore.

Is this combination of software to be known to work?

Additional queston is: Is it possible to use an old ABI compat kernel
and chroot with it from non EABI userspace into EABI userspace or
can't this work?

Regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
