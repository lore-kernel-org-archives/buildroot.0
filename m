From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 09 Apr 2014 21:47:01 +0200
Subject: [Buildroot] [PATCH v2] expect: new package 5.45
In-Reply-To: <1397051636-22272-1-git-send-email-andrew.ruder@elecsyscorp.com>
References: <1397051636-22272-1-git-send-email-andrew.ruder@elecsyscorp.com>
Message-ID: <5b136bda-caa5-47d1-9940-23d54caa06f8@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andrew,

Andrew Ruder <andrew.ruder@elecsyscorp.com> schreef:
>Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
>---
> A few changes from the last time:
>
>    . Removed the dependencies in BR2_PACKAGE_EXPECT Config.in
>      since it is taken care of by the BR2_PACKAGE_TCL.
>
>    . Split the patch into two (one for each notional change) and
>      added git-style headers to each patch.
....

>diff --git a/package/expect/expect.mk b/package/expect/expect.mk
>new file mode 100644
>index 0000000..91fa019
>--- /dev/null
>+++ b/package/expect/expect.mk
>@@ -0,0 +1,21 @@
>+################################################################################
>+#
>+# expect
>+#
>+################################################################################
>+
>+EXPECT_VERSION = 5.45
>+EXPECT_SOURCE = expect$(EXPECT_VERSION).tar.gz
>+EXPECT_SITE = http://downloads.sourceforge.net/project/expect/Expect/$(EXPECT_VERSION)

I don't have the sources available right now, but don't we have a variable that points to sourceforge? BR2_SOURCEFORGE_MIRROR I thought...

>+EXPECT_LICENSE = Public domain
>+EXPECT_LICENSE_FILES = README
>+
>+EXPECT_AUTORECONF = YES
>+EXPECT_DEPENDENCIES = tcl
>+EXPECT_CONF_OPT = --with-tcl=$(BUILD_DIR)/tcl-$(TCL_VERSION)/unix
>+
>+# Since we don't want examples installed
>+EXPECT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR)  install-binaries
>+
>+$(eval $(autotools-package))
>+

This last empty line should be removed. (nitpick)

Best regards,
Thomas
