From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 8 Sep 2016 16:44:21 +0200
Subject: [Buildroot] [PATCH 1/2] package/mysql: add MYSQL_SOCKET variable
In-Reply-To: <1473345222-10563-1-git-send-email-bos@je-eigen-domein.nl>
References: <1473345222-10563-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20160908144421.GA5740@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris, All,

On 2016-09-08 16:33 +0200, Floris Bos spake thusly:
> Add MYSQL_SOCKET variable with default socket location for other
> packages to use.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  package/mysql/mysql.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
> index 534bd97..a9e48ad 100644
> --- a/package/mysql/mysql.mk
> +++ b/package/mysql/mysql.mk
> @@ -14,6 +14,9 @@ MYSQL_AUTORECONF = YES
>  MYSQL_LICENSE = GPLv2
>  MYSQL_LICENSE_FILES = README COPYING
>  
> +# Variable with default socket location for other buildroot packages to use
> +MYSQL_SOCKET = /tmp/mysql.sock

Should we also use that location in the sysv startup script and systemd
unit?

If that is the default of mysql, is there a way to force it during
configure? I'm a bit uneasy to rely on magic values, in case a future
version changes this default location...

Regards,
Yann E. MORIN.

>  MYSQL_CONF_ENV = \
>  	ac_cv_sys_restartable_syscalls=yes \
>  	ac_cv_path_PS=/bin/ps \
> -- 
> 2.7.4
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
