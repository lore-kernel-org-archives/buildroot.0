From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 18:02:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtc: fix include guards for
 older kernel/u-boot
In-Reply-To: <20181008115146.17797-1-lothar.felten@gmail.com>
References: <20181008115146.17797-1-lothar.felten@gmail.com>
Message-ID: <20181008180230.53ab7972@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Oct 2018 13:51:46 +0200, Lothar Felten wrote:
> Patch dtc to accept libfdt include guards with and without leading underscore.
> A compiler warning is added to notify the user.
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>

So I guess this would fix the problem when host-dtc is built before
some old Linux/U-Boot version.

However, I suppose it doesn't fix the problem when you have a
recent version of libfdt installed on your system (through your
distribution), that doesn't play well with those older Linux/U-Boot
versions. Correct ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
