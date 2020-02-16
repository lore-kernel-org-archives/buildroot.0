From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 17:33:58 +0100
Subject: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.4.3
In-Reply-To: <87wo8mec2b.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 16 Feb 2020 17:23:08 +0100")
References: <20200210120353.49600-1-giulio.benetti@benettiengineering.com>
 <87wo8mec2b.fsf@dell.be.48ers.dk>
Message-ID: <87pneeebk9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 >> +++ b/package/nfs-utils/nfs-utils.mk
 >> @@ -4,7 +4,7 @@
 >> #
 >> ################################################################################
 
 >> -NFS_UTILS_VERSION = 1.3.4
 >> +NFS_UTILS_VERSION = 2.4.3
 >> NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 >> NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 >> NFS_UTILS_LICENSE = GPL-2.0+
 >> @@ -23,7 +23,8 @@ NFS_UTILS_CONF_OPTS = \
 >> --enable-ipv6 \
 >> --without-tcp-wrappers \
 >> --with-statedir=/run/nfs \
 >> -	--with-rpcgen=internal
 >> +	--with-rpcgen=$(HOST_DIR)/bin/rpcgen

 > While host-nfs-utils does get implicitly pulled in by libtirpc, it
 > isn't very obvious - So I've added an explicit host-nfs-utils dependency
 > and committed, thanks.

Ups, and I forgot to mention that I also dropped _AUTORECONF = YES now
that all the patches are gone.

-- 
Bye, Peter Korsgaard
