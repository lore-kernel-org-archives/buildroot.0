Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76292E6919E
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 22:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06DF56155D;
	Sun, 24 Nov 2024 22:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AR6pm7ougLxv; Sun, 24 Nov 2024 22:41:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BD336155A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BD336155A;
	Sun, 24 Nov 2024 22:41:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48F4531
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 22:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 264E740167
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 22:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1VEgn3CyWpS for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 22:41:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D7966405AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7966405AB
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7966405AB
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 22:41:37 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FLIMtCzVNNhthFLIMt2RIG; Sun, 24 Nov 2024 23:41:34 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 24 Nov 2024 23:41:34 +0100
Message-Id: <20241124224134.351652-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJt1+zys91w/4tH0t7G/bIpGcwvzk9AtgRAYvyPnvtHcf7qwcxUmjxhZFGtq4okRBOhPvgnozwUrNNHTeikld/mnAS9YQ+b0xt10QckHBWhuj2hrrgWY
 HKZ9Qi8Lv1yErLOMJSGP/zm/+mQS161Soqv+56j06FMiOfDvsVYoQku9Pc3TSjwClTHherFSRVYRGodImL21SJVcf+fI0tcK4aFI4S3q/JQ5H+X3cw77I0tI
 KSLaUzoUkTAUYKD16nF8TuLNJD5IPh/EM7Ew31R56MBzFDo+01Cr/5z0hUz2tRcMLhY9hW87dtyiZU+BfN41aA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1732488094; bh=TgSautTq0yJ5HrEs6MNPlSGrKxJbIuHXdoK86rdaFmY=;
 h=From:To:Subject:Date:MIME-Version;
 b=knXz02WB966VfyJgPGqqLg/u0E0drE5MVIBdNRkOi42OAo+5YROHQbVJhpmnypxAx
 uegmwmbEv0iwTpoWatp0ra7lYC0MvWqKZeF2oY3uNVdFNwftH7URpuUQ3N/NjkXgHE
 7LQJtkhY7zTQy0WYyu4Da6I2VMxaO4k6coMMjaWu5jhTGxc8vYWb03s2STN4CyJ91n
 pyVFZo4WCsi8+VaNiiZrg3Q41iZYq1bGvrlCA9OM+e+H5NUhmbVeHf/E2IhPONAm2+
 FO0affkrwPEQA4qh1HP/0q564d96SRHQm/6ETtMzxVUbTJjSC56TXJq1lYfgK32V+r
 N7d4gUF/fLPBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=knXz02WB
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.107
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 36e2296d38..fe29029633 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_106_RTM/src/SHA256SUMS
-sha256  026b744e1e0784b890c3846ac9506472a92138c1f4d41dec581949574c585c38  nss-3.106.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_107_RTM/src/SHA256SUMS
+sha256  7f7e96473e38150771a615f5d40e8c41ba3a19385301ae0c525091f2fc9d6729  nss-3.107.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 35cfd0edb1..8f2da4a5c4 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.106
+LIBNSS_VERSION = 3.107
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
