From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 Jun 2021 22:35:36 +0200
Subject: [Buildroot] [RPi4] Enable GTK3 on Buildroot
In-Reply-To: <20210602222632.73390af3@gmx.net>
References: <CAHEfaqaqb213HJAdUV7x3K_gk=mFCsdc_5ozFuykD3AU53xmoQ@mail.gmail.com>
 <20210602112346.472e95a5@windsurf.home> <20210602222632.73390af3@gmx.net>
Message-ID: <b532d888-d2a6-bf79-0544-9e5b73aa978a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/06/2021 22:26, Peter Seiderer wrote:
> Hello Derek,
> 
> On Wed, 2 Jun 2021 11:23:46 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
>> Hello,
>>
>> On Tue, 1 Jun 2021 15:21:29 -0600
>> Derek T <derek.tata1@gmail.com> wrote:
>>
>>> I am trying to enable GTK3 on Buildroot to deploy to a Raspberry Pi 4, and
>>> having trouble initializing the Xorg server with an HDMI display.  The
>>> persistent error seems to be an undefined symbol while loading
>>> fbturbo_drv.so.  I tried manually loading the libraries in the config file,
>>> which helped with some of the undefined symbol errors, but the symbol
>>> "fbdevHWSave" has continued to throw an error.  I have a Weston daemon
>>> running on the device, and on boot a desktop screen shows up on the
>>> display.
>>
>> If you already have Weston up and running, why are you not using the
>> Wayland backend of Gtk3 ? It seems more logical than trying to get
>> X.org working.
> 
> Despite the suggestion that there are better solutions than fbturbo on RPi4
> your problem should be fixed by the buildroot patch
> '[v1] package/x11r7/xdriver_xf86-video-fbturbo: fix driver loading' (see [1])...,
> thanks for providing the buildroot config file to reproduce the failure...

 If that works for you, please reply to that mail with

Tested-by: your name <your@email.address>


 Regards,
 Arnout

> 
> Regards,
> Peter
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/patch/20210602201529.6210-1-ps.report at gmx.net/
> 
>>
>> Best regards,
>>
>> Thomas
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
