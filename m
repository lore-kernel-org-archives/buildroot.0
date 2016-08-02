From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Aug 2016 00:19:39 +0200
Subject: [Buildroot] [PATCH 2/3] toolchain: reduce the list of locales to
	keep by default
In-Reply-To: <1470176380-11851-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470176380-11851-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1470176380-11851-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our current list of locales to keep by default is "C en_US de fr". It
doesn't make much sense to keep "de" and "fr" more than any other
language. So let's keep only the "C" and "en_US" locales by default,
and leave it to the user to specify other locales to keep if needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
2.7.4
