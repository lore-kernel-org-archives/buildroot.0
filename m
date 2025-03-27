Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5805C3600B
	for <buildroot@archiver.kernel.org>; Thu, 27 Mar 2025 11:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D6386FC11;
	Thu, 27 Mar 2025 11:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AxoCSn56adHf; Thu, 27 Mar 2025 11:58:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 688FE617BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 688FE617BC;
	Thu, 27 Mar 2025 11:58:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC5B412A
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 11:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B862641E6F
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 11:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-vMIq73MEpo for <buildroot@buildroot.org>;
 Thu, 27 Mar 2025 11:58:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 46EBA41E67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46EBA41E67
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46EBA41E67
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 11:58:27 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.122.102]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3UUy-1tyK6l0hcY-00Gh9M; Thu, 27
 Mar 2025 12:58:25 +0100
To: buildroot@buildroot.org
Date: Thu, 27 Mar 2025 12:58:02 +0100
Message-ID: <20250327115804.3162110-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:CjdQ/lBMtAX1At9hLI3CsHWSHF0wIaOvZjJENXE+Fl7/Pn7GheQ
 eoSSH4nIBPu9ZTMWiHpbUgKKAzHa0Y4djc0V3HOTZcLs8oRXKsyF3SAGEuU05ia6GKjl3av
 F9p0qrs5WsDBpbZzVrJvn6JuP2PTlVfDLANLe6mOj/hkHG7lGAvS3oeVeS4WZ+CasrZOCHl
 TPTAgFHvR0Htc2MD/F0RQ==
UI-OutboundReport: notjunk:1;M01:P0:s+LEA7YKbf8=;9w3cZAzBwztgA+CgtE2mefjMs7D
 nOkYJEPC0noHhFOfQIzNllQX7hcd4Fsmx1UdCkcH0tgkoJZvrmFnAZQkzU8R6cqRRpmKGqmxe
 qUMNyoyUTs/xImnzs4GXrzsWPDzXRkGOfWsK7Jlp5KllbF8eiza+RRJA56D8mbHXQiL3SOTWr
 gEa32cJZRTUrbMiy4lBs9X/u8WI23nAXoupD6+9wCx8w9N0QmS0cdcr+7DOZc2lYMEaEMK50/
 0xk9+a5Qh/IJD4mUoMPwFbAqwaEB8zNWjPHli9bCUJqRBf21yfhIqtwDTjpaCKM4Pqr6ve10l
 68uZ79zjhcFask9nTjS0PhVBqUH2Fz6vTBXMhtz+NmxuLmlf8o2m67mdd2W8mOBpvRliZtO9G
 fkBNN0HB4h2p6gCNlpAdDUz7/4cxUOX4jie4JRd5n26ntDhliCcl9pPqMDoFw6O7zIEZNr+P1
 yzAbbh+E/JdKNjNbxAhTXJktcvgUcdLj/EfTlXnqybvdmmDrD/5WG7tzAKyfmIIErmYlxfthq
 +806raANF5Cr0VCodqqn34palJ+aQ5BF19mzpPAPmP0k5srEucwM6og/ohPIg9thhkrgYvDue
 07YDAhcp0t8HhKDCALxN4qn9PDdwMmovYxPrz3AWQg8KR9BuevzuxbPCVL5MiVI4lDvRbL25A
 EwJFH+ImfSaSPyaJR9kfKBk4P+hp70XBCx8a0/AXKmFGlbUFlUrxbp+mzwqS9Vb3N3HEQSzVY
 16PrBxWkJmUPth/jQuVFaWAsz5T3/R1aS9Wwpju3pqJM/AtofUp7gYuoIH6xhw2C2dQYXL9HS
 8iF9Z1qEZbh+JTCnuc7g2UlpclOf/NcH+EIx6H7I8Wm4ZHChzHyypC9JZYOV8rmHVx3wur7aQ
 wsikU4V/5+BYTPB74iI8nkSxjETt8OXwGLItEH3G0W8RJMZUR5gG+kCKxGRmy4YmRmc+pfBoM
 w2fKcu3J2wtU1UssVHVqxlNisnzg+pcTRbv8ypZR+Om9jGMvaJXBnCWXeWLVUuYW9nlSoIgS4
 VmtKRVGjl+lQIX4ztW15qaml6O5vBaoREd3zySg4ZvAhTCquMOfSKord2hfDGRUxS+xHp5R+I
 KG2na/ZEJOEdFBHS47fuyjkh/mW3Hg6cUM166e3AQh2qzZet3DpX3R9W3tlDgWp/74pDfu2Du
 WhxEz5Jk+Rsnpx2B9lgprjvRhnkR1D5h1vLgqmVwCQUJvaopCGQUF94CjAYKOVZWCY1oTLle1
 VobnbezEU9khwGwKuQYpdi7DdWSRM9GwSdaPt75HQi7gggATCP07fE32qeqKrPBxWeGZCs5wu
 AkFRFNiWhHaxV7/FUObhO+u3lumCj/9f69orO6xq7G4dM8u6hmdeJ6+Gk3SirjX0fEdlNFXS9
 H+3E9WgdHVHoPSTRE8ql8+A+f5WSeb+ms6RK4Vic73DH6jkLlSMxv3C7C8/FtFtGyymkKrIrX
 auhozjx/CsMUjh3eGWxqtrDTecKitSUj/OEWqT8+Q5xmE9NZK
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1743076705; x=1743681505; i=fiona.klute@gmx.de;
 bh=MySOe1GvBUS+gVH1XMPRQm7JyV65K8+rpZaH/7+mepM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=rrOI4tpOCWgqX69G9p8blkj6nSloJUsY/W6AyZZQ8gVNTV+zrZrq5nbIx0K0/CNv
 uUaxxwN8EiT7p7GdBLrgrgYtRY4U4O4GP2B7xjvdRQM27DX0L5dEWJwvdCfdWDc/o
 3+x4TTjchlQ7fcvi+j7z5BvyHJWJqHmPnrrewJtwjXMSKCsVH8wCgH2Gi0+KQCQ/+
 BEh2zq1uSPFgijJvKT/w38n4yOcUw74CEbP6Deu6sIXw62dyihCHm1z0XZVvhb9f9
 MS2uub3G1xh4uUoTOTFAo5aKxuD+C8agFjL68xpiiNmDcpB7t/5Y4QP188hTVJJVp
 YIzZTxCwecdQd09K5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=rrOI4tpO
Subject: [Buildroot] [PATCH 1/3] package/python-gobject: bump version to
 3.52.3
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Upstream changelog:
https://gitlab.gnome.org/GNOME/pygobject/-/blob/3.52.3/NEWS?ref_type=tags

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 1dbd40d038..e49c7ddd08 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from https://download.gnome.org/sources/pygobject/3.50/pygobject-3.50.0.sha256sum
-sha256  8d836e75b5a881d457ee1622cae4a32bcdba28a0ba562193adb3bbb472472212  pygobject-3.50.0.tar.xz
+# from https://download.gnome.org/sources/pygobject/3.52/pygobject-3.52.3.sha256sum
+sha256  00e427d291e957462a8fad659a9f9c8be776ff82a8b76bdf402f1eaeec086d82  pygobject-3.52.3.tar.gz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index 001f355844..3021937887 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOBJECT_VERSION_MAJOR = 3.50
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).0
-PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.xz
+PYTHON_GOBJECT_VERSION_MAJOR = 3.52
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).3
+PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.gz
 PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
 PYTHON_GOBJECT_LICENSE_FILES = COPYING
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
