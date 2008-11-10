From: hartleys <hartleys@visionengravers.com>
Date: Mon, 10 Nov 2008 16:43:08 -0500
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909CEA62E@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2008-10-09 05:50:56, Daniel Laird wrote:
> Use AutoTools.in to build freetype.
> Slight issue with freetype installation to TARGET_DIR.
> Doing an install results in far too many files being copied in.
> So for now I do what the old makefile did which is copy the .so
> files and links manually rather than using a make install.
> It also uses the autotools.in additions to not use the generic
> libtool patch and use a local one instead.

For some reason the FREETYPE_HOOK_POST_BUILD step does not seem to be
running.

If I do 'make freetype-clean; make freetype-dirclean; make freetype' I
see the various MESSAGE macros for each step.

...
>>> freetype 2.2.1 Extracting
>>> freetype 2.2.1 Patching libtool
>>> freetype 2.2.1 Patching package/freetypes
...
>>> freetype 2.2.1 Configuring
...
>>> freetype 2.2.1 Building
...
>>> freetype 2.2.1 'Installing to host (staging directory)'
...

There is one error message in the last step that says:

...
rm -f
/home/bigguiness/buildroot/build_arm/staging_dir/usr/include/freetype2/f
reetype/internal/*
rmdir
/home/bigguiness/buildroot/build_arm/staging_dir/usr/include/freetype2/f
reetype/internal
rmdir:
/home/bigguiness/buildroot/build_arm/staging_dir/usr/include/freetype2/f
reetype/internal: No such file or directory
make[1]: [install] Error 1 (ignored)

Followed by some '/usr/bin/install ...' stuff. The last line of the make
is:

touch
/home/bigguiness/buildroot/build_arm/freetype-2.2.1/.stamp_staging_insta
lled

Am I missing something or doing something wrong to get the library
installed on my target?

Thanks,
Hartley
