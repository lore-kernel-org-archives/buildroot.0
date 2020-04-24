From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Apr 2020 14:16:25 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain/toolchain-external: install
 ldd on the target
In-Reply-To: <20200424120246.GJ5035@scaer>
References: <20200422153442.31989-1-sebastien.szymanski@armadeus.com>
 <20200424120246.GJ5035@scaer>
Message-ID: <20200424141625.5cd80421@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Apr 2020 14:02:46 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> What does ldd bring that can't be already achieved? For example on my
> host system:
> 
>     $ ldd /bin/bash
>         linux-vdso.so.1 (0x00007ffea5be0000)
>         libtinfo.so.6 => /lib/x86_64-linux-gnu/libtinfo.so.6 (0x00007f2ea6fa0000)
>         libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f2ea6f9a000)
>         libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f2ea6da9000)
>         /lib64/ld-linux-x86-64.so.2 (0x00007f2ea7114000)
> 
>     $ LD_TRACE_LOADED_OBJECTS=1 /bin/bash
>         linux-vdso.so.1 (0x00007ffd3d3a7000)
>         libtinfo.so.6 => /lib/x86_64-linux-gnu/libtinfo.so.6 (0x00007f46883cd000)
>         libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f46883c7000)
>         libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f46881d6000)
>         /lib64/ld-linux-x86-64.so.2 (0x00007f4688419000)

I guess the main thing that it brings is that people know about "ldd"
in general, while nobody knows about LD_TRACE_LOADED_OBJECTS :)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
