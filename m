From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 22:43:00 +0200
Subject: [Buildroot] [PATCH] wine: Depend on shared libraries
In-Reply-To: <1521143154-19605-1-git-send-email-nerv@dawncrow.de>
References: <1521143154-19605-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20180331224300.78d89111@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Mar 2018 20:45:54 +0100, Andr? Hentschel wrote:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>

I did a test build, and indeed discovered that wine tries to
unconditionally build a shared library.

I've added a Config.in comment, which required adding a
BR2_PACKAGE_WINE_ARCH_SUPPORTS hidden boolean, and extended the commit
log significantly to explain why we do this change.

And then I've applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
