From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Feb 2021 22:48:57 +0100
Subject: [Buildroot] [PATCH] package/cegui: override first _CONF_OPTS
 instead of appending
In-Reply-To: <20210218175905.9837-1-b.bilas@grinn-global.com>
References: <20210218175905.9837-1-b.bilas@grinn-global.com>
Message-ID: <20210219214857.GH2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bartosz, All,

On 2021-02-18 18:59 +0100, Bartosz Bilas spake thusly:
> During the package update, there was a mistake
> and we appended the options to the first CONF_OPTS
> variable instead of overriding it.
> Fix that by removing an append-assignment.
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

Applied to master, thanks, with the following tweaks;

  - reference the exact commit that introduce the issue
  - also move the first item to its own line

Regards,
Yann E. MORIN.

> ---
>  package/cegui/cegui.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
> index 23919e0151..0596d6566b 100644
> --- a/package/cegui/cegui.mk
> +++ b/package/cegui/cegui.mk
> @@ -9,7 +9,7 @@ CEGUI_SITE = $(call github,cegui,cegui,v$(CEGUI_VERSION))
>  CEGUI_LICENSE = MIT
>  CEGUI_LICENSE_FILES = COPYING
>  CEGUI_INSTALL_STAGING = YES
> -CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
> +CEGUI_CONF_OPTS = -DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
>  	-DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF \
>  	-DCEGUI_BUILD_RENDERER_OGRE=OFF
>  CEGUI_DEPENDENCIES = glm \
> -- 
> 2.30.1
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
