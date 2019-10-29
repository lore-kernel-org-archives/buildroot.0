From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 29 Oct 2019 09:19:58 +0100
Subject: [Buildroot] [PATCH v3 1/4] boot/arm-trusted-firmware: support
 alternate image files
In-Reply-To: <d3607755-73d7-f001-8726-cb6c1ce6e67f@mind.be>
References: <20190322095818.19914-1-etienne.carriere@linaro.org>
 <d3607755-73d7-f001-8726-cb6c1ce6e67f@mind.be>
Message-ID: <CAN5uoS8rHObK-Fmm651reK6DOpqGszSrcyDpbBANytSx3iaKsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomans and all,

On Sun, 27 Oct 2019 at 15:59, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 22/03/2019 10:58, Etienne Carriere wrote:
> > Some platform may generate specific boot image files instead of
> > the generic files *.bin  when building TF-A package.
>
>  This is still very vague, and it doesn't have any in-tree user. Therefore,
> we're not prepared to merge this patch. Do you have a concrete example,
> preferably with a defconfig that actually makes use of it?

Well, I will consider when there is an in-tree board that needs this :)

Actually, this is some kind of equivalent for optee-os
BR2_TARGET_OPTEE_OS_IMAGE_NAMES
or even u-boot BR2_TARGET_UBOOT_FORMAT_CUSTOM.

Regards,
Etienne

>  I've therefore marked this patch as Changes Requested.
>
>  Regards,
>  Arnout
>
> > This change
> > introduces new configuration directive for the arm-trusted-firmware
> > boot package.
> >
> > BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_IMAGE_NAMES is boolean.
> > When disabled, install boot image files are .../*.bin.
> > When enabled, BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL_IMAGE_NAMES shall
> > lists the names of the generated boot image files.
> >
> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> [snip]
