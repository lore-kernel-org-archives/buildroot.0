Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EF1E8FDA7
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CA3840955;
	Fri, 26 Dec 2025 18:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OIj46hbCuzzH; Fri, 26 Dec 2025 18:21:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51D0940963
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773280;
	bh=lINeRJLs3akfQZMi3UCU0cwh/LSBL30DQYYkITnC35o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d7JvoY7GG+NBrb6egdhl6Zd8WbffmKp4uuQ7AQLqnkiN+jWyeztU1UlBrqrd4WVIm
	 C7X4DG0J6n40wFbd08PTrXFcjxpsWk8NP/Gl7h1fVQaCZ0b9iqm/qqRyEBcMouQVo+
	 bbnRRqPyjAivlAzgWqBuNRLTdfryx1+J68RoVsheQJ9TTgEMGRo3QaGk/ZwfivTX1V
	 FOiG9RiRIL79nQ5pA11A85+d8rU0AtUzX8AKiG3rnLUCET6p3toW7ARPnZg13jcxJu
	 9diDtevdJ7G/czFEspuLvnRHgZ0KNjyS6Tp3X9FGqhoinADAljv+/EYreQaRMQ6i+y
	 ju5mlWawfZioQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51D0940963;
	Fri, 26 Dec 2025 18:21:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C29E2EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD07480B74
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1C035TNvlUJu for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8977080AFA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8977080AFA
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 875D181840; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2345568936724fbd081ac9a1e338cffb887c2a82
X-Git-Newrev: 79adde0180e834f839c770caa14d5253544d9719
X-Patchwork-Hint: ignore
Message-Id: <20251226182055.875D181840@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/resiprocate: bump version to 1.13.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=79adde0180e834f839c770caa14d5253544d9719
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/resiprocate/resiprocate/blob/resiprocate-1.13.2/CHANGELOG.md

Switched _SITE to github, the previous URL redirects to github.com.

Removed patches which are included in this release.

License file was renamed and updated:
https://github.com/resiprocate/resiprocate/commits/resiprocate-1.13.2/LICENSE.md

Switch build system to cmake, removed apps-specific option:
- sipdial is built if OpenSSL is enabled:
  https://github.com/resiprocate/resiprocate/blob/resiprocate-1.13.2/apps/CMakeLists.txt#L6
- clicktocall build is broken
  AddressTranslator.cxx: In member function 'void clicktocall::AddressTranslator::
    addTranslation(const resip::Data&, const resip::Data&)':
  AddressTranslator.cxx:55:16: error: assignment of read-only variable 'flags'
     55 |          flags |= std::regex_constants::nosubs;

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                                   |  7 ++
 ...x-some-issue-compiling-with-Visual-Studio.patch | 95 ----------------------
 ...SLInit-disable-use-of-legacy-OpenSSL-memo.patch | 38 ---------
 ...-rutil-fix-typo-in-preprocessor-condition.patch | 25 ------
 ...-ssl-Security-cxx-remove-deprecated-OpenS.patch | 26 ------
 package/resiprocate/Config.in                      |  9 +-
 package/resiprocate/resiprocate.hash               |  5 +-
 package/resiprocate/resiprocate.mk                 | 54 +++++++-----
 8 files changed, 43 insertions(+), 216 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index cf4f45a8d9..1a756dcd3c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_RESIPROCATE_APPS
+	bool "resiprocate apps support option removed"
+	select BR2_LEGACY
+	help
+	  The build system does not contain an apps-specific option
+	  anymore.
+
 config BR2_PACKAGE_WATCHDOGD_TEST_SUITE
 	bool "The watchdogd test mode option has been removed."
 	select BR2_LEGACY
