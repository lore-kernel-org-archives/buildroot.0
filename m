From: Pierre Ficheux <pierre.ficheux@openwide.fr>
Date: Thu, 22 May 2014 09:01:59 +0200 (CEST)
Subject: [Buildroot] RPi
In-Reply-To: <20140521180435.GA3556@free.fr>
Message-ID: <731900685.15108515.1400742119060.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The script doesn't need to bee root. It creates SD image from VFAT + EXT3 partitions created by Buildroot (see attached)

I think it's a good way to start BR on RPi, quite simple.

regards

----- Mail original -----
> De: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ?: "Pierre Ficheux" <pierre.ficheux@openwide.fr>
> Cc: "buildroot" <buildroot@busybox.net>
> Envoy?: Mercredi 21 Mai 2014 20:04:35
> Objet: Re: [Buildroot] RPi
> 
> Pierre, All,
> 
> (He! The same usual suspects! ;-) )
> 
> On 2014-05-21 14:05 +0200, Pierre Ficheux spake thusly:
> > I did some work on BR around Raspberry Pi platform:
> > 
> > - adding a post-image script for RP SD-card image generation
> > (adapted
> > from Yocto RPi recipe)
> > - adding BR support for Adafruit touchscreen ->
> > https://www.adafruit.com/products/1601
> > 
> > I don't know if it could help, but I can build patches.
> 
> For the RPi script, I have to admit I'm a bit sceptic. We usually
> document, as much as we can, the preparation of media for the boards
> (you can see the one for the RPi in boards/raspberrypi/readme) but we
> usually do not provide such scripts.
> 
> The only board we're currently doing it for, is the cubieboard, and
> it
> IMHO has quite a few shortcomings:
>   - requires being root
>   - uses host-tools without enabling them in the defconfig
>   - makes some heavy assumptions on the layout (generated files and
>     medium)
>   - does not handle all failure modes
>   - is (a bit) convoluted
> 
> Also, I'm a bit warry at providing such a root-requiring script, as
> it
> is so easy to bork things on an unsuspecting user's machine. I for
> one
> would not run such a script to begin with.
> 
> I highly prefer we provide a good documentation on how to generate
> basic
> media for a board, and redirect the user to the upstream
> documentation
> (if it exists.)
> 
> We've tried to have a generic infrastructure that would generate
> images
> for any board, without any hard-coded layout or the likes), but it
> turns
> to not be so easy. Such an infra would have to cover all comon cases,
> but also weird corner-cases, where the layout is not simply a
> collection
> of partitions laid out on some media (think initramfs with part of
> the
> VFS mounted from a block device, it's not easy.)
> 
> Others may disagree on the above, so please provide your script, so
> we
> can see and decide on actual code. ;-)
> 
> As for the touchscreen support, that would be very interesting,
> indeed!
> Please send your patch! :-)
> 
> Regards,
> Yann E. MORIN.
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> |  conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
> |               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/
> |  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
> |   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> 

-- 
Pierre FICHEUX -/- CTO OW/OWI, France -\- pierre.ficheux at openwide.fr
                                         http://ingenierie.openwide.fr
                                         http://www.linuxembedded.fr
I would love to change the world, but they won't give me the source code
-------------- next part --------------
A non-text attachment was scrubbed...
Name: build_sdcard.sh
Type: application/x-shellscript
Size: 3990 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140522/136a4c55/attachment.bin>
