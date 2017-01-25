From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 16:43:30 +1300
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-sis:
 disable DRI support when not available
In-Reply-To: <20170101130705.26931-1-bernd.kuhls@t-online.de>
References: <20170101130705.26931-1-bernd.kuhls@t-online.de>
Message-ID: <20170125164330.5ca96109@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Jan 2017 14:07:05 +0100, Bernd Kuhls wrote:

> +ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
> +XDRIVER_XF86_VIDEO_SIS_CONF_OPTS = --disable-dri
> +endif

Using += is really better than using = when doing conditional
assignments, to prevent future mistakes.

Unfortunately I saw it after pushing, so I fixed this as a follow-up
commit rather than fixing the commit itself.

So applied to master with the fix.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
