Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF5AC6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 19:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E462C61060;
	Wed, 21 Sep 2022 19:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E462C61060
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J0Y1x-uRRNdI; Wed, 21 Sep 2022 19:32:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CA296104B;
	Wed, 21 Sep 2022 19:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CA296104B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B9F61BF3F0
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 19:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4C7C4053F
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 19:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4C7C4053F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id szPUYUmbFlJ3 for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 19:31:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 323FB404F7
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 19:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 323FB404F7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F0EA85D02; Wed, 21 Sep 2022 19:31:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 21:24:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0a1c0c37570e301e4e36de94becfcc37e079703
X-Git-Newrev: 8317065ecb4979fe43c466f7e5a7f6dc281bd10d
X-Patchwork-Hint: ignore
Message-Id: <20220921193119.1F0EA85D02@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ipmitool: bump to version 1.8.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1382654530483756610=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1382654530483756610==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8317065ecb4979fe43c466f7e5a7f6dc281bd10d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to github to get latest release:
  https://sourceforge.net/projects/ipmitool/files/ipmitool/%21%21%21_READ_HERE_FIRST_%21%21%21
- Drop patches (already in version)

https://github.com/ipmitool/ipmitool/releases/tag/IPMITOOL_1_8_19

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-missing-stddef.h-include.patch        |  38 ------
 ...SSL-1.1-compatibility-error-storage-size-.patch | 108 ---------------
 ...-compiler-happier-about-changes-related-t.patch |  40 ------
 ...ipmitool-coredumps-in-EVP_CIPHER_CTX_init.patch |  57 --------
 ...-EVP_CIPHER_CTX_free-instead-of-EVP_CIPHE.patch | 148 ---------------------
 ...Fix-compile-with-deprecated-APIs-disabled.patch |  50 -------
 ...mfwupg-move-variable-definition-to-c-file.patch |  40 ------
 ...8-fru-Fix-buffer-overflow-vulnerabilities.patch | 132 ------------------
 ...Fix-buffer-overflow-in-ipmi_spd_print_fru.patch |  52 --------
 ...-buffer-overflow-in-ipmi_get_session_info.patch |  52 --------
 .../0011-channel-Fix-buffer-overflow.patch         |  46 -------
 ...-buffer-overflows-in-get_lan_param_select.patch |  92 -------------
 ...13-fru-sdr-Fix-id_string-buffer-overflows.patch | 141 --------------------
 package/ipmitool/Config.in                         |   2 +-
 package/ipmitool/ipmitool.hash                     |   2 +-
 package/ipmitool/ipmitool.mk                       |  16 +--
 16 files changed, 7 insertions(+), 1009 deletions(-)

