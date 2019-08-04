From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Aug 2019 12:49:58 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-redis: new package
In-Reply-To: <20190317190540.22423-2-grzegorz@blach.pl> (Grzegorz Blach's
 message of "Sun, 17 Mar 2019 20:05:40 +0100")
References: <20190317190540.22423-1-grzegorz@blach.pl>
 <20190317190540.22423-2-grzegorz@blach.pl>
Message-ID: <877e7t2oix.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grzegorz" == Grzegorz Blach <grzegorz@blach.pl> writes:

 > The Python interface to the Redis key-value store.
 > https://github.com/andymccurdy/redis-py

 > Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
 > ---
 >  DEVELOPERS                             |  1 +
 >  package/Config.in                      |  1 +
 >  package/python-redis/Config.in         |  6 ++++++
 >  package/python-redis/python-redis.hash |  5 +++++
 >  package/python-redis/python-redis.mk   | 18 ++++++++++++++++++
 >  5 files changed, 31 insertions(+)
 >  create mode 100644 package/python-redis/Config.in
 >  create mode 100644 package/python-redis/python-redis.hash
 >  create mode 100644 package/python-redis/python-redis.mk

 > +################################################################################
 > +#
 > +# python-redis
 > +#
 > +################################################################################
 > +
 > +PYTHON_REDIS_VERSION = 3.2.1
 > +PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
 > +PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/24/d4/06486dee0f66ef8c5080dc576fdfb33131fd2e0be3747f2be4e5634088a2
 > +PYTHON_REDIS_SETUP_TYPE = setuptools
 > +PYTHON_REDIS_LICENSE = MIT
 > +PYTHON_REDIS_LICENSE_FILES = LICENSE
 > +
 > +ifeq ($(BR2_PACKAGE_PYTHON_HIREDIS),y)
 > +PYTHON_REDIS_DEPENDENCIES += python-hiredis
 > +endif

hiredis is an optional runtime dependency, not a build time one - So it
shouldn't be added to _DEPENDENCIES.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
