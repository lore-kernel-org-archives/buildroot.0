From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 16:11:34 +0200
Subject: [Buildroot] [PATCH 37/38] samba4: install systemd files
In-Reply-To: <a98e85c22089032761afba40c1df85b04c3da942.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <a98e85c22089032761afba40c1df85b04c3da942.1432332802.git.alex.suykov@gmail.com>
Message-ID: <20150705161134.600b509d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sat, 23 May 2015 13:14:42 +0300, Alex Suykov wrote:

> +define SAMBA4_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 644 $(@D)/packaging/systemd/nmb.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/nmb.service
> +	$(INSTALL) -D -m 644 $(@D)/packaging/systemd/smb.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/smb.service
> +	$(INSTALL) -D -m 644 $(@D)/packaging/systemd/winbind.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/winbind.service
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -sf /usr/lib/systemd/system/nmb.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nmb.service
> +	ln -sf /usr/lib/systemd/system/smb.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/smb.service
> +	ln -sf /usr/lib/systemd/system/winbind.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/winbind.service
> +endef

I've changed to use relative paths for the symbolic links, and applied.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
