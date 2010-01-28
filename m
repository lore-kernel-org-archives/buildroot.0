From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Jan 2010 22:58:12 +0100
Subject: [Buildroot] [PATCH 17/19] package: fix install without strip
In-Reply-To: <1264554547-9009-18-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Wed, 27 Jan 2010 02:09:05 +0100")
References: <1264554547-9009-1-git-send-email-llandwerlin@gmail.com>
	<1264554547-9009-18-git-send-email-llandwerlin@gmail.com>
Message-ID: <87zl3xlwnf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

Hi,

Please provide a bit more description - What does it exactly fix? I
would rathr think we should use install-exec everywhere as we now do
strip in the toplevel target-finalize target.

 llandwerlin>  ifeq ($(BR2_ENABLE_DEBUG),y)
 llandwerlin> -$(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install-exec
 llandwerlin> +$(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install-strip
 llandwerlin>  else
 llandwerlin>  $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install-strip
 llandwerlin>  endif

-- 
Bye, Peter Korsgaard
