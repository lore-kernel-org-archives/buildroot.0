Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547CAC19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 16:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA3204051C;
	Sun,  7 Aug 2022 16:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA3204051C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9wKnrJ42P9q; Sun,  7 Aug 2022 16:08:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34504402D7;
	Sun,  7 Aug 2022 16:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34504402D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A5541BF681
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 16:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3133C81317
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 16:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3133C81317
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s56LboA7As9y for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 16:08:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 803F6812FD
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 16:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 803F6812FD
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 002BB86F85; Sun,  7 Aug 2022 15:54:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Aug 2022 18:08:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c99545867a58b96d7b7525a7c10ff78940255477
X-Git-Newrev: efa5ff1489625eb862b1d7d161a169514cc9c881
X-Patchwork-Hint: ignore
Message-Id: <20220807155431.002BB86F85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-autobahn: add missing
 subpackages
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

commit: https://git.buildroot.net/buildroot/commit/?id=efa5ff1489625eb862b1d7d161a169514cc9c881
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds options for python-autobahn subpackages that will be
needed by python-crossbar.

Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-autobahn/Config.in | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
index 627bcd73e5..dfb517ae4b 100644
--- a/package/python-autobahn/Config.in
+++ b/package/python-autobahn/Config.in
@@ -10,3 +10,42 @@ config BR2_PACKAGE_PYTHON_AUTOBAHN
 	  framework.
 
 	  https://pypi.python.org/pypi/autobahn
+
+if BR2_PACKAGE_PYTHON_AUTOBAHN
+
+config BR2_PACKAGE_PYTHON_AUTOBAHN_ACCELERATE
+	bool "C-based WebSocket acceleration"
+	select BR2_PACKAGE_PYTHON_WSACCEL # runtime
+
+config BR2_PACKAGE_PYTHON_AUTOBAHN_COMPRESS
+	bool "Non-standard WebSocket compression support"
+	select BR2_PACKAGE_PYTHON_SNAPPY # runtime
+
+config BR2_PACKAGE_PYTHON_AUTOBAHN_ENCRYPTION
+	bool "TLS and WAMP-cryptosign encryption/authentication support"
+	select BR2_PACKAGE_PYTHON_PYNACL # runtime
+	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
+	select BR2_PACKAGE_PYTHON_PYQRCODE # runtime
+	select BR2_PACKAGE_PYTHON_PYTRIE # runtime
+	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
+
+config BR2_PACKAGE_PYTHON_AUTOBAHN_SCRAM
+	bool "WAMP-SCRAM authentication support"
+	select BR2_PACKAGE_PYTHON_ARGON2_CFFI # runtime
+	select BR2_PACKAGE_PYTHON_PASSLIB # runtime
+
+config BR2_PACKAGE_PYTHON_AUTOBAHN_SERIALIZATION
+	bool "Accelerated JSON, MessagePack, CBOR, UBJSON, and FlatBuffers serialization support"
+	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
+	select BR2_PACKAGE_PYTHON_FLATBUFFERS # runtime
+	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
+	select BR2_PACKAGE_PYTHON_UBJSON # runtime
+	select BR2_PACKAGE_PYTHON_UJSON # runtime
+
+config BR2_PACKAGE_PYTHON_AUTOBAHN_TWISTED
+	bool "Twisted support"
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_TWISTED # runtime
+	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
+
+endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
