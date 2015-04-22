From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 23:28:42 +0200
Subject: [Buildroot] [PATCH] pkg-generic: substitute colon and space out
 of PKG_VERSION
In-Reply-To: <1429737867-1754-1-git-send-email-arnout@mind.be>
References: <1429737867-1754-1-git-send-email-arnout@mind.be>
Message-ID: <20150422232842.1c28991d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Wed, 22 Apr 2015 23:24:27 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

>  ifndef $(2)_VERSION
>   ifdef $(3)_VERSION
>    $(2)_DL_VERSION := $$(strip $$($(3)_VERSION))
> -  $(2)_VERSION := $$(subst /,_,$$(strip $$($(3)_VERSION)))
> +  $(2)_VERSION := $$(subst $(space),_,$$(subst :,_,$$(subst /,_,$$(strip $$($(3)_VERSION)))))
>   else
>    $(2)_VERSION = undefined
>    $(2)_DL_VERSION = undefined
>   endif
>  else
>    $(2)_DL_VERSION := $$(strip $$($(2)_VERSION))
> -  $(2)_VERSION := $$(strip $$(subst /,_,$$($(2)_VERSION)))
> +  $(2)_VERSION := $$(subst $$(space),_,$$(subst :,_,$$(subst /,_,$$(strip $$($(2)_VERSION)))))
>  endif

Since this code is now a bit more complicated, maybe we should have a
function in pkg-utils.mk for this?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
