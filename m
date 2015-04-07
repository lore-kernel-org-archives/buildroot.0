From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 22:53:22 +0200
Subject: [Buildroot] [PATCH 04/18] package/mplayer: add optional samba
 support
In-Reply-To: <1427649094-1240-5-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
 <1427649094-1240-5-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150407225322.2c219692@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 29 Mar 2015 19:11:20 +0200, Bernd Kuhls wrote:

> +ifeq ($(BR2_PACKAGE_SAMBA_SMBCLIENT),y)
> +MPLAYER_CONF_OPTS += --enable-smb
> +MPLAYER_DEPENDENCIES += samba
> +else
> +MPLAYER_CONF_OPTS += --disable-smb
> +endif

Samba 3 has been deprecated. So I've merged this patch, but it's
actually a no-op, unless deprecated packages are enabled. Can you check
whether Samba 4 can be used instead ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
