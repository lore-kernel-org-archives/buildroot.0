From: Lennart Ramberg <ramberg.lennart@gmail.com>
Date: Fri, 23 Oct 2015 11:17:29 +0200
Subject: [Buildroot] X11: How do I prevent the target screen from going
 black after 10 minutes?
In-Reply-To: <CAEzGmjA9FGvMgkpoDbPtcxZbosj4PdqCks_JiJ9hbhgZ_wTjyg@mail.gmail.com>
References: <CAEzGmjCKbQKZWy0WfQaGGoqZgzJ6bjf+4jdZRinx2XLijCZ49A@mail.gmail.com>
 <CAEYzJUH2pcGaafwSJ4dEUY0uvf6a4FNYQ9B-bos6nbWvUSs8RA@mail.gmail.com>
 <CAEzGmjDZ00CTnksb035Jfo9N4-NO4vpUEkJOvf9qptyn-e3NSQ@mail.gmail.com>
 <2045148520.1576581.1445510546977.JavaMail.zimbra@datacom.ind.br>
 <CAEzGmjD5uKHocgH7cDJeXZWvw4eq0YeZfGgx6EHvb_kPf8NVZA@mail.gmail.com>
 <2097041356.1590443.1445512208008.JavaMail.zimbra@datacom.ind.br>
 <CAEzGmjA9FGvMgkpoDbPtcxZbosj4PdqCks_JiJ9hbhgZ_wTjyg@mail.gmail.com>
Message-ID: <CAEzGmjCwfCgFWH=pWvz=B+kLTS4BUhCPb0efjru10HR4dLOm_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Me again,
Sorry for jumping at the gun;
A script could of course be run where I start my other programs.

But still, any opinions about xset vs. xorg.conf?
/Lennart


On Fri, Oct 23, 2015 at 10:21 AM, Lennart Ramberg <ramberg.lennart@gmail.com
> wrote:

