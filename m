Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9A0ECAAA4
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 17:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C2F540242;
	Mon, 29 Aug 2022 17:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C2F540242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JgpDqx8OUjoQ; Mon, 29 Aug 2022 17:38:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DE4040227;
	Mon, 29 Aug 2022 17:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DE4040227
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F30C21BF280
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 17:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB74940227
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 17:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB74940227
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5p_WcY0A4S0S for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 17:38:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E210A40189
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E210A40189
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 17:37:59 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4MGd1v4fp8z9sxK;
 Mon, 29 Aug 2022 19:37:55 +0200 (CEST)
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 19:37:54 +0200
Message-Id: <20220829173754.214890-1-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4MGd1v4fp8z9sxK
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1661794675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=x3cBrmuPVEMo240HS8beVOfEGtbMduI+Ol5jBp1i3o0=;
 b=YDVkWZqELcQyv+fgCzSsuJ6RlBwNl5CH+O005y/z74cbhlL+KBQxI8gg9HpVIkNuaXFKfc
 ZAUk1nJEaGHw5tzowNu45CL3RsXnyiezmjBTP3OtvN7Wd2I4pw6OodEFDRVv3kfXjTcZDQ
 PAX5ewXBBv2dsZA+xj/SRWK+erkqbWqKM8/q3Cj/AnDP1gtQwEqRw7ScnjsRln37sqkzmK
 EuO1i9bLp4ZWGUvLy6DFrT8tcd7TOaF7o+5VniinUVzR4z12109fAwjNCH6ue0h0tLnVJv
 uOu4nrtKwcIQjnxYjsfoF7Q+oqhLSOv7jLXPl+kC3VjhF5LWNQpDcKYjCRatBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=YDVkWZqE
Subject: [Buildroot] [PATCH 1/1] package/python-paho-mqtt: fix package for
 python 3.10
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
Cc: Davide Viti <zinosat@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following error on calling mqtt.publish():

  File "/usr/lib/python3.10/site-packages/paho/mqtt/publish.py", line 222, in single
    multiple([msg], hostname, port, client_id, keepalive, will, auth, tls,
  File "/usr/lib/python3.10/site-packages/paho/mqtt/publish.py", line 126, in multiple
    if not isinstance(msgs, collections.Iterable):
AttributeError: module 'collections' has no attribute 'Iterable'

Backported from https://github.com/eclipse/paho.mqtt.python/pull/497/

This was deprecated in python 3.9 and stopped working in python 3.10

Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
---
 .../0001-fix-publish-for-python-3-10.patch    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/python-paho-mqtt/0001-fix-publish-for-python-3-10.patch

diff --git a/package/python-paho-mqtt/0001-fix-publish-for-python-3-10.patch b/package/python-paho-mqtt/0001-fix-publish-for-python-3-10.patch
new file mode 100644
index 0000000000..aad6b5d723
--- /dev/null
+++ b/package/python-paho-mqtt/0001-fix-publish-for-python-3-10.patch
@@ -0,0 +1,37 @@
+From e1c45570f61f9d6b28f8604c8a8cd6dd94f959ed Mon Sep 17 00:00:00 2001
+From: Brishen Hawkins <brishen.hawkins@gmail.com>
+Date: Tue, 9 Jun 2020 00:18:39 -0600
+Subject: [PATCH] Fix for Python 3.9 moving Iterable to collections.abc
+
+Signed-off-by: Brishen Hawkins <brishen.hawkins@gmail.com>
+
+Backported from: e1c45570f61f9d6b28f8604c8a8cd6dd94f959ed
+Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
+---
+ src/paho/mqtt/publish.py | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/paho/mqtt/publish.py b/src/paho/mqtt/publish.py
+index f9f1986e..dcb34ff1 100644
+--- a/src/paho/mqtt/publish.py
++++ b/src/paho/mqtt/publish.py
+@@ -21,6 +21,10 @@
+ from __future__ import absolute_import
+ 
+ import collections
++try:
++    from collections.abc import Iterable
++except ImportError:
++    from collections import Iterable
+ 
+ from . import client as paho
+ from .. import mqtt
+@@ -124,7 +128,7 @@ def multiple(msgs, hostname="localhost", port=1883, client_id="", keepalive=60,
+     proxy_args: a dictionary that will be given to the client.
+     """
+ 
+-    if not isinstance(msgs, collections.Iterable):
++    if not isinstance(msgs, Iterable):
+         raise TypeError('msgs must be an iterable')
+ 
+     client = paho.Client(client_id=client_id, userdata=collections.deque(msgs),
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