diff --git a/package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch b/package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch
deleted file mode 100644
index 2157ea0450..0000000000
--- a/package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From be76b10a50749e2e11dce8dcc38b414a7f9d8747 Mon Sep 17 00:00:00 2001
-From: Ben Walden <bwalden@redboxvoice.com>
-Date: Sat, 22 Aug 2020 23:14:11 +0100
-Subject: [PATCH] Fix some issue compiling with Visual Studio 16.7.0 and tidy
- up Visual Studio 16 project files
-
-Upstream: https://github.com/resiprocate/resiprocate/commit/be76b10a50749e2e11dce8dcc38b414a7f9d8747
-[Retrieved (and updated to keep only RendKa.cxx update)]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- VisualStudioReadme.htm                        |   65 +
- contrib/GeoIP/GeoIP_12_0.vcxproj              |  550 -------
- contrib/GeoIP/GeoIP_16_0.vcxproj              |   93 +-
- .../db/build_windows/db_static_12_0.vcxproj   | 1260 -----------------
- .../db/build_windows/db_static_16_0.vcxproj   |  696 +--------
- contrib/db/dbinc/atomic.h                     |    4 +-
- contrib/db/mp/mp_fget.c                       |    4 +-
- contrib/db/mp/mp_mvcc.c                       |    4 +-
- contrib/db/mp/mp_region.c                     |    4 +-
- contrib/db/mutex/mut_method.c                 |    2 +-
- contrib/pcre/pcre_12_0.vcxproj                |  466 ------
- contrib/pcre/pcre_16_0.vcxproj                |  159 +--
- contrib/popt/popt_12_0.vcxproj                |  394 ------
- contrib/popt/popt_16_0.vcxproj                |  120 +-
- reSIProcate_16_0.sln                          |   58 +-
- .../queuetostream_12_0.vcxproj                |  582 --------
- .../queuetostream_16_0.vcxproj                |  207 ++-
- repro/repro_12_0.vcxproj                      |  825 -----------
- repro/repro_12_0.vcxproj.filters              |   47 -
- repro/repro_16_0.vcxproj                      |  159 ++-
- repro/reprocmd/reprocmd_12_0.vcxproj          |  597 --------
- repro/reprocmd/reprocmd_16_0.vcxproj          |  139 +-
- repro/reprolib_12_0.vcxproj                   |  596 --------
- repro/reprolib_12_0.vcxproj.filters           |  136 --
- repro/reprolib_16_0.vcxproj                   |  132 +-
- resip/dum/dum_12_0.vcxproj                    |  615 --------
- resip/dum/dum_16_0.vcxproj                    |  124 +-
- resip/dum/test/basicCall_12_0.vcxproj         |  621 --------
- resip/dum/test/basicCall_16_0.vcxproj         |  145 +-
- resip/dum/test/basicClient_12_0.vcxproj       |  653 ---------
- resip/dum/test/basicClient_16_0.vcxproj       |  158 +--
- resip/dum/test/basicMessage_12_0.vcxproj      |  615 --------
- resip/dum/test/basicMessage_16_0.vcxproj      |  141 +-
- resip/dum/test/basicRegister_12_0.vcxproj     |  615 --------
- resip/dum/test/basicRegister_16_0.vcxproj     |  137 +-
- resip/rend/RendKa.cxx                         |    2 +-
- resip/rend/rend_12_0.vcxproj                  |  352 -----
- resip/rend/rend_16_0.vcxproj                  |   89 +-
- resip/stack/resiprocate_12_0.vcxproj          |  873 ------------
- resip/stack/resiprocate_12_0.vcxproj.filters  |  351 -----
- resip/stack/resiprocate_16_0.vcxproj          |  165 ++-
- resip/stack/test/test_12_0.vcxproj            |  627 --------
- resip/stack/test/test_16_0.vcxproj            |  171 ++-
- rutil/dns/ares/ares_12_0.vcxproj              |  488 -------
- rutil/dns/ares/ares_12_0.vcxproj.filters      |   34 -
- rutil/dns/ares/ares_16_0.vcxproj              |  159 +--
- rutil/rutil_12_0.vcxproj                      |  604 --------
- rutil/rutil_16_0.vcxproj                      |  153 +-
- 48 files changed, 1409 insertions(+), 13782 deletions(-)
- delete mode 100644 contrib/GeoIP/GeoIP_12_0.vcxproj
- delete mode 100644 contrib/db/build_windows/db_static_12_0.vcxproj
- delete mode 100644 contrib/pcre/pcre_12_0.vcxproj
- delete mode 100644 contrib/popt/popt_12_0.vcxproj
- delete mode 100644 repro/accountingconsumers/queuetostream_12_0.vcxproj
- delete mode 100644 repro/repro_12_0.vcxproj
- delete mode 100644 repro/repro_12_0.vcxproj.filters
- delete mode 100644 repro/reprocmd/reprocmd_12_0.vcxproj
- delete mode 100644 repro/reprolib_12_0.vcxproj
- delete mode 100644 repro/reprolib_12_0.vcxproj.filters
- delete mode 100644 resip/dum/dum_12_0.vcxproj
- delete mode 100644 resip/dum/test/basicCall_12_0.vcxproj
- delete mode 100644 resip/dum/test/basicClient_12_0.vcxproj
- delete mode 100644 resip/dum/test/basicMessage_12_0.vcxproj
- delete mode 100644 resip/dum/test/basicRegister_12_0.vcxproj
- delete mode 100644 resip/rend/rend_12_0.vcxproj
- delete mode 100644 resip/stack/resiprocate_12_0.vcxproj
- delete mode 100644 resip/stack/resiprocate_12_0.vcxproj.filters
- delete mode 100644 resip/stack/test/test_12_0.vcxproj
- delete mode 100644 rutil/dns/ares/ares_12_0.vcxproj
- delete mode 100644 rutil/dns/ares/ares_12_0.vcxproj.filters
- delete mode 100644 rutil/rutil_12_0.vcxproj
-
-diff --git a/resip/rend/RendKa.cxx b/resip/rend/RendKa.cxx
-index 8645f17636..8321ada1ee 100644
---- a/resip/rend/RendKa.cxx
-+++ b/resip/rend/RendKa.cxx
-@@ -66,7 +66,7 @@ bool operator<(const RendKaAssoc& a, const RendKaAssoc& b)
- 
- struct RendKaConn 
- {
--   bool operator() (const RendKaAssocPtr& a, const RendKaAssocPtr& b) 
-+   bool operator()(const RendKaAssocPtr& a, const RendKaAssocPtr& b) const
-    {
-       return *a < *b;
-    }
diff --git a/package/resiprocate/0002-rutil-OpenSSLInit-disable-use-of-legacy-OpenSSL-memo.patch b/package/resiprocate/0002-rutil-OpenSSLInit-disable-use-of-legacy-OpenSSL-memo.patch
deleted file mode 100644
index c333df849d..0000000000
--- a/package/resiprocate/0002-rutil-OpenSSLInit-disable-use-of-legacy-OpenSSL-memo.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From e7c33f4e078e6e5dfa7dea796fa4ffb88f48a37a Mon Sep 17 00:00:00 2001
-From: Daniel Pocock <daniel@pocock.pro>
-Date: Thu, 4 Aug 2022 10:55:30 +0200
-Subject: [PATCH] rutil: OpenSSLInit: disable use of legacy OpenSSL memory leak
- checking with OpenSSL 3.0 and later
-
-Upstream: https://github.com/resiprocate/resiprocate/commit/e7c33f4e078e6e5dfa7dea796fa4ffb88f48a37a
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- rutil/ssl/OpenSSLInit.cxx | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/rutil/ssl/OpenSSLInit.cxx b/rutil/ssl/OpenSSLInit.cxx
-index d42486f96b..65afed09fe 100644
---- a/rutil/ssl/OpenSSLInit.cxx
-+++ b/rutil/ssl/OpenSSLInit.cxx
-@@ -69,14 +69,19 @@ OpenSSLInit::OpenSSLInit()
- 	CRYPTO_set_dynlock_lock_callback(::resip_OpenSSLInit_dynLockFunction);
- #endif
- 
-+/* The OpenSSL memory leak checking has been deprecated since
-+   OpenSSL v3.0.  OpenSSL developers recommend that we rely
-+   on modern compilers to provide the same functionality. */
- #if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
- 	CRYPTO_malloc_debug_init();
- 	CRYPTO_set_mem_debug_options(V_CRYPTO_MDEBUG_ALL);
--#else
-+#elsif (OPENSSL_VERSION_NUMBER < 0x30000000L)
- 	CRYPTO_set_mem_debug(1);
- #endif
- 
-+#if (OPENSSL_VERSION_NUMBER < 0x30000000L) || defined(LIBRESSL_VERSION_NUMBER)
- 	CRYPTO_mem_ctrl(CRYPTO_MEM_CHECK_ON);
-+#endif
- 
- 	SSL_library_init();
- 	SSL_load_error_strings();
diff --git a/package/resiprocate/0003-rutil-fix-typo-in-preprocessor-condition.patch b/package/resiprocate/0003-rutil-fix-typo-in-preprocessor-condition.patch
deleted file mode 100644
index 5cbe5871d0..0000000000
--- a/package/resiprocate/0003-rutil-fix-typo-in-preprocessor-condition.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 53302195c339dfaa104788a50aa900a48dbff777 Mon Sep 17 00:00:00 2001
-From: Andrey Semashev <andrey.semashev@gmail.com>
-Date: Sat, 10 Sep 2022 12:15:06 +0200
-Subject: [PATCH] rutil: fix typo in preprocessor condition
-
-Upstream: https://github.com/resiprocate/resiprocate/commit/53302195c339dfaa104788a50aa900a48dbff777
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- rutil/ssl/OpenSSLInit.cxx | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/rutil/ssl/OpenSSLInit.cxx b/rutil/ssl/OpenSSLInit.cxx
-index 65afed09fe..0d87a9f9d8 100644
---- a/rutil/ssl/OpenSSLInit.cxx
-+++ b/rutil/ssl/OpenSSLInit.cxx
-@@ -75,7 +75,7 @@ OpenSSLInit::OpenSSLInit()
- #if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
- 	CRYPTO_malloc_debug_init();
- 	CRYPTO_set_mem_debug_options(V_CRYPTO_MDEBUG_ALL);
--#elsif (OPENSSL_VERSION_NUMBER < 0x30000000L)
-+#elif (OPENSSL_VERSION_NUMBER < 0x30000000L)
- 	CRYPTO_set_mem_debug(1);
- #endif
- 
diff --git a/package/resiprocate/0004-resip-stack-ssl-Security-cxx-remove-deprecated-OpenS.patch b/package/resiprocate/0004-resip-stack-ssl-Security-cxx-remove-deprecated-OpenS.patch
deleted file mode 100644
index 2b595d64c1..0000000000
--- a/package/resiprocate/0004-resip-stack-ssl-Security-cxx-remove-deprecated-OpenS.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 88f98702d908549d888aa7f0ee1b0763e09662b1 Mon Sep 17 00:00:00 2001
-From: Daniel Pocock <daniel@pocock.pro>
-Date: Thu, 4 Aug 2022 11:09:43 +0200
-Subject: [PATCH] resip/stack: ssl/Security.cxx: remove deprecated OpenSSL
- ERR_GET_FUNC, not required
-
-Upstream: https://github.com/resiprocate/resiprocate/commit/88f98702d908549d888aa7f0ee1b0763e09662b1
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- resip/stack/ssl/Security.cxx | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/resip/stack/ssl/Security.cxx b/resip/stack/ssl/Security.cxx
-index 75dc6d838a..23c2ebbf09 100644
---- a/resip/stack/ssl/Security.cxx
-+++ b/resip/stack/ssl/Security.cxx
-@@ -967,7 +967,7 @@ BaseSecurity::addPrivateKeyPEM( PEMType type,
-          char buffer[120];
-          unsigned long err = ERR_get_error();
-          ERR_error_string(err, buffer);
--         if(ERR_GET_LIB(err) == ERR_LIB_EVP && ERR_GET_FUNC(err) == EVP_F_EVP_DECRYPTFINAL_EX && ERR_GET_REASON(err) == EVP_R_BAD_DECRYPT)
-+         if(ERR_GET_LIB(err) == ERR_LIB_EVP && ERR_GET_REASON(err) == EVP_R_BAD_DECRYPT)
-          {
-             ErrLog(<< "Could not read private key (error=" << buffer << ") - likely incorrect password provided, may load correctly when transports are added with appropriate password");
-          }
diff --git a/package/resiprocate/Config.in b/package/resiprocate/Config.in
index 7561b7c86c..ba68ad8e59 100644
--- a/package/resiprocate/Config.in
+++ b/package/resiprocate/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_RESIPROCATE
 	  parsing) and libdum (SIP Dialog Usage Manager, a state
 	  machine for SIP dialogs).
 
-	  https://www.resiprocate.org/
+	  https://github.com/resiprocate/resiprocate
 
 if BR2_PACKAGE_RESIPROCATE
 
@@ -40,11 +40,4 @@ config BR2_PACKAGE_RESIPROCATE_REND
 	  Rend is tool that is was created specifically to load test
 	  gtSIP based presence servers.
 
-config BR2_PACKAGE_RESIPROCATE_APPS
-	bool "resiprocate-apps"
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_PCRE
-	help
-	  Build apps clicktocall and sipdial
-
 endif # BR2_PACKAGE_RESIPROCATE
diff --git a/package/resiprocate/resiprocate.hash b/package/resiprocate/resiprocate.hash
index 03336c64a2..93a7131141 100644
--- a/package/resiprocate/resiprocate.hash
+++ b/package/resiprocate/resiprocate.hash
@@ -1,4 +1,3 @@
-# http://list.resiprocate.org/pipermail/resiprocate-announce/2020-May/000000.html
-sha256  046826503d3c8682ae0e42101b28f903c5f988235f1ff4a98dbfb9066d0d3d49  resiprocate-1.12.0.tar.gz
 # Locally Computed
-sha256  16b0fd1938a10fcd145904cc2dad74500fef9d27fc15b44cf8e8f92011f94d35  COPYING
+sha256  059fda8f63c456fd61130d468a67655cfeafb5ba8ff5c1d0a55dc383f83e4fba  resiprocate-1.13.2.tar.gz
+sha256  8c93f7d6085486e9d24b7c6f9c662d92e0b65571003ad15d0827bb99fd924261  LICENSE.md
diff --git a/package/resiprocate/resiprocate.mk b/package/resiprocate/resiprocate.mk
index 58b942465c..ab8299302a 100644
--- a/package/resiprocate/resiprocate.mk
+++ b/package/resiprocate/resiprocate.mk
@@ -4,45 +4,57 @@
 #
 ################################################################################
 
-RESIPROCATE_VERSION = 1.12.0
-RESIPROCATE_SITE = https://www.resiprocate.org/files/pub/reSIProcate/releases
-# For complete details see https://www.resiprocate.org/License
+RESIPROCATE_VERSION = 1.13.2
+RESIPROCATE_SITE = $(call github,resiprocate,resiprocate,resiprocate-$(RESIPROCATE_VERSION))
 RESIPROCATE_LICENSE = VSL-1.0, BSD-3-Clause
-RESIPROCATE_LICENSE_FILES = COPYING
+RESIPROCATE_LICENSE_FILES = LICENSE.md
 RESIPROCATE_CPE_ID_VENDOR = resiprocate
 RESIPROCATE_INSTALL_STAGING = YES
 
-# Utilize c-ares from buildroot instead built in ARES library
-# NOTE: resiprocate doesn't support --without-<feature> syntax as it will try
-#       to build with package if specified
+RESIPROCATE_CONF_OPTS = -DWITH_C_ARES=ON
 RESIPROCATE_DEPENDENCIES = c-ares
-RESIPROCATE_CONF_OPTS = -with-c-ares \
-	--with-sysroot="$(STAGING_DIR)"
+
+RESIPROCATE_CONF_OPTS += \
+	-DBUILD_QPID_PROTON=OFF \
+	-DBUILD_RECON=OFF \
+	-DBUILD_REFLOW=OFF \
+	-DBUILD_REPRO=OFF \
+	-DBUILD_RETURN=OFF \
+	-DBUILD_TFM=OFF \
+	-DHAVE_CLOCK_GETTIME_MONOTONIC_EXITCODE=0
+
+ifeq ($(BR2_PACKAGE_GEOIP),y)
+RESIPROCATE_CONF_OPTS += -DUSE_MAXMIND_GEOIP=ON
+RESIPROCATE_DEPENDENCIES += geoip
+else
+RESIPROCATE_CONF_OPTS += -DUSE_MAXMIND_GEOIP=OFF
+endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
+RESIPROCATE_CONF_OPTS += -DWITH_SSL=ON
 RESIPROCATE_DEPENDENCIES += openssl host-pkgconf
-RESIPROCATE_CONF_OPTS += --with-ssl
-# Configure.ac does not include '-lz' when statically linking against openssl
-RESIPROCATE_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
+else
+RESIPROCATE_CONF_OPTS += -DWITH_SSL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_POPT),y)
-RESIPROCATE_CONF_OPTS += --with-popt
+RESIPROCATE_CONF_OPTS += -DUSE_POPT=ON
 RESIPROCATE_DEPENDENCIES += popt
+else
+RESIPROCATE_CONF_OPTS += -DUSE_POPT=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_RESIPROCATE_DTLS_SUPPORT),y)
-RESIPROCATE_CONF_OPTS += --with-dtls
+RESIPROCATE_CONF_OPTS += -DUSE_DTLS=ON
+else
+RESIPROCATE_CONF_OPTS += -DUSE_DTLS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_RESIPROCATE_REND),y)
-RESIPROCATE_CONF_OPTS += --with-rend
+RESIPROCATE_CONF_OPTS += -DBUILD_REND=ON
 RESIPROCATE_DEPENDENCIES += boost
+else
+RESIPROCATE_CONF_OPTS += -DBUILD_REND=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_RESIPROCATE_APPS),y)
-RESIPROCATE_CONF_OPTS += --with-apps
-RESIPROCATE_DEPENDENCIES += pcre
-endif
-
-$(eval $(autotools-package))
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
