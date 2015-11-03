From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 23:50:20 +0100
Subject: [Buildroot] [PATCH] arch/arm: VFP and Thumb1 are not compatible
In-Reply-To: <1446507277-26679-1-git-send-email-yann.morin.1998@free.fr>
References: <1446507277-26679-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151103235020.20e50c91@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue,  3 Nov 2015 00:34:37 +0100, Yann E. MORIN wrote:
> gcc will refuse to build with both --with-mode=thumb and --with-fpu=vfp,
> with error messages during ./configure, like:
> 
>     checking for suffix of object files... configure: error: in `/home/ymor
>     in/dev/buildroot/O/build/host-gcc-initial-4.9.3/build/arm-buildroot-lin
>     ux-uclibcgnueabihf/libgcc':
>     configure: error: cannot compute suffix of object files: cannot compile
>     See `config.log' for more details.
> 
> And config.log informatively contains:
> 
>     sorry, unimplemented: Thumb-1 hard-float VFP ABI
> 
> This is an error message that comes deep from gcc source files.
> 
> If gcc says it does not support VFP with Thumb1, then let's disable that
> combination in our menuconfig.
> 
> Prefer VFP over Thumb1, i.e. hide Thumb1 when we're not soft-float.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  arch/Config.in.arm | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
