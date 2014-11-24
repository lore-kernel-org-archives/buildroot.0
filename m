From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 24 Nov 2014 06:49:22 +0200
Subject: [Buildroot] [PATCH 13/51] samba: use <pkg>_INSTALL_INIT_SYSV
 mechanism
In-Reply-To: <1416775163-20215-14-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1416775163-20215-14-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141124044922.GB2241@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Nov 23, 2014 at 09:38:45PM +0100, Thomas Petazzoni wrote:
> +define SAMBA_INSTALL_INIT_SYSV
> +	# install start/stop script
> +	@if [ ! -f $(TARGET_DIR)/etc/init.d/S91smb ]; then \
> +		$(INSTALL) -m 0755 -D package/samba/S91smb $(TARGET_DIR)/etc/init.d/S91smb; \
> +	fi
> +endef

Why not install the init script unconditionally like you did in vsftpd?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
