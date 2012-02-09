From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 9 Feb 2012 23:58:34 +0100
Subject: [Buildroot] [PATCH 1/8] linux: use the depmod built in HOST_DIR
In-Reply-To: <28c6a15900cdc487752287f9d20e1ad7af0f992a.1328038759.git.thomas.petazzoni@free-electrons.com>
References: <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
 <28c6a15900cdc487752287f9d20e1ad7af0f992a.1328038759.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201202092358.34713.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 31 January 2012 20:39:59 Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  linux/linux.mk |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 5c5a1d2..dbe1ad7 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -40,7 +40,8 @@ LINUX_MAKE_FLAGS = \
>  	ARCH=$(KERNEL_ARCH) \
>  	INSTALL_MOD_PATH=$(TARGET_DIR) \
>  	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
> -	LZMA="$(LZMA)"
> +	LZMA="$(LZMA)" \
> +	DEPMOD=$(HOST_DIR)/usr/sbin/depmod
>  
>  # Get the real Linux version, which tells us where kernel modules are
>  # going to be installed in the target filesystem.
> 

 Do you know why this is necessary in the first place?  It should be
covered by the TARGET_MAKE_ENV with contains the TARGET_PATH, no?
Or is the problem that igh-ethercat and lttng-modules forget to
include TARGET_MAKE_ENV?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
