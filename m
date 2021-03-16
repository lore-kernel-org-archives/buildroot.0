From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:57:52 +0100
Subject: [Buildroot] [git commit] package/json-for-modern-cpp: enable
 multiple headers by default
Message-ID: <20210316203407.CDBFC865CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f17b25550df9223dfeb62b0eeb66cacb5189125f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

json-for-modern-cpp provides an option to enable multiple headers support.
Currently this option is disabled and the package creates just a
single header: "nlohmann/json.hpp", which contains everything. Enabling
this option, splits this single header into multiple ones. First of all
this provides an additional header: "nlohmann/json_fwd.hpp", which contains
only forwarding declarations of types provided by this library. This
gives you a more finer control over include dependencies and can speed up
build times significantly. The top level header: "nlohmann/json.hpp" is
still there and therefore code which used it before, would stay compatible.

Signed-off-by: Dimitrij Kotrev <dimitrij.kotrev@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/json-for-modern-cpp/json-for-modern-cpp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
index 6e21723fd4..94cdc909f3 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
@@ -12,6 +12,6 @@ JSON_FOR_MODERN_CPP_LICENSE_FILES = LICENSE.MIT
 JSON_FOR_MODERN_CPP_INSTALL_STAGING = YES
 # header only library
 JSON_FOR_MODERN_CPP_INSTALL_TARGET = NO
-JSON_FOR_MODERN_CPP_CONF_OPTS = -DJSON_BuildTests=OFF
+JSON_FOR_MODERN_CPP_CONF_OPTS = -DJSON_BuildTests=OFF -DJSON_MultipleHeaders=ON
 
 $(eval $(cmake-package))
