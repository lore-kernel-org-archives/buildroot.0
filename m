From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 22:51:54 +0200
Subject: [Buildroot] [PATCH 1/1]
 package/x11r7/xdriver_xf86-video-savage: disable DRI support when not
 available
In-Reply-To: <1470583546-7332-1-git-send-email-bernd.kuhls@t-online.de>
References: <1470583546-7332-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160807225154.7b1a9dcf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Aug 2016 17:25:46 +0200, Bernd Kuhls wrote:

> +ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
> +XDRIVER_XF86_VIDEO_SAVAGE_CONF_OPTS = --disable-dri
> +endif

I've applied because we're doing the same condition in other X.org
video drivers. But I'm not happy at all with this condition. Indeed the
build failure is that DRI support is not provided by the X.org server
(for example, the DRIInfoPtr type that is missing and causes the
error), is provided by the X.org server.

So I really believe this whole DRI stuff needs to be reworked.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
