Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DB8C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 08:32:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3D2F61104
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 08:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3D2F61104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE1AD6166B;
	Sat, 28 Aug 2021 08:32:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KByppQzQZeJO; Sat, 28 Aug 2021 08:32:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 300E661670;
	Sat, 28 Aug 2021 08:32:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B75281BF30A
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 08:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6E1B83EF2
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 08:32:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kKGZFzlsv3zk for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 08:32:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FB8A83EE9
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 08:32:14 +0000 (UTC)
Received: from fwd04.aul.t-online.de (fwd04.aul.t-online.de [172.20.26.149])
 by mailout02.t-online.de (Postfix) with SMTP id 4A89D1DC9
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 10:32:12 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (SOjTJiZTwhEQuf0bp3EIIvZydngLUYw6HPJHBffe0xDEMqvCgZ4BpQNJDGjxZ97g0o@[79.214.206.166])
 by fwd04.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mJtl1-3ChD3A0; Sat, 28 Aug 2021 10:32:07 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:37694)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mJtl1-0001Up-9j
 for buildroot@buildroot.org; Sat, 28 Aug 2021 10:32:07 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 10:32:07 +0200
Message-Id: <20210828083207.670611-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210828083207.670611-1-bernd.kuhls@t-online.de>
References: <20210828083207.670611-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-ID: SOjTJiZTwhEQuf0bp3EIIvZydngLUYw6HPJHBffe0xDEMqvCgZ4BpQNJDGjxZ97g0o
X-TOI-EXPURGATEID: 150726::1630139527-00000C79-2CA74240/0/0 CLEAN NORMAL
X-TOI-MSGID: 5e1c0732-b3df-4cf6-b88a-3d816931ef40
Subject: [Buildroot] [PATCH/next 2/2] package/dovecot-pigeonhole: bump
 version to 0.5.16
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Release notes:
https://dovecot.org/pipermail/dovecot-news/2021-August/000464.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index 58444ab7e8..3b7c04834c 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,3 +1,3 @@
 # Locally computed after checking signature
-sha256  e1498f50cef74c351a57474cc423b008627ab1ab60724b859283ead6d00550d0  dovecot-2.3-pigeonhole-0.5.15.tar.gz
+sha256  5ca36780e23b99e6206440f1b3fe3c6598eda5b699b99cebb15d418ba3c6e938  dovecot-2.3-pigeonhole-0.5.16.tar.gz
 sha256  fc9e9522216f2a9a28b31300e3c73c1df56acc27dfae951bf516e7995366b51a  COPYING
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index c0bef6bedc..490bad35c6 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.5.15
+DOVECOT_PIGEONHOLE_VERSION = 0.5.16
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.3-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = https://pigeonhole.dovecot.org/releases/2.3
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
