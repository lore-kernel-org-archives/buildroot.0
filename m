From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 23:05:23 +0200
Subject: [Buildroot] [PATCH V4 08/11] package/gdb: Add C-SKY support
In-Reply-To: <1559284748-32011-9-git-send-email-guoren@kernel.org>
References: <1559284748-32011-1-git-send-email-guoren@kernel.org>
 <1559284748-32011-9-git-send-email-guoren@kernel.org>
Message-ID: <20190531230523.28b2f5e9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Guo,

On Fri, 31 May 2019 14:39:05 +0800
guoren at kernel.org wrote:

> From: Guo Ren <ren_guo@c-sky.com>
> 
> Add gdb build for C-SKY Architecture:
> 
>  - Support host-gdb
>  - Support gdbserver for target

You had forgotten a "depends on !BR2_csky" in package/gdb/Config.in to
prevent "full gdb" from being selected. Indeed, building the full gdb
on the target is not supported on C-SKY yet. I fixed that before
applying.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
