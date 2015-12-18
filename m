From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 20:04:46 +0100
Subject: [Buildroot] [PATCH v3] libgdiplus: new package
In-Reply-To: <CANu7NGt5xa9gWAxY4ha7VDbo0HxTNQ4VeMD7f4kD74tggmsdYw@mail.gmail.com>
References: <1448410510-23087-1-git-send-email-sergio.prado@e-labworks.com>
 <20151217222952.28cfb35c@free-electrons.com>
 <20151218114117.5d273ce1@free-electrons.com>
 <CANu7NGtNLr0u42ZXMoOuuPMOp+Rm=c=GROEF=tZmgrWHQgfPqg@mail.gmail.com>
 <CANu7NGt5xa9gWAxY4ha7VDbo0HxTNQ4VeMD7f4kD74tggmsdYw@mail.gmail.com>
Message-ID: <20151218200446.384cdb38@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sergio Prado,

On Fri, 18 Dec 2015 16:12:57 -0200, Sergio Prado wrote:

> Beaglebone with uclibc
> arm-buildroot-linux-uclibcgnueabihf-gcc: WARNING: unsafe header/library
> path used in cross-compilation: '/lib'
> 
> Qemu x86 with glibc
> i686-buildroot-linux-gnu-gcc: WARNING: unsafe header/library path used in
> cross-compilation: '/lib'
> 
> Why some toolchains generate an error and others a warning in this
> situation? Is there a configuration to enable this check when generating
> the toolchain?

It is not a matter of toolchain, it is a matter of whether you set the
option BR2_COMPILER_PARANOID_UNSAFE_PATH=y or not. By default it's
disabled, so those unsafe path messages are just warnings. In the
autobuilders, we turn this option on by default, so that just unsafe
path messages are treated as errors and abort the build.

This option simply sets an environment variable that makes the
toolchain wrapper error out when such unsafe paths are detected.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
