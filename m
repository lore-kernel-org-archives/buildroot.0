From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sun, 27 Oct 2013 15:43:59 -0500
Subject: [Buildroot] [PATCH 2/2] beagle-capes: new package
In-Reply-To: <526CF766.6070001@mind.be>
References: <1373239866-18076-1-git-send-email-spenser@gillilanding.com>
 <1373239866-18076-2-git-send-email-spenser@gillilanding.com>
 <526CF766.6070001@mind.be>
Message-ID: <CAEBucnDqkZAzSLicRqYgW8wTi6h_5STK12EDPQJ14joaODqABg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

>  We had a discussion at the Buildroot developer meeting, and finally
> found a solution which may be better...
>
>  Instead of doing the firmware_install from the linux package, you can
> do it from the beagle-capes package, i.e.:
>
> define BEAGLE_CAPES_BUILD_CMDS
>         $(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
>                 firmware_install INSTALL_FW_PATH=$(@D)
> endef
>
> define BEAGLE_CAPES_INSTALL_TARGET_CMDS
>         $(INSTALL) -m 644 $(@D)/*.dtbo $(TARGET_DIR)/lib/firmware/
> endef
>
>
>  We don't expect that this 'install firmware to staging' feature would
> ever be used by any other package, that's why we prefer not to have it
> in the linux.mk.

I agree.  I'll create a new patch and resubmit.

>
>  By the way, this will only work for a beaglebone-specific kernel, of
> course. Is there any way to check for that and error out with a clear error
> message?

We can check if any dts files exist in the firmware dir of the kernel.
 I'll write up a patch.

Thanks,
Spenser

-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
