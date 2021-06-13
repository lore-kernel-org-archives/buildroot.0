From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 13 Jun 2021 12:01:48 +0200
Subject: [Buildroot] [git commit] package/gnutls: disable tests
Message-ID: <20210613093141.6296488591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf32928bbb03adaa6844bac159a7855c1bffeb7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tests can't build with NDEBUG is defined. Since commit 5a8c50fe05afa
("core: enable 'NDEBUG' unless BR2_ENABLE_RUNTIME_DEBUG is set") NDEBUG
is defined on !BR2_ENABLE_RUNTIME_DEBUG. Just disable tests.

Fixes:
http://autobuild.buildroot.net/results/9ec31793484a69c14a66b7338d795089c07b9937/
http://autobuild.buildroot.net/results/6ef8f1534237f2df4cff0a0bc0364fe9a46a5343/
http://autobuild.buildroot.net/results/05ff156687138627f244ca3f6cb58f1ce7d127c4/

Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gnutls/gnutls.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 14855bcebc..6fc9ffad0b 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -23,6 +23,7 @@ GNUTLS_CONF_OPTS = \
 	--disable-guile \
 	--disable-libdane \
 	--disable-rpath \
+	--disable-tests \
 	--enable-local-libopts \
 	--enable-openssl-compatibility \
 	--with-librt-prefix=$(STAGING_DIR) \
