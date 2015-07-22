From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 17:06:48 +0200
Subject: [Buildroot] [PATCH v2 1/1] e2fsprogs: remove busybox tune2fs
 when installing full version
In-Reply-To: <1436392260-55786-1-git-send-email-ryan.barnett@rockwellcollins.com>
References: <1436392260-55786-1-git-send-email-ryan.barnett@rockwellcollins.com>
Message-ID: <20150722170648.0a5183e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Wed,  8 Jul 2015 16:51:00 -0500, Ryan Barnett wrote:

> +# Remove busybox tune2fs and e2label since that will take precedence full version
>  define E2FSPROGS_TARGET_TUNE2FS_SYMLINK
> +	$(if $(BR2_PACKAGE_BUSYBOX), \
> +		rm -f $(TARGET_DIR)/sbin/tune2fs; \
> +		rm -f $(TARGET_DIR)/sbin/e2label;)
>  	ln -sf e2label $(TARGET_DIR)/usr/sbin/tune2fs
>  endef

I really didn't like the hijacking of E2FSPROGS_TARGET_TUNE2FS_SYMLINK
for the purposes of Busybox related issues, so I've separated the
Busybox related handling into a different post install target hook and
committed.

Please check
http://git.buildroot.net/buildroot/commit/?id=aa02829240b2927b2cb379eb904b6f40ff751237

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
