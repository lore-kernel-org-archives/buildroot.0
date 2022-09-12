Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06517ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 07:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85DDE40235;
	Mon, 12 Sep 2022 07:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85DDE40235
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u1IBaeLwgqVN; Mon, 12 Sep 2022 07:24:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A98E401D2;
	Mon, 12 Sep 2022 07:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A98E401D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C95331BF2B4
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 07:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB8296080A
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 07:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB8296080A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qfWMCUc0kuJt for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 07:24:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE59B60806
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE59B60806
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 07:24:29 +0000 (UTC)
Received: from opfedar06.francetelecom.fr (unknown [xx.xx.xx.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar25.francetelecom.fr (ESMTP service) with ESMTPS id 4MQylb54Fnz8syd; 
 Mon, 12 Sep 2022 09:24:27 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Mon, 12 Sep 2022 09:24:25 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 12 Sep 2022 09:24:25 +0200
Message-ID: <32299_1662967467_631EDEAB_32299_495_1_0abc443c757568e6a02f5bc2bba7d9a71a81c0ce.1662967465.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX202.corporate.adroot.infra.ftgroup (10.115.26.7)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1662967467;
 bh=XjuDqDZEKPyyRlVZhuq1bCTUenxHuBe3XWmfRxhf5BM=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=hgzfh8hs5EhridPI1iiB7T9g5d8X8NG6Ju1RCKnOBycQnQTohPOb++CSzRurbesJM
 dK1nqRx5d3gDQCdP6bKUzYyD4Rta683U3SKiwnsTkEeTSR/k1J5bqM3krYUZt8POuh
 GGmprGpar717UFzf4mROHrfFKK68apC8c89wzziilZ5eyYpTOO+SudISVI4U+Is4b4
 Wckip6n3DOhG00zmqmOLYMT/dzVypW2uDXbizMMRipuQ+UvSJijjBK46CIojB1zOLY
 SQhFqbTszkl3yJzyV9FsGrkyjkJKvnm5rF/L2/cz3+3cadaChM4qTdvtphxrifuxh3
 VYMZxY2iTbnZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=hgzfh8hs
Subject: [Buildroot] [PATCH] package/python-paho-mqtt: fix merge from next
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
Cc: "Yann E. MORIN" <yann.morin@orange.com>,
 Marcus Hoffmann <marcus.hoffmann@othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

In master, we backported a patch from upstream, to fix running on python
3.10. But at the same time, on next, we bumped the version, where that
change was present.

Now, next has been merged back into master, and the patch obviously does
not apply anymore.

Remove the patch, it is no longer needed.

Fixes:
    http://autobuild.buildroot.net/results/b76/b76b1ab80bdf1b7731731f2f561c5b64e9716513/
    http://autobuild.buildroot.net/results/f9e/f9e07621d345a9bca0be1b0a53bdb21e363d2e90/
    ...

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-fix-publish-for-python-3-10.patch    | 37 -------------------
 1 file changed, 37 deletions(-)
 delete mode 100644 package/python-paho-mqtt/0001-fix-publish-for-python-3-10.patch

diff --git a/package/python-paho-mqtt/0001-fix-publish-for-python-3-10.patch b/package/python-paho-mqtt/0001-fix-publish-for-python-3-10.patch
deleted file mode 100644
index aad6b5d723..0000000000
--- a/package/python-paho-mqtt/0001-fix-publish-for-python-3-10.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From e1c45570f61f9d6b28f8604c8a8cd6dd94f959ed Mon Sep 17 00:00:00 2001
-From: Brishen Hawkins <brishen.hawkins@gmail.com>
-Date: Tue, 9 Jun 2020 00:18:39 -0600
-Subject: [PATCH] Fix for Python 3.9 moving Iterable to collections.abc
-
-Signed-off-by: Brishen Hawkins <brishen.hawkins@gmail.com>
-
-Backported from: e1c45570f61f9d6b28f8604c8a8cd6dd94f959ed
-Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
----
- src/paho/mqtt/publish.py | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/paho/mqtt/publish.py b/src/paho/mqtt/publish.py
-index f9f1986e..dcb34ff1 100644
---- a/src/paho/mqtt/publish.py
-+++ b/src/paho/mqtt/publish.py
-@@ -21,6 +21,10 @@
- from __future__ import absolute_import
- 
- import collections
-+try:
-+    from collections.abc import Iterable
-+except ImportError:
-+    from collections import Iterable
- 
- from . import client as paho
- from .. import mqtt
-@@ -124,7 +128,7 @@ def multiple(msgs, hostname="localhost", port=1883, client_id="", keepalive=60,
-     proxy_args: a dictionary that will be given to the client.
-     """
- 
--    if not isinstance(msgs, collections.Iterable):
-+    if not isinstance(msgs, Iterable):
-         raise TypeError('msgs must be an iterable')
- 
-     client = paho.Client(client_id=client_id, userdata=collections.deque(msgs),
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
