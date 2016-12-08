From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Dec 2016 22:06:48 +0100
Subject: [Buildroot] [PATXH v3 2/2] package/xen: Disable strict
 unused-const-variable checking
In-Reply-To: <1481227872-31723-3-git-send-email-alistair.francis@xilinx.com>
References: <1481227872-31723-1-git-send-email-alistair.francis@xilinx.com>
 <1481227872-31723-3-git-send-email-alistair.francis@xilinx.com>
Message-ID: <20161208220648.3361d86d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 8 Dec 2016 12:11:12 -0800, Alistair Francis wrote:

> + CFLAGS += -Werror -Wno-format-zero-length -Wmissing-declarations \
> +-	-Wno-declaration-after-statement -Wformat-nonliteral
> ++	-Wno-declaration-after-statement -Wformat-nonliteral \
> ++	-Werror=unused-const-variable=0

Sorry for not catching this earlier, but what we want instead is to
completely remove -Werror. It's pointless for releases, and is causing
to cause other build failures.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
