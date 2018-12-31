From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 14:39:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/udisks: Fix compilation issue
 with missing sys/sysmacros.h
In-Reply-To: <20181231091551.6335-1-vadim4j@gmail.com>
References: <20181231091551.6335-1-vadim4j@gmail.com>
Message-ID: <20181231143937.5007b30a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Dec 2018 11:15:51 +0200, Vadim Kochan wrote:
> It fixes compilation error with undefined "minor", "major" and
> "makedev" objects which caused by missing include of <sys/sysmacros.h>
> 
> These definitions were moved to <sys/sysmacros.h> in newer gibc.

It is not really that they have been moved: they were already in
sysmacros.h. However, sysmacros.h used to be included by sys/types.h,
and this inclusion got removed, so sysmacros.h must now be included
explicitly.

I fixed this in the commit log and in the patch description, made other
minor tweaks in the commit log, and applied. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
