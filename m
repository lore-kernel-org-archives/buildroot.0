Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0899C4332F
	for <buildroot@archiver.kernel.org>; Mon, 11 Dec 2023 19:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5658C60BD6;
	Mon, 11 Dec 2023 19:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5658C60BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LlGb7be5iJh0; Mon, 11 Dec 2023 19:14:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 998C360AEF;
	Mon, 11 Dec 2023 19:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 998C360AEF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A669A1BF396
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 19:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B7C941575
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 19:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B7C941575
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fw8xvd40uqM1 for <buildroot@lists.busybox.net>;
 Mon, 11 Dec 2023 19:14:10 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13CA341571
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 19:14:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13CA341571
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A2EA713F8AE;
 Mon, 11 Dec 2023 20:14:05 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 11 Dec 2023 20:14:00 +0100
Message-ID: <20231211191400.61689-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702322046;
 bh=D0otDs2xPN5N/LK3S40jRBdJhR3ws212U6csujde65E=;
 h=From:To:Cc:Subject:Date:From;
 b=TUDYsyRsiZR7P155qFXvKeWEta+36NHkc3xVUvNGlmFKZ+gm6KG01bDXNVwyfdrsQ
 iJCbL/wMnOD4jWMT8Ak5V3acarZhCQtzSNirdw0aj4O3S30XA1x8tlTz2JozIiAAGQ
 VJ8x10ernt6ObE5bow7v1w9sjvyEVTd0M2NsCWseuQljqCq8N9VdM8i2luIZxwHmJG
 0kW7tPMpCXt6Y4JLJ+bgbDPXM6p+PChyVE6mhbudKhXHYG1Q7TLp4l/4IiUXFRmVL1
 xWVRQzpCwGzayRW79zTYzkOk2Kd2kkfxtqjOwVB8xFjTre8hcdA2LXK/amKOOoCX5e
 hC6HYHWriW59A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TUDYsyRs
Subject: [Buildroot] [PATCH 1/1] package/z3: bump to version 4.12.4
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 4.12.2, see:
https://github.com/Z3Prover/z3/blob/z3-4.12.4/RELEASE_NOTES.md#version-4124

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit b79fb3c with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_z3
    ...
    OK

    utils/test-pkg -p z3
    ...
    6 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/z3/z3.hash | 2 +-
 package/z3/z3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/z3/z3.hash b/package/z3/z3.hash
index bddf3066ba..c20bbce2d6 100644
--- a/package/z3/z3.hash
+++ b/package/z3/z3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9f58f3710bd2094085951a75791550f547903d75fe7e2fcb373c5f03fc761b8f  z3-4.12.2.tar.gz
+sha256  25e9b18d04ee22f1d872dfe0daaf4c39034744525214e34fedd206e25140e96e  z3-4.12.4.tar.gz
 sha256  e617cad2ab9347e3129c2b171e87909332174e17961c5c3412d0799469111337  LICENSE.txt
diff --git a/package/z3/z3.mk b/package/z3/z3.mk
index 501d9ee61a..f9510ba592 100644
--- a/package/z3/z3.mk
+++ b/package/z3/z3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-Z3_VERSION = 4.12.2
+Z3_VERSION = 4.12.4
 Z3_SITE = $(call github,Z3Prover,z3,z3-$(Z3_VERSION))
 Z3_LICENSE = MIT
 Z3_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
