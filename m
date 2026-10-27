Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC1F606A31D
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 19:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rtOXPoIy
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EF16606A8;
	Tue, 27 Oct 2026 19:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnTMCHn0jKAG; Tue, 27 Oct 2026 19:57:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 825F2606BA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793131044;
	b=i88rBE9LN+yQQzHR2yw/h8T9+IBt8KfbGkMzau+aKdaymcyvLzwnilWfuRDhRoMXHwoK
	 q+nx6SzoctE7aqLouGYk12czpJCoGFLM9b+T2BCAEFniIo5haEh1964BvtKmMB0erQ1AW
	 Ir5fIT634XNXtf/9orQHeVmH7ba70D2UhflZXj6Ucfiy2U1qhx+waKd9evm51XKcYOaNd
	 tTTh2XvsbRx7c01PVM4tYTyGVtP0xSYm3Vjfwn1BB7vOhZmyi0t+Jh18h4CBQLDuMRMWH
	 npcUz3TOMYXCvOddzjJ98FdRKDzOqDO2mWIlZGwsbodiUqUxQfjTlU2lm79vc+R6CxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793131044;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PR+cmU8YQgU07ZAw7TFoXwEg9YmEcYf9fI/qUnUz2i4=;
	b=Ncl5/GqZvP9u3Cqmt8yUpzQkLXmq41QilAzq1kqOKV95AwChI8pkm/6fetNQ8OxDYtwD
	 Z+mn8y2Y1MlNce5PcK9dT0rBDsadzvl8dvzyKQwtVWHAYkmqsQRbTimsgP8LRmEeL3QBU
	 vC/cUZlP+Q6uHo2FLP/zD9pQ63C6742ZXVLnriPfWKbVp1zSHkbhBF4s6MVIBQV20x9Lb
	 oDeuVv4YQin+T56nJU04bBFo9WYaOfFuC2XLsNbN7h5o4SEzSRiEO1DMqHaXUB0APO+C+
	 wC/7CrYQe2t0nM294HH/qHVPx/z2XPLBd8gvz7isX+AUQgHhQfTqH8xRwXUD7B9GPfw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793131044;
	bh=PR+cmU8YQgU07ZAw7TFoXwEg9YmEcYf9fI/qUnUz2i4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rtOXPoIyXrRfstIsWejX4xG44P3Vr5JP5hSpq9I7tnSntFK0bxxFBR4iyfz8UsyPp
	 AeyH28TOI2Yf7qV9pFEo+7SwH1ct+qJaK594A+cds2Gaq+9zaWfMfhNvyzcIeH17z4
	 Uxw8C8QqxnPeToOdxa1/XT+la4qJy/HIyqMNuEOF9vO5LD7ST5VHPcds7mOt0h3Ut8
	 xp5XTtrwUYVQOOP1skAtoRgt3UqK4/PBrr0bvTJYB5mVOa0W3CEzelOGt2RrqPdAAy
	 TbDX7FhZClT89Q8rpiAxEvL7E32p/uLHtoWRzaI3ILiRY7MQbHy6q35f7a4qRB4URW
	 /yAkShkCL4tVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 825F2606BA;
	Tue, 27 Oct 2026 19:57:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E7FAF529
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE0CC40112
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3OemSnlYRcy for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 19:57:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2BD8D4006F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793131042;
 b=VyaPQL6xQZG+7JfWJ9Witch9zZDhAAfayykL3XLhK4W3Z8r3i+wk9JsYcxbQQd8hoWE3
 EahTPOkZLdGx6+6ZT9Dn/LtdiAKLSojImkV5KPh3H64CMBGYUwZrUab8r52v1fNPAuiWx
 819sPu5Zvo2uFR/XW49ocbpxMv2FjG664qM0ZYAxuGCP6N10e9CTvJiWhzdxnSFjLNYZS
 KZQdDCZW02ee9ATBTxnaoeiLpIaEPQCYlTwNEhdqEZHnqaHwtZwGsd+uiR/ZJNW3kgVSv
 7IymgnulZpRuQiQVvzdm1ptaTVjJLKN3Jimjsk8RkoCNgQd6pHWZoZcGVNSfHpMuRGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793131042;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0VY9Oe8sENqRQZ1cT6sfZb+SO5egQtiUAw6wuoADzMs=;
 b=acfrefNE8VUc3ZhWILDcNrDXpBCvivFRl6OShtapzvsORLudt+rMoF9McayA/DwdOL97
 JKI24BAscGdu7KJMQC2Ydtw6V7lVxQI9G4dX9TdE6X8+WR49I7lFdTDmuv5td0UfygFCn
 TP1c1sWlp6gmU2o+LME9kmkrH813bpEMSwUu3JUBYHC7kHmpZ4RQtd3BWs0sAsU31aMzS
 FA4h4FP45ALat6j8zXxroZRlPilmm5YdzBopHGyZAc9GSNzmKh660f/G03tm3Q3oX1qTS
 hbKMd01YwPXlNC46QcOrtIbeZkf58YXiBrBIHldeBx/Bw3ThfhtSI8EIRvnOJyCQYYw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BD8D4006F
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:57:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7797B9D148; Tue, 27 Oct 2026 19:55:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 20:55:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d779f9d69940704090da7edc03ad0598b1ac5d1d
X-Git-Newrev: 5541e44c0bb0675fee4dc778e4c38c347e0ede96
X-Patchwork-Hint: ignore
Message-Id: <20261027195555.7797B9D148@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-update-modules: bump to
 version 3745bbea3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5541e44c0bb0675fee4dc778e4c38c347e0ede96
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-update-modules/mender-update-modules.hash | 2 +-
 package/mender-update-modules/mender-update-modules.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender-update-modules/mender-update-modules.hash b/package/mender-update-modules/mender-update-modules.hash
index f6de69c42c..08dd47cf98 100644
--- a/package/mender-update-modules/mender-update-modules.hash
+++ b/package/mender-update-modules/mender-update-modules.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4846f39abc254ad2ae2a9f3d5479b064bc1bae5034b9d276ebdb09d8c60f4541  mender-update-modules-d8c4683e6660af6c65069e10ee4b8ee50ec1af46.tar.gz
+sha256  52b3b19bd3ad437caa7d1bce7f4766055a204909889f3436c8459da28dcef771  mender-update-modules-3745bbea3fc8ce73cf6489a58fb77dfb66660ebf.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/mender-update-modules/mender-update-modules.mk b/package/mender-update-modules/mender-update-modules.mk
index 0024acc189..d18b5111ae 100644
--- a/package/mender-update-modules/mender-update-modules.mk
+++ b/package/mender-update-modules/mender-update-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_UPDATE_MODULES_VERSION = d8c4683e6660af6c65069e10ee4b8ee50ec1af46
+MENDER_UPDATE_MODULES_VERSION = 3745bbea3fc8ce73cf6489a58fb77dfb66660ebf
 MENDER_UPDATE_MODULES_SITE = $(call github,mendersoftware,mender-update-modules,$(MENDER_UPDATE_MODULES_VERSION))
 MENDER_UPDATE_MODULES_LICENSE = Apache-2.0
 MENDER_UPDATE_MODULES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
