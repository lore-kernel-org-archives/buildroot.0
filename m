From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Jun 2020 23:11:47 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-python.mk: use PYTHON3_PATH instead
 of duplicating its value
In-Reply-To: <20200615184632.493821-8-asafka7@gmail.com>
References: <20200615184632.493821-1-asafka7@gmail.com>
 <20200615184632.493821-8-asafka7@gmail.com>
Message-ID: <20200615211147.GE2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Asaf, All,

On 2020-06-15 21:46 +0300, Asaf Kahlon spake thusly:
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-python.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 4bf762e662..e5cd52003e 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -21,7 +21,7 @@
>  ################################################################################
>  
>  define PKG_PYTHON_SYSCONFIGDATA_NAME
> -$(basename $(notdir $(wildcard $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/_sysconfigdata__linux_*.py)))
> +$(basename $(notdir $(wildcard $(PYTHON3_PATH)/_sysconfigdata__linux_*.py)))
>  endef
>  
>  # Target distutils-based packages
> -- 
> 2.26.2
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
