From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 May 2014 10:45:15 +0200
Subject: [Buildroot] [git commit] infra: pkg-utils.mk replace "echo -e" with
	printf
Message-ID: <20140521084903.098EE9CCEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9725c5aefc5861e7eb9736f9228265a5d1a7e998
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

printf is POSIX-compliant, echo -e is not.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-utils.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index da3f0fc..c627a64 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -110,8 +110,8 @@ define legal-manifest # pkg, version, license, license-files, source, {HOST|TARG
 endef
 
 define legal-license-header # pkg, license-file, {HOST|TARGET}
-	echo -e "$(LEGAL_INFO_SEPARATOR)\n\t$(1):" \
-		"$(2)\n$(LEGAL_INFO_SEPARATOR)\n\n" >>$(LEGAL_LICENSES_TXT_$(3))
+	printf "$(LEGAL_INFO_SEPARATOR)\n\t$(1):\
+		$(2)\n$(LEGAL_INFO_SEPARATOR)\n\n\n" >>$(LEGAL_LICENSES_TXT_$(3))
 endef
 
 define legal-license-nofiles # pkg, {HOST|TARGET}
