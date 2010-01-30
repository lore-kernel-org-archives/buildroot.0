From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 30 Jan 2010 18:41:31 +0100
Subject: [Buildroot] [PATCH 17/19] package: fix install without strip
In-Reply-To: <87zl3xlwnf.fsf@macbook.be.48ers.dk>
References: <1264554547-9009-1-git-send-email-llandwerlin@gmail.com>
	<1264554547-9009-18-git-send-email-llandwerlin@gmail.com>
	<87zl3xlwnf.fsf@macbook.be.48ers.dk>
Message-ID: <1264873291.7683.1198.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le jeudi 28 janvier 2010 ? 22:58 +0100, Peter Korsgaard a ?crit :
> >>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:
> 
> Hi,
> 
> Please provide a bit more description - What does it exactly fix? I
> would rathr think we should use install-exec everywhere as we now do
> strip in the toplevel target-finalize target.
> 
>  llandwerlin>  ifeq ($(BR2_ENABLE_DEBUG),y)
>  llandwerlin> -$(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install-exec
>  llandwerlin> +$(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install-strip
>  llandwerlin>  else
>  llandwerlin>  $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install-strip
>  llandwerlin>  endif
> 

A little discusion about this issue :
http://lists.busybox.net/pipermail/buildroot/2010-January/031602.html

Libraries plugins aren't installed with install-exec (directfb for
example). Maybe it's an issue from the packages...

Regards,

-- 
Lionel Landwerlin
