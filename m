From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 15:02:46 +0100
Subject: [Buildroot] [PATCH v2 for-master] package/gdb: backport uptream
 fix for simulator build issue with bfin
In-Reply-To: <20170211225119.2986-1-romain.naour@gmail.com>
References: <20170211225119.2986-1-romain.naour@gmail.com>
Message-ID: <20170212150246.4b2e998b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Feb 2017 23:51:19 +0100, Romain Naour wrote:
> This revert the commit [1] which break the simulator for aarch64.
> Backport the upstream fix instead (from 7.12).
> 
> [1] f71ad71f24fbeca1a81cc9efe79016a7db6f1320
> 
> Tested with gcc 4.4.5 (debian squeeze chroot).
> 
> Fixes:
> http://autobuild.buildroot.net/results/cfd/cfdc9117fef7ecdf5cc5fc907a6fe8701a2c174a
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> v2: add my SoB line in the backported patch
> ---
>  .../0001-Revert-sim-unify-SIM_CPU-definition.patch | 355 ---------------------
>  ...lit-out-common-mach-model-defines-into-ar.patch | 155 +++++++++
>  2 files changed, 155 insertions(+), 355 deletions(-)
>  delete mode 100644 package/gdb/7.11.1/0001-Revert-sim-unify-SIM_CPU-definition.patch
>  create mode 100644 package/gdb/7.11.1/0001-sim-bfin-split-out-common-mach-model-defines-into-ar.patch

Applied to master, thanks (after fixing the minor typo in the commit
title, as noticed by Peter Seider).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
