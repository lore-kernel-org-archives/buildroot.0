Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10616C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66C2C405A2;
	Mon, 15 Jul 2024 10:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vrl9Qy8PotW3; Mon, 15 Jul 2024 10:14:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 784B9403AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 784B9403AA;
	Mon, 15 Jul 2024 10:14:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DE591BF3FF
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17A2540327
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPyzHMB1XMpo for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81C1B4039B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81C1B4039B
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CED186B29; Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 12:13:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34857f644b594b1c6f9abc1c24d3045446afd46c
X-Git-Newrev: b5cdce85e8dc27f192634556556ac56dadea3433
X-Patchwork-Hint: ignore
Message-Id: <20240715101423.6CED186B29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webengine-chromium: fix
 another Python 3.x issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5cdce85e8dc27f192634556556ac56dadea3433
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport an upstream Chromium patch that fixes:

FAILED: gen/services/metrics/public/cpp/ukm_builders.cc gen/services/metrics/public/cpp/ukm_builders.h gen/services/metrics/public/cpp/ukm_decode.cc gen/services/metrics/public/cpp/ukm_decode.h
/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/host-bin/python ../../3rdparty/chromium/tools/metrics/ukm/gen_builders.py --input ../../3rdparty/chromium/tools/metrics/ukm/ukm.xml --output gen/services/metrics/public/cpp
/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/tools/metrics/ukm/../common/models.py:247: SyntaxWarning: invalid escape sequence '\w'
  """A complex node type that has attributes or other nodes as children.
Traceback (most recent call last):
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/core/release/../../3rdparty/chromium/tools/metrics/ukm/gen_builders.py", line 59, in <module>
    sys.exit(main(sys.argv))
             ^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/core/release/../../3rdparty/chromium/tools/metrics/ukm/gen_builders.py", line 27, in main
    data = ReadFilteredData(args.input)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/core/release/../../3rdparty/chromium/tools/metrics/ukm/gen_builders.py", line 48, in ReadFilteredData
    data = ukm_model.UKM_XML_TYPE.Parse(ukm_file.read())
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/tools/metrics/ukm/../common/models.py", line 439, in Parse
    return self._ParseMinidom(input_file)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/tools/metrics/ukm/../common/models.py", line 418, in _ParseMinidom
    return self.root_type.Unmarshall(root)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/tools/metrics/ukm/../common/models.py", line 324, in Unmarshall
    child.node_type.Unmarshall(n) for n in nodes]
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/tools/metrics/ukm/../common/models.py", line 302, in Unmarshall
    if not re.match(attr_re, attr_val):
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/host/lib/python3.12/re/__init__.py", line 167, in match
    return _compile(pattern, flags).match(string)
           ^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/host/lib/python3.12/re/__init__.py", line 307, in _compile
    p = _compiler.compile(pattern, flags)
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/host/lib/python3.12/re/_compiler.py", line 745, in compile
    p = _parser.parse(p, flags)
        ^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/host/lib/python3.12/re/_parser.py", line 979, in parse
    p = _parse_sub(source, state, flags & SRE_FLAG_VERBOSE, 0)
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/host/lib/python3.12/re/_parser.py", line 460, in _parse_sub
    itemsappend(_parse(source, state, verbose, nested + 1,
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/host/lib/python3.12/re/_parser.py", line 840, in _parse
    raise source.error('global flags not at the start '
re.error: global flags not at the start of the expression at position 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0004-Migrate-presubmit-to-python3.patch        | 132 +++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/package/qt5/qt5webengine-chromium/0004-Migrate-presubmit-to-python3.patch b/package/qt5/qt5webengine-chromium/0004-Migrate-presubmit-to-python3.patch
new file mode 100644
index 0000000000..9314e30c5c
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium/0004-Migrate-presubmit-to-python3.patch
@@ -0,0 +1,132 @@
+From 71d96b9be632b5231b28277d9e72f6a6c5308e24 Mon Sep 17 00:00:00 2001
+From: Dan Harrington <harringtond@chromium.org>
+Date: Fri, 4 Jun 2021 16:46:25 +0000
+Subject: [PATCH] Migrate presubmit to python3
+
+Fixed a couple warnings I found when running the unit
+tests in python3.
+
+Bug: 1212110
+Change-Id: I3d1b5859b5c517ad5eea30cb816fad0389715f73
+Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/2934203
+Reviewed-by: Jesse Doherty <jwd@chromium.org>
+Commit-Queue: Dan H <harringtond@chromium.org>
+Cr-Commit-Position: refs/heads/master@{#889331}
+Upstream: https://github.com/chromium/chromium/commit/f90f49df8db04dcb72f7ce0c4d0b2fe329bab00c
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ chromium/tools/metrics/ukm/PRESUBMIT.py       |  2 +
+ .../tools/metrics/ukm/gen_builders_test.py    |  4 +-
+ chromium/tools/metrics/ukm/ukm_model.py       | 56 +++++++++++--------
+ 3 files changed, 37 insertions(+), 25 deletions(-)
+
+diff --git a/chromium/tools/metrics/ukm/PRESUBMIT.py b/chromium/tools/metrics/ukm/PRESUBMIT.py
+index 28fab1cffb7..99b13be681b 100644
+--- a/chromium/tools/metrics/ukm/PRESUBMIT.py
++++ b/chromium/tools/metrics/ukm/PRESUBMIT.py
+@@ -8,6 +8,8 @@ See http://dev.chromium.org/developers/how-tos/depottools/presubmit-scripts
+ for more details on the presubmit API built into gcl.
+ """
+ 
++USE_PYTHON3 = True
++
+ UKM_XML = 'ukm.xml'
+ 
+ 
+diff --git a/chromium/tools/metrics/ukm/gen_builders_test.py b/chromium/tools/metrics/ukm/gen_builders_test.py
+index 1ca15e52c9a..0015320a524 100755
+--- a/chromium/tools/metrics/ukm/gen_builders_test.py
++++ b/chromium/tools/metrics/ukm/gen_builders_test.py
+@@ -25,8 +25,8 @@ class GenBuildersTest(unittest.TestCase):
+ 
+   def testGenerateCode(self):
+     relpath = '.'
+-    data = ukm_model.UKM_XML_TYPE.Parse(
+-        open('../../tools/metrics/ukm/ukm.xml').read())
++    with open('../../tools/metrics/ukm/ukm.xml') as f:
++      data = ukm_model.UKM_XML_TYPE.Parse(f.read())
+     event = data[ukm_model._EVENT_TYPE.tag][0]
+     metric = event[ukm_model._METRIC_TYPE.tag][0]
+     self.assertIsNotNone(event)
+diff --git a/chromium/tools/metrics/ukm/ukm_model.py b/chromium/tools/metrics/ukm/ukm_model.py
+index ec24dd57360..b36899db189 100644
+--- a/chromium/tools/metrics/ukm/ukm_model.py
++++ b/chromium/tools/metrics/ukm/ukm_model.py
+@@ -39,15 +39,16 @@ _INDEX_TYPE = models.ObjectNodeType(
+     ],
+     single_line=True)
+ 
+-_STATISTICS_TYPE =  models.ObjectNodeType(
++_STATISTICS_TYPE = models.ObjectNodeType(
+     'statistics',
+     attributes=[
+-      ('export', str, r'^(?i)(|true|false)$'),
++        ('export', str, r'(?i)^(|true|false)$'),
+     ],
+     children=[
+         models.ChildType(_QUANTILES_TYPE.tag, _QUANTILES_TYPE, multiple=False),
+-        models.ChildType(
+-            _ENUMERATION_TYPE.tag, _ENUMERATION_TYPE, multiple=False),
++        models.ChildType(_ENUMERATION_TYPE.tag,
++                         _ENUMERATION_TYPE,
++                         multiple=False),
+     ])
+ 
+ _HISTORY_TYPE =  models.ObjectNodeType(
+@@ -90,25 +91,34 @@ _METRIC_TYPE =  models.ObjectNodeType(
+             _AGGREGATION_TYPE.tag, _AGGREGATION_TYPE, multiple=True),
+     ])
+ 
+-_EVENT_TYPE =  models.ObjectNodeType(
+-    'event',
+-    attributes=[
+-      ('name', str, r'^[A-Za-z0-9.]+$'),
+-      ('singular', str, r'^(?i)(|true|false)$'),
+-    ],
+-    alphabetization=[
+-        (_OBSOLETE_TYPE.tag, _KEEP_ORDER),
+-        (_OWNER_TYPE.tag, _KEEP_ORDER),
+-        (_SUMMARY_TYPE.tag, _KEEP_ORDER),
+-        (_METRIC_TYPE.tag, _LOWERCASE_FN('name')),
+-    ],
+-    extra_newlines=(1, 1, 1),
+-    children=[
+-        models.ChildType(_OBSOLETE_TYPE.tag, _OBSOLETE_TYPE, multiple=False),
+-        models.ChildType(_OWNER_TYPE.tag, _OWNER_TYPE, multiple=True),
+-        models.ChildType(_SUMMARY_TYPE.tag, _SUMMARY_TYPE, multiple=False),
+-        models.ChildType(_METRIC_TYPE.tag, _METRIC_TYPE, multiple=True),
+-    ])
++_EVENT_TYPE = models.ObjectNodeType('event',
++                                    attributes=[
++                                        ('name', str, r'^[A-Za-z0-9.]+$'),
++                                        ('singular', str,
++                                         r'(?i)^(|true|false)$'),
++                                    ],
++                                    alphabetization=[
++                                        (_OBSOLETE_TYPE.tag, _KEEP_ORDER),
++                                        (_OWNER_TYPE.tag, _KEEP_ORDER),
++                                        (_SUMMARY_TYPE.tag, _KEEP_ORDER),
++                                        (_METRIC_TYPE.tag,
++                                         _LOWERCASE_FN('name')),
++                                    ],
++                                    extra_newlines=(1, 1, 1),
++                                    children=[
++                                        models.ChildType(_OBSOLETE_TYPE.tag,
++                                                         _OBSOLETE_TYPE,
++                                                         multiple=False),
++                                        models.ChildType(_OWNER_TYPE.tag,
++                                                         _OWNER_TYPE,
++                                                         multiple=True),
++                                        models.ChildType(_SUMMARY_TYPE.tag,
++                                                         _SUMMARY_TYPE,
++                                                         multiple=False),
++                                        models.ChildType(_METRIC_TYPE.tag,
++                                                         _METRIC_TYPE,
++                                                         multiple=True),
++                                    ])
+ 
+ _UKM_CONFIGURATION_TYPE = models.ObjectNodeType(
+     'ukm-configuration',
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
