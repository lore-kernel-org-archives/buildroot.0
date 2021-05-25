From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 May 2021 23:18:15 +0200
Subject: [Buildroot] [PATCHv3 08/15] package/oracle-mysql: use
 BR2_ENABLE_RUNTIME_DEBUG iso BR2_ENABLE_DEBUG
In-Reply-To: <20210525122750.5022-9-patrickdepinguin@gmail.com>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
 <20210525122750.5022-9-patrickdepinguin@gmail.com>
Message-ID: <ffcb24be-bcdc-709a-85a0-75b76e175fa4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/05/2021 14:27, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> BR2_ENABLE_DEBUG should just steer the availability of debug symbols and
> should have no negative effect on performance.
> 
> Introduction of 'assert' statements, 'debug'-type builds with additional
> logging, etc. should be steered by BR2_ENABLE_RUNTIME_DEBUG instead.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/oracle-mysql/oracle-mysql.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
> index ccfa40cfb1..e7d6354ed8 100644
> --- a/package/oracle-mysql/oracle-mysql.mk
> +++ b/package/oracle-mysql/oracle-mysql.mk
> @@ -95,7 +95,7 @@ ORACLE_MYSQL_CONF_OPTS += \
>  
>  # Debugging is only available for the server, so no need for
>  # this if-block outside of the server if-block
> -ifeq ($(BR2_ENABLE_DEBUG),y)
> +ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
>  ORACLE_MYSQL_CONF_OPTS += --with-debug=full
>  else
>  ORACLE_MYSQL_CONF_OPTS += --without-debug
> 
