From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 14 May 2014 12:26:54 +0200
Subject: [Buildroot] [PATCH 4/4] infra: pkg-utils.mk replace "echo -en" with
	printf
In-Reply-To: <1400063214-29462-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1400063214-29462-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1400063214-29462-5-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

printf is POSIX-compliant, echo -e/n is not.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index da3f0fc..f299e55 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -110,7 +110,7 @@ define legal-manifest # pkg, version, license, license-files, source, {HOST|TARG
 endef
 
 define legal-license-header # pkg, license-file, {HOST|TARGET}
-	echo -e "$(LEGAL_INFO_SEPARATOR)\n\t$(1):" \
+	printf "$(LEGAL_INFO_SEPARATOR)\n\t$(1):" \
 		"$(2)\n$(LEGAL_INFO_SEPARATOR)\n\n" >>$(LEGAL_LICENSES_TXT_$(3))
 endef
 
-- 
2.0.0.rc0
