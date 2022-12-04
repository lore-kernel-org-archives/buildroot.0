Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40356C4321E
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 14:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D018409A9;
	Sun,  4 Dec 2022 14:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D018409A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gQdXg8SxNaOZ; Sun,  4 Dec 2022 14:16:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D3DE4092B;
	Sun,  4 Dec 2022 14:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D3DE4092B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2F301BF3A6
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 14:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DA7160B92
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 14:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DA7160B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kAy0kim6mvQo for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 14:16:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3143D60A9B
Received: from smtp-8fae.mail.infomaniak.ch (smtp-8fae.mail.infomaniak.ch
 [83.166.143.174])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3143D60A9B
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 14:16:38 +0000 (UTC)
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4NQ7lf6NT5zMpnXq;
 Sun,  4 Dec 2022 15:06:54 +0100 (CET)
Received: from localhost.localdomain (unknown [81.221.82.85])
 by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4NQ7lf3Q18zMppdp;
 Sun,  4 Dec 2022 15:06:54 +0100 (CET)
To: buildroot@buildroot.org,
	yann.morin.1998@free.fr
Date: Sun,  4 Dec 2022 15:06:43 +0100
Message-Id: <20221204140643.893075-2-pge@ik.me>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221204140643.893075-1-pge@ik.me>
References: <20221204140643.893075-1-pge@ik.me>
MIME-Version: 1.0
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ik.me;
 s=20200325; 
 t=1670162814; bh=NDIDs79n4DvZnj4dwTkwqZpP5xSKDVLasJE+z9Bq2l0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M/LlkQjpgqHbgv1qcyc27087jiwQDwGAHljS7hh2acor63p7FVDWqdKqEfXc3D1Sc
 emfTITxG5i72S07TARfplktNvQ+uJJlh+gpw2bEDHL5e+5LAq1ZS1nzOD8lBXIgq28
 go6Qd5fmUmlLNMwwxMpW4U1ohzkcv3nlD2rcrQ58=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.a=rsa-sha256
 header.s=20200325 header.b=M/LlkQjp
Subject: [Buildroot] [PATCH 2/2] package/mender-artifact: remove unnecessary
 GO_ENV
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
From: Patrick Gerber via buildroot <buildroot@buildroot.org>
Reply-To: Patrick Gerber <pge@ik.me>
Cc: Patrick Gerber <pge@ik.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All go packages are built with:
GOFLAGS="-mod=vendor"
(see HOST_GO_COMMON_ENV in go/go.mk)

Signed-off-by: Patrick Gerber <pge@ik.me>
---
 package/mender-artifact/mender-artifact.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 1031166f34..6ade624a23 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -86,14 +86,6 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 
 HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz
 
-# By default, go will attempt to download needed modules before building, which
-# is not desirable. This behavior also causes permission issues when cleaning,
-# as go downloads modules as read-only by default. Because mender-artifact
-# includes the modules in the vendor directory, mod=vendor prevents the package
-# from downloading the go modules during the build process and prevents
-# permission issues when cleaning.
-HOST_MENDER_ARTIFACT_GO_ENV = GOFLAGS="-mod=vendor"
-
 HOST_MENDER_ARTIFACT_LDFLAGS = -X github.com/mendersoftware/mender-artifact/cli.Version=$(HOST_MENDER_ARTIFACT_VERSION)
 
 HOST_MENDER_ARTIFACT_BIN_NAME = mender-artifact
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
