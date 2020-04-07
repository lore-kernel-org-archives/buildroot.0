From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 20:55:48 +0200
Subject: [Buildroot] [PATCH 2/2] package/rocksdb: fix build without
 dlfcn.h
In-Reply-To: <20200328155829.1133494-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 28 Mar 2020 16:58:29 +0100")
References: <20200328155829.1133494-1-fontaine.fabrice@gmail.com>
 <20200328155829.1133494-2-fontaine.fabrice@gmail.com>
Message-ID: <875zebnn0r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/04c5afff034d8d71d11b95c998e3156292852de6

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

 > ---
 >  package/rocksdb/rocksdb.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/rocksdb/rocksdb.mk b/package/rocksdb/rocksdb.mk
 > index 86732ad46c..31a9f98b55 100644
 > --- a/package/rocksdb/rocksdb.mk
 > +++ b/package/rocksdb/rocksdb.mk
 > @@ -70,6 +70,7 @@ endif
 >  ifeq ($(BR2_STATIC_LIBS),y)
 >  ROCKSDB_BUILD_TARGETS += static_lib
 >  ROCKSDB_INSTALL_TARGETS += install-static
 > +ROCKSDB_EXTRA_CXXFLAGS += -DROCKSDB_NO_DYNAMIC_EXTENSION
 >  else ifeq ($(BR2_SHARED_LIBS),y)
 >  ROCKSDB_BUILD_TARGETS += shared_lib
 >  ROCKSDB_INSTALL_TARGETS += install-shared
 > -- 
 > 2.25.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
