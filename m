From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 09:30:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: mod_cv needs
 BR2_PACKAGE_OPENCV_LIB_OBJDETECT
In-Reply-To: <1460953338-15043-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460953338-15043-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160418093019.3ee348b5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Apr 2016 06:22:18 +0200, Bernd Kuhls wrote:

> -ifeq ($(BR2_PACKAGE_OPENCV),y)
> +ifeq ($(BR2_PACKAGE_OPENCV)$(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),yy)

Another option is to:

	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT if BR2_PACKAGE_OPENCV

in the Config.in file. I don't know which one is preferred.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
