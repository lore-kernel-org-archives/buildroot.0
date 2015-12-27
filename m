From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Dec 2015 15:34:51 +0100
Subject: [Buildroot] [PATCHv3] toolchain: granular choice for stack
 protector
In-Reply-To: <1451214451-26133-1-git-send-email-yann.morin.1998@free.fr>
References: <1451214451-26133-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151227153451.7b3ede57@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 27 Dec 2015 12:07:31 +0100, Yann E. MORIN wrote:
> From: Steven Noonan <steven@uplinklabs.net>
> 
> Currently, we only support two levels of stach-smashing protection:
>   - entirely disabled,
>   - protect _all_ functions with -fstack-protector-all.
> 
> -fstack-protector-all tends to be far too aggressive and impacts
> performance too much to be worth on a real product.
> 
> Add a choice that allows us to select between different levels of
> stack-smashing protection:
>   - none
>   - basic   (NEW)
>   - strong  (NEW)
>   - all
> 
> The differences are documented in the GCC online documentation:
>     https://gcc.gnu.org/onlinedocs/gcc-4.9.2/gcc/Optimize-Options.html
> 
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
> [yann.morin.1998 at free.fr:
>   - rebase
>   - add legacy handling
>   - SSP-strong depends on gcc >= 4.9
>   - slightly simple ifeq-block in package/Makefile.in
>   - keep the comment in the choice; add a comment shen strong is not
>     available
>   - drop the defaults (only keep the legacy)
>   - update commit log
> ]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> Changes v2 -> v3:
>   - drop the new defaults, only keep legacy  (Thomas)

Applied with the following changes:

    [Thomas:
     - only show the choice if the toolchain has SSP support
     - add details for the BR2_SSP_ALL option that it has a significant
       performance impact.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
