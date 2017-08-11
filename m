From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 11 Aug 2017 12:43:24 +0200
Subject: [Buildroot] [git commit] erlang-p1-xml: Fix host dependencies
	variable name
Message-ID: <20170811120044.E7FA2817C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4f7ec4bd1053c3790dc298af39bbdf5e11b5c1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This should fix the error reported by autobuild:
http://autobuild.buildroot.net/results/63c/63c63b2578e9f6ad71cbea82b987c128305cdab4/

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/erlang-p1-xml/erlang-p1-xml.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang-p1-xml/erlang-p1-xml.mk b/package/erlang-p1-xml/erlang-p1-xml.mk
index 0b0b1ca..58ba3cb 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.mk
+++ b/package/erlang-p1-xml/erlang-p1-xml.mk
@@ -9,7 +9,7 @@ ERLANG_P1_XML_SITE = $(call github,processone,fast_xml,$(ERLANG_P1_XML_VERSION))
 ERLANG_P1_XML_LICENSE = Apache-2.0
 ERLANG_P1_XML_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_XML_DEPENDENCIES = expat erlang-p1-utils
-ERLANG_P1_XML_HOST_DEPENDENCIES = host-expat host-erlang-p1-utils
+HOST_ERLANG_P1_XML_DEPENDENCIES = host-expat host-erlang-p1-utils
 ERLANG_P1_XML_INSTALL_STAGING = YES
 
 ERLANG_P1_XML_USE_AUTOCONF = YES
