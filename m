From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 20 Aug 2007 18:05:17 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:
	diffutils	distcc freetype
In-Reply-To: <20070819231647.5601AA60F9@busybox.net>
References: <20070819231647.5601AA60F9@busybox.net>
Message-ID: <20070820160517.GF23522@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 19, 2007 at 04:16:47PM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-08-19 16:16:47 -0700 (Sun, 19 Aug 2007)
>New Revision: 19583
>
>Log:
>Update configs for distcc, diffutils and freetype
>
>Modified:
>   trunk/buildroot/package/diffutils/diffutils.mk
>   trunk/buildroot/package/distcc/distcc.mk
>   trunk/buildroot/package/freetype/freetype.mk
>
>
>Changeset:
>Modified: trunk/buildroot/package/diffutils/diffutils.mk
>===================================================================
>--- trunk/buildroot/package/diffutils/diffutils.mk	2007-08-19 23:13:06 UTC (rev 19582)
>+++ trunk/buildroot/package/diffutils/diffutils.mk	2007-08-19 23:16:47 UTC (rev 19583)
>@@ -19,6 +19,7 @@
> 
> $(DIFFUTILS_DIR)/.unpacked: $(DL_DIR)/$(DIFFUTILS_SOURCE)
> 	$(DIFFUTILS_CAT) $(DL_DIR)/$(DIFFUTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
>+	$(CONFIG_UPDATE) $(DIFFUTILS_DIR)/config
> 	touch $(DIFFUTILS_DIR)/.unpacked
> 
> $(DIFFUTILS_DIR)/.configured: $(DIFFUTILS_DIR)/.unpacked
>@@ -108,6 +109,8 @@
> 
> diffutils: uclibc $(TARGET_DIR)/$(DIFFUTILS_TARGET_BINARY)
> 
>+diff-utils-unpacked:	$(DIFFUTILS_DIR)/.unpacked

whitespace damaged..
