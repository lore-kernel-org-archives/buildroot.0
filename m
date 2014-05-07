From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 May 2014 14:01:52 +0200
Subject: [Buildroot] [PATCH 10/11] nfs-utils: add license information
In-Reply-To: <1399390966-9678-11-git-send-email-rjbarnet@rockwellcollins.com>
 (Ryan Barnett's message of "Tue, 6 May 2014 10:42:45 -0500")
References: <1399390966-9678-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1399390966-9678-11-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <87mweter0v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <rjbarnet@rockwellcollins.com> writes:

 > Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
 > ---
 >  package/nfs-utils/nfs-utils.mk |    2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
 > index 76face5..2fe5d43 100644
 > --- a/package/nfs-utils/nfs-utils.mk
 > +++ b/package/nfs-utils/nfs-utils.mk
 > @@ -7,6 +7,8 @@
 >  NFS_UTILS_VERSION = 1.2.6
 >  NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.bz2
 >  NFS_UTILS_SITE = http://downloads.sourceforge.net/project/nfs/nfs-utils/$(NFS_UTILS_VERSION)
 > +NFS_UTILS_LICENSE = GPLv2

A number of the files contain the '(at your option) any later version'
string:

grep -rls 'at your option.*later' utils
utils/nfsd/nfssvc.h
utils/nfsdcld/sqlite.h
utils/nfsdcld/sqlite.c
utils/nfsdcld/nfsdcld.c
utils/statd/COPYING
utils/statd/hostname.c
utils/mount/parse_dev.h
utils/mount/network.c
utils/mount/token.h
utils/mount/stropts.h
utils/mount/error.c
utils/mount/parse_opt.c
utils/mount/utils.h
utils/mount/token.c
utils/mount/parse_dev.c
utils/mount/version.h
utils/mount/parse_opt.h
utils/mount/network.h
utils/mount/error.h
utils/mount/stropts.c

So I made it GPLv2+. That's also what Debian lists it as.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
