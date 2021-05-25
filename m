From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 May 2021 23:32:36 +0200
Subject: [Buildroot] [PATCHv3 11/15] package/sofia-sip: use
 BR2_ENABLE_RUNTIME_DEBUG iso BR2_ENABLE_DEBUG
In-Reply-To: <20210525122750.5022-12-patrickdepinguin@gmail.com>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
 <20210525122750.5022-12-patrickdepinguin@gmail.com>
Message-ID: <0fd19bad-277f-ae7d-1928-fd4dc0bf6fcc@mind.be>
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
> ---
>  package/sofia-sip/sofia-sip.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
> index 5c383400ff..cb867ba0dc 100644
> --- a/package/sofia-sip/sofia-sip.mk
> +++ b/package/sofia-sip/sofia-sip.mk
> @@ -30,7 +30,7 @@ SOFIA_SIP_CONF_OPTS += \
>  	--without-openssl
>  endif
>  
> -ifeq ($(BR2_ENABLE_DEBUG),y)
> +ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
>  SOFIA_SIP_CONF_OPTS += --enable-ndebug

 Actually, the logic was inverted here (already wrong in the current situation):
--enable-ndebug should be given when RUNTIME_DEBUG is *not* set.

 However, I think we should define -DNDEBUG in TARGET_CPPFLAGS, so it wouldn't
be necessary to pass it explicitly here (--enable-ndebug does nothing more than
defining NDEBUG).


 Regards,
 Arnout

>  endif
>  
> 
