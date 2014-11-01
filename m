From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 19:08:49 +0100
Subject: [Buildroot] [PATCH 12/51] ktap: bump version
In-Reply-To: <1414349157-22749-12-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1414349157-22749-12-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141101190849.702e3903@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 26 Oct 2014 19:45:18 +0100, Maxime Hadjinlian wrote:
> We switch from a tag to a commit ID, because the release  is from
> December 2013.
> Ktap has 4 releases, all made during a 7 months period, nothing since
> then.
> 
> But the project is still active, ~80 commits have been pushed in the meantime.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/ktap/ktap.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ktap/ktap.mk b/package/ktap/ktap.mk
> index 0c2652d..a6b779a 100644
> --- a/package/ktap/ktap.mk
> +++ b/package/ktap/ktap.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KTAP_VERSION = v0.4
> +KTAP_VERSION = 5b16b61deb6c8a99d71e5167706a5f5566135828
>  KTAP_SITE = $(call github,ktap,ktap,$(KTAP_VERSION))
>  KTAP_SOURCE = v$(KTAP_VERSION).tar.gz
>  KTAP_LICENSE = GPLv2

Applied, thanks. However, it was not building fine for uClibc due to a
missing <stdarg.h> include. The KTAP_SOURCE variable is now
unnecessary. I've fixed that before committing.

Also, I tried to build a 3.16.1 kernel for ARM with the
sama5_defconfig, and even with the logic in linux/linux.mk to enable a
bunch of kernel options when ktap is enabled, it wasn't sufficient, and
ktap complained that a couple of kernel options were missing.

However, it seems like those kernel config options for tracing stuff
changes quite often, so it might be difficult to have a logic in
linux/linux.mk that works for all kernel versions. If you have some
time to have a look into this, it'd be great.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
