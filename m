From: Charles Manning <cdhmanning@gmail.com>
Date: Fri, 21 Feb 2014 14:53:06 +1300
Subject: [Buildroot] What's the buildroot attitude to u-boot building?
Message-ID: <CAE21AQqMQmKKL0=Q55P2zQhV8+iBdpX416xK+SgZd3+ONi8Mgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All

I am having a look at adding some stuff to generate a signed pre-loader for
the SoCFPGA architecture.

There seem to be two options to doing this:
1) Have it fall out of building u-boot (probably the best option once the
patches I'm pushing into u-vboot have settled down)
2) Make an independent build like xloader (probably a better interum
solution), since for now the SocFPGA preloader building is still somewhat
haphazard and needs a magic version of u-boot.

Looking through all the u-boot config stuff makes me wonder why some of the
stuff is even there.

For instance, why are there things like  BR2_TARGET_UBOOT_ETHADDR?
Overriding elements of the u-boot config header by patching over them from
a complete different config system (buildroot) seems to be asking for
trouble.

Surely it would be far better for people to edit their u-boot config
headers?

Can someone explain the rationale behind doing this sort of config in
buildroot?

Thanks

CHarles
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140221/61317655/attachment.html>
