Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CADCCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCBFD6067C;
	Sat, 10 Oct 2026 09:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8fv-IO_QvHv; Sat, 10 Oct 2026 09:22:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ED0BA60A55
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624127;
	b=FgBHGbVqkL2jRLeG929z9gozi5D/F/a5mcnw1k9V27t5N4W/DzCzfyE1iwEn01MuuQPf
	 iANvRA2UQ/9myu6FZ6JVnGY7N2UGRzERzHAitSycJBCSbsx4/v/jBX0y9bJudvZjFGX+X
	 fhh7HhCsVRkQTD8Z+unK/sUksX1WpJ4t5d2yLcbMPjbYXwiSYtJ3YjNnEd66f6i8AYDhW
	 vBh2jX45Xm1pVcPLjfHpvGtrQzPZp7lyJuJpMKoSgAYisVfZdXBjsHjS4DXUcVtAyXxWc
	 +JjO8NTXRSJAy3kxIwAPb8F7xRaDWqvjYz+a9aAk9o1xhBZcoDDPzsZnouh2MWqD+Tw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624127;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ZbHFT6PwC7nf7V/OnqLbQdw482LgBvS4WmMySZW9oGg=;
	b=goEukdTGKp1KMYIcCfDnHX2f/zLfjSKFLAfqDJ5yqrdatBpoyILbNnuewNnfVSmJvCe5
	 PWfOJd0GxIi5yQXrMCA+GbikbW4MALnnY53aqLV6N1arogLwLWZ9UtJWbzrW0WPtzUviO
	 qnAybPiSBnu5Vp9s85bFaagqcX4qSLAuI42dxBu969pucaQRjQQ/awSjY2SG6Jt2yC+8S
	 0eUTmAUdTfAMb5LNkz/yOQrzTZcSKz+Z/+nM8U1crOiUNekRjTQVQ8au0BlekqaCmBp12
	 vAT5uzSueawD7PaVn6wVJ8+uRV11aCyR8rtA3AKdtRmbHvLWC+AhcMxih1ViN9qWRYQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624127;
	bh=ZbHFT6PwC7nf7V/OnqLbQdw482LgBvS4WmMySZW9oGg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P8UIFZfZ7T4KGs0icgbjHkqy0IGXoVowoEt/7tN37vJRfWf7kN4Zc8zTYkBH83RKo
	 JwJAEHG8uUCIt3bPxKiA+wZW7qjidAgeibPwqZSKD2dmc4wrtGpN9fFd1+rgtadcYZ
	 u/HqVaSfrZOVK8wNKD7nKqZu4cRZ/ixsEFRsbQS1CYtPpRkjoWYCeM/3nC2HoJWJ+2
	 LcdaPwV949IZ+7+tmZ+Xi7Ni3PTPU0yWASnINyjC63ySdSecapOErOeFwcrjA/b8/S
	 3y2E7yvEMjlQWOr7R7o/cSJEta9rkU3vkuNb7MCvaIQhqVcm+b6BhhivIExWLIa+Zq
	 xuWDGIi/4Q3RQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED0BA60A55;
	Sat, 10 Oct 2026 09:22:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FBCDDEF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CF85812D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnPtLuhDS_VA for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5D5E6812D6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624087;
 b=TRDZi3MpcKKhfVMCv27uXr+ryVgBRDgY4MZluuBHQ2HeMBMQVo1R5NCJRrBfJKrT9Xh+
 tHaXzmWneqMDm56jxdJqpIDNR8uX5UpdbVUTkSo1Ws32rjk5ha/Mi0WPbQGvOgYa43isB
 WEIUdOvlVl7BZ+SX2p4bGpSYb9r2wny1s9wO+j2XVMHLb757oLZYqAocC3/iULKMGxXQF
 66Mra6EI/NjieP+wIYqpqqHwqO8aAyLVhFZi9sTGcJLh/8Yrep7r/00KZx8rvtY167w1E
 Vipk6GPH/fA4M+jzyIm/YneTz4slbrysPpSWFREMzgwVq1yf9gQLtRgHTeXGxpblalA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624087;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=D2abDbxRpe4ZQ1z81XRDDWw18rLHks/JnrNKlKDfAtE=;
 b=QHUCMkD+M7FIWh77LTMKW+4pfrrvI3pq+gXe9RzOmuOzscUAwFhli1HPEEJTcyLExo8n
 IU6qU7MRfgVLCuSzDiVEslHkb8LNSx1cSqRHaND3fcz96FIV7dXQGGKW+tR/8y2vToppY
 ZDPZnlLJ4OzK8rzIENwGLMIvfu89iFPmolHFY1lckwvVdHvL67TnVUsE+uNCFId/QfG3m
 vq6rk92mrAZWd8/dnNuDmRWKwf0ydygTcA7q4+W6Osz5246dluz9sFb5RvypG8l9OvL/w
 trlFdJ47Yh9Jz5RN4UcHGBirj0ZnuzQQ6/Nk/nmO+gieTNb/IlZQvcjYTsp5lql+rxw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D5E6812D6
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 473B48F0B1; Sat, 10 Oct 2026 09:20:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:09:12 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: bcdaf252070fd4b742b84744bc200ff344142a0e
X-Git-Newrev: 6d271094e808ab66f1222845896b63aa2111038d
X-Patchwork-Hint: ignore
Message-Id: <20261010092009.473B48F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/suricata:
 security bump version to 8.0.7
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5150162419727796389=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5150162419727796389==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d271094e808ab66f1222845896b63aa2111038d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://forum.suricata.io/t/suricata-8-0-5-and-7-0-16-released/6315

Fixes CVE-2026-45764, CVE-2026-45766, CVE-2026-45769, CVE-2026-45768,
CVE-2026-46387, CVE-2026-45759, CVE-2026-45762, CVE-2026-45765,
CVE-2026-45747, CVE-2026-45770, CVE-2026-46352, CVE-2026-45767,
CVE-2026-45763, CVE-2026-45751, CVE-2026-45752 & CVE-2026-45761

https://forum.suricata.io/t/suricata-8-0-6-and-7-0-17-released/6391

Fixes CVE-2026-63452, CVE-2026-63450, CVE-2026-63449, CVE-2026-57227,
CVE-2026-57229, CVE-2026-63446, CVE-2026-63448, CVE-2026-57224,
CVE-2026-63447, CVE-2026-63451, CVE-2026-57222 & CVE-2026-57228

https://forum.suricata.io/t/suricata-8-0-7-released/6467

Fixes 67 security bugs, all CVEs are pending.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 510003c0411a915d71709417e53d2bd62be9f999)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/suricata/suricata.hash | 2 +-
 package/suricata/suricata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 15f7e666b3..a5b7807d60 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  81cee7bae69848a9751b2ce0867620eefa52b192e79c20b5eac897600b28b191  suricata-8.0.4.tar.gz
+sha256  a9d46a9c8f40e81f8a6df3ecc2c5a9a8e8da985876299108d92da547c013ba8c  suricata-8.0.7.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 56bbc0c89b..d77652162c 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 8.0.4
+SURICATA_VERSION = 8.0.7
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE

--===============5150162419727796389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5150162419727796389==--
