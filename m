From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Nov 2012 09:39:25 +0100
Subject: [Buildroot] [PATCH 05/51] package/libiscsi: new package
In-Reply-To: <1354146890-27380-6-git-send-email-yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
 <1354146890-27380-6-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20121129093925.69619997@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 29 Nov 2012 00:54:04 +0100, Yann E. MORIN wrote:

> +LIBISCSI_AUTORECONF = YES
> +# Having a m4/ directory is mandatory for autoreconf to work
> +define LIBISCSI_CREATE_M4_DIR
> +	mkdir -p $(@D)/m4
> +endef
> +LIBISCSI_PRE_CONFIGURE_HOOKS += LIBISCSI_CREATE_M4_DIR

I think the reason why AUTORECONF=YES is needed should be mention with
a comment on top of it. You don't have any patch touching
configure.{ac,in} or Makefile.am, so the need for AUTORECONF=YES
doesn't seem very obvious.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
