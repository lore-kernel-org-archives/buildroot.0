From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 22:50:57 +0100
Subject: [Buildroot] [RFC/PATCH 1/1] gst-fsl-plugins: fix compile for
 sysroot based on newer linux kernel headers
In-Reply-To: <53161025.7040908@mind.be>
References: <1393366722-27644-1-git-send-email-ps.report@gmx.net>
 <1393366722-27644-2-git-send-email-ps.report@gmx.net>
 <20140302094859.66470cdc@skate> <53161025.7040908@mind.be>
Message-ID: <20140304225057.0d010df6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 04 Mar 2014 18:40:53 +0100, Arnout Vandecappelle wrote:

>  The problem is that the kernel headers in /usr/include/linux are not the
> same as the ones in $(LINUX_DIR)/include/linux: headers_install does some
> fixups on them. Also, $(LINUX_DIR)/include/net is completely different
> from /usr/include/net. So putting $(LINUX_DIR)/include in front of the
> system dirs is a bad idea. As in, it didn't work for me :-)

Ok.

>  Maybe a generic solution for packages that require specific kernel
> headers is to include a headers_install in the kernel's build?

But will it work properly? I mean, most of the time, the packages that
need this are vendor-specific packages, that want to access specific
definitions in vendor-specific kernels. And the quality of
vendor-specific kernels is usually quite low, so there are quite some
chances that headers_install might not necessarily do the right thing
as it will not have been properly tested...

>  Anyway, for this one, if it works with -I with all our external
> toolchains and with an internal uClibc and glibc toolchain, then I guess
> it's OK. Perhaps something got fixed in the gst-fsl-plugins bump.

Is this a Acked-by for the patch?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
