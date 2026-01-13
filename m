Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCABD30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72EB860BB3;
	Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OW9c2uoS4yYQ; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 815D360D6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337928;
	bh=HpUWOd/12YpypokZO3hl006+8GKcUNVQLIHRSgIFjWM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jPPcD45B4p6ZJc3+r7yvkjc+1zwlNGbJzmrfyNS4nhvMDe4YoMJBj4LFMFPVoRcS6
	 nCyKFNKOXqaYcCfBh7OC/g1d4Q3PSmA7HIut2ezmxSzNHIL65EyT/Dj66rZKyR0TaW
	 D2FfnAJh3POYnmHVvW3iWnq6hhD0qKYwYFeEM4qkAkovQHvAuRMIt8M7koDLTBsU/q
	 EFFLdtnEtUuZbAPPevtgNV+OCOm1bej2PUKFCtc241Kv5lYWp+O5zoTXFNnKaOi/Jm
	 FRTVbUJkOboQRz26Wnc+9ywYR1w7SQc8cDSfQGzrQSJFFWtYxLPYUTpe17QWflXZVY
	 QpjAdyG3bgTFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 815D360D6D;
	Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 610B6231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 527F960D79
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3u1FnjvEHx5 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D32460BB3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D32460BB3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3ADEC84091; Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b1dc96ec608abe14e3531e2dec9307c8dac3480
X-Git-Newrev: a03e4637ca08531c3b35b936c9fc143fcb9bffb4
X-Patchwork-Hint: ignore
Message-Id: <20260113205845.3ADEC84091@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xcb-proto: bump version to
 1.17.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a03e4637ca08531c3b35b936c9fc143fcb9bffb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2023-August/003414.html
https://lists.x.org/archives/xorg-announce/2024-April/003506.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xcb-proto/xcb-proto.hash | 6 +++---
 package/x11r7/xcb-proto/xcb-proto.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xcb-proto/xcb-proto.hash b/package/x11r7/xcb-proto/xcb-proto.hash
index 1a49710d7a..2c2a33bb82 100644
--- a/package/x11r7/xcb-proto/xcb-proto.hash
+++ b/package/x11r7/xcb-proto/xcb-proto.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-June/003170.html
-sha256  7072beb1f680a2fe3f9e535b797c146d22528990c72f63ddb49d2f350a3653ed  xcb-proto-1.15.2.tar.xz
-sha512  9d0b2f0a4dbbf2d64e32ff4658d1663e13d7e5f1bffc1e8d45be7b9dd5bab46e29fc1c2f6e66a7a569e374ba6756faf3c39b0b5e5560df6d7f8b68beec97659d  xcb-proto-1.15.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-April/003506.html
+sha256  2c1bacd2110f4799f74de6ebb714b94cf6f80fb112316b1219480fd22562148c  xcb-proto-1.17.0.tar.xz
+sha512  34c3795e5a48a66d89b72ee1777fb0bede489d5ec07018e6c9ef3c13bdd60b0358fc2c04a1f0ed0acb5b681aeeb92033db579036e4f5edd967fe56714c03acdf  xcb-proto-1.17.0.tar.xz
 # Locally computed
 sha256  c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  COPYING
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 324b29427d..2688822fa3 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XCB_PROTO_VERSION = 1.15.2
+XCB_PROTO_VERSION = 1.17.0
 XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.xz
 XCB_PROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XCB_PROTO_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
