From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Mon, 10 Nov 2008 12:01:31 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20081110104547.16BEB3C7BC@busybox.net>
References: <20081110104547.16BEB3C7BC@busybox.net>
Message-ID: <20081110110131.GA16174@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 10, 2008 at 02:45:47AM -0800, vanokuten at uclibc.org wrote:
>Author: vanokuten
>Date: 2008-11-10 02:45:46 -0800 (Mon, 10 Nov 2008)
>New Revision: 23987
>
>Log:
>Download Kernel.org minor patches at the same time as full sources.

The comment is correct but the impl is wrong since you do not _download_ all required stuff
at the proper time.
So: Iff there are patches, those patches are prerequesites of the _SOURCE which will
automagically make 'make source' do the right thing.
>
>Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
>
>
>
>Modified:
>   trunk/buildroot/target/linux/Makefile.in.advanced
>
>
>Changeset:
>Modified: trunk/buildroot/target/linux/Makefile.in.advanced
>===================================================================
>--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-11-10 09:51:15 UTC (rev 23986)
>+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-11-10 10:45:46 UTC (rev 23987)
>@@ -205,7 +205,7 @@
> 	 $(WGET) -P $(DL_DIR) $(LINUX26_PATCH_SITE)/$(LINUX26_PATCH_SOURCE)
> endif
> 
>-$(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)
>+$(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE) $(DL_DIR)/$(LINUX26_PATCH_SOURCE)
> 	rm -rf $(LINUX26_DIR)
> 	@echo "*** Unpacking kernel source"
> 	$(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -
>
