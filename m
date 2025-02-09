Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B8AC0219B
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 15:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A27F412AD;
	Sun,  9 Feb 2025 15:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVxjo7W-BxFT; Sun,  9 Feb 2025 15:10:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A2B540B4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A2B540B4B;
	Sun,  9 Feb 2025 15:10:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E21DC2
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 092D060726
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WumGAEkzWlzn for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 15:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 184DD605EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 184DD605EE
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0746587457; Sun,  9 Feb 2025 15:09:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 11:10:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f26dfdc842c7f95102f13f4bc863a404821f57f3
X-Git-Newrev: ef15efdd2c422a8c0df074f46978045e7e8deeb8
X-Patchwork-Hint: ignore
Message-Id: <20250209150951.0746587457@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/package:
 sample_python_*: fix flake8 errors
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ef15efdd2c422a8c0df074f46978045e7e8deeb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

flake8 5.0.4 provided by Debian 12 (bookworm) now detect a missing
whitespace after 'assert' keyword:

  E275 missing whitespace after keyword

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Peter: fix subject, drop extra paranthesises]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/sample_python_attrs.py      | 8 ++++----
 support/testing/tests/package/sample_python_colorzero.py  | 6 +++---
 support/testing/tests/package/sample_python_constantly.py | 6 +++---
 support/testing/tests/package/sample_python_gpiozero.py   | 2 +-
 support/testing/tests/package/sample_python_passlib.py    | 4 ++--
 support/testing/tests/package/sample_python_rpi_gpio.py   | 2 +-
 6 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/support/testing/tests/package/sample_python_attrs.py b/support/testing/tests/package/sample_python_attrs.py
index f224944914..8199cc666b 100644
--- a/support/testing/tests/package/sample_python_attrs.py
+++ b/support/testing/tests/package/sample_python_attrs.py
@@ -8,8 +8,8 @@ class Obj(object):
 
 
 obj1 = Obj(2)
-assert(obj1.x == 2)
-assert(obj1.y == 1)
+assert obj1.x == 2
+assert obj1.y == 1
 obj2 = Obj(3, 4)
-assert(obj2.x == 3)
-assert(obj2.y == 4)
+assert obj2.x == 3
+assert obj2.y == 4
diff --git a/support/testing/tests/package/sample_python_colorzero.py b/support/testing/tests/package/sample_python_colorzero.py
index 23862a816d..8d4daa560d 100644
--- a/support/testing/tests/package/sample_python_colorzero.py
+++ b/support/testing/tests/package/sample_python_colorzero.py
@@ -3,6 +3,6 @@ from colorzero import Color
 red = Color('red')
 green = Color('lime')
 blue = Color('blue')
-assert(red.rgb == (1.0, 0.0, 0.0))
-assert(green.rgb == (0.0, 1.0, 0.0))
-assert(blue.rgb == (0.0, 0.0, 1.0))
+assert red.rgb == (1.0, 0.0, 0.0)
+assert green.rgb == (0.0, 1.0, 0.0)
+assert blue.rgb == (0.0, 0.0, 1.0)
diff --git a/support/testing/tests/package/sample_python_constantly.py b/support/testing/tests/package/sample_python_constantly.py
index 570cf85b23..b826dd4b71 100644
--- a/support/testing/tests/package/sample_python_constantly.py
+++ b/support/testing/tests/package/sample_python_constantly.py
@@ -14,6 +14,6 @@ class RESULT(Values):
 
 
 print(list(RESULT.iterconstants()))
-assert(RESULT.OK < RESULT.FAIL)
-assert(RESULT.OK.value > RESULT.FAIL.value)
-assert(RESULT.get(-5) == RESULT.FAIL)
+assert RESULT.OK < RESULT.FAIL
+assert RESULT.OK.value > RESULT.FAIL.value
+assert RESULT.get(-5) == RESULT.FAIL
diff --git a/support/testing/tests/package/sample_python_gpiozero.py b/support/testing/tests/package/sample_python_gpiozero.py
index b95df07fe7..e20a9c8d34 100644
--- a/support/testing/tests/package/sample_python_gpiozero.py
+++ b/support/testing/tests/package/sample_python_gpiozero.py
@@ -2,4 +2,4 @@ from gpiozero import pi_info
 
 piBoardInfo = pi_info('a020d3')  # 3B+
 
-assert(piBoardInfo.model == '3B+')
+assert piBoardInfo.model == '3B+'
diff --git a/support/testing/tests/package/sample_python_passlib.py b/support/testing/tests/package/sample_python_passlib.py
index 3ab348b9e4..80afbf18d0 100644
--- a/support/testing/tests/package/sample_python_passlib.py
+++ b/support/testing/tests/package/sample_python_passlib.py
@@ -1,5 +1,5 @@
 from passlib.hash import pbkdf2_sha256
 
 hash = pbkdf2_sha256.hash("password")
-assert(pbkdf2_sha256.verify("passWord", hash) is False)
-assert(pbkdf2_sha256.verify("password", hash) is True)
+assert pbkdf2_sha256.verify("passWord", hash) is False
+assert pbkdf2_sha256.verify("password", hash) is True
diff --git a/support/testing/tests/package/sample_python_rpi_gpio.py b/support/testing/tests/package/sample_python_rpi_gpio.py
index 5f0d884e07..e0bd96f631 100644
--- a/support/testing/tests/package/sample_python_rpi_gpio.py
+++ b/support/testing/tests/package/sample_python_rpi_gpio.py
@@ -1,6 +1,6 @@
 try:
     import RPi.GPIO  # noqa
 except RuntimeError as e:
-    assert(str(e) == 'This module can only be run on a Raspberry Pi!')
+    assert str(e) == 'This module can only be run on a Raspberry Pi!'
 else:
     raise RuntimeError('Import succeeded when it should not have!')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
