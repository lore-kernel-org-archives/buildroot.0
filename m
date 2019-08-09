From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 9 Aug 2019 17:09:54 +0200
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: use prebuilt
 BL33 images
In-Reply-To: <20190803220851.01cef626@windsurf.home>
References: <1542900148-17204-1-git-send-email-etienne.carriere@linaro.org>
 <20181201201834.GA7451@speedy.hunter>
 <CAN5uoS-q5p6eLgO5GrgR6LWb2oxy6Crb7w_7RAPrG=FA9QEbwA@mail.gmail.com>
 <20190803220851.01cef626@windsurf.home>
Message-ID: <CAN5uoS9t+CCtemxPYcdDCSMtzXzgBczHMXue9D8=6vTw+szWLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Thanks for the feedback.

> The proposed scheme is not ideal because for example the custom
> pre-built BL33 cannot be provided by another Buildroot package, as you
> cannot express the dependency.
>
> If all you're interested in is supporting OPTEE-OS, then I would
> recommend just add explicit support for it as an optional BL32 in ATF,
> without trying to be too flexible.
>
> If however you really want something that is very flexible, to allow
> both custom BL32 and BL33, then a possible solution is to create
> virtual packages: atf-bl32 and atf-bl33. optee_os would be a provider
> of atf-bl32, and U-Boot/Barebox could be providers of atf-bl33. This
> also allows custom packages in BR2_EXTERNAL, that package some custom
> BL32/BL33 to be providers of atf-bl32 or atf-bl33. This is of course
> more complicated to implement. Perhaps it is wise to wait and see if
> there really is a need for something like this.
>
> In the mean time, if what you want is just OPTEE-OS as BL32, keep it
> simple and add explicit handling for it in ATF.

I had UEFI in mind as it can be a BL33 boot stage used by ATF for
64bit Arm platforms. But it's not built from Buildroot, as pointed
from [1].
Yet I get your point about the need for clean dependency management in
a pristine Buildroot package.
Maybe I or someone can come up with a better proposal some day to address this.

Anyway, thanks again for all your feedback and detailed argumentation.

[1] https://github.com/buildroot/buildroot/blob/2019.05.x/board/aarch64-efi/readme.txt#L31

Regards,
etienne

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
