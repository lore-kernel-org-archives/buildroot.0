From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 8 Dec 2019 10:46:58 -0800
Subject: [Buildroot] [PATCH v6 3/6] package/polkit: add systemd service
 file.
In-Reply-To: <20191208160419.22f9d23d@windsurf.home>
References: <20191206234649.3972927-1-aduskett@gmail.com>
 <20191206234649.3972927-3-aduskett@gmail.com>
 <20191208160419.22f9d23d@windsurf.home>
Message-ID: <CAFSsvmpVed=XG6=f46OY3UUCXEk3zgK67KK-93wLTKFHBvjedQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas

On Sun, Dec 8, 2019 at 7:04 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Fri,  6 Dec 2019 15:46:46 -0800
> aduskett at gmail.com wrote:
>
> > From: Adam Duskett <Aduskett@gmail.com>
> >
> > - Add polkit.service for systemd based systems.
>
> Why aren't you using the one from polkit itself? There is one in
> data/polkit.service.in, which gets compiled to polkit.service, and
> apparently installed if HAVE_SYSTEMD is enabled. There also a D-Bus
> service file at data/org.freedesktop.PolicyKit1.service.in.
I guess I could.

>
> > - Add a polkitd user upon which /usr/lib/polkit-1/polkitd relies.
> > - Set appropriate directory permissions to allow the polkitd user to
> >   access rules and actions.
> > - Set appropriate default attributes for the pkexec binary.
>
> These could be done separately from the systemd service file addition.
>
No, they can't. The user is required to access those particular
directories during
the service startup.

I explained that in IRC.

> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

I don't have time to make a new patch set, so I am going to just mark the entire
patch series as rejected and move on.

If anybody else wants to resurrect this patch series they may do so.

Adam
