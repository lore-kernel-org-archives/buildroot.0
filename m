From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 20:57:11 +0100
Subject: [Buildroot] [PATCH v6 3/6] package/polkit: add systemd service
 file.
In-Reply-To: <CAFSsvmpVed=XG6=f46OY3UUCXEk3zgK67KK-93wLTKFHBvjedQ@mail.gmail.com>
References: <20191206234649.3972927-1-aduskett@gmail.com>
 <20191206234649.3972927-3-aduskett@gmail.com>
 <20191208160419.22f9d23d@windsurf.home>
 <CAFSsvmpVed=XG6=f46OY3UUCXEk3zgK67KK-93wLTKFHBvjedQ@mail.gmail.com>
Message-ID: <20191208205711.32a72740@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 8 Dec 2019 10:46:58 -0800
Adam Duskett <aduskett@gmail.com> wrote:

> > Why aren't you using the one from polkit itself? There is one in
> > data/polkit.service.in, which gets compiled to polkit.service, and
> > apparently installed if HAVE_SYSTEMD is enabled. There also a D-Bus
> > service file at data/org.freedesktop.PolicyKit1.service.in.  
> I guess I could.
> 
> >  
> > > - Add a polkitd user upon which /usr/lib/polkit-1/polkitd relies.
> > > - Set appropriate directory permissions to allow the polkitd user to
> > >   access rules and actions.
> > > - Set appropriate default attributes for the pkexec binary.  
> >
> > These could be done separately from the systemd service file addition.
> >  
> No, they can't. The user is required to access those particular
> directories during
> the service startup.

They can be added before, as a separate patch. Note that if I hadn't
come up with the systemd unit question, I would have applied as-is.

> I don't have time to make a new patch set, so I am going to just mark the entire
> patch series as rejected and move on.
> 
> If anybody else wants to resurrect this patch series they may do so.

That's a bit said. What you've done is very good, it includes
additional test cases.

I'm surprised you're giving up at v6. polkit was a complicated topic,
other folks tried in the past, and gave up way before they reached the
point where you are now, which is essentially very close to what can be
merged.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
