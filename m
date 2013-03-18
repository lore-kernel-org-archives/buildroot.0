From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Mar 2013 22:44:35 +0100
Subject: [Buildroot] [PATCH v2] new package: redis
In-Reply-To: <1363052831-17436-1-git-send-email-daniel.price@gmail.com>
 (Daniel Price's message of "Mon, 11 Mar 2013 18:47:11 -0700")
References: <1363052831-17436-1-git-send-email-daniel.price@gmail.com>
Message-ID: <87ppywxu0s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Price <daniel.price@gmail.com> writes:

 Daniel> Signed-off-by: Daniel Price <daniel.price@gmail.com>
 Daniel> ---
 Daniel>  package/Config.in                    |    1 +
 Daniel>  package/redis/Config.in              |   14 ++++++++++
 Daniel>  package/redis/redis-001-uclibc.patch |   45 ++++++++++++++++++++++++++++++++++
 Daniel>  package/redis/redis-002-lua-AR.patch |   32 ++++++++++++++++++++++++
 Daniel>  package/redis/redis.mk               |   28 +++++++++++++++++++++

 Daniel> +config BR2_PACKAGE_REDIS
 Daniel> +	bool "redis"
 Daniel> +	depends on BR2_USE_MMU # fork()
 Daniel> +	depends on BR2_TOOLCHAIN_HAS_THREADS
 Daniel> +	depends on BR2_LARGEFILE
 Daniel> +	help
 Daniel> +	  Redis is an open source, advanced key-value store. It is often referred
 Daniel> +	  to as a data structure server since keys can contain strings, hashes,
 Daniel> +	  lists, sets and sorted sets.
 Daniel> +

The help text is a bit too long, so I've word wrapped it.

 Daniel> +++ b/package/redis/redis.mk
 Daniel> @@ -0,0 +1,28 @@
 Daniel> +#############################################################
 Daniel> +#
 Daniel> +# redis
 Daniel> +#
 Daniel> +#############################################################
 Daniel> +
 Daniel> +REDIS_VERSION = 2.6.11
 Daniel> +REDIS_SOURCE = redis-$(REDIS_VERSION).tar.gz

That's the default value for _SOURCE, so I've dropped this.

Committed with those fixes, thanks.

-- 
Bye, Peter Korsgaard
