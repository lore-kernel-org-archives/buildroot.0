From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 23:28:36 +0200
Subject: [Buildroot] [PATCH] package/libolm: new package
In-Reply-To: <20191013093049.19448-1-gilles.talis@gmail.com>
References: <20191013093049.19448-1-gilles.talis@gmail.com>
Message-ID: <20191021232836.1210fd2a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 13 Oct 2019 11:30:49 +0200
Gilles Talis <gilles.talis@gmail.com> wrote:

> libolm is an implementation of the Double Ratchet cryptographic ratchet
> described by:
> https://whispersystems.org/docs/specifications/doubleratchet/
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Thanks, I've applied, after doing one change. See below.

> +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> +LIBOLM_CONF_OPTS += -DBUILD_SHARED_LIBS=ON
> +else
> +LIBOLM_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
> +endif

This is not needed, as passing BUILD_SHARED_LIBS is already taken care
off by the cmake-package infrastructure. So I dropped this part of the
.mk file when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
