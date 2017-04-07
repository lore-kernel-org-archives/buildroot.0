From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  7 Apr 2017 16:28:59 +0200
Subject: [Buildroot] [PATCH 2/2] icu: legal-info: refer to the real license
	file
In-Reply-To: <20170407142859.5801-1-peter@korsgaard.com>
References: <20170407142859.5801-1-peter@korsgaard.com>
Message-ID: <20170407142859.5801-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License.html now just contains the string:

The ICU license is now in plain text format, see <a href="./LICENSE">LICENSE</a>.
Update links and software appropriately.

So refer directly to that file instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/icu/icu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index b9e42de94..a435e471a 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -8,7 +8,7 @@ ICU_VERSION = 58.2
 ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = http://download.icu-project.org/files/icu4c/$(ICU_VERSION)
 ICU_LICENSE = ICU License
-ICU_LICENSE_FILES = license.html
+ICU_LICENSE_FILES = LICENSE
 
 ICU_DEPENDENCIES = host-icu
 ICU_INSTALL_STAGING = YES
-- 
2.11.0
