From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Feb 2014 12:30:40 +0100
Subject: [Buildroot] SoCkit support question?
In-Reply-To: <201402211124.03017.manningc2@actrix.gen.nz>
References: <940580837.479152.1392839319094.JavaMail.root@mail>
 <CAGduivymyJe+NLi=tsk1uCxit3ZOy=U8WxLjh=myR9MZGbL+ZQ@mail.gmail.com>
 <530673E3.9030506@savoirfairelinux.com>
 <201402211124.03017.manningc2@actrix.gen.nz>
Message-ID: <20140221123040.4920ad0a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Manning,

On Fri, 21 Feb 2014 11:24:02 +1300, Charles Manning wrote:

> I have just sent my second patch for this to the u-boot list. They didn't like 
> my last one because it was standalone and not integrated into mkimage. They 
> might come back with some formatting stuff, but I think it will be mainlined 
> in a day or two.
> 
> Once that is in place, it can be patched into the u-boot-socfpga tree and the 
> preloader is built and signed as part of a regular u-boot build. It just 
> needs a build-root copy step to copy it into output/images. I will be doing 
> that today.

In the mean time (until your patch gets accepted, and a new U-Boot
release is made with it), it is still possible to support the SoCkit by
having U-Boot build an unsigned image, and let the user manually use
the Altera provided mkpimage tool to sign it. It just needs to be
documented in board/arrow/sockit/readme.txt, with all the other details
on how to actually set up the board to use the bootloader and kernel
images produced by Buildroot.

Don't wait for perfection. Do something simple that works now, and
improve on top of it progressively :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
