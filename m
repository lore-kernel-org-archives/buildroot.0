From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 29 Jan 2015 09:16:47 +0100 (CET)
Subject: [Buildroot] Best-Practice Suggestions for developing package
 patches in buildroot
In-Reply-To: <CAGm1_ku6SdP2jbM8K71ykv2pwBz7e7LtDw1bVFqmZ+YwpFOGDw@mail.gmail.com>
Message-ID: <148959929.30912044.1422519407373.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> 
> Please read Section 8.6.11 "Using Buildroot during development"
> (http://nightly.buildroot.org/manual.html#_advanced_usage). It will
> give you a good idea, how to work on upstream code.
> <pkg1>_OVERRIDE_SRCDIR is the keyword.
> 
> Yegor
> _______________________________________________


To develop a little bit on that, we are in the case of
* a package that is already part of buildroot
* to whom you want to develop a new patch (not apply an existing one)

I usually do a git clone of the package at whatever version BR uses
then use OVERRIDE_SRCDIR to force BR to use my clone as source.
I modify the source that way, using the power of git to modify
the sources locally and save different patches into a chain of commits
once I'm done I use git format-patch to do a patch serie that I can
add to buildroot/upstream

I keep my git clone around because it makes respinning the patches much
easier than if I had to work directly with the patches themselves.

I used quilt a long time ago, but now that I understand git rebase -i
it's much more handy than quilt...


Regards

Jeremy
