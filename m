From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jul 2019 22:34:15 +0200
Subject: [Buildroot] [PATCH] package/gcc: 9.1.0: Fix ICE for ARC
In-Reply-To: <20190716214725.6206-1-abrodkin@synopsys.com>
References: <20190716214725.6206-1-abrodkin@synopsys.com>
Message-ID: <20190718223415.4f279682@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Jul 2019 00:47:25 +0300
Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:

> In a nutshell while compiling Gibc GCC catches Internal Compiler Error (ICE).
> 
> This is a backport of upstream fix [1] for GCC's BUG #89838 [2].
> Fix is the same as previously was done for arc-2019.03 [3].
> 
> With update of GCC to 9.2.0 and above this patch won't be needed
> as it's already merged in both stable "gcc-9-branch" and "master".
> 
> [1] https://github.com/gcc-mirror/gcc/commit/472bac30e63ffacecfa5eda813054555f2cc7def
> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=89838
> [3] https://git.buildroot.org/buildroot/commit/?h=dbf7fffb37e25c40fd5c03d0a64e50a1bba86424
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Evgeniy Didin <didin@synopsys.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  .../gcc/9.1.0/0001-ARC-Backport-fix-PR89838.patch  | 367 +++++++++++++++++++++
>  1 file changed, 367 insertions(+)
>  create mode 100644 package/gcc/9.1.0/0001-ARC-Backport-fix-PR89838.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
