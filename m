From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Sep 2020 19:01:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/dav1d: disable asm on i386
References: <20200920080930.864480-1-bernd.kuhls@t-online.de>
 <20200920153118.6d58e6ba@windsurf>
Message-ID: <cfek3hx9oo.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 20 Sep 2020 15:31:18 +0200 schrieb Thomas Petazzoni:

> However dav1d was bumped to 0.7.1 in June 2020, so it cannot be that.
> But the nasm compiler was bumped on August 25, 2020, in commit
> 090a748aae1b9495362000ca6bf953ef8bc8154e. So it rather seems like a
> change in nasm broke i386 assembly in dav1d.

Hi Thomas,

I tested
https://code.videolan.org/videolan/dav1d/-/commit/
464ca6c2f37b93180cc27ea41889ffaf1eab388e

and various other patches committed to dav1d after the last version bump 
and all of them did not fix the autobuilder error.

But pointing to nasm now did the trick nonetheless:
https://nasm.us/doc/nasmdocc.html
"Correct %ifid $ and %ifid $$ being treated as true."

Bumping nasm fixes the dav1d build error, sent patch:
http://patchwork.ozlabs.org/project/buildroot/patch/
20200920165758.2032916-1-bernd.kuhls at t-online.de/

Regards, Bernd
