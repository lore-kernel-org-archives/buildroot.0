From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 20:36:11 +0100
Subject: [Buildroot] [PATCH v2 04/25] psplash: move systemd service
 files to /usr/lib
In-Reply-To: <1426878856-15747-5-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
 <1426878856-15747-5-git-send-email-mike@mikebwilliams.com>
Message-ID: <20150320203611.463c682a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

On Fri, 20 Mar 2015 15:13:55 -0400, Mike Williams wrote:

>  define PSPLASH_INSTALL_INIT_SYSTEMD
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +
>  	$(INSTALL) -D -m 644 package/psplash/psplash-start.service \
> -		$(TARGET_DIR)/etc/systemd/system/psplash-start.service
> -	$(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
> -	ln -sf  ../psplash-start.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/psplash-start.service
> +	$(INSTALL) -d $(TARGET_DIR)/usr/lib/systemd/system/sysinit.target.wants

Why are we creating this directory?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
