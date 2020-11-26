From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 26 Nov 2020 18:43:00 +0100
Subject: [Buildroot] [PATCH 17/18] package/erlang-p1-xmpp: bump version to
 1.4.10
In-Reply-To: <20201126174301.411219-1-johan.oudinet@gmail.com>
References: <20201126174301.411219-1-johan.oudinet@gmail.com>
Message-ID: <20201126174301.411219-17-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

upstream uses include_lib. Adapt the corresponding patch accordingly.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-xmpp/0001-fix-includes.patch | 4 ++--
 package/erlang-p1-xmpp/erlang-p1-xmpp.hash     | 4 ++--
 package/erlang-p1-xmpp/erlang-p1-xmpp.mk       | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/erlang-p1-xmpp/0001-fix-includes.patch b/package/erlang-p1-xmpp/0001-fix-includes.patch
index d0a267b721..f02037fdc1 100644
--- a/package/erlang-p1-xmpp/0001-fix-includes.patch
+++ b/package/erlang-p1-xmpp/0001-fix-includes.patch
@@ -6,11 +6,11 @@ diff --git a/include/xmpp.hrl b/include/xmpp.hrl
 index afa5f61..678858e 100644
 --- a/include/xmpp.hrl
 +++ b/include/xmpp.hrl
-@@ -26,7 +26,7 @@
+@@ -25,7 +25,7 @@
  -include("ns.hrl").
  -include("jid.hrl").
  -include("xmpp_codec.hrl").
---include("fxml.hrl").
+--include_lib("fast_xml/include/fxml.hrl").
 +-include_lib("p1_xml/include/fxml.hrl").
 
  -type stanza() :: iq() | presence() | message().
diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.hash b/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
index 05578f9939..d0a761fcac 100644
--- a/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 a192349e256c0c0af46e6d7f46c52e6345e61984a266696bb0346934c434f342 erlang-p1-xmpp-1.4.2.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE.txt
+sha256  65c73ffaf8faab5d6fc7d42ada0b5a380f20f3e46056ad98614d81922322d9a2  erlang-p1-xmpp-1.4.10.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
index 2f74c60df2..f903cb945d 100644
--- a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_XMPP_VERSION = 1.4.2
+ERLANG_P1_XMPP_VERSION = 1.4.10
 ERLANG_P1_XMPP_SITE = $(call github,processone,xmpp,$(ERLANG_P1_XMPP_VERSION))
 ERLANG_P1_XMPP_LICENSE = Apache-2.0
 ERLANG_P1_XMPP_LICENSE_FILES = LICENSE.txt
-- 
2.25.1
