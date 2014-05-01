From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 1 May 2014 15:33:30 -0500
Subject: [Buildroot] [PATCH 1/3] host-xxd: new package
In-Reply-To: <1f442184-7786-48c4-b996-d9cb2c17a0b0@email.android.com>
References: <1398972731-20680-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1398972731-20680-2-git-send-email-rjbarnet@rockwellcollins.com>
 <1f442184-7786-48c4-b996-d9cb2c17a0b0@email.android.com>
Message-ID: <OF7E3EDC93.D705E076-ON86257CCB.00705B0E-86257CCB.0070EAAF@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 05/01/2014 
02:56:37 PM:

> Hi Ryan,
> >diff --git a/package/xxd/Config.in.host b/package/xxd/Config.in.host
> >new file mode 100644
> >index 0000000..c2cddde
> >--- /dev/null
> >+++ b/package/xxd/Config.in.host
> >@@ -0,0 +1,6 @@
> >+config BR2_PACKAGE_XXD
> >+   bool "host xxd"
> >+   help
> >+     xxd creates a hex dump of a given file or standard input
> >+
> >+     http://linux.die.net/man/1/xxd
> 
> Normally we specify a project site here, no man page. Is there no such
> site available?

Yes that is correct. I could not find an official project website since 
this tool is public domain. The most useful site that I found for this 
package the man page.

Any other thoughts on what this should be?

> 
> >diff --git a/package/xxd/xxd.mk b/package/xxd/xxd.mk
> >new file mode 100644
> >index 0000000..a960f86
> >--- /dev/null
> >+++ b/package/xxd/xxd.mk
> >@@ -0,0 +1,20 @@
> >
> 
+################################################################################
> >+#
> >+# xxd
> >+#
> >
> 
+################################################################################
> >+
> >+XXD_VERSION = 1.10
> >+XXD_SITE    = http://grail.cba.csuohio.edu/~somos
> 
> Extra whitespace before = should be removed.

Will remove.
 
> >+XXD_LICENSE = Public Domain
> >+XXD_LICENSE_FILES = xxd.c
> >+
> >+define HOST_XXD_BUILD_CMDS
> >+   $(HOST_MAKE_ENV) $(MAKE) -C $(@D)
> >+endef
> >+
> >+define HOST_XXD_INSTALL_CMDS
> >+   $(INSTALL) -m 0755 -D $(@D)/xxd $(HOST_DIR)/usr/bin/xxd
> >+endef
> >+
> >+$(eval $(host-generic-package))
> 
> Best regards,
> Thomas

Thanks,
-Ryan
