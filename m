From: Bernhard Fischer <rep.nop@aon.at>
Date: Tue, 3 Oct 2006 10:40:35 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/lsof
In-Reply-To: <20061002184043.0CF8D4856C@busybox.net>
References: <20061002184043.0CF8D4856C@busybox.net>
Message-ID: <20061003084035.GB4585@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 02, 2006 at 11:40:43AM -0700, andersen at uclibc.org wrote:
>Author: andersen
>Date: 2006-10-02 11:40:42 -0700 (Mon, 02 Oct 2006)
>New Revision: 16289
>
>Log:
>escape the wildcard

Looks like these need escaping too, no?

grep -rHl "patch-kernel.*[^\\]\*" *
package/ed/ed.mk
package/coreutils/coreutils.mk
package/libpcap/libpcap.mk
package/sysvinit/sysvinit.mk
package/ruby/ruby.mk
package/libglib12/libglib12.mk
package/libgtk12/libgtk12.mk
package/bash/bash.mk
target/cloop/cloop.mk

>
>
>Modified:
>   trunk/buildroot/package/lsof/lsof.mk
>
>
>Changeset:
>Modified: trunk/buildroot/package/lsof/lsof.mk
>===================================================================
>--- trunk/buildroot/package/lsof/lsof.mk	2006-10-02 18:25:37 UTC (rev 16288)
>+++ trunk/buildroot/package/lsof/lsof.mk	2006-10-02 18:40:42 UTC (rev 16289)
>@@ -20,7 +20,7 @@
> $(LSOF_DIR)/.unpacked: $(DL_DIR)/$(LSOF_SOURCE)
> 	$(LSOF_CAT) $(DL_DIR)/$(LSOF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
> 	(cd $(LSOF_DIR);tar xf lsof_4.77_src.tar;rm -f lsof_4.77_src.tar)
>-	toolchain/patch-kernel.sh $(LSOF_DIR) package/lsof/ *.patch
>+	toolchain/patch-kernel.sh $(LSOF_DIR) package/lsof/ \*.patch
> 	touch $(LSOF_DIR)/.unpacked
> 
> $(LSOF_DIR)/.configured: $(LSOF_DIR)/.unpacked
>
>_______________________________________________
>buildroot mailing list
>buildroot at uclibc.org
>http://busybox.net/mailman/listinfo/buildroot
>
