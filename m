From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 May 2013 11:23:55 +0200
Subject: [Buildroot] AT91SAM9G20-EK and aplay
In-Reply-To: <519F2CDB.8080805@scen.it>
References: <519F186B.3060606@scen.it> <20130524100520.01c518fd@skate>
 <519F2CDB.8080805@scen.it>
Message-ID: <20130524112355.70d1cc53@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlo Rajko,

On Fri, 24 May 2013 11:03:23 +0200, Carlo Rajko wrote:


> I do not have arm-linux-gdb but have arm-none-linux-gnueabi-gdb.
> But when use the command
> ./output/host/opt/ext-toolchain/bin/arm-none-linux-gnueabi-gdb -c core
> ./output/target/usr/bin/aplay and use command "run" the debugger show:
> Don't know how to run.  Try "help target".

Don't use "run", "run" is to start the program. Here we want to do a
post-mortem analysis of the crash using the core file. Google "gdb core
file" to have more details about what a core file is.

Can you run the gdb command, and copy/paste what you see? Without
entering any command *inside* gdb, it should already tell you which
instruction has faulted, and for what reason.

> I think the problem is not in aply because I have the same problem with
> mpg123.
> Could be the library alsa?

It could. But at least gdb will tell us if it's an undefined
instruction, an invalid memory access, an unaligned access, or
something else.

> > Also, could you post on http://code.bulix.org your Buildroot .config
> > and give us the link? Just to check there isn't anything obviously
> > wrong in your configuration file.
> 
> when I press buttom "PASTE" I have error "Antispam verification failed"

Right left to the "Paste" button there is a little box to train your
mental calculation. You should pay attention to it :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
