From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Tue, 28 Aug 2007 07:36:34 +0200
Subject: [Buildroot] Unable to Build mpg123 because of wrong patch file
In-Reply-To: <12360819.post@talk.nabble.com>
References: <12360819.post@talk.nabble.com>
Message-ID: <1188279394.31623.6.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2007-08-27 at 18:51 -0700, Hebbar wrote:
> Hi All,
> 
>  I am trying to build mpg123 for arm arm926ejs toolchain. Today i tried
> building mpg123 and failed because of wrong patch. Error message is attached
> below. The Cause is that the Patch file tries to correct a non existent file
> Makefile inside mpg123 folder just after uncompressing the mpg123 tar file.
> It should patch the same after it has compiled. 

Mpg123 version was bumped, and it now uses a proper autoconf script, so
the patch is no longer needed.

> error message ---->
> bzcat /home/guru/project/original/bldrt/buildroot/dl/mpg123-0.66.tar.bz2 |
> tar -C /home/guru/project/original/bldrt/buildroot/build_arm   -xf -
> toolchain/patch-kernel.sh
> /home/guru/project/original/bldrt/buildroot/build_arm/mpg123-0.66
> package/mpg123/ mpg123\*.patch
> 
> Applying mpg123-cross.patch using plaintext: 

Nuke this patch from the repo (-:

> can't find file to patch at input line 4
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
> |diff -ruN mpg123-0.59r.orig/Makefile mpg123-0.59r/Makefile
> |--- mpg123-0.59r.orig/Makefile 1999-06-15 22:39:06.000000000 +0200
> |+++ mpg123-0.59r/Makefile      2006-12-14 15:52:44.000000000 +0100
> --------------------------
> File to patch: Makefile
> Makefile: No such file or directory
> Skip this patch? [y] y
> Skipping patch.
> 2 out of 2 hunks ignored
> Patch failed!  Please fix mpg123-cross.patch!
> make: ***
> [/home/guru/project/original/bldrt/buildroot/build_arm/mpg123-0.66/.unpacked]
> Error 1

<cut mpg123 directory contents>

<cut mpg123.mk>

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
