From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Dec 2010 11:05:39 +0100
Subject: [Buildroot] [PATCH 14/55] documentation: Update to explain how
 board support works
In-Reply-To: <143229.86585.qm@web58201.mail.re3.yahoo.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<da8a618d7ebd5da7e48fccbab506f3e7b7a5cdd8.1291582351.git.thomas.petazzoni@free-electrons.com>
	<143229.86585.qm@web58201.mail.re3.yahoo.com>
Message-ID: <20101211110539.08ebc734@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve,

On Fri, 10 Dec 2010 20:37:57 -0800 (PST)
Steve Calfee <nospamcalfee@yahoo.com> wrote:

> I am trying to prepare a board support package. I have run this step
> and stuff disappeared from the .config, for instance:

When you run "savedefconfig", it generates a defconfig file that
contains the value only for the config options that are not of the
default value, and that cannot be computed from other options.

> BR2_ARM_TYPE="ARM926T"

This is an hidden option, whose value is selected depending on
BR2_arm926t. So if you have BR2_arm926t=y in your defconfig, having
BR2_ARM_TYPE="ARM926T" is useless: it will be computed automatically.

> BR2_ARM_EABI=y

This is the default.

> # BR2_ARM_OABI is not set

This is the default.

> BR2_ARCH="arm"
> BR2_ENDIAN="LITTLE"
> BR2_GCC_TARGET_TUNE="arm926ej-s"
> BR2_GCC_TARGET_ARCH="armv5te"
> BR2_GCC_TARGET_ABI="aapcs-linux"

All those are hidden options, whose value is computed from the value of
other options, so there's no need to store them in defconfig files.

> Is this normal? It takes so long to completely rebuild, but they
> don't seem to matter. If you say savedefconfig is enough, ok with me.

savedefconfig is enough. For all options that you were wondering about,
having:

BR2_arm=y
BR2_arm926t=y

in your savedefconfig is sufficient.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
