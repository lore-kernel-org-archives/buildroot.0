From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Sat,  9 Nov 2019 19:55:10 +0100
Subject: [Buildroot] [PATCH v2 0/2] Include makefiles from GLOBAL_PATCH_DIR
Message-ID: <20191109185512.24139-1-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

V2:
* fix includes happening multiple times on host+target packages
* change name of included makefiles from .mk to .smk (see commit for
  details)

Note that the first patch might be usefull independently of the (more
controversial) second patch. 

I am opened to changing the .smk to any pattern you suggest
I am not sure where to fit this in the documentation. suggestions
welcomed

J?r?my Rosen (2):
  allow .smk files as includes in packages
  Include makefiles from GLOBAL_PATCH_DIR

 package/pkg-autotools.mk     |  1 +
 package/pkg-cmake.mk         |  1 +
 package/pkg-generic.mk       |  8 ++++++--
 package/pkg-golang.mk        |  1 +
 package/pkg-kconfig.mk       |  1 +
 package/pkg-kernel-module.mk |  1 +
 package/pkg-luarocks.mk      |  1 +
 package/pkg-meson.mk         |  1 +
 package/pkg-perl.mk          |  1 +
 package/pkg-python.mk        |  1 +
 package/pkg-rebar.mk         |  1 +
 package/pkg-utils.mk         | 21 ++++++++++++++++++++-
 package/pkg-virtual.mk       |  1 +
 package/pkg-waf.mk           |  1 +
 14 files changed, 38 insertions(+), 3 deletions(-)

-- 
2.24.0.rc1
