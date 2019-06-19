From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 21:53:19 +0200
Subject: [Buildroot] [PATCH 15/27] package/flann: re-enable package on
 microblaze
In-Reply-To: <20190614210346.121013-16-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-16-giulio.benetti@micronovasrl.com>
Message-ID: <20190619215319.6ef11005@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Jun 2019 23:03:34 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> With Microblaze Gcc version <= 9.x build fails tue to bug 68485:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. To avoid this, the
> flann package has a !BR2_microblaze dependency. However, gcc bug 68485
> only triggers when optimization is enabled, so we can work around the
> issue by passing -O0, which is what we do in other Buildroot packages to
> work around this bug.
> 
> So, this commit passes -O0 when BR2_TOOLCHAIN_HAS_GCC_BUG_68485, and
> re-enables flann on Microblaze.
> 
> Note that the comment was talking about gcc bug 69401, but this gcc
> bug is a duplicate of 68485. Since all Buildroot packages now use the
> reference to gcc bug 68485 and the option is named
> BR2_TOOLCHAIN_HAS_GCC_BUG_68485, we use this naming as well for
> flann.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/flann/Config.in | 4 ----
>  package/flann/flann.mk  | 4 ++++
>  2 files changed, 4 insertions(+), 4 deletions(-)

I've applied to master, after changing the implementation to use a
FLANN_CXXFLAGS variable.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
