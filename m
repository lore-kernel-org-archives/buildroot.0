Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CE9C3DA5E
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6839B405B7;
	Mon, 15 Jul 2024 10:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYzDxWeXpQnx; Mon, 15 Jul 2024 10:14:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33675405DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33675405DD;
	Mon, 15 Jul 2024 10:14:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 294541BF97C
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17319405C1
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qy286FUqL06Y for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4D0B404F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4D0B404F3
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A61A86C44; Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 12:13:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5cdce85e8dc27f192634556556ac56dadea3433
X-Git-Newrev: 98dc9a933e28e2a83990b67cacd4ce88f5f4e9b6
X-Patchwork-Hint: ignore
Message-Id: <20240715101423.8A61A86C44@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/qt5/qt5webengine-chromium-catapult: bump version to fix build issue
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=98dc9a933e28e2a83990b67cacd4ce88f5f4e9b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have the qt5webengine-chromium-catapult package to override the
catapult code from qtwebengine-chromium with a newer version. It was
initially introduced because the catapult code in qtwebengine-chromium
was not Python 3.x compatible.

Turns out that the catapult version we're using exhibits new build
issues related to Python 3.12 (and perhaps others), so let's update it
again to fix:

FAILED: gen/content/browser/tracing/about_tracing.js gen/content/browser/tracing/about_tracing.html
/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/host-bin/python ../../3rdparty/chromium/third_party/catapult/tracing/bin/generate_about_tracing_contents --outdir gen/content/browser/tracing
/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/third_party/catapult/common/py_vulcanize/py_vulcanize/html_generation_controller.py:21: SyntaxWarning: invalid escape sequence '\('
  if re.search('url\(.+\)', contents):
/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/third_party/catapult/common/py_vulcanize/py_vulcanize/style_sheet.py:63: SyntaxWarning: invalid escape sequence '\('
  return re.sub('url\((?P<quote>"|\'|)(?P<url>[^"\'()]*)(?P=quote)\)',
/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/third_party/catapult/common/py_vulcanize/py_vulcanize/style_sheet.py:75: SyntaxWarning: invalid escape sequence '\('
  'url\((?:["|\']?)([^"\'()]*)(?:["|\']?)\)',
/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/third_party/catapult/common/py_vulcanize/py_vulcanize/js_utils.py:7: SyntaxWarning: invalid escape sequence '\/'
  return js.replace('</script>', '<\/script>')
/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/third_party/catapult/common/py_vulcanize/py_vulcanize/parse_html_deps.py:302: SyntaxWarning: invalid escape sequence '\/'
  raise Exception('Escape script tags with <\/script>')
Traceback (most recent call last):
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/third_party/catapult/common/py_vulcanize/py_vulcanize/html_module.py", line 28, in Parse
    parser_results = parse_html_deps.HTMLModuleParser().Parse(self.contents)
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/third_party/catapult/common/py_vulcanize/py_vulcanize/parse_html_deps.py", line 304, in Parse
    return HTMLModuleParserResults(html)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/third_party/catapult/common/py_vulcanize/py_vulcanize/parse_html_deps.py", line 170, in __init__
    self._soup = bs4.BeautifulSoup(html, 'html5lib')
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/third_party/catapult/third_party/beautifulsoup4-4.9.3/py3k/bs4/__init__.py", line 243, in __init__
    raise FeatureNotFound(
bs4.FeatureNotFound: Couldn't find a tree builder with the features you requested: html5lib. Do you need to install a parser library?

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/core/release/../../3rdparty/chromium/third_party/catapult/tracing/bin/generate_about_tracing_contents", line 14, in <module>
    sys.exit(generate_about_tracing_contents.Main(sys.argv[1:]))
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/third_party/catapult/tracing/tracing_build/generate_about_tracing_contents.py", line 32, in Main
    load_sequence = vulcanizer.CalcLoadSequenceForModuleNames(names)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/third_party/catapult/common/py_vulcanize/py_vulcanize/project.py", line 146, in CalcLoadSequenceForModuleNames
    modules = [self.loader.LoadModule(module_name=name,
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/third_party/catapult/common/py_vulcanize/py_vulcanize/resource_loader.py", line 149, in LoadModule
    m.Parse(excluded_scripts)
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/third_party/catapult/common/py_vulcanize/py_vulcanize/html_module.py", line 30, in Parse
    raise Exception('While parsing %s: %s' % (self.name, str(ex)))
Exception: While parsing tracing.ui.extras.about_tracing.about_tracing: Couldn't find a tree builder with the features you requested: html5lib. Do you need to install a parser library?

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash  | 2 +-
 .../qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
index 5a99c52e1f..18bee4f58f 100644
--- a/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
+++ b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cb1b81c3d9612185b9e981b7329cd49ef057d1afb6de84b88a2af58154d3a0ca  qt5webengine-chromium-catapult-5eedfe23148a234211ba477f76fc2ea2e8529189-git4.tar.gz
+sha256  3dfcab349fd82c854b72fcc3f64e2e08f9a0d72c712a0d86a30d3a9994f244ba  qt5webengine-chromium-catapult-7534569f99827c0ed4df818254ba7daca4606bca-git4.tar.gz
 sha256  f0df289ba9d03d857ad1c2f5918861376b1510b71588ffc60eff5c7a7bfedb09  LICENSE
diff --git a/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk
index 5d0db1e790..bf577873ae 100644
--- a/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk
+++ b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WEBENGINE_CHROMIUM_CATAPULT_VERSION = 5eedfe23148a234211ba477f76fc2ea2e8529189
+QT5WEBENGINE_CHROMIUM_CATAPULT_VERSION = 7534569f99827c0ed4df818254ba7daca4606bca
 QT5WEBENGINE_CHROMIUM_CATAPULT_SITE = https://chromium.googlesource.com/catapult.git
 QT5WEBENGINE_CHROMIUM_CATAPULT_SITE_METHOD = git
 QT5WEBENGINE_CHROMIUM_CATAPULT_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
