From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 May 2021 23:24:09 +0200
Subject: [Buildroot] [PATCHv3 09/15] package/qt5: use
 BR2_ENABLE_RUNTIME_DEBUG iso BR2_ENABLE_DEBUG
In-Reply-To: <20210525122750.5022-10-patrickdepinguin@gmail.com>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
 <20210525122750.5022-10-patrickdepinguin@gmail.com>
Message-ID: <ad9ec3db-fff8-2668-3746-4d5028e42a36@mind.be>
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
>  package/qt5/qt5base/qt5base.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 84e9fa4edb..8b55aa3098 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -86,7 +86,7 @@ else
>  QT5BASE_CONFIGURE_OPTS += -no-gbm
>  endif
>  
> -ifeq ($(BR2_ENABLE_DEBUG),y)
> +ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
>  QT5BASE_CONFIGURE_OPTS += -debug
>  else
>  QT5BASE_CONFIGURE_OPTS += -release
> 
