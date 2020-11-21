From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 22 Nov 2020 00:10:48 +0100
Subject: [Buildroot] [PATCH v4 2/5] package/linux4tegra: new package
In-Reply-To: <CA+h8R2r0J8iaMXNOPcQFK9mNbfHfLu-rZckAyihMDVYE0+28Qw@mail.gmail.com>
References: <20201119075328.8599-1-christian@paral.in>
 <20201119075328.8599-2-christian@paral.in>
 <25b062ad-cd77-fc0b-8ed0-934f48669bf1@gmail.com>
 <CA+h8R2r0J8iaMXNOPcQFK9mNbfHfLu-rZckAyihMDVYE0+28Qw@mail.gmail.com>
Message-ID: <9c9aba6d-77bc-6538-22ba-27f38b2076b1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

Le 21/11/2020 ? 21:45, Christian Stewart a ?crit?:
> Hi Romain,
> 
> On Sat, Nov 21, 2020 at 2:40 AM Romain Naour <romain.naour@gmail.com> wrote:
> [snip]
> 
> I applied the requested comment changes, patch change, and hash file
> tabs -> spaces change to the latest revision:
> 
> https://github.com/skiffos/buildroot/tree/tx2
> 
> 
>>> +define LINUX4TEGRA_INSTALL_IMAGES_CMDS
>>> +     cp -r $(@D)/. $(BINARIES_DIR)/linux4tegra
>>> +endef
>>> +
>>> +LINUX4TEGRA_RSYNC = \
>>> +     rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
>>> +             --chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
>>> +             --keep-dirlinks --exclude=ld.so.conf.d
>>> +
>>> +define LINUX4TEGRA_INSTALL_TARGET_CMDS
>>> +     # install nvidia_drivers
>>> +     $(LINUX4TEGRA_RSYNC) $(@D)/nv_tegra/nvidia_drivers/ $(TARGET_DIR)/
>>> +     # install nvidia_configs
>>> +     $(LINUX4TEGRA_RSYNC) $(@D)/nv_tegra/nvidia_configs/ $(TARGET_DIR)/
>>> +     # install nvidia_tools
>>> +     $(LINUX4TEGRA_RSYNC) $(@D)/nv_tegra/nvidia_tools/ $(TARGET_DIR)/
>>> +endef
>>
>> This install a lot for prebuild binaries for example libGLX_nvidia.so.0.
>> This means that this package should be at least a LIBGL provider etc.
>>
>> There is a long list of shared libraries provided by this package, make sure to
>> not override anything already installed by anoter package (ex: libdrm.so.2)
> 
> Unfortunately this is beyond my scope in Buildroot, so if someone else
> has a chance to take a look at marking LIBGL provided by this package,
> please go ahead.
> 
> I'm not actually using the graphics libraries provided by Buildroot in
> my applications, so it's important to me that linux4tegra compile even
> if the graphics packages are not available.

I'm using meta-tegra for a customer project, I don't think I will be able to
work with Buildroot for this project and continue the LIBGL part.

Best regards,
Romain

> 
> Best regards,
> Christian
> 
