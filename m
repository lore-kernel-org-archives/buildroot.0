From: Simon Dawson <spdawson@gmail.com>
Date: Sat, 14 Sep 2013 20:32:22 +0100
Subject: [Buildroot] [PATCHv2 4/4] docs/manual: add explanations about
	BR2_EXTERNAL
In-Reply-To: <1379185433-8770-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1379185433-8770-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHt8ZCNHEXrQ_jZrqdVD1G3OySYj+dD-kKOh2KL78nzriW5O8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14 September 2013 20:03, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> +This +BR2_EXTERNAL+ then allows three different things:
> +
> + * One can store all the board-specific configuration files here, such
> +   as the kernel configuration, the root filesystem overlay, or any
> +   other configuration file for which Buildroot allows to set its
> +   location. The +BR2_EXTERNAL+ value is available within the
> +   Buildroot configuration using +$(BR2_EXTERNAL)+. As an example, one
> +   could set the +BR2_ROOTFS_OVERLAY+ Buildroot option to
> +   +$(BR2_EXTERNAL)/board/<boardname>/overlay/+ (to specify a root
> +   filesystem overlay), or the +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+
> +   Buildroot option to +$(BR2_EXTERNAL)/board/<boardname>/kernel.config+
> +   (to specify the location of the kernel configuration file).  + To
> +   achieve this, it is recommended but not mandatory, to store those
> +   details in directories called +board/<boardname>/+ under
> +   +BR2_EXTERNAL+.

A minor point: this is slightly inconsistent with the existing
Buildroot manual (see customize-store.txt), where the root filesystem
overlay subdirectory is named "fs-overlay", and the kernel
configuration is named "linux.config".

> +The main usage of this is to store package recipes. The recommended
> +   way to do this is to write a +BR2_EXTERNAL/Config.in+ that looks
> +   like:
> ++
> +------
> +menu "<somecompany> packages"
> +
> +source "$BR2_EXTERNAL/package/package1/Config.in"
> +source "$BR2_EXTERNAL/package/package2/Config.in"
> +
> +endmenu
> +------

Shouldn't this rather be in the $BR2_EXTERNAL/package/Config.in file
(which appears in your example overlay directory layout tree diagram),
which should itself be sourced from the $BR2_EXTERNAL/Config.in file?

Simon.
