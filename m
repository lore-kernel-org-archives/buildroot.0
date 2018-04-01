From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 00:42:26 +0200
Subject: [Buildroot] [PATCH] board/ci20: Fix U-Boot build failure
In-Reply-To: <1522621901.1665.1.camel@collabora.com>
References: <20180401135035.29655-1-ezequiel@collabora.com>
 <20180401160555.36587bd1@windsurf>
 <1522621901.1665.1.camel@collabora.com>
Message-ID: <20180402004226.71aa48eb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 01 Apr 2018 19:31:41 -0300, Ezequiel Garcia wrote:

> I was testing on top of a recent master:
> 
> commit 53e1b222533fd110ab9472480ded126a4762db5e (origin/master,
> origin/HEAD)
> Author: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Date:   Sat Mar 31 15:27:36 2018 +0200
> 
>     package/docker-proxy: convert to golang infrastructure
> 
> ... just tested on top of current master, same error is thrown if there
>  are no output/host/include/libfdt* files.
> 
> Can you point me at the recent fixes?

I was thinking about:

f437bf547ca44849db4578c31707afdd96b85018 uboot: fix build for older uboot source trees
bf733342324b414a1142b57781504111f81c97ea uboot: fix build when libfdt-devel is installed system-wide
0bf80e4bcd5277e3ad935e03c632deba4c7316f2 uboot: ensure host includes are searched before system default includes
b15a7a62d3f992af3fa8eca1e358735c47b64390 uboot: revert "uboot: use local libfdt.h"
baae5156ce37e8b2775f04710f7d1c8e97e4114c uboot: use local fdt headers

But you have all of these. So we have another issue, it seems.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
