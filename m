From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 23:41:18 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_LIBATOMIC
In-Reply-To: <1457297237-4064-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1457297237-4064-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160320234118.106809e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  6 Mar 2016 21:47:16 +0100, Thomas Petazzoni wrote:
> Until now, we were assuming that whenever you have gcc 4.8, libatomic
> is available. It turns out that this is not correct, since libatomic
> will not be available if thread support is disabled in the toolchain.
> 
> Therefore, __atomic_*() intrinsics may not be available even if the
> toolchain uses gcc 4.8.
> 
> To solve this problem, we introduce a BR2_TOOLCHAIN_HAS_LIBATOMIC
> boolean, which indicates whether the toolchain has libatomic. It is
> the case when you are using gcc >= 4.8 *and* thread support is
> enabled. We then use this new BR2_TOOLCHAIN_HAS_LIBATOMIC to define
> BR2_TOOLCHAIN_HAS_ATOMIC.
> 
> As explained in the comment, on certain architectures, libatomic is
> technically not needed to provide the __atomic_*() intrinsics since
> they might be all built-in. However, since libatomic is only absent in
> non-thread capable toolchains, it is not worth making things more
> complex for such seldomly used configuration.
> 
> Note that we are introducing the intermediate
> BR2_TOOLCHAIN_HAS_LIBATOMIC option because it will be useful on its
> own for certain packages.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-common.in | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)

I've applied, after modifying the Config.in comment as suggested by
Yann. I've also applied PATCH 2/2, which had Yann's Reviewed-by.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
