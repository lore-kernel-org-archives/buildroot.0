From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 14:17:58 +0100
Subject: [Buildroot] [PATCH-for-master] package/dtc: additional fix of
 include guards for older u-boot
In-Reply-To: <20190221125652.14226-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Thu, 21 Feb 2019 13:56:51 +0100")
References: <20190221125652.14226-1-patrickdepinguin@gmail.com>
Message-ID: <87k1hsj721.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > With recent dtc but old u-boot, compilation issues occur related to libfdt.
 > These problems really are u-boot issue since it does not properly set
 > include paths so that its own headers are included. Nevertheless, since the
 > u-boot version is typically decided by users and stuck at some version
 > provided by a SoC or board vendor, it is not feasible to fix those old
 > versions.

 > Instead, already several fixes were made in the past, in Buildroot.
 > See commits:

 > c7ffd8a75d5 "package/dtc: fix include guards for older kernel/u-boot"
 > f437bf547ca "uboot: fix build for older uboot source trees"
 > bf733342324 "uboot: fix build when libfdt-devel is installed system-wide"
 > 0bf80e4bcd5 "uboot: ensure host includes are searched before system default
 >                 includes"
 > b15a7a62d3f "uboot: revert "uboot: use local libfdt.h""
 > baae5156ce3 "uboot: use local fdt headers"
 > 3a6573ccee2 "uboot: use local libfdt.h"

 > Commit c7ffd8a75d55e24d793106eabbb80964ab91081f fixes the problem caused by
 > dtc having changed their include guards from _FOO_H to FOO_H (leading
 > underscore removed). Old u-boot would still use _FOO_H, which (combined with
 > host-dtc headers that use FOO_H) would cause the inclusion of two different
 > copies of the same nominal include file, e.g. libfdt.h or libfdt_env.h,
 > causing 'error: redefinition of xxx' compilation issues.
 > The fix sets the 'new' include guard when the 'old' one is detected,
 > preventing a second inclusion of the same nominal file.

 > For some u-boot versions, however, this change not only needs to be made in
 > libfdt.h and libfdt_env.h, but also in 'fdt.h'.

 > Update the dtc patch to do just that.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
