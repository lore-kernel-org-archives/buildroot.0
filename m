From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Oct 2018 10:05:12 +0200
Subject: [Buildroot] [PATCH 1/1] haproxy: put back dependency on
 __sync_*_4
In-Reply-To: <20181005194527.12140-1-fontaine.fabrice@gmail.com>
References: <20181005194527.12140-1-fontaine.fabrice@gmail.com>
Message-ID: <20181014100512.7c25f449@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 Oct 2018 21:45:27 +0200, Fabrice Fontaine wrote:
> __sync_*_4 intrinsics is used by common/hathreads.h when gcc < 4.7 but
> also by contrib/tcploop.c or include/proto/shctx.h so put back a
> mandatory dependency on BR2_TOOLCHAIN_HAS_SYNC_4 which has been wrongly
> removed by patch 978001

When referencing commits, please use the Git commit hash and its commit
title and not the patchwork ID. I.e, like this:

    __sync_*_4 intrinsics is used by common/hathreads.h when gcc < 4.7 but
    also by contrib/tcploop.c or include/proto/shctx.h so put back a
    mandatory dependency on BR2_TOOLCHAIN_HAS_SYNC_4 which has been
    wrongly removed by commit f22fca4bf27f884950dd7804020e5d5193b570b9
    ("haproxy: tweak thread activation").

I've applied after fixing this. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
