From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 23:16:36 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/util-linux: remove patch for
 uClibc support
In-Reply-To: <1456078452-23865-2-git-send-email-romain.naour@gmail.com>
References: <1456078452-23865-1-git-send-email-romain.naour@gmail.com>
 <1456078452-23865-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20160225231636.13d0804c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 21 Feb 2016 19:14:12 +0100, Romain Naour wrote:
> This patch is not needed anymore since the uClibc support has been removed from
> Buildroot. This patch was needed for uClibc <= 0.9.33 support.
> 
> The only remaining supported external toolchain using uClibc 0.9.33 is the
> 2014R1 bfin toolchain. But all features that needs mkostemp() require fork() [1].
> So, we can safely remove the patch.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2016-February/153414.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> v2: Improve the commit log
> Build tested with 2014R1 bfin toolchain (FLAT mode).
> The arc-1015.12 toolchain shouldn't trigger the build issue
> since it's based on uClibc-snapshot (upstream HEAD)
> ---
>  ...fine-mkostemp-for-older-version-of-uClibc.patch | 50 ----------------------
>  1 file changed, 50 deletions(-)
>  delete mode 100644 package/util-linux/0003-c.h-define-mkostemp-for-older-version-of-uClibc.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
