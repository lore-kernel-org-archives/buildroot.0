From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Apr 2019 22:29:35 +0200
Subject: [Buildroot] [PATCH 09/13] board: friendlyarm: nanopi-m1-plus:
 patches: Remove linux patch
In-Reply-To: <20190408151057.14455-9-shyam.saini@amarulasolutions.com>
References: <20190408151057.14455-1-shyam.saini@amarulasolutions.com>
 <20190408151057.14455-9-shyam.saini@amarulasolutions.com>
Message-ID: <20190408222935.0d87c354@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Apr 2019 20:40:53 +0530
Shyam Saini <shyam.saini@amarulasolutions.com> wrote:

> Prior to linux v4.13, there was no support for Nanopi M1 Plus so we used
> a custom device tree patch file for this puspose. In the preceeding patch,
> linux is bumped to newer version which has support for the board in question
> and thus makes this patch file obselete. So lets drop it.

There is no "preceeding patch" that bumps the Linux version. It's PATCH
12/13 that does this, i.e afterwards. This means your series is not
bisectable: if I apply up to PATCH 09/13 included, but not the rest of
the series, the build of the defconfig is broken.

This change must be squashed into the patch updating the defconfig.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
