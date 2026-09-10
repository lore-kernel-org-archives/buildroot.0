Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF714C88E41
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 23:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5336180827;
	Thu, 10 Sep 2026 23:06:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wO4FQ8nkdzBp; Thu, 10 Sep 2026 23:06:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 69280807EB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789081587;
	b=sp77Nj3qiXHLy69dy1wdq+KZ82GynsU6fkQbOEuInFMUOmbwDsEqffAaD+TTHzWwjFWe
	 L+kh6fDz/nraG2x3rB5Xmlvi0YX7C8leMjwBeTAxmcKXwMDJ2kLKCZpKuoQRb1FABdyDR
	 2/ZGx8AEQLhz+WtxNBX3JD/72PJuyHwsstcAp3Ud4rZaWPqYkoEA4tMoWGNAdj46/xHHQ
	 VUHQg1Key3V62AGJpaEbJ6jvjfBFKIhATkUwbE4cx9RnhACfY3NkD8TRhQZ5Qfp7RM4nO
	 O4Ay1sgNPDWC61aqOeiieUTKvLHN8S8o9V106sSgESLnkQlfCk/cfozfhWNprWObqqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789081587;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yMiiPPj6tFIyRVNbi2TWD0FVYXWOW51bcElsaktBldQ=;
	b=dGO5kq6J40ETlPvpOzRYjdc5jGuYZfQt3qN4ucNvx/V46qUEMYMq2bsIIOzkncNtkhfR
	 OD3lXhLCllLzptyPyew7k7MCcSgNY+Cr3X4CdITH6XyfDl20/Nn0w+f+S2/2yP6g3owuk
	 2aoPg7v1iffeYtcIYkwOj+d99svV2iuTeMqcVevkslUZu8rFJVVtckNrsKUbQa/GXNmCv
	 tPGKe+EUnOpoCk/TedhvrG7+L1/IIPSS8A9Jih/ExA8Li3tzwd27zclArlj+6qER0/Ab4
	 9jMknosrRG+igH0wTuyUq5WsE43LLz5ke8Cf7tHU00AOg+39DelayXGaaUJgTSWnL1Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789081587;
	bh=yMiiPPj6tFIyRVNbi2TWD0FVYXWOW51bcElsaktBldQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c0fkpqqBNF/lkbBpyK9UNLV9hBiwISQvmk+Nzhr8+goKzkrZTwj08rCFKgD+YsFnB
	 B1bXkPoj+9Xd0W8sWwyhBaYNlmBXcB6aiTCIuVDIeWPh7tyknGfwQZMfp2NY3ulJPr
	 +RKOd2G1FDURmcElk+Yt9ymRSTCJSVhKeYP6Rr3w2LW+HURVqSPWWwcxp5v/SFT9u4
	 oNEJM6bOFl6i3MdhC0RwYOdEXbjWBCnciGKvjdMGdr2kYnQPl2mxjzZ7xVUutPo9e1
	 hSNt237nE5RoECmkcY/zPoEG5C3eJ26T5wKUXYUTfIxFDuFqpXwfFz3mFCjIh9qqkv
	 VQT3u87YBZOUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69280807EB;
	Thu, 10 Sep 2026 23:06:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 204F6362
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 23:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06A1D40264
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 23:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 45yS7h_MjU3O for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 23:06:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A58C74025D
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789081584;
 b=Mu6uon72sHfyHBTDxmUnmC5qe4OaXGpRoZFyWDcruix5917KLJfhFqiGFKWewfTnAsQm
 wckpByQU7eDbHNNE8e7BBsiTAp5yT/MtzwBpgwp8RLUEquoLEC6/LrI8UEhVT9yMYfgvV
 GCay9Lw44CFckA0yUEXAlWt5HnnqFJgwSOOmxTei9Im7PkbtBVVGAQ0GhV4OugSqj7Kap
 iPewGyj9R20hkQSERRY3XA1IOUIrf/8fh8XQmUuAi0D2iz+41W++Fcw3MpcOgVsEKp2EA
 srmRAVX0b5FGdLLk3VsGvQ9aF8Ih47AOqqFXQ7BlyVn8vtdRXwFVkLFsjPg6bua/heg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789081584;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=a2YVPFxZVGvKL99ZSPFH+Z6Hv9IoG0qbilnZpCdd7yo=;
 b=H0N548wmnnxB6Unj2mA2pHa62DQ+Pi3X0VgR3x9tY7HTXWkQQGyiksxy7kM1P5UDPknT
 z0qmUP+M3np2QGAH5tIR59ulyR6G3pDiGCOsk6F1K2XiSAtCo4NJN8HmDgxq1FWsO4YZt
 hYP/gJHTvacP6lWkizGCKOlAZ2kvKrH16DvUo6dc3hZknweGfYG45e5sO9frZzt9p44a+
 bh3bPRkwhDFN1lztX1e5eFZq4SyQNTW7j0vEqfbizNcEl7gTL+sgfBLy6xEihzO+BBvSB
 eUErfY4OZRRTglDhoYjnN0liolR2hxHEH5yRY8Ii/3UQbMVjjhsGR2/Fy4aymMm13Xw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=igalia.com; 
 dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=U2yFOCwF; 
 arc=none smtp.remote-ip=213.97.179.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=U2yFOCwF
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A58C74025D
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 23:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=a2YVPFxZVGvKL99ZSPFH+Z6Hv9IoG0qbilnZpCdd7yo=; b=
 U2yFOCwFHM5arj2zD2kJjL9YNOqSZPlyoeEja59fWgFS7u9JLj1VBmYtbadqNrQBrGMrNp8lXbdfT
 TPnPoy1D0D5lnLr5Z8ArNyQDAE/17685bOxfILQGqKgjDT2kY/K73XdzPU0iJCZ9aKqaIiRojSN9D
 zcqxldL2nFDBw46kOnmeQpLwO9GEIIwDWFlO+kC8v4anNh1ikXrl5TiROlJagH6xzV8RzHKPpQKBQ
 7AEXL+/TH4DDy5MR0R5DU0EO1EVRMrbWWAp12dZh+/aEjIN6I1FGI4LBbabd5WpSilHvCrWF9QIBH
 kMQCsmVksXUHv2u6Jq8uI/uK/9LFyBx++A==;
