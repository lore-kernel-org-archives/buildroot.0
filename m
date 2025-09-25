Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2B9CAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DC9B417C6;
	Thu, 25 Sep 2025 20:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XxOlBcnd7XB5; Thu, 25 Sep 2025 20:03:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12735415D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12735415D8;
	Thu, 25 Sep 2025 20:03:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F9A512D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BA0C61536
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X1KAE5g0zfhn for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01A2661528
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01A2661528
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:02:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3A4586443; Thu, 25 Sep 2025 20:02:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 21:57:43 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 2004334a6bd600df37aca83508e2039635b89f4f
X-Git-Newrev: eb0fc97fb81ced8d792aa4f0470097f21a020c15
X-Patchwork-Hint: ignore
Message-Id: <20250925200241.F3A4586443@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] utils/scanpypi: remove
 python six module
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eb0fc97fb81ced8d792aa4f0470097f21a020c15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

We dropped support for python2 a while back in [1], as such we
can remove the python six module which was only needed for
backwards comaptibility with python2.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/2743ce00ca61fde1537b64a165a69d497052be58

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add commit ref removing python2 support]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 53eb75ef535b656e9cd762fb9412dc5c1340f64b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/scanpypi | 37 ++++++++++++++-----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index af62c01632..61879e39d4 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -22,16 +22,10 @@ import tempfile
 import traceback
 import importlib
 import importlib.metadata
-import six.moves.urllib.request
-import six.moves.urllib.error
-import six.moves.urllib.parse
-from six.moves import map
-from six.moves import zip
-from six.moves import input
-if six.PY2:
-    import StringIO
-else:
-    import io
+import urllib.request
+import urllib.error
+import urllib.parse
+import io
 
 BUF_SIZE = 65536
 
@@ -225,15 +219,15 @@ class BuildrootPackage():
         self.metadata_url = 'https://pypi.org/pypi/{pkg}/json'.format(
             pkg=self.real_name)
         try:
-            pkg_json = six.moves.urllib.request.urlopen(self.metadata_url).read().decode()
-        except six.moves.urllib.error.HTTPError as error:
+            pkg_json = urllib.request.urlopen(self.metadata_url).read().decode()
+        except urllib.error.HTTPError as error:
             print('ERROR:', error.getcode(), error.msg, file=sys.stderr)
             print('ERROR: Could not find package {pkg}.\n'
                   'Check syntax inside the python package index:\n'
                   'https://pypi.python.org/pypi/ '
                   .format(pkg=self.real_name))
             raise
-        except six.moves.urllib.error.URLError:
+        except urllib.error.URLError:
             print('ERROR: Could not find package {pkg}.\n'
                   'Check syntax inside the python package index:\n'
                   'https://pypi.python.org/pypi/ '
@@ -260,7 +254,7 @@ class BuildrootPackage():
                 'digests': None}]
             # In this case, we can't get the name of the downloaded file
             # from the pypi api, so we need to find it, this should work
-            urlpath = six.moves.urllib.parse.urlparse(
+            urlpath = urllib.parse.urlparse(
                 self.metadata['info']['download_url']).path
             # urlparse().path give something like
             # /path/to/file-version.tar.gz
@@ -272,8 +266,8 @@ class BuildrootPackage():
             try:
                 print('Downloading package {pkg} from {url}...'.format(
                     pkg=self.real_name, url=download_url['url']))
-                download = six.moves.urllib.request.urlopen(download_url['url'])
-            except six.moves.urllib.error.HTTPError as http_error:
+                download = urllib.request.urlopen(download_url['url'])
+            except urllib.error.HTTPError as http_error:
                 download = http_error
             else:
                 self.used_url = download_url
@@ -288,7 +282,7 @@ class BuildrootPackage():
             raise DownloadFailed('Failed to download package {pkg}: '
                                  'No source archive available'
                                  .format(pkg=self.real_name))
-        elif download.__class__ == six.moves.urllib.error.HTTPError:
+        elif download.__class__ == urllib.error.HTTPError:
             raise download
 
         self.filename = self.used_url['filename']
@@ -317,10 +311,7 @@ class BuildrootPackage():
         Keyword arguments:
         tmp_path -- directory where you want the package to be extracted
         """
-        if six.PY2:
-            as_file = StringIO.StringIO(self.as_string)
-        else:
-            as_file = io.BytesIO(self.as_string)
+        as_file = io.BytesIO(self.as_string)
         if self.filename[-3:] == 'zip':
             with zipfile.ZipFile(as_file) as as_zipfile:
                 tmp_pkg = os.path.join(tmp_path, self.buildroot_name)
@@ -797,12 +788,12 @@ def main():
             print('Fetching package', package.real_name)
             try:
                 package.fetch_package_info()
-            except (six.moves.urllib.error.URLError, six.moves.urllib.error.HTTPError):
+            except (urllib.error.URLError, urllib.error.HTTPError):
                 continue
 
             try:
                 package.download_package()
-            except six.moves.urllib.error.HTTPError as error:
+            except urllib.error.HTTPError as error:
                 print('Error: {code} {reason}'.format(code=error.code,
                                                       reason=error.reason))
                 print('Error downloading package :', package.buildroot_name)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
