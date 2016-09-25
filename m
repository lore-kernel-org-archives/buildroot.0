From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Sep 2016 22:00:07 +0200
Subject: [Buildroot] [PATCH] xvisor: needs gcc >= 4.9
In-Reply-To: <1474721260-6810-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1474721260-6810-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160925220007.0e585fb5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Sep 2016 14:47:40 +0200, Eric Le Bihan wrote:
> xvisor needs gcc >= 4.9, as previous versions trigger an ICE on
> dwarf2out_frame_debug_adjust_cfa() [1].
> 
> Fixes:
> 
>  - http://autobuild.buildroot.net/results/fdb/fdb5a568fb38a9d20780cd37eecb71b60b6ca96a/
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60264
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/xvisor/Config.in | 7 +++++++
>  1 file changed, 7 insertions(+)

I've applied to master, after adding before a patch that adds a
BR2_PACKAGE_XVISOR_ARCH_SUPPORTS option, in order to avoid repeating
the architecture dependencies between the main option and the comment.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
