From: Lionel Orry <lionel.orry@gmail.com>
Date: Fri, 17 Apr 2015 18:23:12 +0200
Subject: [Buildroot] Run a custom script after USB mount
In-Reply-To: <CADKZYYKSc+rE2YvaBokFteSTE3gwnEvNksY1-w0HNC35u5yFig@mail.gmail.com>
References: <CADKZYYKSc+rE2YvaBokFteSTE3gwnEvNksY1-w0HNC35u5yFig@mail.gmail.com>
Message-ID: <CAKAx1ch+bA0RtZ6tfeK959UQazCaWRtRZr_N-DKBdGddXvK9Fg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Santhosh,

On Fri, Apr 17, 2015 at 5:21 PM, Santhosh Ramani <srcoolz@gmail.com> wrote:
> Hello Everyone,
>
> I am having some trouble with udev and rules.d. The buildroot system
> automatically mounts any USB memory stick at the location /media/usb0. (I
> have only USB host port). I would like to execute a script every time a USB
> memory stick is inserted.
>
> I added a custom rule in rules.d - I named it zusbdetect.rules (z so that it
> runs at the very end, since I want it to run after usbmount.rules in
> /lib/udev/rules.d has finished executing)
>
> The content of the rules file are as follows:
>
> KERNEL=="sd*", ATTRS{mode}=="a_host", ATTRS{serial}=="musb-hdrc.0.auto",
> ATTRS{product}=="MUSB HDRC host driver", RUN+="/etc/hcc/usb-detected"
>
> I have double checked that my script has execute permissions and I can run
> it by hand. Am I missing something? Can you please point me in the right
> direction?

have you checked that you are actually using the udev system, and not
mdev for example ?
As an aside note, I do the same using mdev and it works perfectly, so
I could get rid of udev and make my system lighter.

>
> Thank you for your help.
> Regards
>
> Santhosh
>
> --
> Greater the Difficulty....Sweeter is the Victory
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,
Lionel
