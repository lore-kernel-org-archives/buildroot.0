From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 21:42:39 +0200
Subject: [Buildroot] [PATCH] package/binutils: fix crash caused by buggy
 xtensa overlay
In-Reply-To: <1501699220-3055-1-git-send-email-jcmvbkbc@gmail.com>
References: <1501699220-3055-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20170802214239.7ed1d94d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 Aug 2017 11:40:20 -0700, Max Filippov wrote:
> In some xtensa configurations there may be system/user registers in
> xtensa-modules with negative index. ISA initialization for such config
> may clobber heap and result in program termination.
> Don't update lookup table entries for register with negative indices.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  ...a-fix-memory-corruption-by-broken-sysregs.patch | 42 ++++++++++++++++++++++
>  ...a-fix-memory-corruption-by-broken-sysregs.patch | 42 ++++++++++++++++++++++
>  ...a-fix-memory-corruption-by-broken-sysregs.patch | 42 ++++++++++++++++++++++
>  3 files changed, 126 insertions(+)
>  create mode 100644 package/binutils/2.27/0131-xtensa-fix-memory-corruption-by-broken-sysregs.patch
>  create mode 100644 package/binutils/2.28.1/0131-xtensa-fix-memory-corruption-by-broken-sysregs.patch
>  create mode 100644 package/binutils/2.29/0008-xtensa-fix-memory-corruption-by-broken-sysregs.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
