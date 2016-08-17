From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Aug 2016 19:22:16 +0200
Subject: [Buildroot] [PATCH v2 3/3] docs: libtool patches are not
 handled by legal-info infrastructure.
In-Reply-To: <1471449670-13421-3-git-send-email-romain.naour@gmail.com>
References: <1471449670-13421-1-git-send-email-romain.naour@gmail.com>
 <1471449670-13421-3-git-send-email-romain.naour@gmail.com>
Message-ID: <20160817172215.GF5778@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-08-17 18:01 +0200, Romain Naour spake thusly:
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  docs/manual/legal-notice.txt     | 4 ++++
>  support/legal-info/README.header | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
> index a4911f7..fd1e5aa 100644
> --- a/docs/manual/legal-notice.txt
> +++ b/docs/manual/legal-notice.txt
> @@ -44,6 +44,10 @@ There you will find:
>    Patches that were applied are also saved, along with a file named +series+
>    that lists the patches in the order they were applied. Patches are under the
>    same license as the files that they modify.
> +  Note: Buildroot applies additional patches to Libtool scripts of
> +  autotools-based packages. These patches can be found under +support/libtool+
> +  in the buildroot source and are not saved with the package sources due to
> +  technical limitations. You may need to collect them manually.

I would have said:

    [...] and, due to technical limitations, are not saved with the
    other patches.

(Ditto below, of course).

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  * A manifest file (one for host and one for target packages) listing the
>    configured packages, their version, license and related information.
>    Some of this information might not be defined in Buildroot; such items are
> diff --git a/support/legal-info/README.header b/support/legal-info/README.header
> index 1f3524f..ee34886 100644
> --- a/support/legal-info/README.header
> +++ b/support/legal-info/README.header
> @@ -20,6 +20,10 @@ This material is composed of the following items.
>     with a file named 'series' that lists the patches in the order they were
>     applied. Patches are under the same license as the files that they modify
>     in the original package.
> +   Note: Buildroot applies additional patches to Libtool scripts of
> +   autotools-based packages. These patches can be found under support/libtool
> +   in the buildroot source and are not saved with the package sources due to
> +   technical limitations. You may need to collect them manually.
>   * A manifest file listing the configured packages and related information.
>   * The license text of the packages; they have been saved in the licenses/
>     subdirectory.
> -- 
> 2.5.5
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