diff --git a/package/ipmitool/0001-Fix-missing-stddef.h-include.patch b/package/ipmitool/0001-Fix-missing-stddef.h-include.patch
deleted file mode 100644
index dc3f92e482..0000000000
--- a/package/ipmitool/0001-Fix-missing-stddef.h-include.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 04d489936191e685123978a1ca370f9cc30e6a06 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Mon, 18 Apr 2016 21:17:26 +0200
-Subject: [PATCH] Fix missing stddef.h include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Needed for wchar_t. Fixes build error:
-
-imbapi.h:140:9: error: unknown type name 'wchar_t'
- typedef wchar_t      WCHAR;
-
-Upstream status: Pending
-https://sourceforge.net/p/ipmitool/mailman/message/35022779/
-
-Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
----
- src/plugins/imb/imbapi.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/plugins/imb/imbapi.h b/src/plugins/imb/imbapi.h
-index 6ba4121..6b39b47 100644
---- a/src/plugins/imb/imbapi.h
-+++ b/src/plugins/imb/imbapi.h
-@@ -33,6 +33,9 @@ ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-  *----------------------------------------------------------------------*/
-+
-+#include <stddef.h>
-+
- #ifndef	_WINDEFS_H
- #define	_WINDEFS_H
- #ifndef FALSE
--- 
-2.10.2
-
diff --git a/package/ipmitool/0002-ID-461-OpenSSL-1.1-compatibility-error-storage-size-.patch b/package/ipmitool/0002-ID-461-OpenSSL-1.1-compatibility-error-storage-size-.patch
deleted file mode 100644
index d43f22e278..0000000000
--- a/package/ipmitool/0002-ID-461-OpenSSL-1.1-compatibility-error-storage-size-.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 1ad09f56d461e78ad83c77b654fb65467a68388b Mon Sep 17 00:00:00 2001
-From: Dennis Schridde <dennis.schridde@uni-heidelberg.de>
-Date: Wed, 30 Nov 2016 17:33:00 +0100
-Subject: [PATCH] ID:461 - OpenSSL 1.1 compatibility - "error: storage size
- of 'ctx' isn't known"
-
-In OpenSSL 1.1 EVP_CIPHER_CTX became opaque, cf. `man 3ssl EVP_EncryptInit`
-
-Fixes: ID:461
-
-Upstream: https://github.com/ipmitool/ipmitool/commit/b57487e360916ab3eaa50aa6d021c73b6337a4a0
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- src/plugins/lanplus/lanplus_crypt_impl.c | 28 ++++++++++++++--------------
- 1 file changed, 14 insertions(+), 14 deletions(-)
-
-diff --git a/src/plugins/lanplus/lanplus_crypt_impl.c b/src/plugins/lanplus/lanplus_crypt_impl.c
-index d5fac37..3c0df23 100644
---- a/src/plugins/lanplus/lanplus_crypt_impl.c
-+++ b/src/plugins/lanplus/lanplus_crypt_impl.c
-@@ -164,10 +164,10 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
- 							uint8_t       * output,
- 							uint32_t        * bytes_written)
- {
--	EVP_CIPHER_CTX ctx;
--	EVP_CIPHER_CTX_init(&ctx);
--	EVP_EncryptInit_ex(&ctx, EVP_aes_128_cbc(), NULL, key, iv);
--	EVP_CIPHER_CTX_set_padding(&ctx, 0);
-+	EVP_CIPHER_CTX* ctx;
-+	EVP_CIPHER_CTX_init(ctx);
-+	EVP_EncryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
-+	EVP_CIPHER_CTX_set_padding(ctx, 0);
- 	
- 
- 	*bytes_written = 0;
-@@ -191,7 +191,7 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
- 	assert((input_length % IPMI_CRYPT_AES_CBC_128_BLOCK_SIZE) == 0);
- 
- 
--	if(!EVP_EncryptUpdate(&ctx, output, (int *)bytes_written, input, input_length))
-+	if(!EVP_EncryptUpdate(ctx, output, (int *)bytes_written, input, input_length))
- 	{
- 		/* Error */
- 		*bytes_written = 0;
-@@ -201,7 +201,7 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
- 	{
- 		uint32_t tmplen;
- 
--		if(!EVP_EncryptFinal_ex(&ctx, output + *bytes_written, (int *)&tmplen))
-+		if(!EVP_EncryptFinal_ex(ctx, output + *bytes_written, (int *)&tmplen))
- 		{
- 			*bytes_written = 0;
- 			return; /* Error */
-@@ -210,7 +210,7 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
- 		{
- 			/* Success */
- 			*bytes_written += tmplen;
--			EVP_CIPHER_CTX_cleanup(&ctx);
-+			EVP_CIPHER_CTX_cleanup(ctx);
- 		}
- 	}
- }
-@@ -239,10 +239,10 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
- 							uint8_t       * output,
- 							uint32_t        * bytes_written)
- {
--	EVP_CIPHER_CTX ctx;
--	EVP_CIPHER_CTX_init(&ctx);
--	EVP_DecryptInit_ex(&ctx, EVP_aes_128_cbc(), NULL, key, iv);
--	EVP_CIPHER_CTX_set_padding(&ctx, 0);
-+	EVP_CIPHER_CTX* ctx;
-+	EVP_CIPHER_CTX_init(ctx);
-+	EVP_DecryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
-+	EVP_CIPHER_CTX_set_padding(ctx, 0);
- 
- 
- 	if (verbose >= 5)
-@@ -266,7 +266,7 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
- 	assert((input_length % IPMI_CRYPT_AES_CBC_128_BLOCK_SIZE) == 0);
- 
- 
--	if (!EVP_DecryptUpdate(&ctx, output, (int *)bytes_written, input, input_length))
-+	if (!EVP_DecryptUpdate(ctx, output, (int *)bytes_written, input, input_length))
- 	{
- 		/* Error */
- 		lprintf(LOG_DEBUG, "ERROR: decrypt update failed");
-@@ -277,7 +277,7 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
- 	{
- 		uint32_t tmplen;
- 
--		if (!EVP_DecryptFinal_ex(&ctx, output + *bytes_written, (int *)&tmplen))
-+		if (!EVP_DecryptFinal_ex(ctx, output + *bytes_written, (int *)&tmplen))
- 		{
- 			char buffer[1000];
- 			ERR_error_string(ERR_get_error(), buffer);
-@@ -290,7 +290,7 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
- 		{
- 			/* Success */
- 			*bytes_written += tmplen;
--			EVP_CIPHER_CTX_cleanup(&ctx);
-+			EVP_CIPHER_CTX_cleanup(ctx);
- 		}
- 	}
- 
--- 
-1.9.1
-
diff --git a/package/ipmitool/0003-ID-461-Make-compiler-happier-about-changes-related-t.patch b/package/ipmitool/0003-ID-461-Make-compiler-happier-about-changes-related-t.patch
deleted file mode 100644
index 7ff27bdab6..0000000000
--- a/package/ipmitool/0003-ID-461-Make-compiler-happier-about-changes-related-t.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From ccc85e4fd67423e770901ec59975e84b07eed883 Mon Sep 17 00:00:00 2001
-From: Zdenek Styblik <stybla@turnovfree.net>
-Date: Sun, 15 Jan 2017 15:11:25 +0100
-Subject: [PATCH] ID:461 - Make compiler happier about changes related to
- OpenSSL 1.1
-
-Complaint was that ctx isn't initialized.
-
-Upstream: https://github.com/ipmitool/ipmitool/commit/77fe5635037ebaf411cae46cf5045ca819b5c145
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- src/plugins/lanplus/lanplus_crypt_impl.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/plugins/lanplus/lanplus_crypt_impl.c b/src/plugins/lanplus/lanplus_crypt_impl.c
-index 3c0df23..d12d0e3 100644
---- a/src/plugins/lanplus/lanplus_crypt_impl.c
-+++ b/src/plugins/lanplus/lanplus_crypt_impl.c
-@@ -164,7 +164,7 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
- 							uint8_t       * output,
- 							uint32_t        * bytes_written)
- {
--	EVP_CIPHER_CTX* ctx;
-+	EVP_CIPHER_CTX *ctx = NULL;
- 	EVP_CIPHER_CTX_init(ctx);
- 	EVP_EncryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
- 	EVP_CIPHER_CTX_set_padding(ctx, 0);
-@@ -239,7 +239,7 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
- 							uint8_t       * output,
- 							uint32_t        * bytes_written)
- {
--	EVP_CIPHER_CTX* ctx;
-+	EVP_CIPHER_CTX *ctx = NULL;
- 	EVP_CIPHER_CTX_init(ctx);
- 	EVP_DecryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
- 	EVP_CIPHER_CTX_set_padding(ctx, 0);
--- 
-1.9.1
-
diff --git a/package/ipmitool/0004-ID-480-ipmitool-coredumps-in-EVP_CIPHER_CTX_init.patch b/package/ipmitool/0004-ID-480-ipmitool-coredumps-in-EVP_CIPHER_CTX_init.patch
deleted file mode 100644
index aabcc62d32..0000000000
--- a/package/ipmitool/0004-ID-480-ipmitool-coredumps-in-EVP_CIPHER_CTX_init.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 72df3eadb27161a292f35b1d97178f70f41e50f6 Mon Sep 17 00:00:00 2001
-From: Zdenek Styblik <stybla@turnovfree.net>
-Date: Sun, 12 Mar 2017 14:00:35 +0100
-Subject: [PATCH] ID:480 - ipmitool coredumps in EVP_CIPHER_CTX_init
-
-IPMI tool coredumps due to changes introduced in ID:461. This shouldn't be
-surprise as a NULL pointer is passed to init. Commit addresses this issue by
-calling EVP_CIPHER_CTX_new() instead of EVP_CIPHER_CTX_init(), which is
-deprecated, and by checking return value of call to former function.
-
-Upstream: https://github.com/ipmitool/ipmitool/commit/f004b4b7197fc83e7d47ec8cbcaefffa9a922717
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- src/plugins/lanplus/lanplus_crypt_impl.c | 14 ++++++++++----
- 1 file changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/src/plugins/lanplus/lanplus_crypt_impl.c b/src/plugins/lanplus/lanplus_crypt_impl.c
-index d12d0e3..0e330c1 100644
---- a/src/plugins/lanplus/lanplus_crypt_impl.c
-+++ b/src/plugins/lanplus/lanplus_crypt_impl.c
-@@ -165,10 +165,13 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
- 							uint32_t        * bytes_written)
- {
- 	EVP_CIPHER_CTX *ctx = NULL;
--	EVP_CIPHER_CTX_init(ctx);
-+	ctx = EVP_CIPHER_CTX_new();
-+	if (ctx == NULL) {
-+		*bytes_written = 0;
-+		return;
-+	}
- 	EVP_EncryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
- 	EVP_CIPHER_CTX_set_padding(ctx, 0);
--	
- 
- 	*bytes_written = 0;
- 
-@@ -240,11 +243,14 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
- 							uint32_t        * bytes_written)
- {
- 	EVP_CIPHER_CTX *ctx = NULL;
--	EVP_CIPHER_CTX_init(ctx);
-+	ctx = EVP_CIPHER_CTX_new();
-+	if (ctx == NULL) {
-+		*bytes_written = 0;
-+		return;
-+	}
- 	EVP_DecryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
- 	EVP_CIPHER_CTX_set_padding(ctx, 0);
- 
--
- 	if (verbose >= 5)
- 	{
- 		printbuf(iv,  16, "decrypting with this IV");
--- 
-1.9.1
-
diff --git a/package/ipmitool/0005-ID-480-Call-EVP_CIPHER_CTX_free-instead-of-EVP_CIPHE.patch b/package/ipmitool/0005-ID-480-Call-EVP_CIPHER_CTX_free-instead-of-EVP_CIPHE.patch
deleted file mode 100644
index b3ce965077..0000000000
--- a/package/ipmitool/0005-ID-480-Call-EVP_CIPHER_CTX_free-instead-of-EVP_CIPHE.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From d9d6e0bff831da03f4448f0cdb82fc3d143662c8 Mon Sep 17 00:00:00 2001
-From: Holger Liebig <holger.liebig@ts.fujitsu.com>
-Date: Tue, 4 Apr 2017 20:43:05 +0200
-Subject: [PATCH] ID:480 - Call EVP_CIPHER_CTX_free() instead of
- EVP_CIPHER_CTX_cleanup()
-
-Call EVP_CIPHER_CTX_free() instead of EVP_CIPHER_CTX_cleanup() to fix memory
-leak.
-
-Upstream: https://github.com/ipmitool/ipmitool/commit/1664902525a1c3771b4d8b3ccab7ea1ba6b2bdd1
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- src/plugins/lanplus/lanplus_crypt_impl.c | 44 +++++++++++++++++---------------
- 1 file changed, 23 insertions(+), 21 deletions(-)
-
-diff --git a/src/plugins/lanplus/lanplus_crypt_impl.c b/src/plugins/lanplus/lanplus_crypt_impl.c
-index 0e330c1..9652a5e 100644
---- a/src/plugins/lanplus/lanplus_crypt_impl.c
-+++ b/src/plugins/lanplus/lanplus_crypt_impl.c
-@@ -165,13 +165,6 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
- 							uint32_t        * bytes_written)
- {
- 	EVP_CIPHER_CTX *ctx = NULL;
--	ctx = EVP_CIPHER_CTX_new();
--	if (ctx == NULL) {
--		*bytes_written = 0;
--		return;
--	}
--	EVP_EncryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
--	EVP_CIPHER_CTX_set_padding(ctx, 0);
- 
- 	*bytes_written = 0;
- 
-@@ -185,6 +178,14 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
- 		printbuf(input, input_length, "encrypting this data");
- 	}
- 
-+	ctx = EVP_CIPHER_CTX_new();
-+	if (ctx == NULL) {
-+		lprintf(LOG_DEBUG, "ERROR: EVP_CIPHER_CTX_new() failed");
-+		return;
-+	}
-+	EVP_CIPHER_CTX_init(ctx);
-+	EVP_EncryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
-+	EVP_CIPHER_CTX_set_padding(ctx, 0);
- 
- 	/*
- 	 * The default implementation adds a whole block of padding if the input
-@@ -198,7 +199,6 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
- 	{
- 		/* Error */
- 		*bytes_written = 0;
--		return;
- 	}
- 	else
- 	{
-@@ -206,16 +206,17 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
- 
- 		if(!EVP_EncryptFinal_ex(ctx, output + *bytes_written, (int *)&tmplen))
- 		{
-+			/* Error */
- 			*bytes_written = 0;
--			return; /* Error */
- 		}
- 		else
- 		{
- 			/* Success */
- 			*bytes_written += tmplen;
--			EVP_CIPHER_CTX_cleanup(ctx);
- 		}
- 	}
-+	/* performs cleanup and free */
-+	EVP_CIPHER_CTX_free(ctx);
- }
- 
- 
-@@ -243,13 +244,6 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
- 							uint32_t        * bytes_written)
- {
- 	EVP_CIPHER_CTX *ctx = NULL;
--	ctx = EVP_CIPHER_CTX_new();
--	if (ctx == NULL) {
--		*bytes_written = 0;
--		return;
--	}
--	EVP_DecryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
--	EVP_CIPHER_CTX_set_padding(ctx, 0);
- 
- 	if (verbose >= 5)
- 	{
-@@ -258,12 +252,20 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
- 		printbuf(input, input_length, "decrypting this data");
- 	}
- 
--
- 	*bytes_written = 0;
- 
- 	if (input_length == 0)
- 		return;
- 
-+	ctx = EVP_CIPHER_CTX_new();
-+	if (ctx == NULL) {
-+		lprintf(LOG_DEBUG, "ERROR: EVP_CIPHER_CTX_new() failed");
-+		return;
-+	}
-+	EVP_CIPHER_CTX_init(ctx);
-+	EVP_DecryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
-+	EVP_CIPHER_CTX_set_padding(ctx, 0);
-+
- 	/*
- 	 * The default implementation adds a whole block of padding if the input
- 	 * data is perfectly aligned.  We would like to keep that from happening.
-@@ -277,7 +279,6 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
- 		/* Error */
- 		lprintf(LOG_DEBUG, "ERROR: decrypt update failed");
- 		*bytes_written = 0;
--		return;
- 	}
- 	else
- 	{
-@@ -285,20 +286,21 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
- 
- 		if (!EVP_DecryptFinal_ex(ctx, output + *bytes_written, (int *)&tmplen))
- 		{
-+			/* Error */
- 			char buffer[1000];
- 			ERR_error_string(ERR_get_error(), buffer);
- 			lprintf(LOG_DEBUG, "the ERR error %s", buffer);
- 			lprintf(LOG_DEBUG, "ERROR: decrypt final failed");
- 			*bytes_written = 0;
--			return; /* Error */
- 		}
- 		else
- 		{
- 			/* Success */
- 			*bytes_written += tmplen;
--			EVP_CIPHER_CTX_cleanup(ctx);
- 		}
- 	}
-+	/* performs cleanup and free */
-+	EVP_CIPHER_CTX_free(ctx);
- 
- 	if (verbose >= 5)
- 	{
--- 
-1.9.1
-
diff --git a/package/ipmitool/0006-lanplus-Fix-compile-with-deprecated-APIs-disabled.patch b/package/ipmitool/0006-lanplus-Fix-compile-with-deprecated-APIs-disabled.patch
deleted file mode 100644
index 87fdd0aaf7..0000000000
--- a/package/ipmitool/0006-lanplus-Fix-compile-with-deprecated-APIs-disabled.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From fc2136969adfb926eed610b8ed0a74b2030b48ed Mon Sep 17 00:00:00 2001
-From: Rosen Penev <rosenp@gmail.com>
-Date: Tue, 21 Aug 2018 19:29:07 -0700
-Subject: [PATCH] lanplus: Fix compile with deprecated APIs disabled.
-
-From the man page:
-
-EVP_CIPHER_CTX was made opaque in OpenSSL 1.1.0. As a result,
-EVP_CIPHER_CTX_reset() appeared and EVP_CIPHER_CTX_cleanup() disappeared.
-EVP_CIPHER_CTX_init() remains as an alias for EVP_CIPHER_CTX_reset().
-
-Upstream: https://github.com/ipmitool/ipmitool/commit/a8862d7508fb138b1c286eea958700cca63c9476
-
-Signed-off-by: Rosen Penev <rosenp@gmail.com>
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- src/plugins/lanplus/lanplus_crypt_impl.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/src/plugins/lanplus/lanplus_crypt_impl.c b/src/plugins/lanplus/lanplus_crypt_impl.c
-index 9652a5e..e94401e 100644
---- a/src/plugins/lanplus/lanplus_crypt_impl.c
-+++ b/src/plugins/lanplus/lanplus_crypt_impl.c
-@@ -183,7 +183,11 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
- 		lprintf(LOG_DEBUG, "ERROR: EVP_CIPHER_CTX_new() failed");
- 		return;
- 	}
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L
- 	EVP_CIPHER_CTX_init(ctx);
-+#else
-+	EVP_CIPHER_CTX_reset(ctx);
-+#endif
- 	EVP_EncryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
- 	EVP_CIPHER_CTX_set_padding(ctx, 0);
- 
-@@ -262,7 +266,11 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
- 		lprintf(LOG_DEBUG, "ERROR: EVP_CIPHER_CTX_new() failed");
- 		return;
- 	}
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L
- 	EVP_CIPHER_CTX_init(ctx);
-+#else
-+	EVP_CIPHER_CTX_reset(ctx);
-+#endif
- 	EVP_DecryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
- 	EVP_CIPHER_CTX_set_padding(ctx, 0);
- 
--- 
-1.9.1
-
diff --git a/package/ipmitool/0007-hpmfwupg-move-variable-definition-to-c-file.patch b/package/ipmitool/0007-hpmfwupg-move-variable-definition-to-c-file.patch
deleted file mode 100644
index 0b49160ba4..0000000000
--- a/package/ipmitool/0007-hpmfwupg-move-variable-definition-to-c-file.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From c3939dac2c060651361fc71516806f9ab8c38901 Mon Sep 17 00:00:00 2001
-From: Vaclav Dolezal <vdolezal@redhat.com>
-Date: Thu, 23 Jan 2020 11:26:32 +0100
-Subject: [PATCH] hpmfwupg: move variable definition to .c file
-
-Signed-off-by: Vaclav Dolezal <vdolezal@redhat.com>
-[Retrieved from:
-https://github.com/ipmitool/ipmitool/commit/c3939dac2c060651361fc71516806f9ab8c38901]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/ipmitool/ipmi_hpmfwupg.h | 2 +-
- lib/ipmi_hpmfwupg.c              | 2 ++
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/include/ipmitool/ipmi_hpmfwupg.h b/include/ipmitool/ipmi_hpmfwupg.h
-index de65292b..07f597be 100644
---- a/include/ipmitool/ipmi_hpmfwupg.h
-+++ b/include/ipmitool/ipmi_hpmfwupg.h
-@@ -800,7 +800,7 @@ typedef struct _VERSIONINFO {
- 	char descString[HPMFWUPG_DESC_STRING_LENGTH + 1];
- }VERSIONINFO, *PVERSIONINFO;
- 
--VERSIONINFO gVersionInfo[HPMFWUPG_COMPONENT_ID_MAX];
-+extern VERSIONINFO gVersionInfo[HPMFWUPG_COMPONENT_ID_MAX];
- 
- #define TARGET_VER (0x01)
- #define ROLLBACK_VER (0x02)
-diff --git a/lib/ipmi_hpmfwupg.c b/lib/ipmi_hpmfwupg.c
-index 4aa8cecd..d63d2c15 100644
---- a/lib/ipmi_hpmfwupg.c
-+++ b/lib/ipmi_hpmfwupg.c
-@@ -50,6 +50,8 @@
- 
- extern int verbose;
- 
-+VERSIONINFO gVersionInfo[HPMFWUPG_COMPONENT_ID_MAX];
-+
- int HpmfwupgUpgrade(struct ipmi_intf *intf, char *imageFilename,
- 		int activate, int, int);
- int HpmfwupgValidateImageIntegrity(struct HpmfwupgUpgradeCtx *pFwupgCtx);
diff --git a/package/ipmitool/0008-fru-Fix-buffer-overflow-vulnerabilities.patch b/package/ipmitool/0008-fru-Fix-buffer-overflow-vulnerabilities.patch
deleted file mode 100644
index a39713fdb1..0000000000
--- a/package/ipmitool/0008-fru-Fix-buffer-overflow-vulnerabilities.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From d615cb6c39d401a569941be2a615176191afa7ac Mon Sep 17 00:00:00 2001
-From: Chrostoper Ertl <chertl@microsoft.com>
-Date: Thu, 28 Nov 2019 16:33:59 +0000
-Subject: [PATCH] fru: Fix buffer overflow vulnerabilities
-
-Partial fix for CVE-2020-5208, see
-https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
-
-The `read_fru_area_section` function only performs size validation of
-requested read size, and falsely assumes that the IPMI message will not
-respond with more than the requested amount of data; it uses the
-unvalidated response size to copy into `frubuf`. If the response is
-larger than the request, this can result in overflowing the buffer.
-
-The same issue affects the `read_fru_area` function.
-
-[Retrieve from
-https://github.com/ipmitool/ipmitool/commit/e824c23316ae50beb7f7488f2055ac65e8b341f2]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- lib/ipmi_fru.c | 33 +++++++++++++++++++++++++++++++--
- 1 file changed, 31 insertions(+), 2 deletions(-)
-
-diff --git a/lib/ipmi_fru.c b/lib/ipmi_fru.c
-index cf00eff..af99aa9 100644
---- a/lib/ipmi_fru.c
-+++ b/lib/ipmi_fru.c
-@@ -615,7 +615,10 @@ int
- read_fru_area(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
- 			uint32_t offset, uint32_t length, uint8_t *frubuf)
- {
--	uint32_t off = offset, tmp, finish;
-+	uint32_t off = offset;
-+	uint32_t tmp;
-+	uint32_t finish;
-+	uint32_t size_left_in_buffer;
- 	struct ipmi_rs * rsp;
- 	struct ipmi_rq req;
- 	uint8_t msg_data[4];
-@@ -628,10 +631,12 @@ read_fru_area(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
- 
- 	finish = offset + length;
- 	if (finish > fru->size) {
-+		memset(frubuf + fru->size, 0, length - fru->size);
- 		finish = fru->size;
- 		lprintf(LOG_NOTICE, "Read FRU Area length %d too large, "
- 			"Adjusting to %d",
- 			offset + length, finish - offset);
-+		length = finish - offset;
- 	}
- 
- 	memset(&req, 0, sizeof(req));
-@@ -667,6 +672,7 @@ read_fru_area(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
- 		}
- 	}
- 
-+	size_left_in_buffer = length;
- 	do {
- 		tmp = fru->access ? off >> 1 : off;
- 		msg_data[0] = id;
-@@ -707,9 +713,18 @@ read_fru_area(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
- 		}
- 
- 		tmp = fru->access ? rsp->data[0] << 1 : rsp->data[0];
-+		if(rsp->data_len < 1
-+		   || tmp > rsp->data_len - 1
-+		   || tmp > size_left_in_buffer)
-+		{
-+			printf(" Not enough buffer size");
-+			return -1;
-+		}
-+
- 		memcpy(frubuf, rsp->data + 1, tmp);
- 		off += tmp;
- 		frubuf += tmp;
-+		size_left_in_buffer -= tmp;
- 		/* sometimes the size returned in the Info command
- 		* is too large.  return 0 so higher level function
- 		* still attempts to parse what was returned */
-@@ -742,7 +757,9 @@ read_fru_area_section(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
- 			uint32_t offset, uint32_t length, uint8_t *frubuf)
- {
- 	static uint32_t fru_data_rqst_size = 20;
--	uint32_t off = offset, tmp, finish;
-+	uint32_t off = offset;
-+	uint32_t tmp, finish;
-+	uint32_t size_left_in_buffer;
- 	struct ipmi_rs * rsp;
- 	struct ipmi_rq req;
- 	uint8_t msg_data[4];
-@@ -755,10 +772,12 @@ read_fru_area_section(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
- 
- 	finish = offset + length;
- 	if (finish > fru->size) {
-+		memset(frubuf + fru->size, 0, length - fru->size);
- 		finish = fru->size;
- 		lprintf(LOG_NOTICE, "Read FRU Area length %d too large, "
- 			"Adjusting to %d",
- 			offset + length, finish - offset);
-+		length = finish - offset;
- 	}
- 
- 	memset(&req, 0, sizeof(req));
-@@ -773,6 +792,8 @@ read_fru_area_section(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
- 	if (fru->access && fru_data_rqst_size > 16)
- #endif
- 		fru_data_rqst_size = 16;
-+
-+	size_left_in_buffer = length;
- 	do {
- 		tmp = fru->access ? off >> 1 : off;
- 		msg_data[0] = id;
-@@ -804,8 +825,16 @@ read_fru_area_section(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
- 		}
- 
- 		tmp = fru->access ? rsp->data[0] << 1 : rsp->data[0];
-+		if(rsp->data_len < 1
-+		   || tmp > rsp->data_len - 1
-+		   || tmp > size_left_in_buffer)
-+		{
-+			printf(" Not enough buffer size");
-+			return -1;
-+		}
- 		memcpy((frubuf + off)-offset, rsp->data + 1, tmp);
- 		off += tmp;
-+		size_left_in_buffer -= tmp;
- 
- 		/* sometimes the size returned in the Info command
- 		* is too large.  return 0 so higher level function
--- 
-2.20.1
-
diff --git a/package/ipmitool/0009-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch b/package/ipmitool/0009-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
deleted file mode 100644
index 213a2ad7bb..0000000000
--- a/package/ipmitool/0009-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 879f57c3b1ff17b1ca0dbdc8aac9c7a814e876fc Mon Sep 17 00:00:00 2001
-From: Chrostoper Ertl <chertl@microsoft.com>
-Date: Thu, 28 Nov 2019 16:44:18 +0000
-Subject: [PATCH] fru: Fix buffer overflow in ipmi_spd_print_fru
-
-Partial fix for CVE-2020-5208, see
-https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
-
-The `ipmi_spd_print_fru` function has a similar issue as the one fixed
-by the previous commit in `read_fru_area_section`. An initial request is
-made to get the `fru.size`, which is used as the size for the allocation
-of `spd_data`. Inside a loop, further requests are performed to get the
-copy sizes which are not checked before being used as the size for a
-copy into the buffer.
-
-[Retrieve from:
-https://github.com/ipmitool/ipmitool/commit/840fb1cbb4fb365cb9797300e3374d4faefcdb10]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- lib/dimm_spd.c | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/lib/dimm_spd.c b/lib/dimm_spd.c
-index 41e30db..68f3b4f 100644
---- a/lib/dimm_spd.c
-+++ b/lib/dimm_spd.c
-@@ -1621,7 +1621,7 @@ ipmi_spd_print_fru(struct ipmi_intf * intf, uint8_t id)
- 	struct ipmi_rq req;
- 	struct fru_info fru;
- 	uint8_t *spd_data, msg_data[4];
--	int len, offset;
-+	uint32_t len, offset;
- 
- 	msg_data[0] = id;
- 
-@@ -1697,6 +1697,13 @@ ipmi_spd_print_fru(struct ipmi_intf * intf, uint8_t id)
- 		}
- 
- 		len = rsp->data[0];
-+		if(rsp->data_len < 1
-+		   || len > rsp->data_len - 1
-+		   || len > fru.size - offset)
-+		{
-+			printf(" Not enough buffer size");
-+			return -1;
-+		}
- 		memcpy(&spd_data[offset], rsp->data + 1, len);
- 		offset += len;
- 	} while (offset < fru.size);
--- 
-2.20.1
-
diff --git a/package/ipmitool/0010-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch b/package/ipmitool/0010-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch
deleted file mode 100644
index 94a5ce6504..0000000000
--- a/package/ipmitool/0010-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From cd785a7fe4f42ab59bcefcf01b9175f039af29b5 Mon Sep 17 00:00:00 2001
-From: Chrostoper Ertl <chertl@microsoft.com>
-Date: Thu, 28 Nov 2019 16:51:49 +0000
-Subject: [PATCH] session: Fix buffer overflow in ipmi_get_session_info
-
-Partial fix for CVE-2020-5208, see
-https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
-
-The `ipmi_get_session_info` function does not properly check the
-response `data_len`, which is used as a copy size, allowing stack buffer
-overflow.
-
-[Retrieve from:
-https://github.com/ipmitool/ipmitool/commit/41d7026946fafbd4d1ec0bcaca3ea30a6e8eed22]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- lib/ipmi_session.c | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/lib/ipmi_session.c b/lib/ipmi_session.c
-index 141f0f4..b9af1fd 100644
---- a/lib/ipmi_session.c
-+++ b/lib/ipmi_session.c
-@@ -309,8 +309,10 @@ ipmi_get_session_info(struct ipmi_intf         * intf,
- 		}
- 		else
- 		{
--			memcpy(&session_info,  rsp->data, rsp->data_len);
--			print_session_info(&session_info, rsp->data_len);
-+			memcpy(&session_info,  rsp->data,
-+			       __min(rsp->data_len, sizeof(session_info)));
-+			print_session_info(&session_info,
-+			                   __min(rsp->data_len, sizeof(session_info)));
- 		}
- 		break;
- 		
-@@ -341,8 +343,10 @@ ipmi_get_session_info(struct ipmi_intf         * intf,
- 				break;
- 			}
- 
--			memcpy(&session_info,  rsp->data, rsp->data_len);
--			print_session_info(&session_info, rsp->data_len);
-+			memcpy(&session_info,  rsp->data,
-+			       __min(rsp->data_len, sizeof(session_info)));
-+			print_session_info(&session_info,
-+			                   __min(rsp->data_len, sizeof(session_info)));
- 			
- 		} while (i <= session_info.session_slot_count);
- 		break;
--- 
-2.20.1
-
diff --git a/package/ipmitool/0011-channel-Fix-buffer-overflow.patch b/package/ipmitool/0011-channel-Fix-buffer-overflow.patch
deleted file mode 100644
index 62e04c3e27..0000000000
--- a/package/ipmitool/0011-channel-Fix-buffer-overflow.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 1d479fc61feacc64adea64da9601f3dfcf6f74b3 Mon Sep 17 00:00:00 2001
-From: Chrostoper Ertl <chertl@microsoft.com>
-Date: Thu, 28 Nov 2019 16:56:38 +0000
-Subject: [PATCH] channel: Fix buffer overflow
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Partial fix for CVE-2020-5208, see
-https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
-
-The `ipmi_get_channel_cipher_suites` function does not properly check
-the final response’s `data_len`, which can lead to stack buffer overflow
-on the final copy.
-
-[Retrieve from:
-https://github.com/ipmitool/ipmitool/commit/9452be87181a6e83cfcc768b3ed8321763db50e4
-
-The patch is slightly modified manually. The define
-(MAX_CIPHER_SUITE_DATA_LEN) was introduced upstream in another patch.
-Replace the define by the value 0x10.]
-
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- lib/ipmi_channel.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/lib/ipmi_channel.c b/lib/ipmi_channel.c
-index fab2e54..59ac227 100644
---- a/lib/ipmi_channel.c
-+++ b/lib/ipmi_channel.c
-@@ -413,7 +413,10 @@ ipmi_get_channel_cipher_suites(struct ipmi_intf *intf, const char *payload_type,
- 			lprintf(LOG_ERR, "Unable to Get Channel Cipher Suites");
- 			return -1;
- 		}
--		if (rsp->ccode > 0) {
-+		if (rsp->ccode
-+		    || rsp->data_len < 1
-+		    || rsp->data_len > sizeof(uint8_t) + 0x10)
-+		{
- 			lprintf(LOG_ERR, "Get Channel Cipher Suites failed: %s",
- 					val2str(rsp->ccode, completion_code_vals));
- 			return -1;
--- 
-2.20.1
-
diff --git a/package/ipmitool/0012-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch b/package/ipmitool/0012-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch
deleted file mode 100644
index aba9ad2c71..0000000000
--- a/package/ipmitool/0012-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From ceebf5998b71e11c81133680560b498977d3d3cd Mon Sep 17 00:00:00 2001
-From: Chrostoper Ertl <chertl@microsoft.com>
-Date: Thu, 28 Nov 2019 17:06:39 +0000
-Subject: [PATCH] lanp: Fix buffer overflows in get_lan_param_select
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Partial fix for CVE-2020-5208, see
-https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
-
-The `get_lan_param_select` function is missing a validation check on the
-response’s `data_len`, which it then returns to caller functions, where
-stack buffer overflow can occur.
-
-[Retrieve from:
-https://github.com/ipmitool/ipmitool/commit/d45572d71e70840e0d4c50bf48218492b79c1a10]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- lib/ipmi_lanp.c | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/lib/ipmi_lanp.c b/lib/ipmi_lanp.c
-index 65d881b..022c7f1 100644
---- a/lib/ipmi_lanp.c
-+++ b/lib/ipmi_lanp.c
-@@ -1809,7 +1809,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
- 		if (p == NULL) {
- 			return (-1);
- 		}
--		memcpy(data, p->data, p->data_len);
-+		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
- 		/* set new ipaddr */
- 		memcpy(data+3, temp, 4);
- 		printf("Setting LAN Alert %d IP Address to %d.%d.%d.%d\n", alert,
-@@ -1824,7 +1824,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
- 		if (p == NULL) {
- 			return (-1);
- 		}
--		memcpy(data, p->data, p->data_len);
-+		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
- 		/* set new macaddr */
- 		memcpy(data+7, temp, 6);
- 		printf("Setting LAN Alert %d MAC Address to "
-@@ -1838,7 +1838,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
- 		if (p == NULL) {
- 			return (-1);
- 		}
--		memcpy(data, p->data, p->data_len);
-+		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
- 
- 		if (strncasecmp(argv[1], "def", 3) == 0 ||
- 		    strncasecmp(argv[1], "default", 7) == 0) {
-@@ -1864,7 +1864,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
- 		if (p == NULL) {
- 			return (-1);
- 		}
--		memcpy(data, p->data, p->data_len);
-+		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
- 
- 		if (strncasecmp(argv[1], "on", 2) == 0 ||
- 		    strncasecmp(argv[1], "yes", 3) == 0) {
-@@ -1889,7 +1889,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
- 		if (p == NULL) {
- 			return (-1);
- 		}
--		memcpy(data, p->data, p->data_len);
-+		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
- 
- 		if (strncasecmp(argv[1], "pet", 3) == 0) {
- 			printf("Setting LAN Alert %d destination to PET Trap\n", alert);
-@@ -1917,7 +1917,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
- 		if (p == NULL) {
- 			return (-1);
- 		}
--		memcpy(data, p->data, p->data_len);
-+		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
- 
- 		if (str2uchar(argv[1], &data[2]) != 0) {
- 			lprintf(LOG_ERR, "Invalid time: %s", argv[1]);
-@@ -1933,7 +1933,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
- 		if (p == NULL) {
- 			return (-1);
- 		}
--		memcpy(data, p->data, p->data_len);
-+		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
- 
- 		if (str2uchar(argv[1], &data[3]) != 0) {
- 			lprintf(LOG_ERR, "Invalid retry: %s", argv[1]);
--- 
-2.20.1
-
diff --git a/package/ipmitool/0013-fru-sdr-Fix-id_string-buffer-overflows.patch b/package/ipmitool/0013-fru-sdr-Fix-id_string-buffer-overflows.patch
deleted file mode 100644
index 2a519f3c72..0000000000
--- a/package/ipmitool/0013-fru-sdr-Fix-id_string-buffer-overflows.patch
+++ /dev/null
@@ -1,141 +0,0 @@
-From bf3ded3a474d85da99eb717acdcd8ff4f89f9879 Mon Sep 17 00:00:00 2001
-From: Chrostoper Ertl <chertl@microsoft.com>
-Date: Thu, 28 Nov 2019 17:13:45 +0000
-Subject: [PATCH] fru, sdr: Fix id_string buffer overflows
-
-Final part of the fixes for CVE-2020-5208, see
-https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
-
-9 variants of stack buffer overflow when parsing `id_string` field of
-SDR records returned from `CMD_GET_SDR` command.
-
-SDR record structs have an `id_code` field, and an `id_string` `char`
-array.
-
-The length of `id_string` is calculated as `(id_code & 0x1f) + 1`,
-which can be larger than expected 16 characters (if `id_code = 0xff`,
-then length will be `(0xff & 0x1f) + 1 = 32`).
-
-In numerous places, this can cause stack buffer overflow when copying
-into fixed buffer of size `17` bytes from this calculated length.
-
-[Retrieve from:
-https://github.com/ipmitool/ipmitool/commit/7ccea283dd62a05a320c1921e3d8d71a87772637]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- lib/ipmi_fru.c |  2 +-
- lib/ipmi_sdr.c | 40 ++++++++++++++++++++++++----------------
- 2 files changed, 25 insertions(+), 17 deletions(-)
-
-diff --git a/lib/ipmi_fru.c b/lib/ipmi_fru.c
-index af99aa9..98bc984 100644
---- a/lib/ipmi_fru.c
-+++ b/lib/ipmi_fru.c
-@@ -3062,7 +3062,7 @@ ipmi_fru_print(struct ipmi_intf * intf, struct sdr_record_fru_locator * fru)
- 		return 0;
- 
- 	memset(desc, 0, sizeof(desc));
--	memcpy(desc, fru->id_string, fru->id_code & 0x01f);
-+	memcpy(desc, fru->id_string, __min(fru->id_code & 0x01f, sizeof(desc)));
- 	desc[fru->id_code & 0x01f] = 0;
- 	printf("FRU Device Description : %s (ID %d)\n", desc, fru->device_id);
- 
-diff --git a/lib/ipmi_sdr.c b/lib/ipmi_sdr.c
-index 2a9cbe3..62aac08 100644
---- a/lib/ipmi_sdr.c
-+++ b/lib/ipmi_sdr.c
-@@ -2084,7 +2084,7 @@ ipmi_sdr_print_sensor_eventonly(struct ipmi_intf *intf,
- 		return -1;
- 
- 	memset(desc, 0, sizeof (desc));
--	snprintf(desc, (sensor->id_code & 0x1f) + 1, "%s", sensor->id_string);
-+	snprintf(desc, sizeof(desc), "%.*s", (sensor->id_code & 0x1f) + 1, sensor->id_string);
- 
- 	if (verbose) {
- 		printf("Sensor ID              : %s (0x%x)\n",
-@@ -2135,7 +2135,7 @@ ipmi_sdr_print_sensor_mc_locator(struct ipmi_intf *intf,
- 		return -1;
- 
- 	memset(desc, 0, sizeof (desc));
--	snprintf(desc, (mc->id_code & 0x1f) + 1, "%s", mc->id_string);
-+	snprintf(desc, sizeof(desc), "%.*s", (mc->id_code & 0x1f) + 1, mc->id_string);
- 
- 	if (verbose == 0) {
- 		if (csv_output)
-@@ -2228,7 +2228,7 @@ ipmi_sdr_print_sensor_generic_locator(struct ipmi_intf *intf,
- 	char desc[17];
- 
- 	memset(desc, 0, sizeof (desc));
--	snprintf(desc, (dev->id_code & 0x1f) + 1, "%s", dev->id_string);
-+	snprintf(desc, sizeof(desc), "%.*s", (dev->id_code & 0x1f) + 1, dev->id_string);
- 
- 	if (!verbose) {
- 		if (csv_output)
-@@ -2285,7 +2285,7 @@ ipmi_sdr_print_sensor_fru_locator(struct ipmi_intf *intf,
- 	char desc[17];
- 
- 	memset(desc, 0, sizeof (desc));
--	snprintf(desc, (fru->id_code & 0x1f) + 1, "%s", fru->id_string);
-+	snprintf(desc, sizeof(desc), "%.*s", (fru->id_code & 0x1f) + 1, fru->id_string);
- 
- 	if (!verbose) {
- 		if (csv_output)
-@@ -2489,35 +2489,43 @@ ipmi_sdr_print_name_from_rawentry(struct ipmi_intf *intf, uint16_t id,
- 
-    int rc =0;
-    char desc[17];
-+   const char *id_string;
-+   uint8_t id_code;
-    memset(desc, ' ', sizeof (desc));
- 
-    switch ( type) {
-       case SDR_RECORD_TYPE_FULL_SENSOR:
-       record.full = (struct sdr_record_full_sensor *) raw;
--      snprintf(desc, (record.full->id_code & 0x1f) +1, "%s",
--               (const char *)record.full->id_string);
-+      id_code = record.full->id_code;
-+      id_string = record.full->id_string;
-       break;
-+
-       case SDR_RECORD_TYPE_COMPACT_SENSOR:
-       record.compact = (struct sdr_record_compact_sensor *) raw	;
--      snprintf(desc, (record.compact->id_code & 0x1f)  +1, "%s",
--               (const char *)record.compact->id_string);
-+      id_code = record.compact->id_code;
-+      id_string = record.compact->id_string;
-       break;
-+
-       case SDR_RECORD_TYPE_EVENTONLY_SENSOR:
-       record.eventonly  = (struct sdr_record_eventonly_sensor *) raw ;
--      snprintf(desc, (record.eventonly->id_code & 0x1f)  +1, "%s",
--               (const char *)record.eventonly->id_string);
--      break;            
-+      id_code = record.eventonly->id_code;
-+      id_string = record.eventonly->id_string;
-+      break;
-+
-       case SDR_RECORD_TYPE_MC_DEVICE_LOCATOR:
-       record.mcloc  = (struct sdr_record_mc_locator *) raw ;
--      snprintf(desc, (record.mcloc->id_code & 0x1f)  +1, "%s",
--               (const char *)record.mcloc->id_string);		
-+      id_code = record.mcloc->id_code;
-+      id_string = record.mcloc->id_string;
-       break;
-+
-       default:
-       rc = -1;
--      break;
--   }   
-+   }
-+   if (!rc) {
-+       snprintf(desc, sizeof(desc), "%.*s", (id_code & 0x1f) + 1, id_string);
-+   }
- 
--      lprintf(LOG_INFO, "ID: 0x%04x , NAME: %-16s", id, desc);
-+   lprintf(LOG_INFO, "ID: 0x%04x , NAME: %-16s", id, desc);
-    return rc;
- }
- 
--- 
-2.20.1
-
diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
index 826bc094be..f5c79c8403 100644
--- a/package/ipmitool/Config.in
+++ b/package/ipmitool/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_IPMITOOL
 	  IPMItool provides a simple command-line interface to
 	  IPMI-enabled devices.
 
-	  http://sourceforge.net/projects/ipmitool/
+	  https://github.com/ipmitool/ipmitool/
 
 if BR2_PACKAGE_IPMITOOL
 
diff --git a/package/ipmitool/ipmitool.hash b/package/ipmitool/ipmitool.hash
index 5c053dc869..bb0b0d80b0 100644
--- a/package/ipmitool/ipmitool.hash
+++ b/package/ipmitool/ipmitool.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0c1ba3b1555edefb7c32ae8cd6a3e04322056bc087918f07189eeedfc8b81e01  ipmitool-1.8.18.tar.bz2
+sha256  48b010e7bcdf93e4e4b6e43c53c7f60aa6873d574cbd45a8d86fa7aaeebaff9c  IPMITOOL_1_8_19.tar.gz
 sha256  b7e2382a8be43b5f6cb092f2d2bda163bf1a1938be9300f821a845cbcd535f56  COPYING
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 801f1ea6b0..06d50bb6b9 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -4,20 +4,14 @@
 #
 ################################################################################
 
-IPMITOOL_VERSION = 1.8.18
-IPMITOOL_SOURCE = ipmitool-$(IPMITOOL_VERSION).tar.bz2
-IPMITOOL_SITE = http://downloads.sourceforge.net/project/ipmitool/ipmitool/$(IPMITOOL_VERSION)
+IPMITOOL_VERSION = 1_8_19
+IPMITOOL_SOURCE = IPMITOOL_$(IPMITOOL_VERSION).tar.gz
+IPMITOOL_SITE = https://github.com/ipmitool/ipmitool/archive/refs/tags
 IPMITOOL_LICENSE = BSD-3-Clause
 IPMITOOL_LICENSE_FILES = COPYING
 IPMITOOL_CPE_ID_VENDOR = ipmitool_project
-
-# 0008-fru-Fix-buffer-overflow-vulnerabilities.patch
-# 0009-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
-# 0010-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch
-# 0011-channel-Fix-buffer-overflow.patch
-# 0012-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch
-# 0013-fru-sdr-Fix-id_string-buffer-overflows.patch
-IPMITOOL_IGNORE_CVES += CVE-2020-5208
+# From git
+IPMITOOL_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_FREEIPMI),y)
 IPMITOOL_DEPENDENCIES += freeipmi


--===============1382654530483756610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1382654530483756610==--

