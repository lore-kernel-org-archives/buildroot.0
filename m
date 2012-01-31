From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 31 Jan 2012 23:30:36 +0100
Subject: [Buildroot] [PATCH 1/8] linux: use the depmod built in HOST_DIR
In-Reply-To: <28c6a15900cdc487752287f9d20e1ad7af0f992a.1328038759.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 31 Jan 2012 20:39:59 +0100")
References: <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
 <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
 <28c6a15900cdc487752287f9d20e1ad7af0f992a.1328038759.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87pqdzijxv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  linux/linux.mk |    3 ++-
 Thomas>  1 files changed, 2 insertions(+), 1 deletions(-)

 Thomas> diff --git a/linux/linux.mk b/linux/linux.mk
 Thomas> index 5c5a1d2..dbe1ad7 100644
 Thomas> --- a/linux/linux.mk
 Thomas> +++ b/linux/linux.mk
 Thomas> @@ -40,7 +40,8 @@ LINUX_MAKE_FLAGS = \
 Thomas>  	ARCH=$(KERNEL_ARCH) \
 Thomas>  	INSTALL_MOD_PATH=$(TARGET_DIR) \
 Thomas>  	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
 Thomas> -	LZMA="$(LZMA)"
 Thomas> +	LZMA="$(LZMA)" \
 Thomas> +	DEPMOD=$(HOST_DIR)/usr/sbin/depmod

Committed, thanks. Not released to this patch, but is the LZMA stuff
still used/needed?

-- 
Bye, Peter Korsgaard
