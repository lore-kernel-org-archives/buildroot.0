From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Apr 2014 21:39:24 +0200
Subject: [Buildroot] [PATCH 1/1] linux: Don't enable DEVTMPFS support
 for kernels older than 3.x.
In-Reply-To: <1397849296-5517-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1397849296-5517-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20140418213924.6d5a3ebf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Fri, 18 Apr 2014 14:28:16 -0500, Ryan Barnett wrote:
> From: Matt Poduska <mjpodusk@rockwellcollins.com>
> 
> In the case where DEVTMPFS is desired for older kernels where the
> support is experimental, it's still possible to enable the option in
> the board's specific linux .config instead of relying on buildroot to
> make the modification.
> 
> Signed-off-by: Matt Poduska <mjpodusk@rockwellcollins.com>
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---
>  linux/linux.mk |    8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Which problem is this fixing? I remember having used devtmpfs prior to
3.x, and it was working well. For versions prior to 2.6.32, the
linux.mk code will set this option that doesn't exist, and the kconfig
code of the kernel will simply get rid of it, without any consequences.

So I'd like to understand the "why" of this patch :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
