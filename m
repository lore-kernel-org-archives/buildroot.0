From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 23:32:46 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/mosquitto: bump to v1.6.11
In-Reply-To: <20200819120506.137013-1-titouan.christophe@railnova.eu>
References: <20200819120506.137013-1-titouan.christophe@railnova.eu>
Message-ID: <20200827233246.1964df63@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 19 Aug 2020 14:05:05 +0200
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
> index b4effa36be..078d6ad151 100644
> --- a/package/mosquitto/Config.in
> +++ b/package/mosquitto/Config.in
> @@ -1,3 +1,8 @@
> +config BR2_PACKAGE_MOSQUITTO_WITH_THREADING
> +	bool
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # pthread_setname_np
> +	default y if BR2_TOOLCHAIN_HAS_THREADS

This looks awkward. Why are you not just doing:

-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
 MOSQUITTO_MAKE_OPTS += WITH_THREADING=yes
 else
 MOSQUITTO_MAKE_OPTS += WITH_THREADING=no

in the .mk file ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
