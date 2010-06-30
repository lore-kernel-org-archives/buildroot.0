From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 30 Jun 2010 10:17:37 -0300
Subject: [Buildroot] [PATCH] Fixed LINUX26_IMAGE_PATH
In-Reply-To: <20100630140355.7fddbd22@surf>
References: <1277894627-4586-1-git-send-email-henuxd@gmail.com>
	<20100630140355.7fddbd22@surf>
Message-ID: <AANLkTilhJRfSmBT2GHPDPeFNopsDnn1rAC2wu1JL2A6Y@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Jun 30, 2010 at 9:03 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> This will break ARM/x86 and many other architectures. Instead, we
> probably need something like:
>
> ifeq ($(KERNEL_ARCH),avr32)
> LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/images/$(LINUX26_IMAGE_NAME)
> else
> LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/$(LINUX26_IMAGE_NAME)
> endif
>

I actually had to fix this yesterday for avr32, but I assumed that it
would be valid for all archs, so I didn't do the ifeq in my private
changes.
Sounds good to me.

But this was something that the kernel people changed AFAIK, it might
apply to other targets as well in the future (?). Also, it's a bit
version dependent, older kernels had it built in boot instead of
boot/images

Kind Regards,
    Thiago A. Correa
