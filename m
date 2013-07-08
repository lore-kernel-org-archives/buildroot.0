From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sun, 7 Jul 2013 22:27:49 -0500
Subject: [Buildroot] [PATCH v3 2/2] qt: add powervr and opengl
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB6A448@DBDE04.ent.ti.com>
References: <1373217165-14521-1-git-send-email-spenser@gillilanding.com>
 <1373217165-14521-2-git-send-email-spenser@gillilanding.com>
 <321768C95D21724485BCE784F1BE98473EB6A448@DBDE04.ent.ti.com>
Message-ID: <CAEBucnCNkD0VfqjgL7d3Rkt_+-wcj34BkZkLSO3cPRkXkm+v=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Prabu,

> Thanks, some quick comments:
>
> - Can you also specify where the pvr2d.h and wsegl.h are picked up from (which Graphics SDK version) ?

Ahh, this is something I missed while porting the patch. I'll have to
look at this some more, these should be from the latest version.  I'll
try to get qt to pick these up from $(STAGING_DIR)/usr/include .

> - Can you also specify the caveat:-  If Qt is built with a different version of wsegl/pvr2d, that is not compatible with the version of Graphics SDK used, it can cause crash/blank screens.  So the pvr2d/wsegl files have to be picked up from the SDK version that is used for the install of the drivers in the currently used filesystem. For example, pvr2d.h used in the below patch is not the latest (PVR2D_REV_MINOR is 5, latest is at 6)

This will be fixed.  I'm only planning to support using the TI
Graphics from within Buildroot (i.e. patch 1 of this series.)

There will be a rev 4 with the fix described above.

Thanks,
Spenser
--
Spenser Gilliland
Computer Engineer
Doctoral Candidate                                       PVR2D_VOID *pMem,
