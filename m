From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 11:54:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/gauche: fix musl build issue
In-Reply-To: <1450349254-18577-1-git-send-email-joerg.krause@embedded.rocks>
References: <1450349254-18577-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151217115404.7927666a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu, 17 Dec 2015 11:47:34 +0100, J?rg Krause wrote:
> Add a patch from upstream to fix a musl build issue:
> 
>   In file included from os_dep.c:44:0:
>   /home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/asm/sigcontext.h:9:8: error: redefinition of 'struct sigcontext'
>    struct sigcontext {
>           ^
>   In file included from /home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/signal.h:243:0,
>                    from ./include/private/../gc_pthread_redirects.h:42,
>                    from ./include/private/../gc.h:1443,
>                    from ./include/private/gc_priv.h:46,
>                    from os_dep.c:17:
>   /home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/bits/signal.h:11:16: note: originally defined here
>    typedef struct sigcontext
> 
> The Linux headers sigcontext and asm/sigcontext are no longer used and were
> replaced with ucontext_t in GC 7.0alpha1 (gauche uses a private copy of bdwgc).
> 
> Fixes:
> http://autobuild.buildroot.net/results/411/4111ea586143410649b78c8dfc737f0f83d78441/
> http://autobuild.buildroot.net/results/b19/b19dbcc7ddf0f24472afcecf4c684915045550bf/
> http://autobuild.buildroot.net/results/9eb/9ebf7ad0d721433dcc8523a55d08ca074d037e58/
> http://autobuild.buildroot.net/results/223/22328dbe8ea86c59ceff3ba40da1d9ef39e10533/
> and many more.
> 
> Fetch from:
> https://github.com/shirok/Gauche/commit/13a196557848f22a1607a300643131345e9f32b3
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/gauche/gauche.hash | 1 +
>  package/gauche/gauche.mk   | 1 +
>  2 files changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
