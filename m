From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Aug 2012 11:09:31 +0200
Subject: [Buildroot] Announcement: availability of autobuilder toolchains
Message-ID: <20120825110931.5acc6645@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

One common complaint about the autobuilders was that the builds were
not reproducible because they were using external toolchains that were
not available to others.

I have fixed this now for all the toolchain configuration used on the
Free Electrons build server, and I guess Peter will follow with the
toolchain configurations he is using on the gcc10 and gcc14 build
machines.

So, what I've done is:

 *) For publicly available external toolchains (Sourcery CodeBench,
    Blackfin), I've changed my configurations so that they point to the
    official toolchain instead of pointing to a local directory on the
    build machine. Originally, I was pointing to a local directory to
    save the extraction time of the toolchain, but this time is very
    small compared to the overall build process, and it allows the
    configurations to be buildable by anyone.

 *) For specific external toolchains (built with Buildroot or
    Crosstool-NG), I've uploaded their tarballs at
    http://autobuild.buildroot.org/toolchains/tarballs/, and the
    configuration directly point to them, thanks to the possibility
    added by Thomas De Schampheleire to specify a custom download URL
    for an external toolchain. I did a bit of tricks for the Buildroot
    toolchains to make sure they are relocatable and usable by
    Buildroot through tarballs (I'll post a different e-mail about
    this).

This means that from now on, *all* configurations used on the Free
Electrons build server are independent from the build machine and can
be reproduce by anyone.

The Buildroot base configuration I'm using are all available at:

   http://autobuild.buildroot.org/toolchains/configs/free-electrons/

I hope these new informations will help people reproduce the build
issues and help in fixing them.

Peter, could you:
 * Give me your base Buildroot configuration that you are using on gcc10
   and gcc14
 * Give me the external toolchain configuration you're using on gcc14
   so that I can build a relocatable Buildroot toolchain for it,
   generate a tarball, and put it in
   http://autobuild.buildroot.org/toolchains/tarballs/, and then have
   you update your base Buildroot configuration so that it downloads
   this tarball instead of using a local directory?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
