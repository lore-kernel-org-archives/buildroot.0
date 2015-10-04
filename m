From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 15:44:52 +0100
Subject: [Buildroot] [PATCH 2/3] vsftpd: Add ftp user creation
In-Reply-To: <1443965495-12774-2-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443965495-12774-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1443965495-12774-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20151004154452.16eee409@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime,

On Sun,  4 Oct 2015 15:31:34 +0200, Maxime Hadjinlian wrote:

> +#
> +# VSFTPD won't work if the jail directory is writable, it has to be readable
> +# only
> +# Otherwise you get the following error:
> +# 500 OOPS: vsftpd: refusing to run with writable root inside chroot()
> +# That's why we have to chmod /home/ftp
> +define VSFTPD_FIX_HOME_PERMISSIONS
> +	$(INSTALL) -d -m 555 $(TARGET_DIR)/home/ftp
> +endef

Can we use VSFTPD_PERMISSIONS instead ? The only drawback is that you
will have to set a fixed UID/GID for ftp:ftp in VSFTPD_USERS.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
