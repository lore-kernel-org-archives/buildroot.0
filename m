Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D99BC636D4
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 16:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31B5F6100D;
	Tue,  7 Feb 2023 16:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31B5F6100D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mBXfY2kIpPiz; Tue,  7 Feb 2023 16:31:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83F7360FFC;
	Tue,  7 Feb 2023 16:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83F7360FFC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 167201BF5F8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D70BC402AF
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D70BC402AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YiBnwWWlEHe2 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 16:31:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3A28402C3
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3A28402C3
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 16:31:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id CA12140014;
 Tue,  7 Feb 2023 16:31:25 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Tue,  7 Feb 2023 17:31:18 +0100
Message-Id: <20230207163119.292389-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230207163119.292389-1-thomas.petazzoni@bootlin.com>
References: <20230207163119.292389-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675787486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ptf3uRm0IFovZ/RDoTkI5KP6D0OqwrKDdnSEa/E6mKA=;
 b=Eov7MbRpFjtSgdHxHlbu1FMRWMKvD/5FlGZjIRIgvORUApuZTfW4FwkzNwsmAGDrjThPRY
 duwDy3oKrN6MlnwGwK1/yc6sPP98DqpZAOIr2cGrWP/VXzCU4Yih9xxFpQwCxqi6rOx36+
 N53wYTjsVdRm1laGXn3PA1wInama+1KCIUDrH3n1nsVlFzZnYjbYrt2OOCaO+yvz8D8il3
 t7Am+ovaMehihomd88ydBYl7tbAkkio5yeRgso3qp9JGUr7zHazPaGxSh8DaZ8y+tS8exd
 KiAN5MYHqOp/CggsVM7dmgiFnKAPMIFqNMfpeVj8BrWuUqgpu8IJmJSOdx+I3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Eov7MbRp
Subject: [Buildroot] [PATCH 3/3] .gitlab-ci.yml: update Docker image to use
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

We have a new Docker image, updated with the new requirements from
bcd15aa08aab1e8292b93995c44dc765a9801632 ("support/docker: add
python3-magic"), but also with an updated Debian Bullseye
installation. Let's use it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index cad35c96bc..ed17bb14b9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,7 +1,7 @@
 # Configuration for Gitlab-CI.
 # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
 
-image: $CI_REGISTRY/buildroot.org/buildroot/base:20220206.1756
+image: $CI_REGISTRY/buildroot.org/buildroot/base:20230207.1123
 
 stages:
   - generate-gitlab-ci
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
