From: Carlos Santos <unixmania@gmail.com>
Date: Wed, 11 Mar 2020 14:04:58 -0300
Subject: [Buildroot] [PATCH/next v2 1/4] package/openrc: drop custom
 getty service
In-Reply-To: <20200311165238.GL5357@scaer>
References: <20200301151747.25723-1-unixmania@gmail.com>
 <20200301151747.25723-2-unixmania@gmail.com>
 <20200311165238.GL5357@scaer>
Message-ID: <CAJ4jsaf45hC09Kiq4ueF31F2Ev0g1nnCA_a8Ex6BkRo2h91PzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 11, 2020 at 1:52 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Carlos, All,
>
> On 2020-03-01 12:17 -0300, unixmania at gmail.com spake thusly:
> > From: Carlos Santos <unixmania@gmail.com>
> >
> > In Buildroot getty is provided by BusyBox or util-linux (agetty). Both
> > create a /sbin/getty symlink pointing to the actual program, so make the
> > agetty service use that path instead of /sbin/agetty.
> >
> > Also start agetty after all other services, to prevent mixing startup
> > messages with the getty prompt on devices with a single serial console.
> >
> > This allows us to drop the custom getty service, which causes an error
> > message from openrc 0.42.1 (in a forthcoming patch):
> >
> >     Error: getty is the name of a real and virtual service.
> >
> > The patches are required because it's not possible to override the
> > command or startup order by means of a configuration file. Anyway it's
> > still better to patch something maintained upstream than depending on a
> > custom piece that may easily become obsolete.
> >
> > Signed-off-by: Carlos Santos <unixmania@gmail.com>
>
> Applied to master, thanks.
>
> It is to be noted, however, that util-linux' agetty is optional (with
> BR2_PACKAGE_UTIL_LINUX_AGETTY), but the problem was pre-existing, so
> it's not a problem of your patch.
>
> I wonder anyway if we should not try to fix that somehow?

I think nothing else is required, since /sbin/getty always points to a
valid getty program, either provided by busybox or util-linux.

The alternative would be conditionally patching, based on wetter
agetty is selected or not.

-- 
Carlos Santos <unixmania@gmail.com>
