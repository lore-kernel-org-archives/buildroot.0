Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84562CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DD906068B;
	Sat,  3 Oct 2026 13:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAKNpzoe0EEI; Sat,  3 Oct 2026 13:57:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5CE4C60F3D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035842;
	b=kDrr7Pd738cB0PAzFURpkCCCY8YXzHOeC3JnpsE6JjK9J6vu2FR3bb4Ij+e1HExa4QVJ
	 3RTv90ZFnVPhfscH83bL97DOTFaCe9VQyVOEi1jUvHQF/erssjDDP+ciIkDCFM3CHjchB
	 IGVMO1R6Enwj/ReY/QvWF3TagSiaALSs4y3FJFIPSoNeOjr9RXhHxnqTf63ebvHMU49YY
	 9IBnZN424wl3CJ4jkLyWWIDHzwuPiIW/X+qmfCq2zj/CZ76HGddbA9dv+BTnKeC2VixNb
	 R8n4xyPNAelnyaecsygsP0bDM4/V1Z6JpsVXlCfCV54M59ZCmjxplpU61gHN0A6+TNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035842;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9htBe2eFk4+deQ2QRFbOWBQMeqtt1g9YAeqwecGhApY=;
	b=Hq1VZqAKmZy25na/gIIRZEXZ7PsC8AZ2lJ+WaAtFWsfA/A6TFPLtpLBBcxFujj+0EKET
	 J2yTwwslI3H01QnBYoffGaCWq9xZXmzesm+8ne+MjDSp+DfHuTYKl3gC1U3Va2c0ov8FU
	 dNHhasFQ2X9KPx7w1prd0Ssdj3swlXevfPsrxtHYY75xf3TAw8prDRaqI7cLtswRB4Xnt
	 21hRWJ8NWJml4d2JWN359zKn5RGUqcG5bsD7Qp+AVOsxbLMr3bsr29zcoUNRBdTkkxyTY
	 zXWO+PDPBONLfEk0ptZf59i9ztRj3ivwt1s7cUNMMVK0tuuD++jVVAzuwyt6YvBjxvQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035842;
	bh=9htBe2eFk4+deQ2QRFbOWBQMeqtt1g9YAeqwecGhApY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AV+v+vS9w6liI+kXlYuMd4tlRWXY7rXhtBimehuq5ggFmTukZD65Waa8L1x6+V/1E
	 TDjo35fKjV3+E2O5rHY6vRHYmph+mClzYXlfBl/jCt0Bpb2kLo2Jd0yal5reDXkZA5
	 fKtrujQ9Y97BAroSm3FuNWJhykBZjm8pSzl57pVNWCC36g05Gt4oXoB8VD4JibzPsa
	 BVIDFGJ4FASda/2WB+R4BwqrDsUTUWsVWvFXoAlmllIgeCyT/CaziUW95Wv/NvPELQ
	 ldmh+PUBjIam6fjzeMWeCh81Yz62+Yk4/oOuEuvGQ30mgGdCHyBekDYg6kFYcbzqZw
	 EInqL0IvI43dA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CE4C60F3D;
	Sat,  3 Oct 2026 13:57:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BED939DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE37F414C9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qr1GYnwD_1ig for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 85441414E4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035815;
 b=BxeHTLv91m8wZ147WP0K6OqDiZY0puzQdIgpC3GCmnKO1SRUvLaHKEdQS8GRcMbtFnns
 JqlMh3JiqmT2MgcoJ7UULF37XdgQlp2UhAIKtSLewXyugYRX3WjPcidFQVu0rGZ9ru9r6
 NXLqFjTtaDht/QjLheYVYUupXox6o8caw+cdm3IpaNF4Nj1mkb2iZG99OmXMz2aXZZdtK
 4zvIfAKy4FYB92sa3FlNwBlB+mRihCAM/U9ubLkosqG5XarlKtIygbxFFeydjvcMSPw3W
 2IAIfYhs20YU95A27Uyw3ldpz0tWNsfE4YMRvPNcu7t4+g0tiN8p8HuMmAzXgQgIjug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035815;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=tITJpP2EKDOlnmbTAn0I4g5B1Xb/ANb42GacIEP0bTs=;
 b=BskREjKlpFKvc2gcp0zOgekw8dOV4YHT090kdD4mtYwa5KRu4rfO2CvOQ/Nd5np1cYAF
 p4OUBwQPeu4MdvAyPClrcVvT6vuHmKVQ6asWUfm0VXGfRrGpHO73q0TsOgoXuoeK4wdHi
 eVfy9dHNytX30qW439DUekKltyiGagmllICf+gMmM105MXf3g41oPcp4ouusLlh3qCsa1
 n0EJKuE8af+FQ9MRw/xzP/NDlcyTRhHX/Lygkm/ySG/pneLqtaTs1hXlSGY4ohvj+jgT6
 FCn3loqh7CU4DwmlPPEGcwLidPL6cE+8IdGE9PwGHku688sIy2/AVMi2urte6TvAUTw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85441414E4
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0F0F8A31D; Sat,  3 Oct 2026 13:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42347117dc606fa4f825cb129254d8071cfe6fe2
X-Git-Newrev: 6bedb0de293ac88558d49bf3ea9c4d0ac14883da
X-Patchwork-Hint: ignore
Message-Id: <20261003135540.D0F0F8A31D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-poetry-core: bump to
 version 2.5.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6bedb0de293ac88558d49bf3ea9c4d0ac14883da
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-poetry-core/python-poetry-core.hash | 4 ++--
 package/python-poetry-core/python-poetry-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
index 9ea47dea69..be39876d65 100644
--- a/package/python-poetry-core/python-poetry-core.hash
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/poetry-core/json
-md5  75622eedc30fc131eb3947630aa622e6  poetry_core-2.3.2.tar.gz
-sha256  20cb71be27b774628da9f384effd9183dfceb53bcef84063248a8672aa47031f  poetry_core-2.3.2.tar.gz
+md5  ad4701fd3a73d43eb761131b5916f66d  poetry_core-2.5.0.tar.gz
+sha256  81d04c9253b19d0604718268d781867c8f7b2128e5b25bbf1e84141eec6b89c4  poetry_core-2.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
index a8db44e24d..03cac41c42 100644
--- a/package/python-poetry-core/python-poetry-core.mk
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POETRY_CORE_VERSION = 2.3.2
+PYTHON_POETRY_CORE_VERSION = 2.5.0
 PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
-PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/10/48/5b4f344c252ee2f75051b6bf7dfb68ab53aa00a107f5f8e5cbf795701dad
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/42/b5/50f1fda26c4fe5b1d6ce5cdf0391bdfa1ca12fdcb8ad68344d5cf678fc90
 PYTHON_POETRY_CORE_SETUP_TYPE = pep517
 PYTHON_POETRY_CORE_LICENSE = MIT
 PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
