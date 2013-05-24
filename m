From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 May 2013 10:05:20 +0200
Subject: [Buildroot] AT91SAM9G20-EK and aplay
In-Reply-To: <519F186B.3060606@scen.it>
References: <519F186B.3060606@scen.it>
Message-ID: <20130524100520.01c518fd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlo Rajko,

On Fri, 24 May 2013 09:36:11 +0200, Carlo Rajko wrote:

> With buildroot-2013.02 use kernel 3.1.6 and use toolchain
> CODESOURCERY_ARM201203
> 
> The kernel detects sound card, but when use prg aplay or use mpg123 to
> play a file, receive a "Segmentation fault"
> 
> if I run the command "cat file.wav > /dev/dsp" the sound card works fine.
> 
> With buildroot-2011.11 is all ok.
> 
> Can you help me ?

Do you have a few more messages in the kernel logs that given more
details about the segmentation fault?

Otherwise, do "ulimit -c unlimited", run the crashing application, it
will generate a 'core' file. Transfer it to your development PC, and
run cross-gdb on it:

	./output/host/usr/bin/arm-linux-gdb -c core ./output/target/usr/bin/aplay

and then see what's the reason of the segmentation fault.

Also, could you post on http://code.bulix.org your Buildroot .config
and give us the link? Just to check there isn't anything obviously
wrong in your configuration file.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
