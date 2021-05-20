From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 May 2021 11:18:12 +0200
Subject: [Buildroot] [PATCH 2/2] support/testing: test_glxinfo load X11
 modules in the right order
In-Reply-To: <20210513141149.3154510-2-romain.naour@gmail.com> (Romain Naour's
 message of "Thu, 13 May 2021 16:11:49 +0200")
References: <20210513141149.3154510-1-romain.naour@gmail.com>
 <20210513141149.3154510-2-romain.naour@gmail.com>
Message-ID: <87lf89ahm3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > From [1]
 > "Xorg does not implement real dynamic linking and requires that its
 > modules get loaded in the right order."

 > From /var/log/Xorg.0.0.log:
 >  (II) LoadModule: "modesetting"
 >  (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
 >  (EE) Failed to load /usr/lib/xorg/modules/drivers/modesetting_drv.so: /usr/lib/xorg/modules/drivers/modesetting_drv.so: undefined symbol: shadowRemove

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/1255661899

 > [1] https://forums.gentoo.org/viewtopic-p-8245578.html#8245578

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Is this also applicable to 2021.02.x, E.G. where we use the older swrast
driver?

-- 
Bye, Peter Korsgaard
