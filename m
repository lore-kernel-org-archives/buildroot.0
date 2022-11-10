Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBBEC4332F
	for <buildroot@archiver.kernel.org>; Thu, 10 Nov 2022 06:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C42F88175D;
	Thu, 10 Nov 2022 06:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C42F88175D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cFMWSUzwD0bY; Thu, 10 Nov 2022 06:28:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03F2581747;
	Thu, 10 Nov 2022 06:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03F2581747
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 441351BF31B
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 06:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F8E981747
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 06:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F8E981747
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wvav0bj0IpVQ for <buildroot@lists.busybox.net>;
 Thu, 10 Nov 2022 06:28:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B21E812C3
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B21E812C3
 for <buildroot@busybox.net>; Thu, 10 Nov 2022 06:28:53 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id BABD4440EA2;
 Thu, 10 Nov 2022 08:26:21 +0200 (IST)
To: buildroot@busybox.net
Date: Thu, 10 Nov 2022 08:28:37 +0200
Message-Id: <889889d8be793f429c3a36717502136a69b6abb4.1668061717.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1668061581;
 bh=z31eLlsoSQlR1j6gAokMzPW6cqM5pSkAvkseqJ+oZPw=;
 h=From:To:Cc:Subject:Date:From;
 b=Tls/ddcyYR3E4dOxUoOsaVvr+tTEoBB0m4Srh3ZW+8LbU+PFCBsF0NXzFHuy55hHo
 wV0p+7J6o4dtg0QdYAeW6PQJ+wohzBYzWdts1foW6jvfyub2kmzXXq5CLmKUvWKe8c
 q9qCbrnf7xO5bstswLmvUzN8TqYBN6sIBUtCK/gllpCWTcZZHycO3s0LV1dOjPF49h
 GQldGTTGYA/tKmKGrgVwjDItONlN76gLEtoNOGsh4fiW3lbV8zSFkbwW8B8eZ9t2H3
 +QDTewZozuahWS5+LHb6nsysL0KXmDNnMu+/M+Ot1TicUPWSiUnAYRTIVqUWe7hFTq
 8xW/i+6H0uIog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=Tls/ddcy
Subject: [Buildroot] [PATCH next] package/uhubctl: bump to version 2.5.0
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update LICENSE file hash for copyright year update.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/uhubctl/uhubctl.hash | 4 ++--
 package/uhubctl/uhubctl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uhubctl/uhubctl.hash b/package/uhubctl/uhubctl.hash
index c696d70f6cd2..8a4581b84ce3 100644
--- a/package/uhubctl/uhubctl.hash
+++ b/package/uhubctl/uhubctl.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  391f24fd1f89cacce801df38ecc289b34c3627bc08ee69eec515af7e1a283d97  uhubctl-2.4.0.tar.gz
-sha256  2d3aa0737e8db9dfd710f9a282b446cb7b15b2b3eecac383f0c45c64d736eea0  LICENSE
+sha256  d4452252f7862f7a45dd9c62f2ea7cd3a57ab5f5ab0e54a857d4c695699bbba3  uhubctl-2.5.0.tar.gz
+sha256  5eb09049fafa91347386daf769223ba2ee6914cb26ab95b86854ad6edea49b5d  LICENSE
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/uhubctl/uhubctl.mk b/package/uhubctl/uhubctl.mk
index 3429d7d151e8..f9815409ae67 100644
--- a/package/uhubctl/uhubctl.mk
+++ b/package/uhubctl/uhubctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UHUBCTL_VERSION = 2.4.0
+UHUBCTL_VERSION = 2.5.0
 UHUBCTL_SITE = $(call github,mvp,uhubctl,v$(UHUBCTL_VERSION))
 UHUBCTL_LICENSE = GPL-2.0
 UHUBCTL_LICENSE_FILES = LICENSE COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
