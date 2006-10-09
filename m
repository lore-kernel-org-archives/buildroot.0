From: Fredrik Roubert <roubert@df.lth.se>
Date: Mon, 9 Oct 2006 10:37:21 +0200
Subject: [Buildroot] CCACHE_DIR
Message-ID: <20061009083721.GC20352@igloo.df.lth.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Currently buildroot hardcodes the ccache directory patch, with the
consequence that the built toolchain can't be used outside of the
buildroot build tree.

Three months ago, Ed Swierk suggested on this mailing list to change
that behaviour:

http://www.busybox.net/lists/buildroot/2006-July/000027.html

As far as I can see in the archives, there was no response to his mail.
From my point of view, his suggestion is a good one and it would be a
good idea to apply his patch to buildroot. I therefore attach his patch
to this mail (so that everyone can see it immediately, it's very short),
and ask for anyone who thinks that this patch is a bad idea to explain
why.

Cheers // Fredrik Roubert

-- 
Visserij 192  |  +32 473 344527 / +46 708 776974
BE-9000 Gent  |  http://www.df.lth.se/~roubert/
-------------- next part --------------
--- buildroot.orig/toolchain/ccache/ccache.mk	2006-06-26 07:15:03.000000000 +0000
+++ buildroot/toolchain/ccache/ccache.mk	2006-07-17 16:34:58.000000000 +0000
@@ -24,10 +24,6 @@
 	# Should probably patch things to use a relative path.
 	$(SED) "s,getenv(\"CCACHE_PATH\"),\"$(STAGING_DIR)/bin-ccache\",g" \
 		$(CCACHE_DIR1)/execute.c
-	# WARNING - this will break if the toolchain build dir is deleted.
-	$(SED) "s,getenv(\"CCACHE_DIR\"),\"$(CCACHE_DIR1)/cache\",g" \
-		$(CCACHE_DIR1)/ccache.c
-	mkdir -p $(CCACHE_DIR1)/cache
 	touch $(CCACHE_DIR1)/.patched
 
 $(CCACHE_DIR1)/.configured: $(CCACHE_DIR1)/.patched
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 303 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061009/d2a61a12/attachment.pgp 
