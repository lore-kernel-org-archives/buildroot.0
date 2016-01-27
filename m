From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 21:58:10 +0100
Subject: [Buildroot] [PATCH 1/1] OrangePi PC addition to build root
In-Reply-To: <1450962484-90787-1-git-send-email-echaudron@xiot.nl>
References: <1450962484-90787-1-git-send-email-echaudron@xiot.nl>
Message-ID: <20160127215810.6270bb5f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eelco,

On Thu, 24 Dec 2015 14:08:04 +0100, Eelco Chaudron wrote:

> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/jwrdegoede/linux-sunxi.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="a516ac6dda21e6f5edceecd08b475b16e360656b"

Your defconfig for the OrangePi PC no longer works. You used a specific
commit from Hans De Goede repository, but his branches are not stable
(i.e he is constantly rebasing them). So the commit
a516ac6dda21e6f5edceecd08b475b16e360656b no longer exists.

Could you send a patch to update the defconfig to use the mainline
4.5-rc1 kernel, which according to my colleague Maxime Ripard, contains
the support for the Orange Pi PC platform ?

You can see the failure caused by the current defconfig at
https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/105029977.
Note that if you try to rebuild the defconfig on your side, it may work
because you have linux-a516ac6dda21e6f5edceecd08b475b16e360656b.tar.gz
in your $(BR2_DL_DIR). But new users using your defconfig are no longer
able to download this kernel version.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
