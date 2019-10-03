From: Christophe Blaess <mailist@logilin.fr>
Date: Thu, 3 Oct 2019 21:47:35 +0200
Subject: [Buildroot] [PATCH 1/1] board/raspberrypi/post-build.sh: avoid
 HDMI login when getty disabled
In-Reply-To: <CAJ4jsafDZuYipJF1s9OdiMV=NeUMV6-SyDOqfKdC2ObBj_gqow@mail.gmail.com>
References: <20191001125028.5094-1-mailist@logilin.fr>
 <CAJ4jsafDZuYipJF1s9OdiMV=NeUMV6-SyDOqfKdC2ObBj_gqow@mail.gmail.com>
Message-ID: <f21377ab-1bdb-42a8-fc51-66a5b195913d@logilin.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

> I guess you are using raspberrypi_defconfig as a template for a custom
> board configuration. Can't you simply leave
> BR2_ROOTFS_POST_BUILD_SCRIPT empty?

No, I was using raspberry_defconfig on Raspberry Pi 4 as training 
support to show how to use this option on production systems when we 
don't want any getty (only custom code running on background).

I removed serial console by disabling the "Run a getty option.." but the 
HDMI login was still there.

It's ok to remove the BR2_ROOTFS_POST_BUILD_SCRIPT, but I would rather 
have only disabled the getty option. It seemed more elegant to me.
