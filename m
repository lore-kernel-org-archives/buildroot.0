From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Oct 2016 18:44:55 +0200
Subject: [Buildroot] [PATCH] configs/odroidc2: bump kernel headers to
	3.14.79
In-Reply-To: <20161013195621.6015-1-daggs@gmx.com> (Dagg Stompler's message of
 "Thu, 13 Oct 2016 22:56:21 +0300")
References: <20161013195621.6015-1-daggs@gmx.com>
Message-ID: <87insu3mns.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dagg" == Dagg Stompler <daggs@gmx.com> writes:

 > following commit 7de5b0d2d83bec38ec96ef5917259d9f46df58d4, bump kernel
 > headers to 3.14.79 to match the kernel version.

 > Signed-off-by: Dagg Stompler <daggs@gmx.com>
 > ---
 >  configs/odroidc2_defconfig | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
 > index 44fc61a..95a9169 100644
 > --- a/configs/odroidc2_defconfig
 > +++ b/configs/odroidc2_defconfig
 > @@ -11,7 +11,7 @@ BR2_GCC_VERSION_4_9_X=y
 
 >  # Kernel
 >  BR2_KERNEL_HEADERS_VERSION=y
 > -BR2_DEFAULT_KERNEL_VERSION="3.14.29"
 > +BR2_DEFAULT_KERNEL_VERSION="3.14.79"

I was going to say that we should just use BR2_KERNEL_HEADERS_AS_KERNEL,
but it seems like the odroid2c kernel is so heavily patched that you
cannot actually build glibc with their kernel headers :/

Committed, thanks.

-- 
Bye, Peter Korsgaard
