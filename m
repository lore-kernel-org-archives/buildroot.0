From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 3 May 2021 21:06:05 +0200
Subject: [Buildroot] problems building a system for Rpi4
In-Reply-To: <CAG-SZaJqi-sMUtj2R0HRwvpST1WRdQSF7eA3iDi6n=g-gEB=XQ@mail.gmail.com>
References: <CAG-SZaJqi-sMUtj2R0HRwvpST1WRdQSF7eA3iDi6n=g-gEB=XQ@mail.gmail.com>
Message-ID: <20210503210605.2b441f31@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alejandro,

On Mon, 3 May 2021 11:18:06 -0400, Roberto Alejandro Esp? Mu?oz <teratux@gmail.com> wrote:

> Hello, I'm having some trouble getting my build to boot on a RPi4.  I
> initially tried building the default config version for 64 bits
> (raspberrypi4_64_defconfig) and it builds and boots ok with no problem.  I
> need to change the system to use glibc but whenever I manage to build the
> system and boot it I get a kernel panic error: Attempted to kill init with
> exitcode=0x00007f00.  The only change I'm making is switching over to a
> glibc toolchain and so far no progress.
> 
> I'm using buildroot buildroot-2020.11.3 and I attached my current config.

Simple mismatch between toolchain headers:

BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y

and Linux-Kernel Version, here still 5.4.72...

Can reproduce your problem with this combination (buildroot toolchain instead
of external one), and can be fixed by simple changing the toolchain
headers to 5.4.x (and complete re-build)...

Regards,
Peter

> 
> Thanks in advance
> 
