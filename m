From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Jun 2021 10:11:37 +0200
Subject: [Buildroot] [RPi4] Enable GTK3 on Buildroot
In-Reply-To: <CAHEfaqbr3ihj_1xcMqjv2mj_axLriPyA5p=G+FOFhJg_Yh14pQ@mail.gmail.com>
References: <CAHEfaqaqb213HJAdUV7x3K_gk=mFCsdc_5ozFuykD3AU53xmoQ@mail.gmail.com>
 <20210602112346.472e95a5@windsurf.home>
 <20210602222632.73390af3@gmx.net>
 <b532d888-d2a6-bf79-0544-9e5b73aa978a@mind.be>
 <CAHEfaqbr3ihj_1xcMqjv2mj_axLriPyA5p=G+FOFhJg_Yh14pQ@mail.gmail.com>
Message-ID: <20210606081137.GK168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Derek, All,

On 2021-06-03 08:27 -0600, Derek T spake thusly:
> Hello all,
> Thank you for the guidance and patch, I just successfully built and tested it on the Raspberry Pi 4 with an HDMI display.? Do
> you know when these changes are going to be mainlined?
> Tested-by: Derek Tata < [1]derek.tata1@gmail.com>

You should have replied to the actual mail with the patch, not the mail
from Arnout. So your Tested-by tag got missed when I applied...

Anyway, I applied the patch from Peter to master, so it should be part
of the upcoming release, 2021.05 (anytime soon now).

Regards,
Yann E. MORIN.

> Best,
> Derek
> On Wed, Jun 2, 2021 at 2:35 PM Arnout Vandecappelle < [2]arnout@mind.be> wrote:
> 
>   On 02/06/2021 22:26, Peter Seiderer wrote:
>   > Hello Derek,
>   >
>   > On Wed, 2 Jun 2021 11:23:46 +0200, Thomas Petazzoni < [3]thomas.petazzoni@bootlin.com> wrote:
>   >
>   >> Hello,
>   >>
>   >> On Tue, 1 Jun 2021 15:21:29 -0600
>   >> Derek T < [4]derek.tata1@gmail.com> wrote:
>   >>
>   >>> I am trying to enable GTK3 on Buildroot to deploy to a Raspberry Pi 4, and
>   >>> having trouble initializing the Xorg server with an HDMI display.? The
>   >>> persistent error seems to be an undefined symbol while loading
>   >>> fbturbo_drv.so.? I tried manually loading the libraries in the config file,
>   >>> which helped with some of the undefined symbol errors, but the symbol
>   >>> "fbdevHWSave" has continued to throw an error.? I have a Weston daemon
>   >>> running on the device, and on boot a desktop screen shows up on the
>   >>> display.
>   >>
>   >> If you already have Weston up and running, why are you not using the
>   >> Wayland backend of Gtk3 ? It seems more logical than trying to get
>   >> X.org working.
>   >
>   > Despite the suggestion that there are better solutions than fbturbo on RPi4
>   > your problem should be fixed by the buildroot patch
>   > '[v1] package/x11r7/xdriver_xf86-video-fbturbo: fix driver loading' (see [1])...,
>   > thanks for providing the buildroot config file to reproduce the failure...
> 
>   ?If that works for you, please reply to that mail with
> 
>   Tested-by: your name <your@email.address>
> 
>   ?Regards,
>   ?Arnout
> 
>   >
>   > Regards,
>   > Peter
>   >
>   > [1] [5]https://patchwork.ozlabs.org/project/buildroot/patch/20210602201529.6210-1-ps.report at gmx.net/
>   >
>   >>
>   >> Best regards,
>   >>
>   >> Thomas
>   >
>   > _______________________________________________
>   > buildroot mailing list
>   > [6]buildroot at busybox.net
>   > [7]http://lists.busybox.net/mailman/listinfo/buildroot
>   >
> 
> Links:
> 1. mailto:derek.tata1 at gmail.com
> 2. mailto:arnout at mind.be
> 3. mailto:thomas.petazzoni at bootlin.com
> 4. mailto:derek.tata1 at gmail.com
> 5. https://patchwork.ozlabs.org/project/buildroot/patch/20210602201529.6210-1-ps.report at gmx.net/
> 6. mailto:buildroot at busybox.net
> 7. http://lists.busybox.net/mailman/listinfo/buildroot

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