Received: from 68.171.94.90.dynamic.jazztel.es ([90.94.171.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x4nqX-000PLw-H4; Fri, 11 Sep 2026 01:06:21 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 0887a0f5;
 Thu, 10 Sep 2026 23:06:21 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 11 Sep 2026 01:06:19 +0200
Message-ID: <20260910230621.1936231-1-aperez@igalia.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/wlroots: bump to version 0.20.2
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

Both .1 and .2 have been minor bugfix releases. Changelog:

  https://gitlab.freedesktop.org/wlroots/wlroots/-/tags/0.20.2
  https://gitlab.freedesktop.org/wlroots/wlroots/-/tags/0.20.1

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wlroots/wlroots.hash | 4 ++--
 package/wlroots/wlroots.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index cd1b83e6e4..aea272b12b 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.20.0/downloads/wlroots-0.20.0.tar.gz.sig
+# https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.20.2/downloads/wlroots-0.20.2.tar.gz.sig
 # with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
-sha256  33f52414e1b280839aeb70786f0ae2c9f54e27ad4873108d86270a2f89c4934b  wlroots-0.20.0.tar.gz
+sha256  80c567d2ed4efb2cfa6b077f22c7a710d9c78ba4e185a75e8694001114af0733  wlroots-0.20.2.tar.gz
 
 # Hashes for license files:
 sha256  35d427c043dcafe8893b9e7247348f599847c81d9a067703587c80707f3d58df  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 5ce634d402..cae2ff0c5d 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.20.0
+WLROOTS_VERSION = 0.20.2
 WLROOTS_SITE = https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$(WLROOTS_VERSION)/downloads
 WLROOTS_LICENSE = MIT
 WLROOTS_LICENSE_FILES = LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
