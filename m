Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F3CC4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 21:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13B664036F;
	Thu,  9 Nov 2023 21:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13B664036F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6i8w11k08wgJ; Thu,  9 Nov 2023 21:08:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18E1A417B6;
	Thu,  9 Nov 2023 21:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18E1A417B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78CA51BF995
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD49A6149E
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD49A6149E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5bewmQ6aHBmI for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 21:05:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3B3360AC3
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 21:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3B3360AC3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 889D386E92; Thu,  9 Nov 2023 21:05:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 21:57:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a01490397e4cc11155b3c396ded382eefeef4f12
X-Git-Newrev: 713ce6547d39b82f6bc7c21e47747b961820a593
X-Patchwork-Hint: ignore
Message-Id: <20231109210542.889D386E92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-m2crypto: bump to version
 0.40.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=713ce6547d39b82f6bc7c21e47747b961820a593
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch and associated CVE ignore which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr: update .checkpackageignore]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |   1 -
 ...-in-the-RSA-decryption-API-CVE-2020-25657.patch | 174 ---------------------
 package/python-m2crypto/python-m2crypto.hash       |   4 +-
 package/python-m2crypto/python-m2crypto.mk         |   7 +-
 4 files changed, 4 insertions(+), 182 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2feecbcb73..c11ece4b4b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1123,7 +1123,6 @@ package/python-crossbar/0001-Avoid-intentional-syntax-error.patch Upstream
 package/python-crossbar/0002-requirements-min.txt-drop-indirect-dependencies.patch Upstream
 package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch Upstream
 package/python-daphne/0001-remove-pytest-runner-requirement.patch Upstream
-package/python-m2crypto/0001-Mitigate-the-Bleichenbacher-timing-attacks-in-the-RSA-decryption-API-CVE-2020-25657.patch Upstream
 package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch Upstream
 package/python-pylibftdi/0001-do-not-use-find-library.patch Upstream
 package/python-pyqt5/0001-configure-skip-qtdetail.patch Upstream
