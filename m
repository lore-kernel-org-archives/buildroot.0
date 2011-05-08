From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 May 2011 20:28:47 +0200
Subject: [Buildroot] [PATCH] sh: Add SH2A CodeSourcery external toolchain
In-Reply-To: <1304691784-29011-1-git-send-email-phil.edworthy@renesas.com>
References: <1304691784-29011-1-git-send-email-phil.edworthy@renesas.com>
Message-ID: <20110508202847.0996a987@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 06 May 2011 15:23:04 +0100
Phil Edworthy <PHIL.EDWORTHY@renesas.com> wrote:

> Added the CodeSourcery uCLinux/uClibc toolchain for the SH2A big
> endian devices.

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

However, I have a question regarding the sh2a_nofpueb and sh2eb target
architecture variants to which this toolchain applies. In Buildroot, we
use the target architecture variant to build the host tuple, which is
then used as the --host=XXX-YYY argument to build autotools-based
packages.

So for example, when sh2eb is selected, we pass "--host=sh2eb-linux" to
the ./configure script of all autotools-based packages.

Unfortunately, neither sh2a_nofpueb nor sh2eb are recognized as correct
machine types by config.sub. From packages/gnuconfig/config.sub:

        | sh | sh[1234] | sh[24]a | sh[24]aeb | sh[23]e | sh[34]eb | sheb | shbe | shle | sh[1234]le | sh3ele \
        | sh64 | sh64le \

So, a package such as dropbear fails to build with:

checking host system type... Invalid configuration `sh2eb-linux': machine `sh2eb' not recognized

I don't know anything about the various CPU types in the SuperH world,
so I can't fix it myself, but obviously the target variants do need
some cleanup/improvements. Could you help us to improve this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
