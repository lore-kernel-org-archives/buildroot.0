From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 14:26:46 +0100
Subject: [Buildroot] Package without external sources
In-Reply-To: <70b69772-0747-d241-77a7-3e17b9ec56e5@klomp.eu> (Sven Klomp's
 message of "Sat, 14 Nov 2020 13:56:05 +0100")
References: <70b69772-0747-d241-77a7-3e17b9ec56e5@klomp.eu>
Message-ID: <874kls9ii1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Klomp <mail@klomp.eu> writes:

 > Hello,
 > I want to create a package without external sources. photoframe.mk
 > looks like:
 > PHOTOFRAME_VERSION = 0.0.1
 > PHOTOFRAME_LICENSE = GPL-3.0+

 > define PHOTOFRAME_INSTALL_TARGET_CMDS
 > ??? $(INSTALL) -D -m 0755 $(LIBFOO_PKGDIR)/photoframe.sh $(TARGET_DIR)/bin
 > endef

 > $(eval $(autotools-package))


 > However, the it complains with
 > "PHOTOFRAME_SITE cannot be empty when PHOTOFRAME_SOURCE is not"

 > I wonder, as PHOTOFRAME_SOURCE is not set as shown above.

It is because PHOTOFRAME_SOURCE defaults to
photoframe-$(PHOTOFRAME_VERSION).tar.gz. If you don't have any external
source code, just drop PHOTOFRAME_VERSION to disable this, talking about
the photoframe version when it is part of the buildroot tree anyway
doesn't make a lot of sense.

-- 
Bye, Peter Korsgaard
