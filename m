From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 22:35:43 +0100
Subject: [Buildroot] [PATCH 1/1] alsa-lib: fix build on powerpc64 and
 powerpc64le
In-Reply-To: <c51221ec7f459272dd2bd2bf01097537cdb045b3.1478143517.git.sam.bobroff@au1.ibm.com>
References: <c51221ec7f459272dd2bd2bf01097537cdb045b3.1478143517.git.sam.bobroff@au1.ibm.com>
Message-ID: <20161103223543.3deff09b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Nov 2016 14:25:34 +1100, Sam Bobroff wrote:
> Fixes linker error
> http://autobuild.buildroot.net/results/c6272ac900d1a53b976839ac4f50a210b3e6b354
> 
> On powerpc64 (and powerpc64le) the build fails due to linker problems
> because of an old (2003) workaround for powerpc64, presumably working
> around an old toolchain problem that is no longer present. Removing
> the workaround allows the build to succeed. A new patch is added for
> this.
> 
> Additionally, there was a mistake in patch 3: the patch added a test
> for HAVE_LIBDL to include/alsa-symbols.h but it was positioned in the
> file before config.h was included, so HAVE_LIBDL is never seen as
> defined.  The test was also using HAVE_LIBDL (which indicates the
> library) rather than HAVE_DLFCN (which indicates the header).
> 
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---

Applied to master, thanks!

Please submit those patches upstream to the alsa-lib project. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
