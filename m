From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 19:09:22 +0200
Subject: [Buildroot] [PATCH v2] board: add support for LinkSprite pcDuino
In-Reply-To: <CAFGfvX4VMf88CT+5174whXOzxnSMM-s+kOo_2DO5+Pnfxit4+A@mail.gmail.com>
References: <1464291692-28094-1-git-send-email-geomatsi@gmail.com>
 <1465587642-14400-1-git-send-email-geomatsi@gmail.com>
 <20160611151904.36d1a0cb@free-electrons.com>
 <CAFGfvX4VMf88CT+5174whXOzxnSMM-s+kOo_2DO5+Pnfxit4+A@mail.gmail.com>
Message-ID: <20160611190922.1e3a4e19@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Jun 2016 18:48:11 +0300, Sergey Matyukevich wrote:

> > So the dtb name does not carry the "v1" thing ?  
> 
> That is correct. Neither kernel nor U-Boot have this 'v1' thing for the
> first pcduino board series.

Ah, okay. Then maybe you can keep the pcduino name for the defconfig
and the board directory, assuming that it refers to the v1.

> U-Boot indeed comes with a sane default environment. And this is exactly
> the copy of default environment for pcduino. I assume that I have to put
> something reasonable to u-boot-env mmc partition from the start.

Leave the environment partition unitialized. U-Boot will detect that
there is no valid environment, and will automatically fall back to its
built-in default environment.

> What is wrong with lrzsz package ? It is very handy for the board with WiFi
> networking only: one can upload/download files via serial port until proper
> networking setup is worked out.

By "principle", we don't add additional userspace packages to
defconfig. In addition:

 1/ Your defconfig enables WiFi support, so transferring files over
    serial port doesn't seem very useful.

 2/ Busybox has a "rx" applet that replaces the corresponding program
    from lrzsz.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
