From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 8 Dec 2019 13:31:42 -0800
Subject: [Buildroot] [PATCH v6 3/6] package/polkit: add systemd service
 file.
In-Reply-To: <20191208205711.32a72740@windsurf.home>
References: <20191206234649.3972927-1-aduskett@gmail.com>
 <20191206234649.3972927-3-aduskett@gmail.com>
 <20191208160419.22f9d23d@windsurf.home>
 <CAFSsvmpVed=XG6=f46OY3UUCXEk3zgK67KK-93wLTKFHBvjedQ@mail.gmail.com>
 <20191208205711.32a72740@windsurf.home>
Message-ID: <CAFSsvmq5+tJRYGoyV_XWcmozK-G867npOVnwfqCjGjRzWmuURQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 8, 2019 at 11:57 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Sun, 8 Dec 2019 10:46:58 -0800
> Adam Duskett <aduskett@gmail.com> wrote:
>
> > > Why aren't you using the one from polkit itself? There is one in
> > > data/polkit.service.in, which gets compiled to polkit.service, and
> > > apparently installed if HAVE_SYSTEMD is enabled. There also a D-Bus
> > > service file at data/org.freedesktop.PolicyKit1.service.in.
> > I guess I could.
> >
> > >
> > > > - Add a polkitd user upon which /usr/lib/polkit-1/polkitd relies.
> > > > - Set appropriate directory permissions to allow the polkitd user to
> > > >   access rules and actions.
> > > > - Set appropriate default attributes for the pkexec binary.
> > >
> > > These could be done separately from the systemd service file addition.
> > >
> > No, they can't. The user is required to access those particular
> > directories during
> > the service startup.
>
> They can be added before, as a separate patch. Note that if I hadn't
> come up with the systemd unit question, I would have applied as-is.
>
> > I don't have time to make a new patch set, so I am going to just mark the entire
> > patch series as rejected and move on.
> >
> > If anybody else wants to resurrect this patch series they may do so.
>
> That's a bit said. What you've done is very good, it includes
> additional test cases.
>
> I'm surprised you're giving up at v6. polkit was a complicated topic,
> other folks tried in the past, and gave up way before they reached the
> point where you are now, which is essentially very close to what can be
> merged.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

I appreciate the compliment, however, I do get frustrated because I
tend to submit complicated
patches that sit for weeks, months or even years without any feedback.
Polkit is a pretty big exception
to this rule, and I do appreciate the fairly quick review.

I just fear that if I spend time making a v7, the patch set will sit
for months without any feedback, or if there is
then I will submit a v8 which will include the fixes requested, and
then another maintainer will chime in with
more requested fixes even though they didn't say anything to the
previous patch set when it has been sitting
without feedback for months. This has been a pain point for me for
quite some time.

I understand we are all volunteers with families and lives, however
this also means that more complicated patches
get either zero reviews, sit for very long periods of time, or are
never reviewed at all. This makes me really apprehensive
about submitting anything other than simple fixes and version bumps
that require nothing other than a version/hash update
from now on.

I will see if I can apply your requested fixes in the meantime.

Adam
