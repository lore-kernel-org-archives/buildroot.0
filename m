From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 22 Jul 2011 13:51:45 +0200
Subject: [Buildroot] [git commit] ipset: ensure target kernel headers are
	used
Message-ID: <20110722115833.2A3F08B422@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ca99c04d2676ba66b670b0eb17ed5fe5d37db4e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ipsets configure script checks the kernel headers to ensure the kernel
is new enough / has patch applied, and errors out if this is not so.

Ensure that the target kernel headers are searched, rather than
what is available on the build host.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ipset/ipset.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 9d901fc..700d2bc 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -9,5 +9,6 @@ IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_AUTORECONF = YES
 IPSET_DEPENDENCIES = libmnl host-pkg-config
+IPSET_CONF_OPT = --with-ksource=$(LINUX_HEADERS_DIR)
 
 $(eval $(call AUTOTARGETS,package,ipset))
-- 
1.7.3.4
