From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Apr 2013 20:52:41 +0200
Subject: [Buildroot] [PATCH v5 2/7] arch: Add blackfin CPU choice.
In-Reply-To: <1365761909-15305-2-git-send-email-sonic.adi@gmail.com>
References: <1365761909-15305-1-git-send-email-sonic.adi@gmail.com>
 <1365761909-15305-2-git-send-email-sonic.adi@gmail.com>
Message-ID: <20130416205241.602cc24c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Fri, 12 Apr 2013 18:18:24 +0800, Sonic Zhang wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
> 
> is patch adds a Target CPU configuration option and uses it to select a -m
> option for gcc.
> 
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> ---
>  arch/Config.in.bfin |   97 +++++++++++++++++++++++++++++++++++++++++++++++----
>  1 files changed, 90 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
> index 0b137ae..ac96620 100644
> --- a/arch/Config.in.bfin
> +++ b/arch/Config.in.bfin
> @@ -1,12 +1,65 @@
>  choice
> -	prompt "Target ABI"
> +	prompt "Target CPU"
>  	depends on BR2_bfin
> -	default BR2_BFIN_FDPIC
> -config BR2_BFIN_FDPIC
> -	bool "FDPIC"
> -config BR2_BFIN_FLAT
> -	bool "FLAT"
> -	select BR2_PREFER_STATIC_LIB

Those options (BR2_BFIN_FPIC, BR2_BFIN_FLAT) should have been removed
in PATCH 1, and added in Config.in.legacy (main Buildroot directory) to
ensure that users experience a smooth transition from the old options
to the new ones.

Once this is fixed, you have my Acked-by for this patch.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
