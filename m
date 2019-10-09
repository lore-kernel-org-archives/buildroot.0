From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Wed,  9 Oct 2019 13:26:49 +0200
Subject: [Buildroot] [PATCH v2 2/9] package/libssh: use
 host-autotools-package macro
In-Reply-To: <20191009112656.21232-1-heiko.thiery@gmail.com>
References: <20191009112656.21232-1-heiko.thiery@gmail.com>
Message-ID: <20191009112656.21232-3-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

Enable host support for the lib because the package host-sysrepo (depends on
package libnetconf2) is needed by package netopeer2keystored.

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 package/libssh/libssh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index b8464ed2bf..b90c52a2f3 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -43,3 +43,4 @@ LIBSSH_DEPENDENCIES += openssl
 endif
 
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.20.1
