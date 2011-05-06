From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 06 May 2011 11:49:24 +0200
Subject: [Buildroot] [PATCH] package: Adding Next Generation IRC deamon
	ngircd
In-Reply-To: <1304673813-11888-1-git-send-email-fabien.marteau@armadeus.com>
	(fabien marteau's message of "Fri, 6 May 2011 11:23:33 +0200")
References: <1304673813-11888-1-git-send-email-fabien.marteau@armadeus.com>
Message-ID: <877ha4kvkr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "fabien" == fabien marteau <fabien.marteau@armadeus.com> writes:

 fabien> From: Fabien Marteau <fabien.marteau@armadeus.com>
 fabien> Acked-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
 fabien> Signed-off-by: Fabien Marteau <fabien.marteau@armadeus.com>

Thanks, committed with a minor change.

 fabien> +#############################################################
 fabien> +#
 fabien> +# ngIRCd: Next Generation IRC Daemon
 fabien> +#
 fabien> +#############################################################
 fabien> +NGIRCD_VERSION = 17.1
 fabien> +NGIRCD_SITE = ftp://ftp.berlios.de/pub/ngircd/
 fabien> +NGIRCD_DEPENDENCIES = zlib
 fabien> +
 fabien> +define NGIRCD_SUPPRESS_DOCUMENTATION
 fabien> +	rm -rf $(TARGET_DIR)/usr/share/doc/ngircd
 fabien> +	rm -rf $(TARGET_DIR)/usr/share/man/man5/arm-linux-ngircd.conf.5
 fabien> +	rm -rf $(TARGET_DIR)/usr/share/man/man8/arm-linux-ngircd.8
 fabien> +endef
 fabien> +
 fabien> +NGIRCD_POST_INSTALL_TARGET_HOOKS+=NGIRCD_SUPPRESS_DOCUMENTATION

This is handled automatically on a global level - See target-finalize in
the toplevel Makefile.

-- 
Bye, Peter Korsgaard
