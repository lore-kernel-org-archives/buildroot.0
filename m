From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 21 May 2014 10:25:10 +0200
Subject: [Buildroot] [PATCH v2 2/2] infra: pkg-utils.mk replace "echo -en"
	with printf
In-Reply-To: <1400660710-15758-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1400660710-15758-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1400660710-15758-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

printf is POSIX-compliant, echo -e/n is not.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
Changes v1 -> v2:
    - Add a trailing \n while retaining splitted lines (Peter Korsgaard,
      Thomas De Schampheleire)
---
 package/pkg-utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
2.0.0.rc0
