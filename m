From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 6 Feb 2019 16:32:40 +0100
Subject: [Buildroot] [PATCH 1/3] utils/genrandconfig: drop qt4 fixups
In-Reply-To: <20190206151116.8012-1-peter@korsgaard.com>
References: <20190206151116.8012-1-peter@korsgaard.com>
Message-ID: <4664ac9e-5d10-fcf7-3f16-2f907b3878fd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/02/2019 16:11, Peter Korsgaard wrote:
> Now that Qt4 is removed, these fixups can be removed as well.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 Series applied to master, thanks.

 Regards,
 Arnout


> ---
>  utils/genrandconfig | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 047740a411..a2190d6d25 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -311,16 +311,8 @@ def fixup_config(configfile):
>          return False
>      # The cs nios2 2017.02 toolchain is affected by binutils PR19405
>      if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
> -       'BR2_PACKAGE_QT_GUI_MODULE=y\n' in configlines:
> -        return False
> -    # The cs nios2 2017.02 toolchain is affected by binutils PR19405
> -    if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
>         'BR2_PACKAGE_FLANN=y\n' in configlines:
>          return False
> -    # or1k affected by binutils PR21464
> -    if 'BR2_or1k=y\n' in configlines and \
> -       'BR2_PACKAGE_QT_GUI_MODULE=y\n' in configlines:
> -        return False
>  
>      with open(configfile, "w+") as configf:
>          configf.writelines(configlines)
> 
