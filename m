Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23604D3901B
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 20:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E00CD60D99;
	Wed, 14 Jan 2026 20:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NnmDIKdTpIzx; Wed, 14 Jan 2026 20:40:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A8FE60D9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768423215;
	bh=JMqzHdhavLPp/Xo1BgxY38+eAaMrcybZrv3kp6jPbK4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G+Zwhh5ZT+6oo1JJV5+VFFnEbaGn38NSu3XWw6HEgUj2obq7ppYoS4RbEqCYKMJ5Y
	 iBJaB/gdRqZ2G53FF9kbNg+12XYdUc6qcCSjVIFnswams1BWFbvyaLlWDPTRDLf8ob
	 8fOPwdqzn1bt5EyZy6b/l71f/963f0gvDNA9lujxzbi+N63CgBqhVJhr9MDZhnE71Q
	 bkL/rwaKMGMsPQGDIsgh4641mF0D7GDtVJWuVs/2Eff8WRP3PWz0imH5AxRh0QKz0y
	 qM7f4BjQxPPP1qYCrpAkc5qgXIdm3J/C95uhEsCtwX0FCMQf01TOwNlCn1/5nn5i52
	 uNBqg5c3TPi3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A8FE60D9C;
	Wed, 14 Jan 2026 20:40:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CFDA31C3
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B557860DA1
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVMwDNREcExZ for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 20:40:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC90660D9C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC90660D9C
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:40:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD133885C2; Wed, 14 Jan 2026 20:40:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 21:30:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c183602cb37214e47294cddb785bbb73536b810f
X-Git-Newrev: 2e382cea6a086ffbe9b14476a264c010228f6afe
X-Patchwork-Hint: ignore
Message-Id: <20260114204010.CD133885C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xapian: bump to version 1.4.30
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2e382cea6a086ffbe9b14476a264c010228f6afe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ChangeLog:
https://xapian.org/docs/xapian-core-1.4.30/NEWS

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xapian/xapian.hash | 4 ++--
 package/xapian/xapian.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xapian/xapian.hash b/package/xapian/xapian.hash
index 898d2e4eff..845f5b78fc 100644
--- a/package/xapian/xapian.hash
+++ b/package/xapian/xapian.hash
@@ -1,5 +1,5 @@
-# From https://lists.xapian.org/pipermail/xapian-discuss/2024-December/010056.html
-sha256  bcbc99cfbf16080119c2571fc296794f539bd542ca3926f17c2999600830ab61  xapian-core-1.4.27.tar.xz
+# From https://lists.xapian.org/pipermail/xapian-discuss/2025-November/010103.html
+sha256  4edf9989499e8bc95085c9f7108ed41d69546c34c6eea81da0fa22d95043bf72  xapian-core-1.4.30.tar.xz
 
 # locally computed
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/xapian/xapian.mk b/package/xapian/xapian.mk
index 187e366066..aef05ec532 100644
--- a/package/xapian/xapian.mk
+++ b/package/xapian/xapian.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPIAN_VERSION = 1.4.27
+XAPIAN_VERSION = 1.4.30
 XAPIAN_SOURCE = xapian-core-$(XAPIAN_VERSION).tar.xz
 XAPIAN_SITE = https://oligarchy.co.uk/xapian/$(XAPIAN_VERSION)
 XAPIAN_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
