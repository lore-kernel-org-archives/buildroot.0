From: Philippe Ney <philippe.ney@tizoo.com>
Date: Sun, 19 Aug 2007 15:28:45 +0200
Subject: [Buildroot] How to change kernel version
In-Reply-To: <d6cda7730708190608i1b754e71r25dac548fd1c922@mail.gmail.com>
References: <d6cda7730708190608i1b754e71r25dac548fd1c922@mail.gmail.com>
Message-ID: <20070819152845.a2be6def.philippe.ney@tizoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi,
> 
>   I searched over the archives but I couldn't find anything about how
> one could change the kernel version. The only available option for
> AVR32, 2.6.22, is unable to boot on an STK1000 due to a bug in the MMC
> drivers, so I would like to change it to 2.6.18 which actually works.
> 
> Kind Regards,
>    Thiago A. Correa

Hi,

Check the makefiles (Makefile.in, *.mk) to find which one define the linux
kernel you build. Its name should be linux.mk. And you can change the
kernel version directly in this file.

Or if you want configuration options, modify the Config.in file related to
kernel choice for your platforme.

Philippe
