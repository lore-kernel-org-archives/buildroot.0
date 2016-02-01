From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 2 Feb 2016 00:33:08 +0100
Subject: [Buildroot] [PATCH 3/4] kernel-module-imx-gpu-viv: add new
	package
In-Reply-To: <87powg9l3e.fsf@dell.be.48ers.dk>
References: <1454319423-13913-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454319423-13913-4-git-send-email-gary.bisson@boundarydevices.com>
 <20160201215644.1e3d3713@free-electrons.com>
 <87powg9l3e.fsf@dell.be.48ers.dk>
Message-ID: <CAAMH-yvUWbgc=wPgqGKOeL+GD7joPFmv1v49TpEinE-eAb6nbg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Mon, Feb 1, 2016 at 10:28 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
> Hi,
>
>  > I really don't like spreading hooks for package A in the code of
>  > package B. I think here it's better to change linux.mk with:
>
>  >         $(if $(BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV),
>  >                 $(call KCONFIG_DISABLE_OPT,CONFIG_MXC_GPU_VIV,$(@D)/.config))
>
>  > In LINUX_KCONFIG_FIXUP_CMDS.
>
>  > Peter, Arnout, Yann, what do you think ?
>
> Yes, that matches what we do for the other package related kernel
> configs.

Ok I'll switch to that.

> Does this theoretically work on a mainline kernel? If so, perhaps it
> should also disable the recently added DRM_VIVANTE stuff in case it
> conflicts?

No unfortunately this doesn't work on a mainline kernel.

Regards,
Gary
