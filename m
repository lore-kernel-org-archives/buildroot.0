Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE2BC021A4
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 12:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF83B60D6D;
	Mon, 24 Feb 2025 12:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhGpI13xNw76; Mon, 24 Feb 2025 12:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C53D60D69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C53D60D69;
	Mon, 24 Feb 2025 12:36:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F44C943
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 12:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4F5040181
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 12:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_QTIE3lR4pU for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 12:36:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 35A984012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35A984012F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35A984012F
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 12:36:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.124.97]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBm1e-1taPgz0Iiy-00EuVL; Mon, 24
 Feb 2025 13:36:33 +0100
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Mon, 24 Feb 2025 13:36:18 +0100
Message-ID: <20250224123618.2764327-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:S957MqBkUw9EefjSYVKVhTGSMO8xL+/mHh5c4c5KeDPuEZefVvy
 Ax4o1jRPlxv9R4+GZvAJxxzzZwj3hie6aNWCUDAjN9vwA+dnlTSBHl2gM06ojajGhBgksqj
 lM9WPXD1/rziDsgEZSzzzv1h8xE/CVNlC04aMx1TyFH5nmq0AMSm8pb/mXIj6jiAdDCCsKz
 TQk3hif5wWsg7qVL7DqeQ==
UI-OutboundReport: notjunk:1;M01:P0:XnRxJXKILyk=;eC42tVlvlJ5tViUlbogECZ1ZJUV
 cMNC9uUmIW4JWWnBGpUqVY3KxONXW5l+OcyjSNHWrOXeSFMGakpJkcIwVOq9azKjCIzkuwVII
 o4fetKBJyiIu/uCHxj5mMtUglTdYgl0duMIw8t84SztWYBlzO8FHtZe1cJ+kuR0lmDNx8yXmF
 aWBSCvIig2H/9PZ9ZNJqQr8tVzuax7EuOhYJnEs3LMxAg10EBWD1EnbzYh+OqRzylzUMKJClR
 zxQ33RrIKZB3VO491lp3uTBxds63X4BI2aZX8qvYf98RylPCYZvkAjfdIXlmAF4NYKiYminOo
 RGJL8HTAsWEZRzJLvdraQJPD+cqraY3o1lamCG0KUhHy6GZaEAyHYrZi0xR/h2O1Wsk23+/o9
 ILP1LA9AlVhCCYEw4F9O9EE/HrO83cbY93NIDFhtYZ7BPT1d4r3uf5mxut0GdsUwR9+ZfD3ub
 0IzVqrX0K5AEqOgT8UB9l3maanxCLe6SrW4sDJRASLsq5qdPmzO9cLGFGhBDekLfB3HQ4wCUg
 4uluYurOGllQ25RX35hRjOhqjdyjN/vsB3VT9X6Jwa/kdo9Q3hr4m0TuhQw0ojIFphws6tyAx
 1Ge/XTdCgv4ake5w41R8Iq+pxO8VibaXUIAUJiiFFpMB27ev7uHpkhBdpX6CsJF2mvg9pBaFj
 CJ3Wo8nM9FHNMT+haHqIbdD+Vk6856rXBqqsKXNwSl8bRfly55d5lOHj5mgSlwi4PM/EPqhyT
 izkHy2VmNyQ6wkXaUazefo0UffyN/D6kAqldkl7gQMP385Up6tCsM1bX9ma3drS5o4T6o3dfN
 YlSAAzIfSxCMxh23sAX4ADhTMLlntRWdehfxBBPWz/NinJK/+jOy9fSxhWiaEdbwVZ77wUMB8
 ecR0kPeRDrk0cNUz0Wo2KfOp06kGo7sLn/f8Xis8qcqnqctIm6LCyNvZRLozJqIcZB9sApriv
 cL1asZ80Crb93uZQNDiGIzuxfQYhsNmQYF1z5Cu7Kez6Phv8Jpdomiym7BEy7kbyWLbHiXgWn
 EE6Hgq54jLYzPBWpAkdrOOf+xqkSBXq1fCZfcg5XnxKFZ9syJvPyC9oVOhjFETqT3zsYojkMO
 idu4tSRJOFMuLKpAW4jhusU/wRwjIlLk2+4aZlMXDw1hDNDLNiPiTPvNI1OV0pn80yIzxZlte
 /OAIVZf79RgfoPH2Xg1pzEj7y+EtN9TP1PFIfczuzcqkdJl5lA7x8Jyyw991oyR+APU6Yp62r
 IUHOqV+J/OqSNtT7ARZ40aSxCnjr/FI2A4MmjxviQiRyAue1oexSwP7l56+ePuY578c77KeKR
 2A0shEpjYe3WUOYR/lHuCwMkoahc2tz5JrRSUG0Fq5o64nzn4nzdCNw7CFnXepJ/DCvZDA2IX
 +OYhqgtr7PnAxxGTUaAZFRuRW9lQ8Q7fPfxMrUGQmLJTCZa+RHFclkR5wI6b0phtmGncpj/+b
 ToQ7S+Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1740400593; x=1741005393; i=fiona.klute@gmx.de;
 bh=7hgn/+E26Z0QS9G+bBOnmcXljaZ8KB1FnGZiH3t4lTM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tnHMtf2Xg8HN6K8YlJhNIRSA/8KSwgqjnNPN4Lc9Mnab8q3qoYaD91wo+/sE0a1W
 xS4ZvWLt+Dw9aKaUL6Ut5nNj/bR2rYuksouUIU0qJlw+wlsXMgqhHaXQfZEKDkrom
 YGoRlebZZa9Jr4f2uZx4LLSDebW0T2rcG1xNYHMBlZmBGIRJNWY+w/fEoRYVdQnON
 di6Z+BzC4a1JkGXSUNedzJZeS6eZH/VjTriiLhB3Tg6x2Jd8eCYfz/axozC13Yg5D
 vnBUEgwRvzedlzzFBdjE83mGJRDn2S2XR77m4QjnrIVSOwRirKqm3yU1FJ61932xk
 O1N1EjYe36yQ9Uqd8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=tnHMtf2X
Subject: [Buildroot] [PATCH 1/1] package/libglib2: bump version to 2.82.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This is a small bugfix release, the fix relevant for Buildroot is a
possible integer overflow when parsing ISO 8601 date/time strings:
https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4499/diffs

Full upstream changelog, two other fixes are for macos, one related to
testing:
https://gitlab.gnome.org/GNOME/glib/-/blob/2.82.5/NEWS?ref_type=tags

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 6175a7157c..8bd4bf157d 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.82/glib-2.82.4.sha256sum
-sha256  37dd0877fe964cd15e9a2710b044a1830fb1bd93652a6d0cb6b8b2dff187c709  glib-2.82.4.tar.xz
+# https://download.gnome.org/sources/glib/2.82/glib-2.82.5.sha256sum
+sha256  05c2031f9bdf6b5aba7a06ca84f0b4aced28b19bf1b50c6ab25cc675277cbc3f  glib-2.82.5.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 58a9eb3ee6..6c012c79c7 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.82
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).5
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
