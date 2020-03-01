From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Mar 2020 10:35:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/emlog: annotate CVE-2019-16868
 and CVE-2019-17073
In-Reply-To: <20200229204548.3463349-1-fontaine.fabrice@gmail.com>
References: <20200229204548.3463349-1-fontaine.fabrice@gmail.com>
Message-ID: <20200301093526.GF8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-29 21:45 +0100, Fabrice Fontaine spake thusly:
> CVE-2019-16868 and CVE-2019-17073 are misclassified (by our CVE tracker)
> as affecting emlog, while in fact it affects http://www.emlog.net.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/emlog/emlog.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/emlog/emlog.mk b/package/emlog/emlog.mk
> index 8759f82c7c..7d63916ab2 100644
> --- a/package/emlog/emlog.mk
> +++ b/package/emlog/emlog.mk
> @@ -9,6 +9,10 @@ EMLOG_SITE = $(call github,nicupavel,emlog,emlog-$(EMLOG_VERSION))
>  EMLOG_LICENSE = GPL-2.0
>  EMLOG_LICENSE_FILES = COPYING
>  
> +# CVE-2019-16868 and CVE-2019-17073 are misclassified (by our CVE tracker) as
> +# affecting emlog, while in fact it affects http://www.emlog.net.
> +EMLOG_IGNORE_CVES += CVE-2019-16868 CVE-2019-17073
> +
>  define EMLOG_BUILD_CMDS
>  	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) nbcat
>  endef
> -- 
> 2.25.0
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
