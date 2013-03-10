From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Mar 2013 22:07:15 +0100
Subject: [Buildroot] [PATCH v2 2/8] gdisk: rename to gptfdisk
In-Reply-To: <1362689131-1479-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 7 Mar 2013 21:45:24 +0100")
References: <1362689131-1479-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362689131-1479-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ppz7x8u4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> In order to match the new upstream name, rename the gdisk package to
 Thomas> gptfdisk. We add the relevant legacy configuration options to ensure a
 Thomas> smooth transition for users.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Thomas> +#
 Thomas> +# Legacy options since 2013.02
 Thomas> +#
 Thomas> +
 Thomas> +config BR2_PACKAGE_GDISK
 Thomas> +        bool "gdisk has been replaced by gptfdisk"
 Thomas> +	select BR2_LEGACY
 Thomas> +	select BR2_PACKAGE_GPTFDISK
 Thomas> +	help
 Thomas> +	  The option has been renamed BR2_PACKAGE_GPTFDISK.
 Thomas> +
 Thomas> +config BR2_PACKAGE_GDISK_GDISK
 Thomas> +        bool "gdisk tool from gdisk has been replaced by gdisk in gptfdisk"
 Thomas> +	select BR2_LEGACY
 Thomas> +	select BR2_PACKAGE_GPTFDISK
 Thomas> +	select BR2_PACKAGE_GPTFDISK_GDISK
 Thomas> +	help
 Thomas> +	  The option has been renamed BR2_PACKAGE_GPTFDISK_GDISK.
 Thomas> +
 Thomas> +config BR2_PACKAGE_GDISK_SGDISK
 Thomas> +        bool "sgdisk tool from gdisk has been replaced by sgdisk in gptfdisk"
 Thomas> +	select BR2_LEGACY
 Thomas> +	select BR2_PACKAGE_GPTFDISK
 Thomas> +	select BR2_PACKAGE_GPTFDISK_SGDISK
 Thomas> +	help
 Thomas> +	  The option has been renamed BR2_PACKAGE_GPTFDISK_SGDISK.

The indentation of the 'bool' lines is wrong (spaces vs tabs). Committed
with that fixed, thanks.

-- 
Bye, Peter Korsgaard
