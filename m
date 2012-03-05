From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Mar 2012 21:05:24 +0100
Subject: [Buildroot] [PATCH] Ubinize: made UBI volume name and volume
 alignment configurable
In-Reply-To: <1330974852-27696-1-git-send-email-rolandu@gmail.com>
References: <1330974852-27696-1-git-send-email-rolandu@gmail.com>
Message-ID: <20120305210524.22346643@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Roland,

Thanks, it looks good to me. One comment below.

Le Mon,  5 Mar 2012 21:14:12 +0200,
Roland Uuesoo <rolandu@gmail.com> a ?crit :

> +config BR2_TARGET_ROOTFS_UBI_VOL_ALIGNMENT
> +        int "UBI volume alignment"
> +        depends on BR2_TARGET_ROOTFS_UBI
> +        default 1
> +        help
> +          Default volume alignment

Could you add a bit more detail on what this 'volume alignment'
parameter is useful for.

>  define ROOTFS_UBI_CMD
> -	cp fs/ubifs/ubinize.cfg . ;\
> +	cp fs/ubifs/ubinize.cfg $(BUILD_DIR)/_ubinize.cfg ;\
> +        echo "vol_name=$(BR2_TARGET_ROOTFS_UBI_VOL_NAME)" \
> +                >> $(BUILD_DIR)/_ubinize.cfg ;\
> +        echo "vol_alignment=$(BR2_TARGET_ROOTFS_UBI_VOL_ALIGNMENT)" \
> +                >> $(BUILD_DIR)/_ubinize.cfg ; \
>  	echo "image=$$@fs" \
> -		>> ./ubinize.cfg ;\
> -	$(HOST_DIR)/usr/sbin/ubinize -o $$@ $(UBI_UBINIZE_OPTS)
> ubinize.cfg ;\
> -	rm ubinize.cfg
> +		>> $(BUILD_DIR)/_ubinize.cfg ;\
> +	$(HOST_DIR)/usr/sbin/ubinize -o $$@ $(UBI_UBINIZE_OPTS)
> $(BUILD_DIR)/_ubinize.cfg ;\
> +        rm $(BUILD_DIR)/_ubinize.cfg

The indentation is a bit funky here. Can you keep the indentation at
one tab?

Thanks for your work!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
