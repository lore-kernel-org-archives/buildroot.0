From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2016 12:56:55 +0200
Subject: [Buildroot] [PATCH 2/2 v3] docs/manual: update the linux tools
 section
In-Reply-To: <bdadcf3de3e5617f0492d88329476963a06fad44.1473171931.git.yann.morin.1998@free.fr>
References: <cover.1473171931.git.yann.morin.1998@free.fr>
 <bdadcf3de3e5617f0492d88329476963a06fad44.1473171931.git.yann.morin.1998@free.fr>
Message-ID: <20160922125655.69a5b900@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Sep 2016 16:29:15 +0200, Yann E. MORIN wrote:

>  ------------------------------
> -01: config BR2_LINUX_KERNEL_TOOL_FOO
> +01: config BR2_PACKAGE_LINUX_TOOLS_FOO
>  02: 	bool "foo"

This example lacks the "select BR2_PACKAGE_LINUX_TOOLS" which I believe
is now very important to mention.


> +16: 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/linux/tools \

Why $(@D)/linux/tools ? This doesn't seem right. I've changed it to
$(LINUX_DIR)/tools, which is what packages really use.

Committed with those issues fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
