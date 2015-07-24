From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jul 2015 11:32:44 +0200
Subject: [Buildroot] [PATCH] package/gcc: fix libgcc build for xtensa
In-Reply-To: <1437730231-22278-1-git-send-email-jcmvbkbc@gmail.com>
References: <1437730231-22278-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20150724113244.61809b39@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Fri, 24 Jul 2015 12:30:31 +0300, Max Filippov wrote:
> xtensa libgcc can't be built with -mtext-section-literals flag, now
> coming from TARGET_CFLAGS, because it needs to emit literals to
> .init/.fini sections, which is not currently supported.
> 
> Filter -mtext-section-literals flag out of GCC_COMMON_TARGET_CFLAGS.
> 
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/gcc/gcc.mk |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
