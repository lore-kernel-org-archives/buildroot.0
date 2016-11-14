From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 22:55:53 +0100
Subject: [Buildroot] [PATCH] package/gcc: backport xtensa trap pattern
 for 5.x
In-Reply-To: <1479117941-14895-1-git-send-email-jcmvbkbc@gmail.com>
References: <1479117941-14895-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20161114225553.0adf1094@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Nov 2016 02:05:41 -0800, Max Filippov wrote:
> gcc 5.x uses trap pattern extensively to mark locations where program
> execution should never get. Default pattern implementation emits a call
> to 'abort' function. This function however is not always available, e.g.
> it's not available for the libc dynamic linker. Backport implementation
> of the trap pattern for xtensa that does not result in a call to
> 'abort'.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/0fbcc4475545904bf88f25a3bdf3ee552bf4960e
>   http://autobuild.buildroot.net/results/cb7f5bdfac615d774f3bcd1b802f8d74460bc557
>   http://autobuild.buildroot.net/results/cf3dc9ae4f74ff28b285f1a862b71d96384d7651
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  .../5.4.0/875-xtensa-implement-trap-pattern.patch  | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 package/gcc/5.4.0/875-xtensa-implement-trap-pattern.patch

Applied to master, thanks. However, I'm wondering if this backport
should also be done on gcc versions earlier than 5.x. Could you clarify
this point?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
