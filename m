From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2015 17:40:52 +0200
Subject: [Buildroot] [PATCHv4 18/18] Makefile: add a few more targets to
 nobuild_targets
In-Reply-To: <1430041876-16436-19-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1430041876-16436-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1430041876-16436-19-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150426154052.GG4809@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2015-04-26 11:51 +0200, Thomas Petazzoni spake thusly:
> With this commit, one can now execute the source-check, external-deps
> and legal-info targets regardless of the checks normally being done by
> packages on the configuration.
> 
> Note that we intentionally do not go down the road of adding %-source,
> %-legal-info, and the miryad of other targets that could work in such
> situations. We only whitelist a few targets that are really useful to
> have as nobuild_targets.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index e0be636..2d7c05a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -86,7 +86,7 @@ noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconf
>  # We're building in two situations: when MAKECMDGOALS is empty
>  # (default target is to build), or when MAKECMDGOALS contains
>  # something else than one of the nobuild_targets.
> -nobuild_targets := source
> +nobuild_targets := source source-check legal-info external-deps _external-deps

You may also want to add those:
    clean distclean

Because otherwise, it is not possible to clean or distclean a directory
when the .config has one or more unset board names.

Regards,
Yann E. MORIN.

>  ifeq ($(MAKECMDGOALS),)
>  BR_BUILDING = y
>  else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
> -- 
> 2.1.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
