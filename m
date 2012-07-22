From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 16:26:41 +0200
Subject: [Buildroot] [PATCH 07/11] ext-tool.mk: add fancy messages
In-Reply-To: <1342963719-1810-8-git-send-email-s.martin49@gmail.com>
References: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
 <1342963719-1810-8-git-send-email-s.martin49@gmail.com>
Message-ID: <20120722162641.6bd3eeef@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 22 Jul 2012 15:28:35 +0200,
Samuel Martin <s.martin49@gmail.com> a ?crit :

> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 293bf4f..0861673 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -65,6 +65,7 @@ INFLATE.tar  = cat
>  
>  # MESSAGE Macro -- display a message in bold type
>  MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
> +MESSAGE2    = echo "$(TERM_BOLD)>>> $(1) $(2)$(TERM_RESET)"
>  TERM_BOLD  := $(shell tput smso)
>  TERM_RESET := $(shell tput rmso)

Maybe we need:

MESSAGE	= echo "$(TERM_BOLD)>>> $(1) $(2)$(TERM_RESET)"
PKG_MESSAGE = $(call MESSAGE,$($(PKG)_NAME) $($(PKG)_VERSION),$(1))

And then use PKG_MESSAGE in the package infrastructure, and MESSAGE in
other places. But definitely MESSAGE vs. MESSAGE2 is ugly.

And maybe the MESSAGE definition would have to be somewhere outside of
pkg-utils.mk since it's not package related anymore.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
