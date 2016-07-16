From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 16:43:28 +0200
Subject: [Buildroot] [PATCH] package/alljoyn: needs
 BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <1468676694-14108-1-git-send-email-romain.naour@gmail.com>
References: <1468676694-14108-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160716164328.6040cb26@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Jul 2016 15:44:54 +0200, Romain Naour wrote:
> After applying a patch like [1], the build failed with the following
> error:
> liballjoyn_c.a(Message.o): In function `alljoyn_message_destroy':
> Message.cc:(.text+0x74): undefined reference to `__sync_sub_and_fetch_4'
> liballjoyn.so: undefined reference to `__sync_bool_compare_and_swap_4'
> liballjoyn.so: undefined reference to `__sync_add_and_fetch_4'
> 
> So, add dependency on BR2_TOOLCHAIN_HAS_SYNC_4 which also disable the
> alljoyn build on sparc.
> 
> [1] https://git.buildroot.org/buildroot/commit/?id=c5e96d8935016456bea342db170ae6a139a8470f
> 
> Fixes:
> http://autobuild.buildroot.net/results/cea/cea62a7ed7f1eda6f817d8e27fd645942def25ec
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/alljoyn/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
