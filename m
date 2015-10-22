From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 22 Oct 2015 08:42:26 -0200 (BRST)
Subject: [Buildroot] X11: How do I prevent the target screen from going
 black after 10 minutes?
In-Reply-To: <CAEzGmjDZ00CTnksb035Jfo9N4-NO4vpUEkJOvf9qptyn-e3NSQ@mail.gmail.com>
References: <CAEzGmjCKbQKZWy0WfQaGGoqZgzJ6bjf+4jdZRinx2XLijCZ49A@mail.gmail.com>
 <CAEYzJUH2pcGaafwSJ4dEUY0uvf6a4FNYQ9B-bos6nbWvUSs8RA@mail.gmail.com>
 <CAEzGmjDZ00CTnksb035Jfo9N4-NO4vpUEkJOvf9qptyn-e3NSQ@mail.gmail.com>
Message-ID: <2045148520.1576581.1445510546977.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Lennart Ramberg" <ramberg.lennart@gmail.com>
> To: "Bj?rn Forsman" <bjorn.forsman@gmail.com>
> Cc: "buildroot" <buildroot@busybox.net>
> Sent: Thursday, October 22, 2015 5:44:17 AM
> Subject: Re: [Buildroot] X11: How do I prevent the target screen from going
> black after 10 minutes?

> Thanks for the quick reply.
> However, I had no success. Screen still blanks after 10 min (unless keyb/mouse
> activity).
> I assume this is what you meant:

> # cat /boot/grub/grub.cfg
> set default="0"
> set timeout="3"

> menuentry "Buildroot" {
> linux /boot/bzImage root=/dev/sda1 consoleblank=0
> }

> Regards
> Lennart

Supposing that you are not running a screen saver daemon live "xscreensaver", I guess the screen goes blank (black?) due to the X server itself, not the Linux kernel. Try using

    $ xset q

to display the screen saver timeout and

    $ xset s off

to disable the screen saver.

> On Wed, Oct 21, 2015 at 7:02 PM, Bj?rn Forsman < bjorn.forsman@gmail.com >
> wrote:

>> On 21 October 2015 at 18:59, Lennart Ramberg < ramberg.lennart@gmail.com >
>> wrote:
>> > Hello,

>> > Maybe not a proper Builroot question, but:
>> > X11: How do I prevent the target screen from going black after 10 minutes?
>> > There is no xorg.conf (to edit the ServerFlags section).
>> > I was thinking maybe an overlay with an edited xorg.conf?

>> Have you tried adding "consoleblank=0" to the kernel command line? (I
>> _think_ that should do it.)

>> Best regards,
>> Bj?rn Forsman

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Carlos Santos (Casantos)
DATACOM, P&D

----- Original Message -----
> From: "Lennart Ramberg" <ramberg.lennart@gmail.com>
> To: "Bj?rn Forsman" <bjorn.forsman@gmail.com>
> Cc: "buildroot" <buildroot@busybox.net>
> Sent: Thursday, October 22, 2015 5:44:17 AM
> Subject: Re: [Buildroot] X11: How do I prevent the target screen from going black after 10 minutes?

> Thanks for the quick reply.
> However, I had no success. Screen still blanks after 10 min (unless keyb/mouse
> activity).
> I assume this is what you meant:

> # cat /boot/grub/grub.cfg
> set default="0"
> set timeout="3"

> menuentry "Buildroot" {
> linux /boot/bzImage root=/dev/sda1 consoleblank=0
> }

> Regards
> Lennart

> On Wed, Oct 21, 2015 at 7:02 PM, Bj?rn Forsman < bjorn.forsman@gmail.com >
> wrote:

>> On 21 October 2015 at 18:59, Lennart Ramberg < ramberg.lennart@gmail.com >
>> wrote:
>> > Hello,

>> > Maybe not a proper Builroot question, but:
>> > X11: How do I prevent the target screen from going black after 10 minutes?
>> > There is no xorg.conf (to edit the ServerFlags section).
>> > I was thinking maybe an overlay with an edited xorg.conf?

>> Have you tried adding "consoleblank=0" to the kernel command line? (I
>> _think_ that should do it.)

>> Best regards,
>> Bj?rn Forsman

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
