From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Aug 2016 21:17:13 +0200
Subject: [Buildroot] [git commit] toolchain: reduce the list of locales to
	keep by default
Message-ID: <20160803192302.C56DA807DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e757a6c5ca27d2f468cfca0e720fe769b8246ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our current list of locales to keep by default is "C en_US de fr". It
doesn't make much sense to keep "de" and "fr" more than any other
language. So let's keep only the "C" and "en_US" locales by default,
and leave it to the user to specify other locales to keep if needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-common.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index dae34ab..77b4cb1 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -51,7 +51,7 @@ config BR2_ENABLE_LOCALE_PURGE
 
 config BR2_ENABLE_LOCALE_WHITELIST
 	string "Locales to keep"
-	default "C en_US de fr"
+	default "C en_US"
 	depends on BR2_ENABLE_LOCALE_PURGE
 	help
 	  Whitespace seperated list of locales to allow on target.
