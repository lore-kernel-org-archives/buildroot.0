From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 12:35:45 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/memcached: disable tests
In-Reply-To: <20210619204648.388641-1-fontaine.fabrice@gmail.com>
References: <20210619204648.388641-1-fontaine.fabrice@gmail.com>
Message-ID: <20210718123545.0487d4bf@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Fabrice,

On Sat, 19 Jun 2021 22:46:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable tests to avoid the following build failure with -DNDEBUG which
> is raised since commit 5a8c50fe05afacc3cbe8e7347e238da9f242fab0
> 
> /home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: testapp.o: in function `cache_redzone_test':
> (.text+0x2f48): undefined reference to `cache_error'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c4ddd86bd4b74ba4e4857ee38e3a95bb9b019093
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes V1 -> v2:
>  - Fix MEMCACHED_CONF_OPTS handling

Since -DNDEBUG is no longer passed following commit
a1c7cff1a081765c082c196bd9e6c1e72ceee797, this failure no longer
occurs. While disabling tests would still be useful, I don't think
carrying a non-upstream patch that requires autoreconf really makes
sense.

If you get the patch upstreamed, of course we should then be using
--disable-tests.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
