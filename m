From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Oct 2013 00:10:24 +0200
Subject: [Buildroot] [PATCH] Revert "berkeleydb: bump to version 6.0.20"
In-Reply-To: <1381174561-22507-1-git-send-email-jezz@sysmic.org>
References: <1381174561-22507-1-git-send-email-jezz@sysmic.org>
Message-ID: <20131007221024.GF9561@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2013-10-07 21:36 +0200, J?r?me Pouiller spake thusly:
> BerkeleyDB has changed its license since version 6. New license (AGPL) may
> be incompatible with some packages. So we prefer to stick to version 5
> 
> This reverts commit 4c478de2e76ffc1d0a6dc413475307fd44a0a595.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/berkeleydb/berkeleydb.mk |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
> index 9b23623..d39bf80 100644
> --- a/package/berkeleydb/berkeleydb.mk
> +++ b/package/berkeleydb/berkeleydb.mk
> @@ -4,7 +4,10 @@
>  #
>  ################################################################################
>  
> -BERKELEYDB_VERSION = 6.0.20
> +# If you want to use lastest version of BerkeleyDB, just change VERSION below.
> +# However, notice BerkeleyDB license changed and is now Affero GPL since
> +# version 6

I'd prefer we'd phrase it something like:

    # Since BerkeleyDB version 6 and above are licensed under the Affero
    # GPL (AGPL), we want to keep this 'bdb' package at version 5.x to
    # avoid licensing issues.
    # BerkeleyDB version 6 or above should be provided by a dedicated
    # package instead.

Because we really do want to keep 5.x, while your text seems to imply we
could bump the version. We do not want this to happen.

> +BERKELEYDB_VERSION = 5.3.21
>  BERKELEYDB_SITE = http://download.oracle.com/berkeley-db
>  BERKELEYDB_SOURCE = db-$(BERKELEYDB_VERSION).NC.tar.gz
>  BERKELEYDB_SUBDIR = build_unix

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
