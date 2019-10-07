From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 22:26:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/leveldb: bump version to 1.22
In-Reply-To: <20191006122828.23586-1-bernd.kuhls@t-online.de>
References: <20191006122828.23586-1-bernd.kuhls@t-online.de>
Message-ID: <20191007222626.7180e191@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Oct 2019 14:28:28 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Upstream switched to cmake, removed patches for the old buildsystem.
> Added license hash.
> 
> Package requires gcc >= 4.8:
> https://github.com/google/leveldb/blob/master/CMakeLists.txt#L14
> 
> Removed "v" from LEVELDB_SITE to reflect current naming scheme.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Did you verify that qt5webkit was still building properly after this ?

> -define LEVELDB_INSTALL_STAGING_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE1) \
> -		INSTALL_ROOT=$(STAGING_DIR) INSTALL_PREFIX=/usr \
> -		$(LEVELDB_MAKE_ARGS) -C $(@D) install
> -	$(INSTALL) -D -m 0644 $(@D)/out-static/libmemenv.a $(STAGING_DIR)/usr/lib/libmemenv.a
> -	$(INSTALL) -D -m 0644 $(@D)/helpers/memenv/memenv.h $(STAGING_DIR)/usr/include/helpers/memenv/memenv.h

Indeed, I remember that libmemenv.a and memenv.h were explicitly
installed here because they were needed by qt5webkit, and I tested the
new 1.22 version of leveldb with its CMake based build system, and it
doesn't install those files.

Also, could you verify that minetest still builds fine with this
version of leveldb ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
