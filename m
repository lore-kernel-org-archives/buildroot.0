From: Hamish Moffatt <hamish@cloud.net.au>
Date: Mon, 15 Oct 2007 12:04:50 +1000
Subject: [Buildroot] patch: packages/mpfr fails to build
Message-ID: <20071015020450.GA1526@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mpfr package now fails to build due to the odd format of the upstream
mpfr patches file. Upstream recommends using "patch -p1 -N -Z", so here
is a patch to make buildroot do this.

thanks
Hamish

Index: package/mpfr/mpfr.mk
===================================================================
--- package/mpfr/mpfr.mk        (revision 20217)
+++ package/mpfr/mpfr.mk        (working copy)
@@ -42,7 +42,7 @@
        toolchain/patch-kernel.sh $(MPFR_DIR) package/mpfr/ \*.patch
        $(CONFIG_UPDATE) $(MPFR_DIR)
 ifneq ($(MPFR_PATCH),)
-       ( cd $(MPFR_DIR); patch -p1 < $(DL_DIR)/$(MPFR_PATCH_FILE); )
+       ( cd $(MPFR_DIR); patch -p1 -N -Z < $(DL_DIR)/$(MPFR_PATCH_FILE); )
 endif
        touch $@

-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
