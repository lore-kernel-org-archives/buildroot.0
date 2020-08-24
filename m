From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Aug 2020 22:41:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/iputils: bump version to
 20200821
In-Reply-To: <20200824164042.10778-1-petr.vorel@gmail.com>
References: <20200824164042.10778-1-petr.vorel@gmail.com>
Message-ID: <20200824224133.63ade6fe@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 24 Aug 2020 18:40:42 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Remove patch from this version.
> 
> Remove USE_CRYPTO related config (configuration was removed in this
> release).
> 
> tftpd is not built by default since this release, thus explicitly enable it.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

I have applied to next, but... I have some second thoughts.

> -ifeq ($(BR2_PACKAGE_NETTLE),y)
> -IPUTILS_CONF_OPTS += -DUSE_CRYPTO=nettle
> -IPUTILS_DEPENDENCIES += nettle
> -else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
> -IPUTILS_CONF_OPTS += -DUSE_CRYPTO=gcrypt
> -IPUTILS_DEPENDENCIES += libgcrypt
> -else ifeq ($(BR2_PACKAGE_OPENSSL),y)
> -IPUTILS_CONF_OPTS += -DUSE_CRYPTO=openssl
> -IPUTILS_DEPENDENCIES += openssl
> -else
> -IPUTILS_CONF_OPTS += -DUSE_CRYPTO=kernel
> -endif

So you no longer have any optional dependency on a crypto provider, i.e
there is nothing that guarantees that openssl will be built before
iputils if openssl is available, for example.

Is that really what you want ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
