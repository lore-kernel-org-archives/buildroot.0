From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 15:11:37 +0200
Subject: [Buildroot] pre-built binary packages
In-Reply-To: <8AE4BE7D9622DF41B76E1AD887AA1A477BB220F1@MARCM-SBS2011.marcmltd.local>
References: <8AE4BE7D9622DF41B76E1AD887AA1A477BB220F1@MARCM-SBS2011.marcmltd.local>
Message-ID: <20171011151137.469e7fd6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Oct 2017 11:00:11 +0000, Marc Murphy wrote:

> I am wondering if it is possible to generate binary releases of
> packages to be included in the build tree.  For example I have a
> system that is rooted in 2017.02 and still has work done on some
> packages but when updating releases from other engineers the changes
> can get conflicted or messed up resulting in a fresh rebuild.  This
> normally isn't a problem until Qt is in the equation.  For me once Qt
> is configured built that's it I shouldn't need to build it again.  Is
> there any way to 1) export or package the binaries and headers for
> module archiving 2) use the prebuilt binaries and headers in a new
> build to prevent having to rebuild Qt again
> 
> I think it could be a useful feature to create controlled releases or
> to speed up builds.

Buildroot does not implement any mechanism to "cache" build results. It
is quite complicated to do it right, because you have to figure out
when an existing build result can be re-used from the cache or should
be rebuilt. Indeed, "building Qt" doesn't mean anything. With which
configuration was it built? For which host architecture and which
target architecture? With which target flags and optimization?

If you want to speed up your build with Buildroot, consider:

 - Using a faster build machine (more SSD, more RAM)
 - Using an external toolchain
 - Using ccache

If you want a build system that caches existing build artifacts, then
you should use OpenEmbedded/Yocto.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
