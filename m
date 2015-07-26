From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:07:18 +0200
Subject: [Buildroot] [PATCH] Makefile: unexport O
In-Reply-To: <1437851259-4539-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1437851259-4539-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150726150718.5ecc6679@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Mart?nez,

On Sat, 25 Jul 2015 16:07:39 -0300, Guido Mart?nez wrote:
> After bee5745ccc2 ("Makefile: don't depend on the umask"), any use
> of "make O=<dir>" would leak $O into the enviroment for submakes,
> and it's inherited by package makefiles. Some package makefiles have
> protections to make sure they don't use the value of $O if it comes from
> the enviroment (Linux), but some don't (uClibc).
> 
> This caused build failures when using a different output dir.
> 
> Fix this by unconditionally unexporting the O variable, since we never
> need to have it set in the environment for packages, it should be only
> internally used by BR.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
