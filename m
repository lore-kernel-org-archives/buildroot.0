From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Wed, 8 Oct 2014 12:11:27 +0200 (CEST)
Subject: [Buildroot] Raspaudio : how to use buildroot as a git submodule
In-Reply-To: <CAM+bi4uA5FriQu0TR+gVOdn9frJBRjaQn8MZCzRdDcTdfiyBPg@mail.gmail.com>
Message-ID: <385355617.26302999.1412763087035.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




----- Mail original -----
> Hi, Jeremy
> 
> That's a pretty long README and it's very clear. I've just sent you a
> pull request fixing a few typos, I couldn't think of any else to
> change.

thx, merged.

yeah, I have to admit that this README is more or less an internal 
documentation on how to personalize buildroot


> 
> I'm now using this latest version with my project and everything
> seems fine.
> I'm using a post build script to modify inittab accordingly and
> packages to selectively install the binary blobs I need on the
> simulation machine, so now I live happy with a fully common overlay.
> 

it would be handy to have multiple overlays, but it's not possible with
the current buildroot infrastructure...

This is the last point where you can't have a common+per-variant config
in buildroot submodule. I'm considering a BR patch, but nothing has 
been written yet...

> I didn't know about building the toolchain as a separate project. It
> looks cool, although I'm currently using prebuilt toolchains and have
> not tested it yet.
> 

Yeah, that was a "hey, that would be cool" moment while writing the 
documentation. I quickly tested it and it works, so I added the 
section to the documentation


I'm glad this helps

Regards 
J?r?my

> 
> Regards,
> 
> 2014-10-03 10:03 GMT+02:00 Jeremy Rosen <jeremy.rosen@openwide.fr>:
> > Ok, I have made quite a few changes, some of them are really
> > interesting
> >
> > * I have added a big README.md (which needs proofrreading) that
> > covers
> >   all sorts of interesting things, both on the project and how to
> >   customize buildroot in general
> > * I have removed your Makefile.Project* files, I standardize on a
> >   single project being "standard" and multiple projects being
> >   "advanced" (but it's properly documented)
> > * I have changed defaults to "change as much as possible with
> >   variants. This should not break your use-case since
> >   * all is set via BR settings, so it can be overridden
> >   * if it is already set, it won't be overwritten by the
> >      infrastructure
> > * I have documented how to have per-project configuration options
> > via
> >   variables
> > * I have documented how to use variants to have the toolchain be a
> >   separated project. This has been discussed here recently and is
> >   rather easy to do with the submodule infrastructure
> >
> >
> > Feel free to test/break/send me feedback. This is starting to loo
> > really
> > great.
> 
> 
> 
> --
> ?lvaro G?mez Machado
> 
