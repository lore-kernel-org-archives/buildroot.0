Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA364C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 18:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 597ED60E21;
	Tue,  1 Nov 2022 18:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 597ED60E21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WCjpNY6475bY; Tue,  1 Nov 2022 18:13:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7122760E09;
	Tue,  1 Nov 2022 18:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7122760E09
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D68C41BF95C
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 18:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3CAA40276
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 18:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3CAA40276
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XkhdyuEPc5w2 for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 18:13:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2EEB4020A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2EEB4020A
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 18:13:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id B4AA720003;
 Tue,  1 Nov 2022 18:13:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 19:13:17 +0100
Message-Id: <20221101181320.368702-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667326405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=AO0wf62Op0cL0VLVOGY5PTX+DKfpzXqJ0W2w/0AqC9I=;
 b=Ft3EuqGkvV66u+V4E+KRyDI6vQ7Zf3mrO6fL413D2+MztZC9DPQkK5wzgQaEleXqaNmTfu
 BJg+wyVv1VlKQvq9dbPFIZ8rd/hGkzdrGhbUoF2eSD9g909PfHx2hFqHjoWJ3EaNtGlsXV
 qfUc/GDaTKPfR89LOPm7ry/dj58HdGf0Vrf8LDqVWjVAFTCH+xDPzVsVZH+1HtC0eQwUGd
 7muMyyZO31LsjmiZww9n1SOpMNPBhUbkg+GYGmOllyRfikmbBZsiAjdT0OypOwO7V1CaeJ
 ez1UUc9ATpamrFXPrf3YvkujUD3YpQmOZbuX+fbt9LPfkpvSv+cOOsLkQD4YzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ft3EuqGk
Subject: [Buildroot] [PATCH 1/3]
 support/testing/tests/package/test_python_flask*: increase time after
 server startup
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Lionel Flandrin <lionel@svkt.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It seems like on Gitlab CI, the runners are quite slow, and the Flask
server does not startup in the 15 seconds we give it. So increase this
to 30 seconds before trying to contact the Flask server.

Hopefully fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3249828594

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_python_flask.py              | 2 +-
 support/testing/tests/package/test_python_flask_expects_json.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_python_flask.py b/support/testing/tests/package/test_python_flask.py
index ef5d96bae9..9d8587e918 100644
--- a/support/testing/tests/package/test_python_flask.py
+++ b/support/testing/tests/package/test_python_flask.py
@@ -21,7 +21,7 @@ class TestPythonPy3Flask(TestPythonPackageBase):
         _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
 
         # Give enough time for the flask server to start up
-        time.sleep(15)
+        time.sleep(30)
 
         cmd = "wget -q -O - http://127.0.0.1:5000/"
         output, exit_code = self.emulator.run(cmd, timeout=self.timeout)
diff --git a/support/testing/tests/package/test_python_flask_expects_json.py b/support/testing/tests/package/test_python_flask_expects_json.py
index 5576cba2b4..91b8bf21b7 100644
--- a/support/testing/tests/package/test_python_flask_expects_json.py
+++ b/support/testing/tests/package/test_python_flask_expects_json.py
@@ -31,7 +31,7 @@ class TestPythonPy3FlaskExpectsJson(TestPythonPackageBase):
         _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
 
         # Give enough time for the flask server to start up
-        time.sleep(15)
+        time.sleep(30)
 
         self.try_json("""{"email": "test", "name": "test"}""", 200)
         self.try_json("""{"email": "test", "name": 2}""", 400)
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
