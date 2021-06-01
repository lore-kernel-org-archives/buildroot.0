From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jun 2021 22:40:01 +0200
Subject: [Buildroot] [git commit branch/next] package/sofia-sip: correct
 passing of '--enable-ndebug'
Message-ID: <20210601201213.4995B7FE56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb12adbb7613a4c05643491453dbc09151b5bf48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The preprocessor option NDEBUG, triggered by the configure option
'--enable-ndebug', should be read as 'no-debug'. When NDEBUG is set, asserts
are _disabled_.

The sofia-sip package had inverted logic, and set '--enable-ndebug' when
BR2_ENABLE_DEBUG was enabled, while it should be the other way around.

Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sofia-sip/sofia-sip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index 5c383400ff..274c72fce8 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -30,7 +30,7 @@ SOFIA_SIP_CONF_OPTS += \
 	--without-openssl
 endif
 
-ifeq ($(BR2_ENABLE_DEBUG),y)
+ifeq ($(BR2_ENABLE_DEBUG),)
 SOFIA_SIP_CONF_OPTS += --enable-ndebug
 endif
 
