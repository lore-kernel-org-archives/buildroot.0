From: Jens Kleinhans <Jens.Kleinhans@gmx.de>
Date: Thu, 03 Dec 2009 12:53:25 +0100
Subject: [Buildroot] uImage out of zImage
Message-ID: <20091203115325.192320@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I use this Kernel, because I want to build a RTAI-patched Kernel for an ARM-Board, and the newest Kernel RTAI offers patches (Arch = arm) for is 2.6.20. I know about the disadvantages, but I see no other way. If you know one, please tell me!
How can I use this uImage? After Cross-Compiling only a zImage was created, so I thought it might be clever to transform it into an uImage. Isn't there a possibility to do this? With the command I wrote in my last Email I thought it should work...

Thanks so far, Jens

On Thu, Dec 03, 2009 at 12:36:49PM +0100, Jens Kleinhans wrote:
> I crosscompiled the kernel 2.6.20 and now I want to make a uImage out of the zImage. I found the following command for making uImage. But when I type only options are shown. How can I build the uImage the right way?
> 
> root at benjamin-laptop:/usr/src/linux/arch/arm/boot# ls
> bootp  compressed  Image  install.sh  Makefile  zImage
> root at benjamin-laptop:/usr/src/linux/arch/arm/boot# mkimage -A arm -O linux -C none -T kernel -a 20008000 -e 20008000 -n linux-2.6 -d arch/arm/boot/zImage uImage

Why don't you use the uImage target the Linux kernel offers?

And you should _really_ consider using a more recent kernel unless you
have a good reason not to do so. 2.6.20 is indeed ancient.

Daniel
 
-- 
Jetzt kostenlos herunterladen: Internet Explorer 8 und Mozilla Firefox 3.5 -
sicherer, schneller und einfacher! http://portal.gmx.net/de/go/chbrowser
