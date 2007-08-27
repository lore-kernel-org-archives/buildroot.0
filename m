From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Mon, 27 Aug 2007 12:53:58 +0200
Subject: [Buildroot] How to change kernel version
In-Reply-To: <d6cda7730708181940u51f1e3d6ya6e701104d6dc5c7@mail.gmail.com>
References: <d6cda7730708181940u51f1e3d6ya6e701104d6dc5c7@mail.gmail.com>
Message-ID: <1188212038.7840.14.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2007-08-19 at 03:40 +0100, Thiago A. Corr?a wrote:
> Hi,
> 
>    I searched over the archives but I couldn't find anything about how
> one could change the kernel version. The only available option for
> AVR32, 2.6.22, is unable to boot on an STK1000 due to a bug in the MMC
> drivers, so I would like to change it to 2.6.18 which actually works.

You could also attack the problem with the 2.6.22 kernel. AFAIK the bug
is not in the MMC driver, but the MMC core. A small change seems to
correct the problem for AVR32.

See this thread for patch and information:

http://avr32linux.org/archives/kernel/2007-August/000240.html

Also, if your kernel is just booting too fast for the MMC layer to
detect the partitions, adding "rootwait=1" to the bootargs in u-boot
will let the kernel wait for the root partition to pop up.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
