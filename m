From: tbultel at free.fr <tbultel@free.fr>
Date: Fri, 20 Feb 2015 17:34:09 +0100 (CET)
Subject: [Buildroot] grub2 failure with gcc-4.9
In-Reply-To: <54E6094C.40505@ou.edu>
Message-ID: <1775144639.104859314.1424450049586.JavaMail.root@zimbra90-e16.priv.proxad.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



----- Mail original -----
> De: "Steve Kenton" <skenton@ou.edu>
> ?: "Thierry Bultel" <tbultel@free.fr>, buildroot at busybox.net, "Thomas Petazzoni"
> <thomas.petazzoni@free-electrons.com>
> Envoy?: Jeudi 19 F?vrier 2015 17:03:24
> Objet: Re: Fwd: Re: [Buildroot] grub2 failure with gcc-4.9
> 
> On 02/19/2015 09:46 AM, Thierry Bultel wrote:
> 
> >>>>  ... grub hangs.
> >> I'm not sure if it's related but I think we are mixing host and
> >> target grub2. When you run ~output/host/usr/sbin/grub-install
> >> any scripts it runs such as grub-mkimage are run from the
> >> build hosts /usr/... and not buildroot HOSTDIR or TARGETDIR
> >> I have been getting elf header mismatches which I think are
> >> differences between grub 2.00 and grub 2.01-beta
> > 
> > Thanks Steve,
> > 
> > FYI,
> > I am not using grub-install, but instead:
> > 
> > sudo ./host/usr/sbin/grub-bios-setup \
> > -b ./host/usr/lib/grub/i386-pc/boot.img \
> > -c ./images/grub.img -d . /dev/sde
> > 
> > I have notified the grub mailing list, this seems to be an unknown
> > issue and I need to fill a bug report. (and first try with
> > 2.01-beta ...)
> > 
> > Thierry
> > 
> Yep, that's the correct way, I just wanted to mention that
> grub-install
> is an easy trap to fall into if you let your fingers run on
> auto-pilot.
> And it can produce subtle and hard to recognize problems which
> sounded
> familiar :-)
> 

FYI, the bug is not reproducible with the master branch of grub.
I will have to submit a patch anyway, because due to the poor usb hid 
implementation, grub thinks my touchscreen and my joystick are keyboards .. and goes in
infinite loop due to unknown keys (I also had it on the 2.0 version). 
But everything else works fine.

Thierry

> Steve
> 
> 
