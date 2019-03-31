From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 14:42:31 +0200
Subject: [Buildroot] [PATCH] toolchain-external: Fix paths in libstdc++
 gdb python file
In-Reply-To: <20190329220445.22941-1-tpiepho@impinj.com>
References: <20190329220445.22941-1-tpiepho@impinj.com>
Message-ID: <20190331144231.13d5b9ca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Trent,

On Fri, 29 Mar 2019 22:04:56 +0000
Trent Piepho <tpiepho@impinj.com> wrote:

> The python file libstdc++.so.6.0.25-gdb.py contains two paths:
> pythondir = '/share/gcc-8.2.1/python'
> libdir = '/arm-linux-gnueabihf/lib'
> 
> The latter is the location of the file in the toolchain and the former
> the location of a python module to be used by gdb.  The python code in
> the file subtracts libdir from the end of the current
> libstdc++.so.6.0.25-gdb.py location and appends pythondir, to find the
> current path to the python module.
> 
> Buildroot installs this file into the stage, at which point the paths
> above are no longer correct.
> 
> This patch uses sed to fixup the paths to reflect the installed
> location, relative to HOST_DIR, and the location of the python module
> relative to HOST_DIR.
> 
> and

And ?

> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> ---
>  .../toolchain-external-arm-arm.mk                        | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Is this problem specific to the ARM ARM toolchain ? I guess other
toolchains will have the same file, so probably we want a more generic
fix ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
