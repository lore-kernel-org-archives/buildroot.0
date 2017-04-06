From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:29:29 +0200
Subject: [Buildroot] [PATCH v3] linux: Add CIP SLTS easy selection option
In-Reply-To: <1491497905-18810-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1491497905-18810-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20170406222929.7a395880@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Apr 2017 18:58:25 +0200, Angelo Compagnucci wrote:
> This patch adds an easy way to select the CIP project SLTS
> kernel within the kernel menu.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

I've applied after doing a few tweaks, see below.

> +config BR2_CIP_KERNEL_REPO_URL
> +	string "CIP SLTS (SuperLong Term Support) kernel url"
> +	default "git://git.kernel.org/pub/scm/linux/kernel/git/bwh/linux-cip.git"

I've completely dropped this option. Indeed, it is already possible
without your patch to select a custom Git repository to download the
kernel. So having yet another option to do that is useless. If you want
to use a custom CIP repository, just use the existing
BR2_LINUX_KERNEL_CUSTOM_GIT option.



> +	help
> +	  CIP launched in the spring of 2016 to address the needs of
> +	  organizations in industries such as power generation and
> +	  distribution, water, oil and gas, transportation, building
> +	  automation and more for reliable and secure Linux-based
> +	  embedded systems that can be sustained over a period of
> +	  10 to as many as 60 years.
> +	  The project's goal is to provide an open source base layer
> +	  of industrial-grade software that permits the use and
> +	  implementation of software building blocks that meet
> +	  these requirements.
> +
> +	  The CIP community plans to maintain 4.4 for security and
> +	  bug fixes for more than 10 years.

Since this help text was useful, I've moved it under the
BR2_LINUX_KERNEL_LATEST_CIP_VERSION option.

> +config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> +	bool "Latest CIP SLTS (Super Long Term Support) version (v4.4.55-cip3)"

This prompt was too long and didn't fit in the menuconfig window. So
I've removed the "(Super Long Term Support)" part of it, which is
anyway explained in the help text.

Applied with those two changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
