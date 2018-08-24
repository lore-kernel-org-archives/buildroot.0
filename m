From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 13:49:00 +0200
Subject: [Buildroot] [PATCH] package/rauc: needs kernel headers >= 3.0
In-Reply-To: <20180824080217.16181-1-yann.morin.1998@free.fr>
References: <20180824080217.16181-1-yann.morin.1998@free.fr>
Message-ID: <20180824134900.1ccc9c2c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Aug 2018 10:02:17 +0200, Yann E. MORIN wrote:
> rauc includes <linux/mmc/ioctl.h> which was introduced only in
> linux 3.0.
> 
> Also change order to have arch dependencies first.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Andrey Yurovsky <yurovsky@gmail.com>

As discussed separately, this only solves the problem for the target
build, and not for the host build. So, I would prefer a solution that
adjusts the RAUC code to build with headers < 3.0, so that we solve
both the host and the target problem@the same time.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
