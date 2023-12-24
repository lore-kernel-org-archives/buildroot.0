Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAC0C46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 08:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75A234012E;
	Sun, 24 Dec 2023 08:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75A234012E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 55YwhlOK0sxA; Sun, 24 Dec 2023 08:15:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70A3140272;
	Sun, 24 Dec 2023 08:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70A3140272
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D83A91BF359
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 08:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCF924031F
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 08:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCF924031F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOJM804Elb4Q for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 08:15:16 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8798240272
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 08:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8798240272
Received: from fli4l.lan.fli4l (p54a1b896.dip0.t-ipconnect.de [84.161.184.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9AF42A4C063C;
 Sun, 24 Dec 2023 09:15:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52754)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rHJdg-0001CD-16;
 Sun, 24 Dec 2023 09:15:12 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 09:15:10 +0100
Message-Id: <20231224081512.19928-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1703405712;
 bh=iOPYCDBa0MbVOUJVyrZbQGrD/PwLIhFyouJtbqzJHYA=;
 h=From:To:Cc:Subject:Date:From;
 b=h0dFwSjv/3y8xnuM7l752rEVY95hMTiSvL75T0Xb0SN0xR8adj8I3ZAr6eIFAM9h2
 UnEee5ihkWwiq3UwxJq9d6+7JhZwBkT24jPrSGnwnB8pwRQQ5tbe0TptiOpPr64ssY
 8/A603BulXdIQMcgjIdaKaLEHYO8lUAeUNNaqXefvAgElJ8OLWE3URdA/oS93a7vle
 J0rDrdB1lmR+YDJW2Mk++pOMMx8o/vLLNnciUEY08IVzJo2ejdZvbk3ZV+FIHrAHor
 rV1NryTqj3uRp9KaH9Rox/PicNXxt9oi65lzJzZMUw6Z5uFbPfHGQhj2qmYj43CVEy
 6QGN+Z4XV8ipg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=h0dFwSjv
Subject: [Buildroot] [PATCH 1/3] package/libxslt: bump to version 1.1.39
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.39.news

Fixes:
http://autobuild.buildroot.net/results/8dc/8dc9b1fb68c196deace94951ed81a9a520f98973//

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libxslt/libxslt.hash | 4 ++--
 package/libxslt/libxslt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
index 458c1388d3..7597e7954d 100644
--- a/package/libxslt/libxslt.hash
+++ b/package/libxslt/libxslt.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.38.sha256sum
-sha256  1f32450425819a09acaff2ab7a5a7f8a2ec7956e505d7beeb45e843d0e1ecab1  libxslt-1.1.38.tar.xz
+# From https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.39.sha256sum
+sha256  2a20ad621148339b0759c4d4e96719362dee64c9a096dbba625ba053846349f0  libxslt-1.1.39.tar.xz
 
 # Hash for license file:
 sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  COPYING
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index ec066fbfa2..8098937ef3 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXSLT_VERSION = 1.1.38
+LIBXSLT_VERSION = 1.1.39
 LIBXSLT_SOURCE = libxslt-$(LIBXSLT_VERSION).tar.xz
 LIBXSLT_SITE = https://download.gnome.org/sources/libxslt/1.1
 LIBXSLT_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
