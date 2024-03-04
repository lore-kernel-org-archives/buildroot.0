Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F67C54E41
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 21:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E87760DED;
	Mon,  4 Mar 2024 21:52:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oAfZp8xDbmlB; Mon,  4 Mar 2024 21:52:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1055660D72
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1055660D72;
	Mon,  4 Mar 2024 21:52:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D6E0C1BF94D
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 21:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C315F408A8
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 21:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ncxRlyc_8pdt for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 21:52:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F60940894
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F60940894
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 21:52:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55F74880E1; Mon,  4 Mar 2024 21:52:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Mar 2024 22:46:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20406b715946887902e40ffcf8815a90dcb5faaf
X-Git-Newrev: 15109dd7ebcf2c670c2eea31fa79460a8a1446e9
X-Patchwork-Hint: ignore
Message-Id: <20240304215231.55F74880E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: security bump to
 5.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=15109dd7ebcf2c670c2eea31fa79460a8a1446e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: CVE-2024-27351: Potential regular expression
denial-of-service in django.utils.text.Truncator.words() [1]

Remove patch that is included in this release.

[1] https://docs.djangoproject.com/en/dev/releases/5.0.3/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Fixed-sensitive_variables-sensitive_post.patch | 45 ----------------------
 package/python-django/python-django.hash           |  4 +-
 package/python-django/python-django.mk             |  4 +-
 3 files changed, 4 insertions(+), 49 deletions(-)

diff --git a/package/python-django/0001-Fixed-sensitive_variables-sensitive_post.patch b/package/python-django/0001-Fixed-sensitive_variables-sensitive_post.patch
deleted file mode 100644
index 90dc9c7dd0..0000000000
--- a/package/python-django/0001-Fixed-sensitive_variables-sensitive_post.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From d294b7679f2cb51c7231d6a7fb22e76eb74e49ec Mon Sep 17 00:00:00 2001
-From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
-Date: Sat, 17 Feb 2024 08:15:59 +0100
-Subject: [PATCH] Fixed #35187 -- Fixed
- @sensitive_variables/sensitive_post_parameters decorators crash with
- .pyc-only builds.
-
-Thanks Jon Janzen for the implementation idea.
-
-Thanks Marcus Hoffmann for the report.
-
-Regression in 38e391e95fe5258bc6d2467332dc9cd44ce6ba52.
-Backport of d1be05b3e9209fd0787841c71a95819d81061187 from main
-
-Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
-Upstream: https://github.com/django/django/commit/41a4bba817f139f3cfd94f04e728e046560c9a18
----
- django/views/decorators/debug.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/django/views/decorators/debug.py b/django/views/decorators/debug.py
-index 7ea8a540de..6540fc0651 100644
---- a/django/views/decorators/debug.py
-+++ b/django/views/decorators/debug.py
-@@ -47,7 +47,6 @@ def sensitive_variables(*variables):
- 
-             try:
-                 file_path = inspect.getfile(wrapped_func)
--                _, first_file_line = inspect.getsourcelines(wrapped_func)
-             except TypeError:  # Raises for builtins or native functions.
-                 raise ValueError(
-                     f"{func.__name__} cannot safely be wrapped by "
-@@ -55,7 +54,8 @@ def sensitive_variables(*variables):
-                     "Python file (not a builtin or from a native extension)."
-                 )
-             else:
--                key = hash(f"{file_path}:{first_file_line}")
-+                first_line_number = wrapped_func.__code__.co_firstlineno
-+                key = hash(f"{file_path}:{first_line_number}")
- 
-             if variables:
-                 coroutine_functions_to_sensitive_variables[key] = variables
--- 
-2.34.1
-
diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 20b66a4106..d5684a083c 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  5d0df847e1b751a4a5d2bde1563c75fc  Django-5.0.2.tar.gz
-sha256  b5bb1d11b2518a5f91372a282f24662f58f66749666b0a286ab057029f728080  Django-5.0.2.tar.gz
+md5  1009c48d70060cadb40000cc15a8058a  Django-5.0.3.tar.gz
+sha256  5fb37580dcf4a262f9258c1f4373819aacca906431f505e4688e37f3a99195df  Django-5.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 231de0b833..258ff9e0c1 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.0.2
+PYTHON_DJANGO_VERSION = 5.0.3
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/50/98/499a2d11eb0b22fdd55ce5895e0f5ce6d7d4957a785f237a89317cb478fa
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/e1/b1/ac6a16aaf0049637b50afbcf06b8ec2fa5c6ce42d4ae6ba66bbaf4c3609a
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
