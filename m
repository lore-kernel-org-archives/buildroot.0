From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 7 Oct 2014 14:55:36 +0200
Subject: [Buildroot] [PATCH 2/3] hicolor-icon-theme: new package
In-Reply-To: <20141007142842.3c481ac5@free-electrons.com>
References: <1411489271-26899-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1411489271-26899-3-git-send-email-eric.le.bihan.dev@free.fr>
 <20141005232215.48f593d8@free-electrons.com>
 <20141007122515.GB4028@rmm-p1267483>
 <20141007142842.3c481ac5@free-electrons.com>
Message-ID: <20141007125535.GC4028@rmm-p1267483>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 07, 2014 at 02:28:42PM +0200, Thomas Petazzoni wrote:
> Dear Eric Le Bihan,
>
> On Tue, 7 Oct 2014 14:25:15 +0200, Eric Le Bihan wrote:
>
> > > I'm a bit confused by what this package does: it doesn't contain
> > > anything, and does not install anything except a huge number of
> > > directories (empty) in usr/share/icons/. Is this the intended behavior?
> > > I would have expected an icon theme to install some .svg or .png files,
> > > no?
> >
> > The hicolor icon theme is the *fallback* icon theme. As explained in the
> > specifications [1], this theme is required to have a place for third-party
> > applications to install their icons. If a icon is not found in the current
> > theme, then hicolor is the theme to look into.
> >
> > So the package just installs a directory structure as well as an index.
>
> Well, how can an empty thing be a fallback icon theme? That's kind of
> weird.
>
> Anyway, if you could update the help text to mention what it is
> exactly, it'd be great. Just to clarify to the user that it's normal
> for this package to not install anything except a bunch of empty
> directories.

Of course!

> > I added it to avoid some warnings when executing the gtk3-demo application.
>
> Sure, I certainly don't claim that it is unnecessary, I was just trying
> to understand what was going on.
>
> > When I'll provide a patch bumping libgtk3 to 3.14, I will also provide a
> > package for adwaita-icon-theme, which is a true icon theme, weighting 18 MB!
>
> Ouch. But all icons are present in multiple sizes, no? Are all sizes
> needed?

The adwaita-icon-theme package provides icons which sizes are 16x16, 24x24,
32x32, 48x48, 256x256 and of course some SVG ones. On the target its takes 20
MB of storage.

I'm no expert in icon loading, but it looks like if the requested size is not
found, then a smaller one is selected, upscaling is applied and you get
blurry icons.

Should I provide an option in the configuration menu to install only specific
sizes, or should removing the unwanted icons be left to the user (via
post-build script)?

Best regards,
ELB
