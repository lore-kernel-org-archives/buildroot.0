From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 20 May 2021 12:15:25 +0200
Subject: [Buildroot] [PATCH 2/2] support/testing: test_glxinfo load X11
 modules in the right order
In-Reply-To: <87lf89ahm3.fsf@dell.be.48ers.dk>
References: <20210513141149.3154510-1-romain.naour@gmail.com>
 <20210513141149.3154510-2-romain.naour@gmail.com>
 <87lf89ahm3.fsf@dell.be.48ers.dk>
Message-ID: <f88891fa-a83d-9e1a-54de-5b1effeb2de8@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Le 20/05/2021 ? 11:18, Peter Korsgaard a ?crit?:
>>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:
> 
>  > From [1]
>  > "Xorg does not implement real dynamic linking and requires that its
>  > modules get loaded in the right order."
> 
>  > From /var/log/Xorg.0.0.log:
>  >  (II) LoadModule: "modesetting"
>  >  (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
>  >  (EE) Failed to load /usr/lib/xorg/modules/drivers/modesetting_drv.so: /usr/lib/xorg/modules/drivers/modesetting_drv.so: undefined symbol: shadowRemove
> 
>  > Fixes:
>  > https://gitlab.com/buildroot.org/buildroot/-/jobs/1255661899
> 
>  > [1] https://forums.gentoo.org/viewtopic-p-8245578.html#8245578
> 
>  > Signed-off-by: Romain Naour <romain.naour@gmail.com>
> 
> Is this also applicable to 2021.02.x, E.G. where we use the older swrast
> driver?
> 

This patch is needed after the switch to the gallium swrast.
Since the test_glxinfo was working for the 2021.02 release the backport is not
needed.

Best regards,
Romain
