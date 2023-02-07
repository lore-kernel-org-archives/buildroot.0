Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA172C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 16:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ABDE81A64;
	Tue,  7 Feb 2023 16:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ABDE81A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lIGnlkkQcLEA; Tue,  7 Feb 2023 16:31:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D098581971;
	Tue,  7 Feb 2023 16:31:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D098581971
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDE061BF95C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C798581442
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C798581442
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yrobf3zoR0uk for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 16:31:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BF5F813A8
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BF5F813A8
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 16:31:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 943B340002;
 Tue,  7 Feb 2023 16:31:23 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Tue,  7 Feb 2023 17:31:16 +0100
Message-Id: <20230207163119.292389-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675787483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=49iu4lFyPqyXRHjcX1iFniVvrcNCsuVwXxgzCedQqOA=;
 b=RJh/E9yQyt0gqtZJFai7tKrryW/u2dvJK8xeMXxuxA9O2P6bOmUyvmhjvzHAjaonu1IzyC
 /6Z3cCnNENETaT0QKkHBlk2GDwoukzZ9ARq40RkJLlAp3TVn6+FfwqvcvSTfoF1JIJGZAb
 xGoUkVdYiGJDcW1kKVGGJTzYQCLsBkuy0T/4hgEY3xpo4a532eHRkONCS5V63SMd2GNEoD
 2/5W+ggRWOpuJjebLOtsp3fIMhL7mcJLC1XSoY0O/w949j5YnXn42mYnNDM+7VQMtdMv/L
 cLZMosNBBZY9S0yA/W9Y8k9I/8cSFZWasPZYIkCSwXTQtFksUkB0YL0g6/RCog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RJh/E9yQ
Subject: [Buildroot] [PATCH 1/3] support/docker: update Debian distro to a
 newer tag/date
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/docker/Dockerfile       | 2 +-
 support/docker/apt-sources.list | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index d775ae23e1..de1534e77a 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -6,7 +6,7 @@
 # We use a specific tag for the base image *and* the corresponding date
 # for the repository., so do not forget to update the apt-sources.list
 # file that is shipped next to this Dockerfile.
-FROM debian:bullseye-20210902
+FROM debian:bullseye-20230202
 
 LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
       vendor="Buildroot" \
diff --git a/support/docker/apt-sources.list b/support/docker/apt-sources.list
index 0f872fd398..849996d9f7 100644
--- a/support/docker/apt-sources.list
+++ b/support/docker/apt-sources.list
@@ -1,4 +1,4 @@
-# Latest just before 20210817T000000Z:
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20210902T205533Z/ bullseye main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20210902T193650Z/ bullseye-security main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20210902T205533Z/ bullseye-updates main
+# Latest just before 20230207T102800Z:
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20230206T092119Z/ bullseye main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20230206T092119Z/ bullseye-security main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20230206T092119Z/ bullseye-updates main
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
