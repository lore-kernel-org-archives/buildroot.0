From: MikeW <mw_phil@yahoo.co.uk>
Date: Tue, 12 Dec 2006 15:09:25 +0000 (UTC)
Subject: [Buildroot] Issue preparing a buildroot
References: <1165919607.6628.4.camel@petitemort.i.digital-scurf.org>
Message-ID: <loom.20061212T155919-203@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Daniel Silverstone <dsilvers@...> writes:

> Does anyone here have experience of getting buildroot going on an
> Ubuntu/edgy system, or even experience of resolving such an error?
> 
....
/space/dsilvers/dev-simtec/buildroot-curl-support/
 toolchain_build_i686/uClibc_dev//usr/include/bits/local_lim.h:36:26:
> error: linux/limits.h: No such file or directory
> 
> I hope you can help,
> 
> Thank,
> 
> D.
> 
Well it's often possible to temporarily 'fix' such issues by means of a
symbolic link to the right place; as long as it's limited in scope,
the use of an 'external' limits.h file shouldn't break anything ....?!

I would have thought there was an add-in package that would supply
the missing headers - surely we are not in Windows "hide system files"
territory ?

I don't know whether Ubuntu is missing the entire /linux subdirectory
or just the limits.h file, but just add the minimum required to get past
this obstacle, i.e. don't link to the /linux directory if you can help it,
just create an empty one (if missing) and add a symlink to the
existing limits.h file.

In this way the possible side-effects of using a 'foreign' file are
reduced, and you use as much as possible from the correct toolchain.

The above is *not* from direct Ubuntu experience, but I have made
'enabling' fixups in the manner described to get things to build
before now.

Regards,
Mike
