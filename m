From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 18:52:27 +0100
Subject: [Buildroot] [PATCH 4/4] mysql: host-mysql depends on host-zlib
In-Reply-To: <1393944603-3104-4-git-send-email-kuyurix@gmail.com>
References: <1393944603-3104-1-git-send-email-kuyurix@gmail.com>
 <1393944603-3104-4-git-send-email-kuyurix@gmail.com>
Message-ID: <20140304185227.46062c52@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marcelo Guti?rrez,

On Tue,  4 Mar 2014 14:50:03 +0000, Marcelo Guti?rrez wrote:
> 
> Signed-off-by: Marcelo Guti?rrez <kuyurix@gmail.com>
> ---
>  package/mysql/mysql.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
> index c35fef5..9a8612b 100644
> --- a/package/mysql/mysql.mk
> +++ b/package/mysql/mysql.mk
> @@ -34,7 +34,7 @@ MYSQL_CONF_OPT = \
>  
>  ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
>  MYSQL_DEPENDENCIES += host-mysql host-bison
> -HOST_MYSQL_DEPENDENCIES =
> +HOST_MYSQL_DEPENDENCIES = host-zlib

Hum, why? I have built the mysql server successfully without this
patch. Can you give some details about why this is needed?

And by the way, thanks a lot for the patches!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
