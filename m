From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 10 Mar 2021 18:46:50 +0100
Subject: [Buildroot] Raspberry Pi Zero SPI Issue
In-Reply-To: <CABuJUtFKSD8fmp-NmqbHz2WQWsKcQeshL6yB_KwfGHFg8PEWug@mail.gmail.com>
References: <CABuJUtFKSD8fmp-NmqbHz2WQWsKcQeshL6yB_KwfGHFg8PEWug@mail.gmail.com>
Message-ID: <20210310184650.71725565@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ali,

On Wed, 10 Mar 2021 20:26:59 +0300, Ali ?amdal <alicamdal0@gmail.com> wrote:

> Hi,
> I have a build for raspberry pi zero and added all spi tools, drivers and
> so on. After build, i have integrate drivers with modprobe and set
> config.txt with dtparam. But my SPI works very slow, it can read true value
> from hardware but very very slow. It read one value per 5 or 6 mins maybe
> even more. What did I do wrong with that ? Can you give any suggestions?
> 
> Thanks.

As far as I read [1] enabling SPI via dtparam sets no speed, maybe
enabling it via dtoverlay anyspi or spi-<n>-<m> gains an speed/SPI-clock
parameter...

Which SPI hardware?

Regards,
Peter


[1] https://github.com/raspberrypi/linux/blob/rpi-5.4.y/arch/arm/boot/dts/overlays/README
