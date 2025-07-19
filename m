Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43896C83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 11:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17E418110E;
	Sat, 19 Jul 2025 11:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdOQhqqe2eEW; Sat, 19 Jul 2025 11:36:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15DD183AC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15DD183AC5;
	Sat, 19 Jul 2025 11:36:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9163B117
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 766F04040A
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CN-WuoKxlWMH for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 11:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6A20400F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6A20400F2
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:36:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F659867A2; Sat, 19 Jul 2025 11:36:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Jul 2025 13:26:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14d1d58e1f1d3d8ff6eb92ad3ed3a7bf99e05590
X-Git-Newrev: 358e85b966c865e69452b50437bfc4e2f05c9f0f
X-Patchwork-Hint: ignore
Message-Id: <20250719113616.8F659867A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-asgiref: bump to 0.9.1
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
Content-Type: multipart/mixed; boundary="===============1022992143212018535=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1022992143212018535==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=358e85b966c865e69452b50437bfc4e2f05c9f0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release Notes:

* Fixed deletion of Local values affecting other contexts. (#523)

* Skip CPython specific garbage collection test on pypy. (#521)

3.9.0 (2025-07-03)
------------------

* Adds support for Python 3.13.

* Drops support for (end-of-life) Python 3.8.

* Fixes an error with conflicting kwargs between AsyncToSync and the wrapped
  function. (#471)

* Fixes Local isolation between asyncio Tasks. (#478)

* Fixes a reference cycle in Local (#508)

* Fixes a deadlock in CurrentThreadExecutor with nested async_to_sync →
  sync_to_async → async_to_sync → create_task calls. (#494)

* The ApplicationCommunicator testing utility will now return the task result
  if it's already completed on send_input and receive_nothing. You may need to
  catch (e.g.) the asyncio.exceptions.CancelledError if sending messages to
  already finished consumers in your tests. (#505)

Source: https://github.com/django/asgiref/blob/main/CHANGELOG.txt

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-asgiref/python-asgiref.hash | 4 ++--
 package/python-asgiref/python-asgiref.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asgiref/python-asgiref.hash b/package/python-asgiref/python-asgiref.hash
index e3157c3e11..e7cda89f4d 100644
--- a/package/python-asgiref/python-asgiref.hash
+++ b/package/python-asgiref/python-asgiref.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asgiref/json
-md5  fb2927e26ea34c97e0a4c89612e80562  asgiref-3.8.1.tar.gz
-sha256  c343bd80a0bec947a9860adb4c432ffa7db769836c64238fc34bdc3fec84d590  asgiref-3.8.1.tar.gz
+md5  f4151a69f1fc33dd69c237515bbf9c92  asgiref-3.9.1.tar.gz
+sha256  a5ab6582236218e5ef1648f242fd9f10626cfd4de8dc377db215d5d5098e3142  asgiref-3.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-asgiref/python-asgiref.mk b/package/python-asgiref/python-asgiref.mk
index 0725ad6e38..22cb1077db 100644
--- a/package/python-asgiref/python-asgiref.mk
+++ b/package/python-asgiref/python-asgiref.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASGIREF_VERSION = 3.8.1
+PYTHON_ASGIREF_VERSION = 3.9.1
 PYTHON_ASGIREF_SOURCE = asgiref-$(PYTHON_ASGIREF_VERSION).tar.gz
-PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/29/38/b3395cc9ad1b56d2ddac9970bc8f4141312dbaec28bc7c218b0dfafd0f42
+PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/90/61/0aa957eec22ff70b830b22ff91f825e70e1ef732c06666a805730f28b36b
 PYTHON_ASGIREF_SETUP_TYPE = setuptools
 PYTHON_ASGIREF_LICENSE = BSD-3-Clause
 PYTHON_ASGIREF_LICENSE_FILES = LICENSE

--===============1022992143212018535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1022992143212018535==--
