From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 17:23:08 +0100
Subject: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.4.3
In-Reply-To: <20200210120353.49600-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Mon, 10 Feb 2020 13:03:53 +0100")
References: <20200210120353.49600-1-giulio.benetti@benettiengineering.com>
Message-ID: <87wo8mec2b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Bump to version 2.4.3 of nfs-utils. All patches have been upstreamed, so
 > drop them all. It must be used rpcgen build by host-nfs-utils, to do
 > this let's pass its path to --with-rpcgen= instead of 'internal'.

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > ---
 >  .../0001-Patch-taken-from-Gentoo.patch        | 60 ----------------
 >  ...tch-legacy-index-in-favour-of-strchr.patch | 72 -------------------
 >  ...e-script-find-getrpcbynumber-in-libt.patch | 46 ------------
 >  ...ntd-Add-check-for-struct-file_handle.patch | 46 ------------
 >  ...tils-add-missing-include-of-stdint.h.patch | 33 ---------
 >  ...de-sys-sysmacros.h-where-appropriate.patch | 50 -------------
 >  package/nfs-utils/nfs-utils.hash              |  4 +-
 >  package/nfs-utils/nfs-utils.mk                |  5 +-
 >  8 files changed, 5 insertions(+), 311 deletions(-)
 >  delete mode 100644 package/nfs-utils/0001-Patch-taken-from-Gentoo.patch
 >  delete mode 100644 package/nfs-utils/0002-Switch-legacy-index-in-favour-of-strchr.patch
 >  delete mode 100644 package/nfs-utils/0003-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
 >  delete mode 100644 package/nfs-utils/0004-mountd-Add-check-for-struct-file_handle.patch
 >  delete mode 100644 package/nfs-utils/0005-nfs-utils-add-missing-include-of-stdint.h.patch
 >  delete mode 100644 package/nfs-utils/0006-Include-sys-sysmacros.h-where-appropriate.patch

 > +++ b/package/nfs-utils/nfs-utils.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -NFS_UTILS_VERSION = 1.3.4
 > +NFS_UTILS_VERSION = 2.4.3
 >  NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 >  NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 >  NFS_UTILS_LICENSE = GPL-2.0+
 > @@ -23,7 +23,8 @@ NFS_UTILS_CONF_OPTS = \
 >  	--enable-ipv6 \
 >  	--without-tcp-wrappers \
 >  	--with-statedir=/run/nfs \
 > -	--with-rpcgen=internal
 > +	--with-rpcgen=$(HOST_DIR)/bin/rpcgen

While host-nfs-utils does get implicitly pulled in by libtirpc, it
isn't very obvious - So I've added an explicit host-nfs-utils dependency
and committed, thanks.

-- 
Bye, Peter Korsgaard
