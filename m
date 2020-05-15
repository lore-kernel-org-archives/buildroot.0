From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 23:22:25 +0200
Subject: [Buildroot] [PATCH] package/tio: fix build with termio
 redefinition
In-Reply-To: <20200511142602.46170-1-vadim4j@gmail.com>
References: <20200511142602.46170-1-vadim4j@gmail.com>
Message-ID: <20200515232225.760def53@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 May 2020 17:26:02 +0300
Vadym Kochan <vadim4j@gmail.com> wrote:

> Include termbits.h from asm-generic/ which does not have termio
> definition which is already defined by sys/ioctl.h -> ioctl-types.h
> 
> Same approach is also used by flashrom tool.
> 
> Fixes: http://autobuild.buildroot.net/results/076d5f166631450d25f25916381f0bfd6f1d58da
> 
> Signed-off-by: Vadym Kochan <vadim4j@gmail.com>

A similar change was already submitted upstream by Fabrice Fontaine:

  https://github.com/tio/tio/pull/98/commits/7a84120f7bfbe698fa8050953b7a3e7a7dc63ca0

And it was submitted to Buildroot, and it was already rejected. Indeed,
including <asm-generic/...> headers from user-space is bad.

See some discussion in the picocom source code at
https://github.com/npat-efault/picocom/blob/master/termbits2.h#L37 for
more details about this issue.

Unfortunately, it doesn't seem like there is an easy fix available,
short of replicating what picocom did.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
