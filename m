Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675A0C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C625B405ED;
	Mon, 15 Jul 2024 10:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pyBobryjDNep; Mon, 15 Jul 2024 10:14:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 169F240602
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 169F240602;
	Mon, 15 Jul 2024 10:14:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B24E61BF3FF
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12ED080D58
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNMUS1pN1Iru for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03B7380D8D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03B7380D8D
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1CA686C43; Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 12:13:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efc5e6ad52150d2724867df672677eb668eb4807
X-Git-Newrev: 649101f6e65c5345e97229d31f19ea1f8e7b16c4
X-Patchwork-Hint: ignore
Message-Id: <20240715101423.F1CA686C43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webengine-chromium: fix
 Python 3.12 issue in protobuf copy
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

commit: https://git.buildroot.net/buildroot/commit/?id=649101f6e65c5345e97229d31f19ea1f8e7b16c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

Traceback (most recent call last):
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/core/release/../../3rdparty/chromium/components/resources/ssl/ssl_error_assistant/gen_ssl_error_assistant_proto.py", line 71, in <module>
    sys.exit(main())
             ^^^^^^
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/core/release/../../3rdparty/chromium/components/resources/ssl/ssl_error_assistant/gen_ssl_error_assistant_proto.py", line 68, in main
    return SSLErrorAssistantProtoGenerator().Run()
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/components/resources/protobufs/binary_proto_generator.py", line 200, in Run
    self._ImportProtoModules(opts.path)
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/components/resources/protobufs/binary_proto_generator.py", line 107, in _ImportProtoModules
    self.ImportProtoModule()
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/core/release/../../3rdparty/chromium/components/resources/ssl/ssl_error_assistant/gen_ssl_error_assistant_proto.py", line 33, in ImportProtoModule
    import ssl_error_assistant_pb2
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/core/release/pyproto/components/security_interstitials/content/ssl_error_assistant_pb2.py", line 9, in <module>
    from google.protobuf import reflection as _reflection
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/core/release/pyproto/google/protobuf/reflection.py", line 51, in <module>
    from google.protobuf import message_factory
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/core/release/pyproto/google/protobuf/message_factory.py", line 49, in <module>
    from google.protobuf.internal import python_message as message_impl
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/core/release/pyproto/google/protobuf/internal/python_message.py", line 59, in <module>
    from six.moves import range
ModuleNotFoundError: No module named 'six.moves'

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...thon-google-protobuf-internal-python_mess.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/qt5/qt5webengine-chromium/0008-protobuf-python-google-protobuf-internal-python_mess.patch b/package/qt5/qt5webengine-chromium/0008-protobuf-python-google-protobuf-internal-python_mess.patch
new file mode 100644
index 0000000000..810e71475a
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium/0008-protobuf-python-google-protobuf-internal-python_mess.patch
@@ -0,0 +1,51 @@
+From f01ebcd09a0b43589671fc8573bd0c00781c618e Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 13 Jul 2024 17:34:13 +0200
+Subject: [PATCH] protobuf/python/google/protobuf/internal/python_message.py:
+ fix Python 3.12 compatibility
+
+This is a part of the larger commit
+29527fb6f77bdf5f2393f2327fec590c6deab27f from Chromium, which updates
+their internal copy of protobuf to 3.20.0.
+
+Upstream: https://github.com/chromium/chromium/commit/29527fb6f77bdf5f2393f2327fec590c6deab27f (part of)
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../python/google/protobuf/internal/python_message.py      | 7 ++-----
+ 1 file changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/chromium/third_party/protobuf/python/google/protobuf/internal/python_message.py b/chromium/third_party/protobuf/python/google/protobuf/internal/python_message.py
+index 803ae848493..a1954ce88c9 100755
+--- a/chromium/third_party/protobuf/python/google/protobuf/internal/python_message.py
++++ b/chromium/third_party/protobuf/python/google/protobuf/internal/python_message.py
+@@ -55,9 +55,6 @@ import struct
+ import sys
+ import weakref
+ 
+-import six
+-from six.moves import range
+-
+ # We use "as" to avoid name collisions with variables.
+ from google.protobuf.internal import api_implementation
+ from google.protobuf.internal import containers
+@@ -467,7 +464,7 @@ def _ReraiseTypeErrorWithFieldName(message_name, field_name):
+     exc = TypeError('%s for field %s.%s' % (str(exc), message_name, field_name))
+ 
+   # re-raise possibly-amended exception with original traceback:
+-  six.reraise(type(exc), exc, sys.exc_info()[2])
++  raise exc.with_traceback(sys.exc_info()[2])
+ 
+ 
+ def _AddInitMethod(message_descriptor, cls):
+@@ -480,7 +477,7 @@ def _AddInitMethod(message_descriptor, cls):
+     enum_type with the same name.  If the value is not a string, it's
+     returned as-is.  (No conversion or bounds-checking is done.)
+     """
+-    if isinstance(value, six.string_types):
++    if isinstance(value, str):
+       try:
+         return enum_type.values_by_name[value].number
+       except KeyError:
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
