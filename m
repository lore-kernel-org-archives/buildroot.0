From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 16:02:47 +0200
Subject: [Buildroot] [PATCH v2 1/2] Strip binaries in the rootfs
 creation instead of in target-finalize
In-Reply-To: <20191001013654.22298-2-unixmania@gmail.com>
References: <20191001013654.22298-1-unixmania@gmail.com>
 <20191001013654.22298-2-unixmania@gmail.com>
Message-ID: <20200413160247.6e8ee01b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Mon, 30 Sep 2019 22:36:53 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Since commit 118534fe54 the root filesystem image is generated from a
> temporary copy of TARGET_DIR, so we can strip the binaries in the copy,
> only.
> 
> This allows us to easily find the non-stripped executables to debug with
> gdbserver, as they are at the same relative path in TARGET_DIR as in the
> target device, rather than searching inside the build directory.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=10386
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> CC: Ciro Santilli <ciro.santilli@gmail.com>
> ---
> Changes v1->v2:
> - Strip before running the fakeroot script, as suggested by Arnout
>   Vandecappelle
> - Change commit message accordingly. Removed paragraph about setting
>   sysroot to TARGET_DIR in gdb, which is done in the next commit.
> ---
>  Makefile     | 34 ----------------------------------
>  fs/common.mk | 36 +++++++++++++++++++++++++++++++++++-
>  2 files changed, 35 insertions(+), 35 deletions(-)

There's been feedback from both Yann and me on this patch, and both of
us think this is not the approach we want to take. Instead, we'd rather
see everything installed to STAGING_DIR as the way of fixing the
original issue.

So I've marked both patches as Rejected in patchwork. Of course, if
other people disagree with this decision, we can always revisit and
rediscuss the matter.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
