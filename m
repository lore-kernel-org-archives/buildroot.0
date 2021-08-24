Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3040C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:17:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7148060FDC
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7148060FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A7FC42708;
	Thu, 26 Aug 2021 22:17:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dwfB6QOsoKkY; Thu, 26 Aug 2021 22:17:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88ECF42710;
	Thu, 26 Aug 2021 22:17:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 408C21BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDE5B6149F
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I9rBr3OggDZh for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34A3F614B1
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 88F5A8DC52; Thu, 26 Aug 2021 22:01:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 23:59:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5d60e07e27a44e245eeb64cbd8acb2c1b5d7c415
X-Git-Newrev: a0238b538fcf9801c783ebe3b7636fed5c9f778b
X-Patchwork-Hint: ignore
Message-Id: <20210826220133.88F5A8DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python{3}-requests:
 allow idna 3.x to be installed on python 3.x
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6629820436354526685=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============6629820436354526685==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a0238b538fcf9801c783ebe3b7636fed5c9f778b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The tests.package.test_docker_compose.TestDockerCompose is broken
since the python-idna version bump to 3.0 because python-requests needs
python-idna < 3.0.

 # docker-compose up -d
 Traceback (most recent call last):
   File "/usr/lib/python3.9/site-packages/pkg_resources/__init__.py", line 583, in _build_master
   File "/usr/lib/python3.9/site-packages/pkg_resources/__init__.py", line 900, in require
   File "/usr/lib/python3.9/site-packages/pkg_resources/__init__.py", line 791, in resolve
 pkg_resources.ContextualVersionConflict: (idna 3.2 (/usr/lib/python3.9/site-packages), Requirement.parse('idna<3,>=2.5'), {'requests'})

 During handling of the above exception, another exception occurred:

 Traceback (most recent call last):
   File "/usr/bin/docker-compose", line 6, in <module>
     from pkg_resources import load_entry_point
   File "/usr/lib/python3.9/site-packages/pkg_resources/__init__.py", line 3252, in <module>
   File "/usr/lib/python3.9/site-packages/pkg_resources/__init__.py", line 3235, in _call_aside
   File "/usr/lib/python3.9/site-packages/pkg_resources/__init__.py", line 3264, in _initialize_master_working_set
   File "/usr/lib/python3.9/site-packages/pkg_resources/__init__.py", line 585, in _build_master
   File "/usr/lib/python3.9/site-packages/pkg_resources/__init__.py", line 598, in _build_from_requirements
   File "/usr/lib/python3.9/site-packages/pkg_resources/__init__.py", line 786, in resolve
 pkg_resources.DistributionNotFound: The 'idna<3,>=2.5' distribution was not found and is required by requests

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/1522848327

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ow-idna-3.x-to-be-installed-on-Python-3.x.patch | 33 ++++++++++++++++++++++
 ...ow-idna-3.x-to-be-installed-on-Python-3.x.patch | 33 ++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/package/python-requests/0001-Allow-idna-3.x-to-be-installed-on-Python-3.x.patch b/package/python-requests/0001-Allow-idna-3.x-to-be-installed-on-Python-3.x.patch
new file mode 100644
index 0000000000..ea9ad15df2
--- /dev/null
+++ b/package/python-requests/0001-Allow-idna-3.x-to-be-installed-on-Python-3.x.patch
@@ -0,0 +1,33 @@
+From d747c4753484aa9b90a094d6bf7ec45e5acfb623 Mon Sep 17 00:00:00 2001
+From: Naor Livne <naorlivne@gmail.com>
+Date: Wed, 7 Jul 2021 16:25:20 +0300
+Subject: [PATCH] Allow idna 3.x to be installed on Python 3.x
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Co-authored-by: Mickaël Schoentgen <contact@tiger-222.fr>
+Co-authored-by: Seth Michael Larson <sethmichaellarson@gmail.com>
+(cherry picked from commit 33cf965f7271ab4978ed551754db37865c4085db)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ setup.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 7ba4b2a2..83d78665 100755
+--- a/setup.py
++++ b/setup.py
+@@ -43,7 +43,8 @@ packages = ['requests']
+ 
+ requires = [
+     'chardet>=3.0.2,<5',
+-    'idna>=2.5,<3',
++    'idna>=2.5,<3; python_version < "3"',
++    'idna>=2.5,<4; python_version >= "3"',
+     'urllib3>=1.21.1,<1.27',
+     'certifi>=2017.4.17'
+ 
+-- 
+2.31.1
+
diff --git a/package/python3-requests/0001-Allow-idna-3.x-to-be-installed-on-Python-3.x.patch b/package/python3-requests/0001-Allow-idna-3.x-to-be-installed-on-Python-3.x.patch
new file mode 100644
index 0000000000..ea9ad15df2
--- /dev/null
+++ b/package/python3-requests/0001-Allow-idna-3.x-to-be-installed-on-Python-3.x.patch
@@ -0,0 +1,33 @@
+From d747c4753484aa9b90a094d6bf7ec45e5acfb623 Mon Sep 17 00:00:00 2001
+From: Naor Livne <naorlivne@gmail.com>
+Date: Wed, 7 Jul 2021 16:25:20 +0300
+Subject: [PATCH] Allow idna 3.x to be installed on Python 3.x
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Co-authored-by: Mickaël Schoentgen <contact@tiger-222.fr>
+Co-authored-by: Seth Michael Larson <sethmichaellarson@gmail.com>
+(cherry picked from commit 33cf965f7271ab4978ed551754db37865c4085db)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ setup.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 7ba4b2a2..83d78665 100755
+--- a/setup.py
++++ b/setup.py
+@@ -43,7 +43,8 @@ packages = ['requests']
+ 
+ requires = [
+     'chardet>=3.0.2,<5',
+-    'idna>=2.5,<3',
++    'idna>=2.5,<3; python_version < "3"',
++    'idna>=2.5,<4; python_version >= "3"',
+     'urllib3>=1.21.1,<1.27',
+     'certifi>=2017.4.17'
+ 
+-- 
+2.31.1
+

--===============6629820436354526685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============6629820436354526685==--