diff --git a/package/python-m2crypto/0001-Mitigate-the-Bleichenbacher-timing-attacks-in-the-RSA-decryption-API-CVE-2020-25657.patch b/package/python-m2crypto/0001-Mitigate-the-Bleichenbacher-timing-attacks-in-the-RSA-decryption-API-CVE-2020-25657.patch
deleted file mode 100644
index 68200b7d9b..0000000000
--- a/package/python-m2crypto/0001-Mitigate-the-Bleichenbacher-timing-attacks-in-the-RSA-decryption-API-CVE-2020-25657.patch
+++ /dev/null
@@ -1,174 +0,0 @@
-From 84c53958def0f510e92119fca14d74f94215827a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Mat=C4=9Bj=20Cepl?= <mcepl@cepl.eu>
-Date: Tue, 28 Jun 2022 21:17:01 +0200
-Subject: [PATCH] Mitigate the Bleichenbacher timing attacks in the RSA
- decryption API (CVE-2020-25657)
-
-Fixes #282
-
-[Retrieved from:
-https://gitlab.com/m2crypto/m2crypto/-/commit/84c53958def0f510e92119fca14d74f94215827a]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/SWIG/_m2crypto_wrap.c | 20 ++++++++++++--------
- src/SWIG/_rsa.i           | 20 ++++++++++++--------
- tests/test_rsa.py         | 15 +++++++--------
- 3 files changed, 31 insertions(+), 24 deletions(-)
-
-diff --git a/src/SWIG/_m2crypto_wrap.c b/src/SWIG/_m2crypto_wrap.c
-index aba9eb6d..a9f30da9 100644
---- a/src/SWIG/_m2crypto_wrap.c
-+++ b/src/SWIG/_m2crypto_wrap.c
-@@ -7040,9 +7040,10 @@ PyObject *rsa_private_encrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_private_encrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
- 
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
-@@ -7070,9 +7071,10 @@ PyObject *rsa_public_decrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_public_decrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
- 
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
-@@ -7097,9 +7099,10 @@ PyObject *rsa_public_encrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_public_encrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
- 
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
-@@ -7124,9 +7127,10 @@ PyObject *rsa_private_decrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_private_decrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
- 
-diff --git a/src/SWIG/_rsa.i b/src/SWIG/_rsa.i
-index bc714e01..1377b8be 100644
---- a/src/SWIG/_rsa.i
-+++ b/src/SWIG/_rsa.i
-@@ -239,9 +239,10 @@ PyObject *rsa_private_encrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_private_encrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
- 
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
-@@ -269,9 +270,10 @@ PyObject *rsa_public_decrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_public_decrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
- 
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
-@@ -296,9 +298,10 @@ PyObject *rsa_public_encrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_public_encrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
- 
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
-@@ -323,9 +326,10 @@ PyObject *rsa_private_decrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_private_decrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
- 
-diff --git a/tests/test_rsa.py b/tests/test_rsa.py
-index 7bb3af75..5e75d681 100644
---- a/tests/test_rsa.py
-+++ b/tests/test_rsa.py
-@@ -109,8 +109,9 @@ class RSATestCase(unittest.TestCase):
-         # The other paddings.
-         for padding in self.s_padding_nok:
-             p = getattr(RSA, padding)
--            with self.assertRaises(RSA.RSAError):
--                priv.private_encrypt(self.data, p)
-+            # Exception disabled as a part of mitigation against CVE-2020-25657
-+            # with self.assertRaises(RSA.RSAError):
-+            priv.private_encrypt(self.data, p)
-         # Type-check the data to be encrypted.
-         with self.assertRaises(TypeError):
-             priv.private_encrypt(self.gen_callback, RSA.pkcs1_padding)
-@@ -127,10 +128,12 @@ class RSATestCase(unittest.TestCase):
-             self.assertEqual(ptxt, self.data)
- 
-         # no_padding
--        with six.assertRaisesRegex(self, RSA.RSAError, 'data too small'):
--            priv.public_encrypt(self.data, RSA.no_padding)
-+        # Exception disabled as a part of mitigation against CVE-2020-25657
-+        # with six.assertRaisesRegex(self, RSA.RSAError, 'data too small'):
-+        priv.public_encrypt(self.data, RSA.no_padding)
- 
-         # Type-check the data to be encrypted.
-+        # Exception disabled as a part of mitigation against CVE-2020-25657
-         with self.assertRaises(TypeError):
-             priv.public_encrypt(self.gen_callback, RSA.pkcs1_padding)
- 
-@@ -146,10 +149,6 @@ class RSATestCase(unittest.TestCase):
-                          b'\000\000\000\003\001\000\001')  # aka 65537 aka 0xf4
-         with self.assertRaises(RSA.RSAError):
-             setattr(rsa, 'e', '\000\000\000\003\001\000\001')
--        with self.assertRaises(RSA.RSAError):
--            rsa.private_encrypt(1)
--        with self.assertRaises(RSA.RSAError):
--            rsa.private_decrypt(1)
-         assert rsa.check_key()
- 
-     def test_loadpub_bad(self):
--- 
-GitLab
-
diff --git a/package/python-m2crypto/python-m2crypto.hash b/package/python-m2crypto/python-m2crypto.hash
index 879f232565..782837081e 100644
--- a/package/python-m2crypto/python-m2crypto.hash
+++ b/package/python-m2crypto/python-m2crypto.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/m2crypto/json
-md5  8f39bfac730b6567e0c2179d15318c60  M2Crypto-0.38.0.tar.gz
-sha256  99f2260a30901c949a8dc6d5f82cd5312ffb8abc92e76633baf231bbbcb2decb  M2Crypto-0.38.0.tar.gz
+md5  280c20072afbe7010cf9e9620ea25c7b  M2Crypto-0.40.1.tar.gz
+sha256  bbfd113ec55708c05816252a4f09e4237df4f3bbfc8171cbbc33057d257bbb30  M2Crypto-0.40.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4eca478396f4b2b020729a111fce3f096456d74500bfd8f2b0388c3c69f997c0  LICENCE
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index 3c28fa3b0d..69a0c28df5 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_M2CRYPTO_VERSION = 0.38.0
+PYTHON_M2CRYPTO_VERSION = 0.40.1
 PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
-PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/2c/52/c35ec79dd97a8ecf6b2bbd651df528abb47705def774a4a15b99977274e8
+PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/9e/a3/9433817493ea250db67a05de3361cb0a1d58531847d50406f2f28455e68c
 PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
 PYTHON_M2CRYPTO_LICENSE = MIT
 PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
@@ -15,7 +15,4 @@ PYTHON_M2CRYPTO_CPE_ID_PRODUCT = m2crypto
 PYTHON_M2CRYPTO_DEPENDENCIES = openssl host-swig
 PYTHON_M2CRYPTO_BUILD_OPTS = --openssl=$(STAGING_DIR)/usr
 
-# 0001-Mitigate-the-Bleichenbacher-timing-attacks-in-the-RSA-decryption-API-CVE-2020-25657.patch
-PYTHON_M2CRYPTO_IGNORE_CVES += CVE-2020-25657
-
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
