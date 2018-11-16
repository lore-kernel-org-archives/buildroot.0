From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 16 Nov 2018 18:12:22 +0100
Subject: [Buildroot] [PATCH 2/2] libtirpc: Fix whitespace on 4th patch
In-Reply-To: <20181116171222.23391-1-petr.vorel@gmail.com>
References: <20181116171222.23391-1-petr.vorel@gmail.com>
Message-ID: <20181116171222.23391-2-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...es-needed-to-build-rpcbind-on-top-of.patch | 78 +++++++++----------
 1 file changed, 38 insertions(+), 40 deletions(-)

diff --git a/package/libtirpc/0004-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch b/package/libtirpc/0004-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
index 7f53ffca16..797fb7a42c 100644
--- a/package/libtirpc/0004-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
+++ b/package/libtirpc/0004-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
@@ -22,16 +22,16 @@ index aa5908e..4999066 100644
 +++ b/Makefile.am
 @@ -2,6 +2,9 @@ SUBDIRS = src man doc rpcgen
  ACLOCAL_AMFLAGS = -I m4
- 
+
  GENFILES	       = tirpc/rpcsvc/crypt.h \
 +			 tirpc/rpcsvc/mount.h \
 +			 tirpc/rpcsvc/nfs_prot.h \
 +			 tirpc/rpcsvc/rquota.h \
  			 tirpc/rpc/rpcb_prot.h
- 
+
  noinst_HEADERS	       = tirpc/reentrant.h \
 @@ -11,6 +14,9 @@ noinst_HEADERS	       = tirpc/reentrant.h \
- 
+
  nobase_include_HEADERS = tirpc/netconfig.h \
  			 tirpc/rpcsvc/crypt.x \
 +			 tirpc/rpcsvc/mount.x \
@@ -53,23 +53,23 @@ index 0000000..f68a06f
 + * may copy or modify Sun RPC without charge, but are not authorized
 + * to license or distribute it to anyone else except as part of a product or
 + * program developed by the user.
-+ * 
++ *
 + * SUN RPC IS PROVIDED AS IS WITH NO WARRANTIES OF ANY KIND INCLUDING THE
 + * WARRANTIES OF DESIGN, MERCHANTIBILITY AND FITNESS FOR A PARTICULAR
 + * PURPOSE, OR ARISING FROM A COURSE OF DEALING, USAGE OR TRADE PRACTICE.
-+ * 
++ *
 + * Sun RPC is provided with no support and without any obligation on the
 + * part of Sun Microsystems, Inc. to assist in its use, correction,
 + * modification or enhancement.
-+ * 
++ *
 + * SUN MICROSYSTEMS, INC. SHALL HAVE NO LIABILITY WITH RESPECT TO THE
 + * INFRINGEMENT OF COPYRIGHTS, TRADE SECRETS OR ANY PATENTS BY SUN RPC
 + * OR ANY PART THEREOF.
-+ * 
++ *
 + * In no event will Sun Microsystems, Inc. be liable for any lost revenue
 + * or profits or other special, indirect and consequential damages, even if
 + * Sun has been advised of the possibility of such damages.
-+ * 
++ *
 + * Sun Microsystems, Inc.
 + * 2550 Garcia Avenue
 + * Mountain View, California  94043
@@ -101,13 +101,13 @@ index 0000000..f68a06f
 + * or a directory. The file handle can contain whatever information the
 + * server needs to distinguish an individual file.
 + */
-+typedef opaque fhandle[FHSIZE];	
++typedef opaque fhandle[FHSIZE];
 +#ifdef WANT_NFS3
 +typedef opaque fhandle3<FHSIZE3>;
 +#endif
 +
 +/*
-+ * If a status of zero is returned, the call completed successfully, and 
++ * If a status of zero is returned, the call completed successfully, and
 + * a file handle for the directory follows. A non-zero status indicates
 + * some sort of error. The status corresponds with UNIX error numbers.
 + */
@@ -203,20 +203,20 @@ index 0000000..f68a06f
 +		void
 +		MOUNTPROC_NULL(void) = 0;
 +
-+		/*	
++		/*
 +		 * If fhs_status is 0, then fhs_fhandle contains the
-+	 	 * file handle for the directory. This file handle may
++		 * file handle for the directory. This file handle may
 +		 * be used in the NFS protocol. This procedure also adds
 +		 * a new entry to the mount list for this client mounting
 +		 * the directory.
 +		 * Unix authentication required.
 +		 */
-+		fhstatus 
++		fhstatus
 +		MOUNTPROC_MNT(dirpath) = 1;
 +
 +		/*
-+		 * Returns the list of remotely mounted filesystems. The 
-+		 * mountlist contains one entry for each hostname and 
++		 * Returns the list of remotely mounted filesystems. The
++		 * mountlist contains one entry for each hostname and
 +		 * directory pair.
 +		 */
 +		mountlist
@@ -273,8 +273,8 @@ index 0000000..f68a06f
 +		MOUNTPROC_MNT(dirpath) = 1;
 +
 +		/*
-+		 * Returns the list of remotely mounted filesystems. The 
-+		 * mountlist contains one entry for each hostname and 
++		 * Returns the list of remotely mounted filesystems. The
++		 * mountlist contains one entry for each hostname and
 +		 * directory pair.
 +		 */
 +		mountlist
