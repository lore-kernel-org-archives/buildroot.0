Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9055C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70C134F112;
	Mon, 20 Feb 2023 22:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70C134F112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CF_9QWhbgJbu; Mon, 20 Feb 2023 22:32:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFCB34F105;
	Mon, 20 Feb 2023 22:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFCB34F105
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF51C1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84706611C4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84706611C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yb1HABRe1k1u for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33F3861097
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33F3861097
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D430828C8; Mon, 20 Feb 2023 20:52:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:41:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bc4bed533a6c0166b70aeb03ddde9b021ea4058f
X-Git-Newrev: c38de8139abee58fb8d1cdc83d061c93aee7fd7f
X-Patchwork-Hint: ignore
Message-Id: <20230220205204.2D430828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python3: bump to
 version 3.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c38de8139abee58fb8d1cdc83d061c93aee7fd7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update license hash:
  - http://www.cwi.nl -> https://www.cwi.nl
  - http://www.cnri.reston.va.us -> https://www.cnri.reston.va.us
  - http://www.opensource.org -> https://opensource.org

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...33-Fix-quadratic-time-idna-decoding.-GH-9.patch | 86 ----------------------
 package/python3/python3.hash                       |  4 +-
 package/python3/python3.mk                         |  2 +-
 3 files changed, 3 insertions(+), 89 deletions(-)

diff --git a/package/python3/0033-3.11-gh-98433-Fix-quadratic-time-idna-decoding.-GH-9.patch b/package/python3/0033-3.11-gh-98433-Fix-quadratic-time-idna-decoding.-GH-9.patch
deleted file mode 100644
index d281e7261d..0000000000
--- a/package/python3/0033-3.11-gh-98433-Fix-quadratic-time-idna-decoding.-GH-9.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 9bb8e18ca46fe66fa6802602f8a7228a24dd785f Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Mon, 7 Nov 2022 19:23:16 -0800
-Subject: [PATCH] [3.11] gh-98433: Fix quadratic time idna decoding. (GH-99092)
- (GH-99222)
-
-There was an unnecessary quadratic loop in idna decoding. This restores
-the behavior to linear.
-
-(cherry picked from commit d315722564927c7202dd6e111dc79eaf14240b0d)
-
-(cherry picked from commit a6f6c3a3d6f2b580f2d87885c9b8a9350ad7bf15)
-
-Co-authored-by: Miss Islington (bot) <31488909+miss-islington@users.noreply.github.com>
-Co-authored-by: Gregory P. Smith <greg@krypto.org>
-[Peter: drop NEWS.d/*]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Lib/encodings/idna.py                         | 32 +++++++++----------
- Lib/test/test_codecs.py                       |  6 ++++
- 2 files changed, 23 insertions(+), 17 deletions(-)
-
-diff --git a/Lib/encodings/idna.py b/Lib/encodings/idna.py
-index ea4058512f..bf98f51336 100644
---- a/Lib/encodings/idna.py
-+++ b/Lib/encodings/idna.py
-@@ -39,23 +39,21 @@ def nameprep(label):
- 
-     # Check bidi
-     RandAL = [stringprep.in_table_d1(x) for x in label]
--    for c in RandAL:
--        if c:
--            # There is a RandAL char in the string. Must perform further
--            # tests:
--            # 1) The characters in section 5.8 MUST be prohibited.
--            # This is table C.8, which was already checked
--            # 2) If a string contains any RandALCat character, the string
--            # MUST NOT contain any LCat character.
--            if any(stringprep.in_table_d2(x) for x in label):
--                raise UnicodeError("Violation of BIDI requirement 2")
--
--            # 3) If a string contains any RandALCat character, a
--            # RandALCat character MUST be the first character of the
--            # string, and a RandALCat character MUST be the last
--            # character of the string.
--            if not RandAL[0] or not RandAL[-1]:
--                raise UnicodeError("Violation of BIDI requirement 3")
-+    if any(RandAL):
-+        # There is a RandAL char in the string. Must perform further
-+        # tests:
-+        # 1) The characters in section 5.8 MUST be prohibited.
-+        # This is table C.8, which was already checked
-+        # 2) If a string contains any RandALCat character, the string
-+        # MUST NOT contain any LCat character.
-+        if any(stringprep.in_table_d2(x) for x in label):
-+            raise UnicodeError("Violation of BIDI requirement 2")
-+        # 3) If a string contains any RandALCat character, a
-+        # RandALCat character MUST be the first character of the
-+        # string, and a RandALCat character MUST be the last
-+        # character of the string.
-+        if not RandAL[0] or not RandAL[-1]:
-+            raise UnicodeError("Violation of BIDI requirement 3")
- 
-     return label
- 
-diff --git a/Lib/test/test_codecs.py b/Lib/test/test_codecs.py
-index 8edd5ac063..2407567261 100644
---- a/Lib/test/test_codecs.py
-+++ b/Lib/test/test_codecs.py
-@@ -1535,6 +1535,12 @@ def test_builtin_encode(self):
-         self.assertEqual("pyth\xf6n.org".encode("idna"), b"xn--pythn-mua.org")
-         self.assertEqual("pyth\xf6n.org.".encode("idna"), b"xn--pythn-mua.org.")
- 
-+    def test_builtin_decode_length_limit(self):
-+        with self.assertRaisesRegex(UnicodeError, "too long"):
-+            (b"xn--016c"+b"a"*1100).decode("idna")
-+        with self.assertRaisesRegex(UnicodeError, "too long"):
-+            (b"xn--016c"+b"a"*70).decode("idna")
-+
-     def test_stream(self):
-         r = codecs.getreader("idna")(io.BytesIO(b"abc"))
-         r.read(3)
--- 
-2.30.2
-
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index c4ee79305d..7f079865d9 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a57dc82d77358617ba65b9841cee1e3b441f386c3789ddc0676eca077f2951c3  Python-3.11.0.tar.xz
-sha256  f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b  LICENSE
+sha256  85879192f2cffd56cb16c092905949ebf3e5e394b7f764723529637901dfb58f  Python-3.11.1.tar.xz
+sha256  d4a223f033419313218c9b8444167e91e87a5bebdb43fb8490df441df5220a8b  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 123bc8ef88..219d135b3f 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.11
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).0
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
