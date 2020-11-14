From: Sven Klomp <mail@klomp.eu>
Date: Sat, 14 Nov 2020 13:56:05 +0100
Subject: [Buildroot] Package without external sources
Message-ID: <70b69772-0747-d241-77a7-3e17b9ec56e5@klomp.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I want to create a package without external sources. photoframe.mk looks 
like:
PHOTOFRAME_VERSION = 0.0.1
PHOTOFRAME_LICENSE = GPL-3.0+

define PHOTOFRAME_INSTALL_TARGET_CMDS
 ??? $(INSTALL) -D -m 0755 $(LIBFOO_PKGDIR)/photoframe.sh $(TARGET_DIR)/bin
endef

$(eval $(autotools-package))


However, the it complains with
"PHOTOFRAME_SITE cannot be empty when PHOTOFRAME_SOURCE is not"

I wonder, as PHOTOFRAME_SOURCE is not set as shown above.


Thanks for help
Sven
