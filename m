From: Carlos Santos <unixmania@gmail.com>
Date: Fri, 20 Sep 2019 11:47:08 -0300
Subject: [Buildroot] Systemd default console
In-Reply-To: <CADYdroO1n5J9ssSmV=_TY=FDw4WriNuB_-M09UES3o-qkQtPuA@mail.gmail.com>
References: <CADYdroO1n5J9ssSmV=_TY=FDw4WriNuB_-M09UES3o-qkQtPuA@mail.gmail.com>
Message-ID: <CAJ4jsafoQPnGzdvHzn2c7LAZRbORVOhb7PinuSVEmw6_ZitWiQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 20, 2019 at 10:39 AM Norbert Lange <nolange79@gmail.com> wrote:
>
> Hello,
>
> I tried systemd with busybox for the first time and I have now the
> problem that login vie serial is not working correctly.
>
> -   busybox creates the link
> /etc/systemd/system/getty.target.wants/console-getty.service, which
> starts a getty on ttyS0
> -   systemd itself create
> /run/systemd/generator/getty.target.wants/serial-getty at ttyS0.service
> automatically (no idea when and how)
>
> in and output is perfectly garbled until one of those services is killed.
> Given that systemd automatically picks up the getty from the
> commandline, is there any reason for busybox to setup /dev/console?

Do not use BR2_TARGET_GENERIC_GETTY_PORT with systemd.

-- 
Carlos Santos <unixmania@gmail.com>
