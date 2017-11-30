From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 09:00:57 +0100
Subject: [Buildroot] [PATCH 7/8] package/asterisk: add comment about a
 check-package false positive
In-Reply-To: <d2844704851e4e8ff93c3007e9e67e2a339e11c7.1511996903.git.yann.morin.1998@free.fr>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
 <d2844704851e4e8ff93c3007e9e67e2a339e11c7.1511996903.git.yann.morin.1998@free.fr>
Message-ID: <20171130090057.2d034d10@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Nov 2017 00:08:44 +0100, Yann E. MORIN wrote:
> This variable is inherited from the target variant, which is
> autoreconfed. But the host variant is only the menucselect

menuselect

> sub-directory, which we do not want to autoreconf, so the explcit
> NO is required.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/asterisk/asterisk.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index 50512c0b3a..21dca549a0 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -285,6 +285,7 @@ HOST_ASTERISK_LICENSE_FILES = COPYING
>  
>  # No need to autoreconf for the host variant,
>  # so do not inherit the target setup.
> +# check-package reports an issue here, but that's a false positive. Ignore.
>  HOST_ASTERISK_AUTORECONF = NO

I'm not sure we should have a comment here. Instead we should fix
check-package: it is not normal for check-package to emit a warning
here, since it is legal (currently) for a package to autoreconf its
target variant, and not autoreconf its host variant.

Ricardo, do you think you could fix this problem in check-package ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
