From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 17:03:07 +0200
Subject: [Buildroot] [PATCH 3/4 v8] package/linux-backports: new package
In-Reply-To: <fc089d79e34b8b07a9e1e04c7a9cb0c179554ce7.1437576751.git.yann.morin.1998@free.fr>
References: <cover.1437576751.git.yann.morin.1998@free.fr>
 <fc089d79e34b8b07a9e1e04c7a9cb0c179554ce7.1437576751.git.yann.morin.1998@free.fr>
Message-ID: <20150722170307.5451a658@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 22 Jul 2015 16:58:54 +0200, Yann E. MORIN wrote:

> +linux-backports-check-kernel-version: $(BUILD_DIR)/linux-$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))/.config

Doesn't this fail really badly if:

LINUX_OVERRIDE_SRCDIR = <some value>

 ?

In this case, $(LINUX_DIR) is $(BUILD_DIR)/linux-custom/ and not
$(BUILD_DIR)/linux-$(call qstrip,$(BR2_LINUX_KERNEL_VERSION)).

Argh :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
