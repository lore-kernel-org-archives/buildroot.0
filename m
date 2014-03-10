From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Mon, 10 Mar 2014 16:38:55 +0100 (CET)
Subject: [Buildroot] Raspaudio : how to use buildroot as a git submodule
In-Reply-To: <CAM+bi4vYCeJc76ax8p1=Ldy-3ptinN7QT+yFZkYh0JpOghQ2tw@mail.gmail.com>
Message-ID: <1402783577.11294202.1394465935829.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> 
> 
> Hi, Jeremy
> 
> Personally, I see potential in this.
> 
> Have you thought of a way to include custom packages outside the
> buildroot hierarchy?
> 
> 
> Just as an example to illustrate the question, in the case of NOOBS
> ( https://github.com/raspberrypi/noobs ), maybe the NOOBS application
> (
> https://github.com/raspberrypi/noobs/blob/master/buildroot/package/recovery/recovery.mk
> )
> itself isn't well suited for buildroot upstream for it's very
> architecure dependent.
> 


yes, this is exactly what I wanted to avoid, a project that has to 
include all of buildroot in a subdirectory and thus has problems
following upstream. 

You can include external software in the raspaudio infrastructre because
this infrastucture relies on the BR2_EXTERNAL feature of buildroot
that allows external software to be built.

You just need to include your own software via the external.mk and
Config.in files that are at the root of raspaudio-based project.

I need to test and document that properly, but it works


> 
> So, have you thought of some way to place this directory outside
> buildroots hierarchy but
> let it be managed by buildroot? That, alongside your scripts and
> makefiles would allow
> to create root file systems with custom packages without "polluting"
> the buildroot
> directory/repository.
> 


That's exactly the point of raspaudio. Feel free to test and report any
problem you have. I have been the only one testing it so far and I
might have missed some important stuff..


Boucman
