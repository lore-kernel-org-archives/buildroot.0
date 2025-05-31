Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F089C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 17:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D142740546;
	Sat, 31 May 2025 17:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Ga9rK0rervA; Sat, 31 May 2025 17:26:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 020FC404E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 020FC404E6;
	Sat, 31 May 2025 17:26:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DD7D127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FF5A40068
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPzBlNJ0IAG2 for <buildroot@buildroot.org>;
 Sat, 31 May 2025 17:26:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1727F4004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1727F4004A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1727F4004A
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:26:10 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.114.90]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MaJ3t-1uQfAw2EU9-00PiZH; Sat, 31
 May 2025 19:26:07 +0200
To: buildroot@buildroot.org
Date: Sat, 31 May 2025 19:25:48 +0200
Message-ID: <20250531172549.2664496-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:UUOH1FbeV4Xq8cBSBZRfuIT97WbYRP9mvpJkkmjLCPtMHUBldWd
 utp+f2BBZatJhUeB+gNRJtZVWQbzhAJWB4bqmMAaHYPSgtqR7sq4MlDyyQXuLdBtnZ7iQvJ
 530Yicz6XBzvqta8iSswIxJTpDqwdCY9P2ehvhksGcHkU4qcJG/TuwBmYAwqLtbA5oaBXR+
 khXjMRvqQoC7gS7o1jpFg==
UI-OutboundReport: notjunk:1;M01:P0:bI2vieWYoUQ=;vEOGa3oX+VaBDKOVwj4LExDVYvL
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1748712368; x=1749317168; i=fiona.klute@gmx.de;
 bh=LEBUwUbfTuI6+u1W+VVJKfzhHhu/R4FhASDZtIXmLlM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=jSEgAcu7gwjRx8PRxwIbJNHW8brcx+wWnzFRc0lhn6ugbuJIJ46i17DIg/8jNFbX
 wbSD9NR1UXhZDfW0qGa+b/qE6JjLykYDio8MBBhyRp6iDq4wJCt/4OdoocK9n/CEw
 II6oeM5cqx9AR67fyyZdCOsA8QfSMHwEcBknCAppHjUb8/UyU2EUx9y73rf1WKrDc
 VbqCR1DTQSYmQyB1D6gTGxv7hsazR0QbdSAR1nzXCnlq5Lk1nIfdcyjR2C2B50aYm
 OCaUyZ1I22X1Ms96XccjpQkvmWgfjaMSnHsrxV9Z64ip66ULTocORcGALXuCvlqkm
 aPYIKTgayCpEtIlFpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=jSEgAcu7
Subject: [Buildroot] [PATCH next 1/2] package/python-aiomqtt: bump version
 to 2.4.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Aiomqtt switched its build system to hatchling with 2.3.1, change
PYTHON_AIOMQTT_SETUP_TYPE and dependencies accordingly.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/python-aiomqtt/python-aiomqtt.hash | 4 ++--
 package/python-aiomqtt/python-aiomqtt.mk   | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-aiomqtt/python-aiomqtt.hash b/package/python-aiomqtt/python-aiomqtt.hash
index 12ea86d538..eab5a1938f 100644
--- a/package/python-aiomqtt/python-aiomqtt.hash
+++ b/package/python-aiomqtt/python-aiomqtt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiomqtt/json
-md5  e23feb8ad69a1ae3a9701fb1f3c03a3c  aiomqtt-2.3.0.tar.gz
-sha256  312feebe20bc76dc7c20916663011f3bd37aa6f42f9f687a19a1c58308d80d47  aiomqtt-2.3.0.tar.gz
+md5  9ded3fea036dc979d7855a6b3fd1dc33  aiomqtt-2.4.0.tar.gz
+sha256  ab0f18fc5b7ffaa57451c407417d674db837b00a9c7d953cccd02be64f046c17  aiomqtt-2.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2cdee9e997c759749069649dfb9060fdb885da82bc50c0dcb4841b1dcab0b032  LICENSE
diff --git a/package/python-aiomqtt/python-aiomqtt.mk b/package/python-aiomqtt/python-aiomqtt.mk
index 80cecea9e8..c5b932838d 100644
--- a/package/python-aiomqtt/python-aiomqtt.mk
+++ b/package/python-aiomqtt/python-aiomqtt.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-PYTHON_AIOMQTT_VERSION = 2.3.0
+PYTHON_AIOMQTT_VERSION = 2.4.0
 PYTHON_AIOMQTT_SOURCE = aiomqtt-$(PYTHON_AIOMQTT_VERSION).tar.gz
-PYTHON_AIOMQTT_SITE = https://files.pythonhosted.org/packages/db/c9/168e78bd35b21d9bdbb26178db33a8f265e4a69bb4193e72434e7cb3d1cd
-PYTHON_AIOMQTT_SETUP_TYPE = poetry
+PYTHON_AIOMQTT_SITE = https://files.pythonhosted.org/packages/45/9a/863bc34c64bc4acb9720a9950bfc77d6f324640cdf1f420bb5d9ee624975
+PYTHON_AIOMQTT_SETUP_TYPE = hatch
 PYTHON_AIOMQTT_LICENSE = BSD-3-Clause
 PYTHON_AIOMQTT_LICENSE_FILES = LICENSE
-PYTHON_AIOMQTT_DEPENDENCIES = host-python-poetry-dynamic-versioning
 
 $(eval $(python-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
