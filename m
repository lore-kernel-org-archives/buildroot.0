From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Wed, 1 Oct 2014 14:58:56 +0200 (CEST)
Subject: [Buildroot] Raspaudio : how to use buildroot as a git submodule
In-Reply-To: <CAM+bi4tCHcCha7T5eo1RPTf0fYpOFUjsmy5fhHQ4Nj=-qwHzNw@mail.gmail.com>
Message-ID: <1723661717.26039623.1412168336757.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Mail original -----
> Hi!
> 
> 2014-09-26 13:56 GMT+02:00 Jeremy Rosen <jeremy.rosen@openwide.fr>:
> > That's an incencitive to upstream, no ? :P
> >
> > more seriously, if you want to do that, I would recommand
> > * either renaming the package entirely.
> > * or use the OVERRRIDE_SRC_DIR macro (see usermanual)
> 
> On this case I would. It's a simple bump version from V2_7 to github
> master,
> but since it's not a release I'm not sure it is desirable. Maybe it's
> better to wait for V2_8,
> although libconfuse's development is pretty much stagnated.
> 
> I don't want to rename the package, because that would mean having to
> modify all packages that depend on this one,
> so at the end it's less cumbersome to have a custom branch of
> buildroot in which I have made these little changes.
> 

Ok, that's probably a case of cloning libconfuse (as a submodule )in 
your main directory and using OVERRIDE_SRC_DIR to use it..

> >> All in all, however, I'm very happy with the environment your
> >> Makefile
> >> provides. I've done a couple changes that I hope will publish in
> >> the
> >> following week for comments.
> >>
> >
> > please do, I'll happily integrate... At this stage the framework
> > satisfies all my needs so I need external ideas to make it live :)
> 
> I've just uploaded a few files to this github repository.
> 
> https://github.com/agamez/buildroot-submodule
> 

Ok, since you have a created a github project, I have cloned it myself
if you want my clone to be the "root" clone, just destroy yours and then
re-clone mine... 

> There are only a couple differences between that version and yours.
> First, I solved a typo on your Makefile (now called common.mk),
> and then I've made it so that several projects can coexist under the
> same directory.
> Thus, two Makefile exist (Makefile.Project1 and Makefile.Project-X)
> 
> Configuration and buildroot generated files for each one are now
> saved
> under Project1 and Project-X directory.
> 

And you can have a Makefile with an empty project name for the case
where you only want one project, good

> This now satisfies my need of two almost similar projects, sharing up
> to 90% source code but with a couple differences.
> I need to be able to compile both and have them on different
> directories, thus the two output directories.
> 

yes typicall use-case for me is a project that needs to run on two
different hardware

* all overlays/custom packages are common
* buildroot source obviously need to be the same
* dl/ can be shared
* config files are different
* build/ directory is completely different

> Now you are able to make -f Makefile.Project1 menuconfig, or make -f
> Makefile.Project-X or whatever,
> without interfering one project with the other.
> 
> I hope you like it!
> 

A lot, keep me posted if you change more stuff...

I'll add a README for cleanliness...


> Regards
> 
> --
> ?lvaro G?mez Machado
> 
