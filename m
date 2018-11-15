From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Nov 2018 16:20:37 +0100
Subject: [Buildroot] version `GLIBC_2.27' not found
In-Reply-To: <a59aa43d9d9f5a8e734185c9efd73c75@tochlab.net>
References: <a59aa43d9d9f5a8e734185c9efd73c75@tochlab.net>
Message-ID: <20181115162037.6a4f2208@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Nov 2018 14:21:36 +0000, tochansky at tochlab.net wrote:

> I have a strange behavior of toolchain built by buildroot.
> 
> I made a toolchain on pc with gentoo linux and took it to kubuntu 16.04 LTS and ld reports:
> 
> /opt/moonshine/bin/x86_64-moonshine-linux-gnu-ld: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.27' not found (required by /opt/moonshine/bin/x86_64-moonshine-linux-gnu-ld)
> 
> same time /opt/moonshine/bin/x86_64-moonshine-linux-gnu-gcc works fine.
> 
> As I can see, there is glibc 2.27 on gentoo and 2.23 on kubuntu. Thing I can't understand is why other tools(gcc for example) works normal.

It depends on the glibc symbols they use. You need to build your
toolchain on a system that has a glibc <= 2.23.

You can also have a look@the pre-built toolchains available at
https://toolchains.bootlin.com/, we build them in chroots with old
system, specifically to make them as compatible as possible. The
"stable" toolchains are currently built inside a Debian Squeeze chroot,
while the "bleeding-edge" toolchains are built inside a Debian Jessie
chroot, because gdb 8.0 requires a C++11 capable compiler.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