@@ -308,7 +308,7 @@ new file mode 100644
 index 0000000..01564f8
 --- /dev/null
 +++ b/tirpc/rpcsvc/nfs_prot.x
-@@ -0,0 +1,1266 @@
+@@ -0,0 +1,1265 @@
 +/*
 + * Sun RPC is a product of Sun Microsystems, Inc. and is provided for
 + * unrestricted use provided that this legend is included on all tape
@@ -316,23 +316,23 @@ index 0000000..01564f8
 + * may copy or modify Sun RPC without charge, but are not authorized
 + * to license or distribute it to anyone else except as part of a product or
 + * program developed by the user.
-+ * 
++ *
 + * SUN RPC IS PROVIDED AS IS WITH NO WARRANTIES OF ANY KIND INCLUDING THE
 + * WARRANTIES OF DESIGN, MERCHANTIBILITY AND FITNESS FOR A PARTICULAR
 + * PURPOSE, OR ARISING FROM A COURSE OF DEALING, USAGE OR TRADE PRACTICE.
-+ * 
++ *
 + * Sun RPC is provided with no support and without any obligation on the
 + * part of Sun Microsystems, Inc. to assist in its use, correction,
 + * modification or enhancement.
-+ * 
++ *
 + * SUN MICROSYSTEMS, INC. SHALL HAVE NO LIABILITY WITH RESPECT TO THE
 + * INFRINGEMENT OF COPYRIGHTS, TRADE SECRETS OR ANY PATENTS BY SUN RPC
 + * OR ANY PART THEREOF.
-+ * 
++ *
 + * In no event will Sun Microsystems, Inc. be liable for any lost revenue
 + * or profits or other special, indirect and consequential damages, even if
 + * Sun has been advised of the possibility of such damages.
-+ * 
++ *
 + * Sun Microsystems, Inc.
 + * 2550 Garcia Avenue
 + * Mountain View, California  94043
@@ -413,7 +413,7 @@ index 0000000..01564f8
 +	opaque data[NFS_FHSIZE];
 +};
 +
-+/* 
++/*
 + * Timeval
 + */
 +struct nfstime {
@@ -455,7 +455,7 @@ index 0000000..01564f8
 +};
 +
 +
-+typedef string filename<NFS_MAXNAMLEN>; 
++typedef string filename<NFS_MAXNAMLEN>;
 +typedef string nfspath<NFS_MAXPATHLEN>;
 +
 +/*
@@ -529,7 +529,7 @@ index 0000000..01564f8
 +};
 +
 +/*
-+ * Arguments to remote write 
++ * Arguments to remote write
 + */
 +struct writeargs {
 +	nfs_fh	file;		/* handle for file */
@@ -694,7 +694,7 @@ index 0000000..01564f8
 +	opaque data<NFS3_FHSIZE>;
 +};
 +
-+/* 
++/*
 + * Timeval (v3)
 + */
 +struct nfstime3 {
@@ -1448,28 +1448,28 @@ index 0000000..01564f8
 + */
 +program NFS_PROGRAM {
 +	version NFS_VERSION {
-+		void 
++		void
 +		NFSPROC_NULL(void) = 0;
 +
-+		attrstat 
++		attrstat
 +		NFSPROC_GETATTR(nfs_fh) =	1;
 +
-+		attrstat 
++		attrstat
 +		NFSPROC_SETATTR(sattrargs) = 2;
 +
-+		void 
++		void
 +		NFSPROC_ROOT(void) = 3;
 +
-+		diropres 
++		diropres
 +		NFSPROC_LOOKUP(diropargs) = 4;
 +
-+		readlinkres 
++		readlinkres
 +		NFSPROC_READLINK(nfs_fh) = 5;
 +
-+		readres 
++		readres
 +		NFSPROC_READ(readargs) = 6;
 +
-+		void 
++		void
 +		NFSPROC_WRITECACHE(void) = 7;
 +
 +		attrstat
@@ -1574,7 +1574,6 @@ index 0000000..01564f8
 +	} = 3;
 +} = 100003;
 +#endif
-+
 diff --git a/tirpc/rpcsvc/rquota.x b/tirpc/rpcsvc/rquota.x
 new file mode 100644
 index 0000000..72864d1
@@ -1616,7 +1615,7 @@ index 0000000..72864d1
 +	unsigned int rq_curfiles;	/* current # allocated files */
 +	unsigned int rq_btimeleft;	/* time left for excessive disk use */
 +	unsigned int rq_ftimeleft;	/* time left for excessive files */
-+};	
++};
 +
 +enum gqr_status {
 +	Q_OK = 1,		/* quota returned */
@@ -1642,12 +1641,11 @@ index 0000000..72864d1
 +		RQUOTAPROC_GETQUOTA(getquota_args) = 1;
 +
 +		/*
-+	 	 * Get active quotas only
++		 * Get active quotas only
 +		 */
 +		getquota_rslt
 +		RQUOTAPROC_GETACTIVEQUOTA(getquota_args) = 2;
 +	} = 1;
 +} = 100011;
--- 
+--
 1.9.1
-
-- 
2.19.1
