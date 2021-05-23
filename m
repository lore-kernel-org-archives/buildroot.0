From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 20:03:56 +0200
Subject: [Buildroot] [PATCH 2/2] package/libnids: drop
 LIBNIDS_IGNORE_CVES
In-Reply-To: <20210523132938.1520248-2-fontaine.fabrice@gmail.com>
References: <20210523132938.1520248-1-fontaine.fabrice@gmail.com>
 <20210523132938.1520248-2-fontaine.fabrice@gmail.com>
Message-ID: <20210523180356.GE3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-23 15:29 +0200, Fabrice Fontaine spake thusly:
> NVD database has been updated:
> https://nvd.nist.gov/vuln/search/results?form_type=Advanced&results_type=overview&seach_type=all&query=cpe:2.3:a:libnids_project:libnids:1.24:*:*:*:*:*:*:*
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libnids/libnids.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
> index 4a9138b80e..3e36838c40 100644
> --- a/package/libnids/libnids.mk
> +++ b/package/libnids/libnids.mk
> @@ -13,10 +13,6 @@ LIBNIDS_INSTALL_STAGING = YES
>  LIBNIDS_DEPENDENCIES = host-pkgconf libpcap
>  LIBNIDS_AUTORECONF = YES
>  
> -# CVE-2010-0751 was fixed in libnids v1.24 but the NVD database is not
> -# aware of the fix, ignore it until this is updated
> -LIBNIDS_IGNORE_CVES += CVE-2010-0751
> -
>  # disable libnet if not available
>  # Tests in configure.in expect --with-libnet=$build_dir
>  # not an installation patch like in our context.
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
