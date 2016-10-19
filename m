From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 15:01:15 +0200
Subject: [Buildroot] [PATCH V2,
 1/1] Fix: qt5webkit overwrites target python.
In-Reply-To: <1476877746-13572-1-git-send-email-johanderycke@gmail.com>
References: <1476877746-13572-1-git-send-email-johanderycke@gmail.com>
Message-ID: <20161019150115.5f331124@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Oct 2016 13:49:06 +0200, johanderycke at gmail.com wrote:
> From: Johan Derycke <johan.derycke@barco.com>
> 
> Signed-off-by: Johan Derycke <johan.derycke@barco.com>

This really requires a more detailed commit log.

> -QT5WEBKIT_ENV = PATH=$(@D)/bin:$(BR_PATH)
> +QT5WEBKIT_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
>  define QT5WEBKIT_PYTHON2_SYMLINK
> -	mkdir -p $(@D)/bin
> -	ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/bin/python
> +	mkdir -p $(@D)/host-bin
> +	ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/host-bin/python
>  endef

Otherwise, this looks good.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
