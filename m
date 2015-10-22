From: Lennart Ramberg <ramberg.lennart@gmail.com>
Date: Thu, 22 Oct 2015 09:44:17 +0200
Subject: [Buildroot] X11: How do I prevent the target screen from going
 black after 10 minutes?
In-Reply-To: <CAEYzJUH2pcGaafwSJ4dEUY0uvf6a4FNYQ9B-bos6nbWvUSs8RA@mail.gmail.com>
References: <CAEzGmjCKbQKZWy0WfQaGGoqZgzJ6bjf+4jdZRinx2XLijCZ49A@mail.gmail.com>
 <CAEYzJUH2pcGaafwSJ4dEUY0uvf6a4FNYQ9B-bos6nbWvUSs8RA@mail.gmail.com>
Message-ID: <CAEzGmjDZ00CTnksb035Jfo9N4-NO4vpUEkJOvf9qptyn-e3NSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the quick reply.
However, I had no success. Screen still blanks after 10 min (unless
keyb/mouse activity).
I assume this is what you meant:

# cat /boot/grub/grub.cfg
set default="0"
set timeout="3"

menuentry "Buildroot" {
        linux /boot/bzImage root=/dev/sda1 consoleblank=0
}

Regards
Lennart


On Wed, Oct 21, 2015 at 7:02 PM, Bj?rn Forsman <bjorn.forsman@gmail.com>
wrote:

> On 21 October 2015 at 18:59, Lennart Ramberg <ramberg.lennart@gmail.com>
> wrote:
> > Hello,
> >
> > Maybe not a proper Builroot question, but:
> > X11: How do I prevent the target screen from going black after 10
> minutes?
> > There is no xorg.conf (to edit the ServerFlags section).
> > I was thinking maybe an overlay with an edited xorg.conf?
>
> Have you tried adding "consoleblank=0" to the kernel command line? (I
> _think_ that should do it.)
>
> Best regards,
> Bj?rn Forsman
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151022/f36b5d79/attachment.html>
