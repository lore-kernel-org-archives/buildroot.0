From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 11:32:16 +0200
Subject: [Buildroot] [PATCH v2 1/9] toolchain: Add config option for
 atomic intrinsics
In-Reply-To: <1406813090-32472-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <20140730084548.05bd6dec@free-electrons.com>
 <1406813090-32472-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <20140803113216.03e0fb94@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Kolesov,

On Thu, 31 Jul 2014 17:24:42 +0400, Anton Kolesov wrote:
> GCC has several builtin functions that implement atomic operations. Those
> functions are architecture specific and may not be implemented by the
> specific toolchain. In case of GCC for ARC those functions rely on
> LLOCK/SCOND instructions which are optional in ARC CPU's. If ARC CPU doesn't
> support those instructions but software tries to use them, then application
> will be aborted with Illegal instruction exception. To avoid confusion user
> should first specify that their CPU supports atomic extension, which will
> allow selection of packages that use builtin atomic functions.
> 
> Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>

I have applied the following patches from your series:

3ebdc64dcc687a95dd4fed7eda8ff811d2db0eaf thrift: Add dependency on atomic intrinsics
b6f9dd2a389c1f4da858c928bf48f8baec461082 libtorrent: Add dependency on atomic intrinsics
b7a791a103d21835d0e3fb8accfb58346330560f icu: Add dependency on atomic intrinsics
b35d1582346625a7076de0a44958d5c5133103d2 jack2: Add dependency on atomic intrinsics
cbffd50561f7ce595296bddaf108031e501b2063 toolchain: Add config option for atomic intrinsics

I did not apply the other patches, because they were missing the
propagation of the atomic intrinsics dependency to the reverse
depencies of the package needing atomic intrinsics. For example, in
PATCH 2/9, you add the dependency on atomic intrinsics to Cairo, but
nowhere you propagate that to the reverse dependencies of Cairo. Could
you send an updated version of those patches, taking into account this
need?

Also, could you send a patch against the Buildroot manual that
documents the atomic intrinsics dependency, like we document
dependencies like wchar, largefile, ipv6 and so on.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
