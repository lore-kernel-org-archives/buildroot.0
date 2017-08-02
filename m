From: Mason <slash.tmp@free.fr>
Date: Wed, 2 Aug 2017 11:39:04 +0200
Subject: [Buildroot] Policy for upgrading toolchains in LTS version
In-Reply-To: <3fa81af3-4372-6a67-5fb9-3717549b0350@free.fr>
References: <232c0fde-c837-ccfd-949c-eeec82a24fdb@free.fr>
 <20170622192701.GC3054@scaer> <443c0c3b-683b-935d-1b4e-c020a406bcc3@free.fr>
 <87a84zkw97.fsf@dell.be.48ers.dk>
 <3fa81af3-4372-6a67-5fb9-3717549b0350@free.fr>
Message-ID: <6589d153-b760-1284-6975-89fb29a14c99@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/06/2017 16:15, Mason wrote:

> As previously mentioned, IIUC, Linaro is preparing an
> OOB release addressing "stack clash". I plan to wait
> for that release, and then send a patch, is that OK?

Hello Peter,

yroux has confirmed that the updated toolchain is not
ready yet ("the stack clash mitigation patchset is still
under discussion/review on GCC list").

There will be an update to GCC 6.4 in 2-3 weeks which will
include the mitigation patches *if* they are ready.

In the mean time, could you cherry-pick:

641fe0e39240 toolchain-external: bump Linaro AArch64 toolchain to 2017.02
52f059f38d46 toolchain-external: bump Linaro ARMeb toolchain to 2017.02
075d26900b4f toolchain-external: bump Linaro ARM toolchain to 2017.02

onto the 2017.02.x branch, so that it is in sync with master?

Regards.
