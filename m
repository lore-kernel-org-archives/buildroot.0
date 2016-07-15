From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 09:52:14 +0200
Subject: [Buildroot] [PATCH] jemalloc: fix sparc64 build
In-Reply-To: <1468530719-12814-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1468530719-12814-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160715095214.74766065@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Jul 2016 23:11:59 +0200, Eric Le Bihan wrote:
> GCC 4.9.3 for sparc64 defines __sparc_v9__, not __sparc64__ nor
> __sparcv9 (as reported by `gcc -dM -E - < /dev/null | egrep 'sparc|arch'`).
> 
> This prevents LG_QUANTUM from being properly defined. Adding this new
> value solves the issue.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/95d/95df560b13be7abbce6aeeb3ed0f0814d597bd08/
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  ...001-Fix-LG_QUANTUM-definition-for-sparc64.patch | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/jemalloc/0001-Fix-LG_QUANTUM-definition-for-sparc64.patch

Applied to master, thanks. Please submit the patch upstream to the
jemalloc project. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