> This worked:
> # DISPLAY=:0 xset s off -dpms   (Skipped consoleblank=0 in grub.cfg)
> But it won't persist a restart.
>
> I guess a script could run it after boot, alternativerly I could make an
> xorg.conf.
> How should Buildroot arrange such a script to be run automatically after
> boot?
> I assume avoiding xorg.conf would be more modern/better. Or?
>
> Regards
> Lennart
>
> On Thu, Oct 22, 2015 at 1:10 PM, Carlos Santos <casantos@datacom.ind.br>
> wrote:
>
>> ----- Original Message -----
>> > From: "Lennart Ramberg" <ramberg.lennart@gmail.com>
>> > To: "Carlos Santos" <casantos@datacom.ind.br>
>> > Cc: "Bj?rn Forsman" <bjorn.forsman@gmail.com>, "buildroot" <
>> buildroot at busybox.net>
>> > Sent: Thursday, October 22, 2015 8:54:19 AM
>> > Subject: Re: [Buildroot] X11: How do I prevent the target screen from
>> going black after 10 minutes?
>>
>> > Thanks, however:
>>
>> > # xset q
>> > -sh: xset: not found
>>
>> Sorry, I forgot to say that you need to select the xset package, under
>>
>>     -> Target packages
>>         -> Graphic libraries and applications (graphic/text)
>>             -> X.org X Window System
>>                 -> X11R7 Applications
>>
>> > And yes, it goes black.
>>
>> :-)
>>
>> > Regards
>> > Lennart
>>
>> Carlos Santos (Casantos)
>> DATACOM, P&D
>>
>> > On Thu, Oct 22, 2015 at 12:42 PM, Carlos Santos <
>> casantos at datacom.ind.br >
>> > wrote:
>>
>> >> > From: "Lennart Ramberg" < ramberg.lennart@gmail.com >
>> >> > To: "Bj?rn Forsman" < bjorn.forsman@gmail.com >
>> >> > Cc: "buildroot" < buildroot@busybox.net >
>> >> > Sent: Thursday, October 22, 2015 5:44:17 AM
>> >> > Subject: Re: [Buildroot] X11: How do I prevent the target screen
>> from going
>> >> > black after 10 minutes?
>>
>> >> > Thanks for the quick reply.
>> >> > However, I had no success. Screen still blanks after 10 min (unless
>> keyb/mouse
>> >> > activity).
>> >> > I assume this is what you meant:
>>
>> >> > # cat /boot/grub/grub.cfg
>> >> > set default="0"
>> >> > set timeout="3"
>>
>> >> > menuentry "Buildroot" {
>> >> > linux /boot/bzImage root=/dev/sda1 consoleblank=0
>> >> > }
>>
>> >> > Regards
>> >> > Lennart
>>
>> >> Supposing that you are not running a screen saver daemon live
>> "xscreensaver", I
>> >> guess the screen goes blank (black?) due to the X server itself, not
>> the Linux
>> >> kernel. Try using
>>
>> >> $ xset q
>>
>> >> to display the screen saver timeout and
>>
>> >> $ xset s off
>>
>> >> to disable the screen saver.
>>
>> >> > On Wed, Oct 21, 2015 at 7:02 PM, Bj?rn Forsman <
>> bjorn.forsman at gmail.com >
>> >> > wrote:
>>
>> >> >> On 21 October 2015 at 18:59, Lennart Ramberg <
>> ramberg.lennart at gmail.com >
>> >> >> wrote:
>> >> >> > Hello,
>>
>> >> >> > Maybe not a proper Builroot question, but:
>> >> >> > X11: How do I prevent the target screen from going black after 10
>> minutes?
>> >> >> > There is no xorg.conf (to edit the ServerFlags section).
>> >> >> > I was thinking maybe an overlay with an edited xorg.conf?
>>
>> >> >> Have you tried adding "consoleblank=0" to the kernel command line?
>> (I
>> >> >> _think_ that should do it.)
>>
>> >> >> Best regards,
>> >> >> Bj?rn Forsman
>>
>> >> > _______________________________________________
>> >> > buildroot mailing list
>> >> > buildroot at busybox.net
>> >> > http://lists.busybox.net/mailman/listinfo/buildroot
>>
>> >> Carlos Santos (Casantos)
>> >> DATACOM, P&D
>>
>> >> ----- Original Message -----
>> >> > From: "Lennart Ramberg" < ramberg.lennart@gmail.com >
>> >> > To: "Bj?rn Forsman" < bjorn.forsman@gmail.com >
>> >> > Cc: "buildroot" < buildroot@busybox.net >
>> >> > Sent: Thursday, October 22, 2015 5:44:17 AM
>> >>> Subject: Re: [Buildroot] X11: How do I prevent the target screen from
>> going
>> >> > black after 10 minutes?
>>
>> >> > Thanks for the quick reply.
>> >> > However, I had no success. Screen still blanks after 10 min (unless
>> keyb/mouse
>> >> > activity).
>> >> > I assume this is what you meant:
>>
>> >> > # cat /boot/grub/grub.cfg
>> >> > set default="0"
>> >> > set timeout="3"
>>
>> >> > menuentry "Buildroot" {
>> >> > linux /boot/bzImage root=/dev/sda1 consoleblank=0
>> >> > }
>>
>> >> > Regards
>> >> > Lennart
>>
>> >> > On Wed, Oct 21, 2015 at 7:02 PM, Bj?rn Forsman <
>> bjorn.forsman at gmail.com >
>> >> > wrote:
>>
>> >> >> On 21 October 2015 at 18:59, Lennart Ramberg <
>> ramberg.lennart at gmail.com >
>> >> >> wrote:
>> >> >> > Hello,
>>
>> >> >> > Maybe not a proper Builroot question, but:
>> >> >> > X11: How do I prevent the target screen from going black after 10
>> minutes?
>> >> >> > There is no xorg.conf (to edit the ServerFlags section).
>> >> >> > I was thinking maybe an overlay with an edited xorg.conf?
>>
>> >> >> Have you tried adding "consoleblank=0" to the kernel command line?
>> (I
>> >> >> _think_ that should do it.)
>>
>> >> >> Best regards,
>> >> >> Bj?rn Forsman
>>
>> >> > _______________________________________________
>> >> > buildroot mailing list
>> >> > buildroot at busybox.net
>> >> > http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151023/4fb585df/attachment.html>
