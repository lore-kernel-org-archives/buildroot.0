From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 26 Apr 2016 17:17:21 +0200
Subject: [Buildroot] [PATCH] i7z: new package
References: <1461680504-21604-1-git-send-email-vincent.stehle@intel.com>
Message-ID: <1dd4vcxq7g.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 26 Apr 2016 16:21:44 +0200 schrieb Vincent Stehl?:

> +config BR2_PACKAGE_I7Z
> +	bool "i7z"
> +	depends on BR2_i386 || BR2_x86_64
> +	select BR2_PACKAGE_NCURSES
> +	help

Hi,

the package depends on threads:

i7z_Dual_Socket.c:23:21: fatal error: pthread.h: No such file or directory
 #include <pthread.h>
                     ^

Tested using this defconfig:

BR2_PTHREADS_NONE=y
BR2_PACKAGE_I7Z=y

Regards, Bernd
