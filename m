From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 2 Jul 2014 12:36:10 +0300
Subject: [Buildroot] [PATCH] binutils: Use the default version by default
In-Reply-To: <1404293385-56160-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1404293385-56160-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140702093610.GG9025@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

On Wed, Jul 02, 2014 at 10:29:45AM +0100, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>

Subject should mention that this commit only affects MIPS.

baruch

> ---
>  package/binutils/Config.in.host |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index 08540a3..bc21f5e 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -3,7 +3,7 @@ comment "Binutils Options"
>  choice
>  	prompt "Binutils Version"
>  	depends on !BR2_arc
> -	default BR2_BINUTILS_VERSION_2_21 if (BR2_mips || BR2_mipsel || BR2_sh)
> +	default BR2_BINUTILS_VERSION_2_21 if BR2_sh
>  	default BR2_BINUTILS_VERSION_2_24 if BR2_microblaze || BR2_powerpc64le
>  	default BR2_BINUTILS_VERSION_2_22
>  	help

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
