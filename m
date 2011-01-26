From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Jan 2011 20:35:47 +0100
Subject: [Buildroot] Migrate .05 to .08/.11 fails with glibc based
 external toolchain
In-Reply-To: <1296063608.3969.20.camel@feynman.coloradoengineeringinc.com>
References: <1296063608.3969.20.camel@feynman.coloradoengineeringinc.com>
Message-ID: <20110126203547.09906893@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 26 Jan 2011 10:40:08 -0700
"Michael J. Hammel" <buildroot@graphics-muse.org> wrote:

> I've got a build that has been working with 2010.05 that I tried to
> migrate to a newer release.  It dies early in the newer releases,
> apparently related to a dependency on uclibc.  The problem is my
> external toolchain (Crosstool-NG) is glibc based and the buildroot
> configs appear to reflect this.  So I'm not sure where this dependency
> is coming from.  Here is where the build fails with 2010.11 (2010.08 is
> the same):
> 
> Checking external toolchain settings
> mkdir
> -p /home/mjhammel/src/cei/system_build/bld/buildroot-2010.11/output/target/lib
> Copy external toolchain libraries to target...
> Copy external toolchain sysroot to staging...
> # Create lib64 symbolic links if needed
> make[1]: *** No rule to make target `uclibc_target', needed by
> `gcc_target'. Stop.
> make[1]: Leaving directory
> `/home/mjhammel/src/cei/system_build/bld/buildroot-2010.11'
> 
> I found nothing in bugzilla about this.  Something tells me I'm missing
> something basic here.

You have enabled "native toolchain in the target filesystem" in
Packages -> Development tools. This is not supported currently with
external toolchains.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
