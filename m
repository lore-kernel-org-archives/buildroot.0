From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2015 23:40:38 +0200
Subject: [Buildroot] [PATCH 09/35] docs/manual: update documentation
 about applying patches
In-Reply-To: <1427650429-9293-10-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-10-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150329214038.GJ4093@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-29 19:33 +0200, Thomas Petazzoni spake thusly:
> The Buildroot manual is currently wrong when describing how patches
> are applied: it says that <packagename>-*.patch is applied, and that
> <packagename>-<seq>-*.patch is the recommended name for patches. This
> is incorrect, since we're now using just <seq>-*.patch. This commit
> adjusts the documentation accordingly.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  docs/manual/adding-packages-generic.txt |  2 +-
>  docs/manual/customize-patches.txt       | 11 +++++------
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index 85c9ccd..1aa6def 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -219,7 +219,7 @@ information is (assuming the package name is +libfoo+) :
>    +LIBFOO_SITE+. If +HOST_LIBFOO_PATCH+ is not specified, it defaults
>    to +LIBFOO_PATCH+. Note that patches that are included in Buildroot
>    itself use a different mechanism: all files of the form
> -  +<packagename>-*.patch+ present in the package directory inside
> +  +*.patch+ present in the package directory inside
>    Buildroot will be applied to the package after extraction (see
>    xref:patch-policy[patching a package]). Finally, patches listed in
>    the +LIBFOO_PATCH+ variable are applied _before_ the patches stored
> diff --git a/docs/manual/customize-patches.txt b/docs/manual/customize-patches.txt
> index e129a64..fa63541 100644
> --- a/docs/manual/customize-patches.txt
> +++ b/docs/manual/customize-patches.txt
> @@ -33,12 +33,11 @@ follows:
>  * If a +series+ file exists in the package directory, then patches are
>    applied according to the +series+ file;
>  +
> -* Otherwise, patch files matching +<packagename>-*.patch+
> -  are applied in alphabetical order.
> -  So, to ensure they are applied in the right order, it is highly
> -  recommended to name the patch files like this:
> -  +<packagename>-<number>-<description>.patch+, where +<number>+
> -  refers to the 'apply order'.
> +* Otherwise, patch files matching +*.patch+ are applied in
> +  alphabetical order.  So, to ensure they are applied in the right
> +  order, it is highly recommended to name the patch files like this:
> +  +<number>-<description>.patch+, where +<number>+ refers to the
> +  'apply order'.

Patches bundled in Buildroot have a four-number sequence. Should we
suggest this as well for patches in BR2_GLOBAL_PATCH_DIR ?

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  For information about how patches are applied for a package, see
>  xref:patch-apply-order[]
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
