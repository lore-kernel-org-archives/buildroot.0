From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 22:00:57 +0200
Subject: [Buildroot] [PATCH 1/5] package/mariadb: use host-openssl from
 buildroot-system
In-Reply-To: <20190915193559.8464-1-bluemrp9@gmail.com>
References: <20190915193559.8464-1-bluemrp9@gmail.com>
Message-ID: <20190915220057.5f78f039@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ryan,

On Sun, 15 Sep 2019 12:35:55 -0700
Ryan Coe <bluemrp9@gmail.com> wrote:

> From: Peter Seiderer <ps.report@gmx.net>
> 
> - change WITH_SSL for host build from bundled to system (and add
>   host-openssl dependency) to avoid the following configure failure:
> 
>   CMake Error at /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
>     Could NOT find GnuTLS (missing: GNUTLS_LIBRARY GNUTLS_INCLUDE_DIR)
>     (Required is at least version "3.3.24")
>   Call Stack (most recent call first):
>     /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:378 (_FPHSA_FAILURE_MESSAGE)
>     /usr/share/cmake/Modules/FindGnuTLS.cmake:54 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
>     libmariadb/CMakeLists.txt:298 (FIND_PACKAGE)

We're not getting any build failures about mariadb. Under what
conditions/configurations does the above error take place ?

> -HOST_MARIADB_CONF_OPTS += -DWITH_SSL=OFF

This says "SSL=OFF", not "use bundled SSL". Could you clarify ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
