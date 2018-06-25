From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jun 2018 21:42:11 +0200
Subject: [Buildroot] [PATCH] gdb: add patch to fix noMMU build issue
In-Reply-To: <20180625080738.8145-1-thomas.petazzoni@bootlin.com>
References: <20180625080738.8145-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180625214211.1892523e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jun 2018 10:07:38 +0200, Thomas Petazzoni wrote:
> This commit adds a patch to fix a build issue encountered on noMMU
> architectures when building gdbserver, due to the use of fork()
> instead of vfork().
> 
> The patch has been submitted upstream:
> 
>   https://sourceware.org/ml/gdb-patches/2018-06/msg00569.html
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...-nat-fork-inferior-include-linux-ptrace.h.patch | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 package/gdb/8.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
