Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0E9CFB424
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 10:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF5424036F;
	Sun,  6 Oct 2024 10:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HRUcWi5uLGJw; Sun,  6 Oct 2024 10:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77A1340245
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77A1340245;
	Sun,  6 Oct 2024 10:44:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC4CB1BF2C3
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 10:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7EAE606B3
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 10:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nws0OXIV10ur for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 10:44:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7135A6060B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7135A6060B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7135A6060B
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 10:44:41 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AB277B00572;
 Sun,  6 Oct 2024 12:44:38 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  6 Oct 2024 12:44:34 +0200
Message-ID: <20241006104434.1414754-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728211479;
 bh=XbnjpLnDtSBX+m9gJtM+cIzgV3JF/UBs1oc9Bx3j6sQ=;
 h=From:To:Cc:Subject:Date:From;
 b=tSZW6ATa0RUxGaghe3BnHiZEmFD22Kpg/AqOkygsiJFMvf8M7GeV24v4Eg2YvTlVy
 EcBgx6ny9GujGdbI12TFNb1HYhSoU2EOfdLc7oPB1TExzXu+IsGgWUkQZJIcWIeNmr
 ps2ddZUVdQ3mfBAe+QUCAnlTE6r5RWTZJ4zhgX2a1wOfvbrm67PgzF2k6WiQDDryjO
 v6B9ijjgjNbJZwny4j1eegie3ZbpMWB4p9ugCb69lqCo0UZPzbF6EeNMOuhirrvytt
 MmoLSW8qTucfaZQOLBTHJnfXQP82Iw9N5RpvE5FImpc2wmlaj/wAAqLhwDXk/zhcos
 XBCGV0g/Uyqfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tSZW6ATa
Subject: [Buildroot] [PATCH v2 1/1] package/libopenmpt: bump to version
 0.7.10
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

For release note, see:
https://lib.openmpt.org/libopenmpt/2024/09/22/security-update-0.6.19-releases-0.7.10-0.5.33-0.4.45/

Note: even if the release annouce has "security update" in its title,
it is only applicable to the 0.6.x version series. This version 0.7.10
is NOT impacted by this security fix.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Change v1 -> v2:
- Removed "security" in the commit log title.
  As the rest of the commit log is stating, this bump is not
  a security bump.
---
 package/libopenmpt/libopenmpt.hash | 2 +-
 package/libopenmpt/libopenmpt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libopenmpt/libopenmpt.hash b/package/libopenmpt/libopenmpt.hash
index cc5519806c..ab501d20b4 100644
--- a/package/libopenmpt/libopenmpt.hash
+++ b/package/libopenmpt/libopenmpt.hash
@@ -1,3 +1,3 @@
 # computed locally
-sha256  0386e918d75d797e79d5b14edd0847165d8b359e9811ef57652c0a356a2dfcf4  libopenmpt-0.7.9+release.autotools.tar.gz
+sha256  093713c1c1024f4f10c4779a66ceb2af51fb7c908a9e99feb892d04019220ba1  libopenmpt-0.7.10+release.autotools.tar.gz
 sha256  e3d7e76c6b441ddd9fff0a397e7b5e055a11678bd7c3b246a0ce13e352eb15e8  LICENSE
diff --git a/package/libopenmpt/libopenmpt.mk b/package/libopenmpt/libopenmpt.mk
index aff67f6935..744c67c6b7 100644
--- a/package/libopenmpt/libopenmpt.mk
+++ b/package/libopenmpt/libopenmpt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENMPT_VERSION = 0.7.9
+LIBOPENMPT_VERSION = 0.7.10
 LIBOPENMPT_SITE = https://lib.openmpt.org/files/libopenmpt/src
 LIBOPENMPT_SOURCE = libopenmpt-$(LIBOPENMPT_VERSION)+release.autotools.tar.gz
 LIBOPENMPT_LICENSE = BSD-3-Clause
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
