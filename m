Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD5DF3D5FF
	for <buildroot@archiver.kernel.org>; Sun, 29 Mar 2026 11:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 412B66090A;
	Sun, 29 Mar 2026 11:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZYbLvuXJ_Mr; Sun, 29 Mar 2026 11:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7978660A35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774782399;
	bh=ioq5UqCKlJNtPN2judGt+CqGRsdvO5Evx+TM2SwfBfc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rSuNlUG6BLhEd6WnQsYtic0f+DMPF+Pl1ldGkp1OK3urH81WcmFwQLRZWbBHgTaRL
	 fUmL2cSSUJpmiqIXV1kf6YArtrDCSfyStxF8rPdqcd+ZVf9uwKNdco5d+6J/W2QtY8
	 Q3Pa8vFLlucV/duumkQX926P5YdUkQMGhL8x1p9BBhn5VlA9gY06QybkVV0Twbtg+/
	 yffScVedUqYa+cUo7AHO2NJoMlfab3uY287HVEdnyf0431n0X+eUbgJkXHzFnL45iR
	 K9L6AVteaXdbytnPykmKH8oC781MfI5oXFYtgXMLdjHIDPaF9yYoMd5FRhEVbudBQU
	 NnSvR5vF/MvTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7978660A35;
	Sun, 29 Mar 2026 11:06:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 50404374
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 11:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35E8440375
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 11:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNrg9xLKB2qu for <buildroot@buildroot.org>;
 Sun, 29 Mar 2026 11:06:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AD91400C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AD91400C8
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 11:06:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA7827FDB7; Sun, 29 Mar 2026 11:06:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Mar 2026 12:57:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e6597de2173cab3e40a115cf1282c9cf9ebd913
X-Git-Newrev: b647b0c95d823a294ac5da6c15d5daad41874e1c
X-Patchwork-Hint: ignore
Message-Id: <20260329110635.BA7827FDB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add python-gymnasium tests
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b647b0c95d823a294ac5da6c15d5daad41874e1c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add a basic runtime test for the python-gymnasium package.
This test verifies the fundamental operations of the library by:
- Importing `gymnasium`.
- Creating a "CartPole-v1" environment.
- Resetting the environment.
- Taking a random action step.
- Closing the environment.

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
[Julien:
 - sort DEVELOPERS entries alphabetically
 - fix file name typo in DEVELOPERS
 - remove selection of dependencies in test config
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                               |  2 ++
 support/testing/tests/package/sample_python_gymnasium.py |  8 ++++++++
 support/testing/tests/package/test_python_gymnasium.py   | 12 ++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f0aadbbcd3..410073d48a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3485,8 +3485,10 @@ F:	package/python-farama-notifications/
 F:	package/python-gymnasium/
 F:	support/testing/tests/package/sample_python_cloudpickle.py
 F:	support/testing/tests/package/sample_python_farama_notifications.py
+F:	support/testing/tests/package/sample_python_gymnasium.py
 F:	support/testing/tests/package/test_python_cloudpickle.py
 F:	support/testing/tests/package/test_python_farama_notifications.py
+F:	support/testing/tests/package/test_python_gymnasium.py
 
 N:	Yair Ben Avraham <yairba@protonmail.com>
 F:	package/casync/
diff --git a/support/testing/tests/package/sample_python_gymnasium.py b/support/testing/tests/package/sample_python_gymnasium.py
new file mode 100644
index 0000000000..42997b2982
--- /dev/null
+++ b/support/testing/tests/package/sample_python_gymnasium.py
@@ -0,0 +1,8 @@
+import gymnasium as gym
+env = gym.make("CartPole-v1")
+
+observation, info = env.reset()
+random_action = env.action_space.sample()
+next_observation, reward, terminated, truncated, info = env.step(random_action)
+
+env.close()
diff --git a/support/testing/tests/package/test_python_gymnasium.py b/support/testing/tests/package/test_python_gymnasium.py
new file mode 100644
index 0000000000..c36ce37dde
--- /dev/null
+++ b/support/testing/tests/package/test_python_gymnasium.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Gymnasium(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_GYMNASIUM=y
+        """
+    sample_scripts = ["tests/package/sample_python_gymnasium.py"]
+    timeout = 20
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
