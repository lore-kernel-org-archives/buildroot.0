From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Apr 2010 15:42:44 +0200
Subject: [Buildroot] [PATCH 08/41] ext-toolchain: remove pkgconfig files
 from the external toolchain
In-Reply-To: <1271199974-30434-9-git-send-email-llandwerlin@gmail.com>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
	<1271199974-30434-9-git-send-email-llandwerlin@gmail.com>
Message-ID: <20100414154244.5d7ae3c1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 14 Apr 2010 01:05:41 +0200
llandwerlin at gmail.com wrote:

> --- a/toolchain/external-toolchain/ext-tool.mk
> +++ b/toolchain/external-toolchain/ext-tool.mk
> @@ -80,7 +80,8 @@ copy_toolchain_lib_root = \
>  copy_toolchain_sysroot = \
>  	SYSROOT_DIR="$(strip $1)"; \
>  	cp -a $${SYSROOT_DIR}/* $(STAGING_DIR)/ ; \
> -	find $(STAGING_DIR) -type d | xargs chmod 755
> +	find $(STAGING_DIR) -type d | xargs chmod 755; \
> +	rm -rf $(STAGING_DIR)/usr/lib/pkgconfig

Just curious, which toolchain has pkgconfig files in its sysroot dir ?
If it has pkgconfig files in its sysroot dir, doesn't it also have
other libraries than the C library in /usr/lib ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
