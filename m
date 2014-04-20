From: Mike Zick <minimod@morethan.org>
Date: Sun, 20 Apr 2014 08:09:24 -0500
Subject: [Buildroot] Analysis of build results for 2014-04-19
In-Reply-To: <20140420104812.5bc926a9@skate>
References: <20140420063009.8B76B100DB9@stock.ovh.net>
 <20140420104812.5bc926a9@skate>
Message-ID: <20140420080924.6ef37e79@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Apr 2014 10:48:12 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

>   CC       consumer-stream.lo
> consumer-timer.c: In function 'consumer_timer_thread':
> consumer-timer.c:518:1: internal compiler error: in gen_movsi, at
> config/arm/arm.md:5452 Please submit a full bug report,
> with preprocessed source if appropriate.
> 

I seem to remember that message usually having a (missing here)
line with the bug report URL.
It is (or was) one of the build time options.

> Nobody ever answered me on how to handle gcc bugs affecting custom
> external toolchains...
> 

Directions should be in doc/<version>/README.bugs of the documentation -
Which probably was not shipped and/or installed with the compiler.  ;)

In general, the bug report goes to the builder of the binary,
not to gcc.gnu.org

In the case of a gcc binary built by Buildroot, that would be
Buildroot.org.
Ah, but it is already here.  ;)

Duh...

For the auto-builder, I guess all you can do is exclude the 
vendor/arch/gcc-version that exhibits an ICE.

Mike
