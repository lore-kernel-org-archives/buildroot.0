From: Carlos Santos <unixmania@gmail.com>
Date: Sun, 9 Feb 2020 18:28:39 -0300
Subject: [Buildroot] [PATCH v6 5/6] package/polkit: add init service file
In-Reply-To: <20191208160808.7fcc27ec@windsurf.home>
References: <20191206234649.3972927-1-aduskett@gmail.com>
 <20191206234649.3972927-5-aduskett@gmail.com>
 <20191208160808.7fcc27ec@windsurf.home>
Message-ID: <CAJ4jsaeGW4swqZ0a-s1ypM-OHFNran_+a2=OGrtRjObYunz8WQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 8, 2019 at 12:08 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> +Carlos in Cc for the review of the init script.
>
> On Fri,  6 Dec 2019 15:46:48 -0800
> aduskett at gmail.com wrote:
>
> > diff --git a/package/polkit/S50polkit b/package/polkit/S50polkit
> > new file mode 100644
> > index 0000000000..55c10e99ae
> > --- /dev/null
> > +++ b/package/polkit/S50polkit
> > @@ -0,0 +1,15 @@
> > +#!/bin/sh
> > +#
> > +# start polkitd
> > +#
> > +
> > +case "$1" in
> > +     start)
> > +             start-stop-daemon -q -S -x /usr/lib/polkit-1/polkitd -- --no-debug &
>
> Why is the & necessary at this end ?
>
> I think this init script deserves a comment that explains why it
> doesn't follow the traditional pattern for init scripts.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Why is a polkitd init script requited if, according to the man page

DESCRIPTION
       polkitd provides the org.freedesktop.PolicyKit1 D-Bus service
       on the system message bus. Users or administrators should never
       need to start this daemon as it will be automatically started
       by dbus-daemon(1) or systemd(1) whenever an application calls
       into the service.

-- 
Carlos Santos <unixmania@gmail.com>
