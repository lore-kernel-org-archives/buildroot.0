From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 17:02:57 +0200
Subject: [Buildroot] [PATCH v3 11/11] weston: handle libxml2 dependency
In-Reply-To: <1459262350-10974-12-git-send-email-gustavo@zacarias.com.ar>
References: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
 <1459262350-10974-12-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160330170257.5ec378e7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Mar 2016 11:39:10 -0300, Gustavo Zacarias wrote:
> It's used for JUnit XML output support.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/weston/weston.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index 9313fcc..2891fe3 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -116,4 +116,11 @@ else
>  WESTON_CONF_OPTS += --disable-systemd-login --disable-systemd-notify
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBXML2),y)
> +WESTON_CONF_OPTS += --enable-junit-xml
> +WESTON_DEPENDENCIES += libxml2
> +else
> +WESTON_CONF_OPTS += --disable-junit-xml
> +endif

Do we really care about this JUnit XML output support ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
