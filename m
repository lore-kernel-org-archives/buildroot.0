Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1371CC88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 16:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1A6080A49;
	Tue, 15 Sep 2026 16:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LT_TEWuqn6u4; Tue, 15 Sep 2026 16:51:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D29888099D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789491062;
	b=PPS2ww9vKtxpENj5T4MGG6B3qbI6btAetvCM1jIRtvx2KOi8fUm7Yy2pE+xSLqdtmUzV
	 cn2jvZNQGPPm7HhnOqoSvekq9sFltFhslRrdwim1CeubjGOfot8r5OgcSv9BpLy5Ez6PR
	 V0TWLIQEGVU2rLLo0xbzdBgwnjBeS5uODsikoUc1be6viUpBTKbgFFVS/YVQPFyF7tDqd
	 r2c7NjYtNVeycnvPV/lfb9sqeMhqci5wtmahSfQ6lNzxz4cJgZuEN7ua9gUWPse+oaRDJ
	 rpoSk6Drf5KS194uTRVRlYa9xuwquOEyy1CXQA2RfgPiroOsyxyDJLDpfoTqab0DKBw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789491062;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=U0f9bArhzsuu4kTApj0jx3G2G530FqWh2UKxqX1MVqE=;
	b=X5tqHJ16pTuNesTRV+uxIYymUsBLY2o5vzqcZi3H8h0yX7p2X2+To7H4q4POD0nzn5R6
	 vLPPqzHVMxxlOCfobUw6pPpdBTwC8kZ1GfXce5zX6b+8MKkAvKdWmW8dY4ohRRElzFruX
	 E3F53D95SfapJzAGolF95elcEz4Gquxt7yIKscsxU9Fh6b0tA1PXSYIxqmkEYbZoUlZrq
	 8BNnEKJfFR6rrmcteRNBPUNYEnRwFc2KdN+6howGQdR6cgsIa74GRnHFPtw+ki5yG3HFp
	 gyaDxySx8lrHP3qCoFG3Q/M4tNx59Jy/CwlGxp6XgY6rRPAqbRkgUYFpLrvU0Oy7KrA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789491061;
	bh=U0f9bArhzsuu4kTApj0jx3G2G530FqWh2UKxqX1MVqE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R6B8sKPTMWYyFxlxEpunrbFbfFIx2218ZoRVd1H01sIxDFXNlZhXzd+UTRaJ9yxHs
	 DdD6jIKqp2S+AwHZlBrZ7dcf/+JX5Vewm0o1KceI8PlC2O6leCu5lsglj6ZlCEH9qt
	 ht7g+zsI9uP8IzJHHykDinjVMOyqiy5MMduiWNw85M0fMXDXUAEjuIlqQVdyGsm84V
	 ythD66kRHyDOKjOkK9gA06Mso7kzb1zngqbwsOkOBmIwK6xE5qOdz3fQVHLN9uEG7q
	 CTODglVMsoWJFgJQRsbpKojDv2ZhY1CTTxcby2QGmR3d9woaN1vbzQRDIbox/IcLPX
	 /gh0IUR/1sNyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D29888099D;
	Tue, 15 Sep 2026 16:51:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BBB63AF
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 16:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51FE640557
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 16:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3RTHQzIEGp2 for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 16:50:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 968EF40535
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789491059;
 b=V0sNBpBaiHS3b2CtTgkXGz+7sYK4budSzNKgz61enVsQOO36Ui5EtJcU5KlPwyKf4n2U
 bYaNgWjyG0MF0UGCctsuiWNez292jZwqOPuZJUx18ZzHLTdu81fbYUjIpRL1oVzYeJ2W8
 2V1Yz2zVoIAGfBW9Mz9OAr/DW10OkV6SkDLAHxsfDVfU6zk2cMvx0JCweuHrztGR9WNYj
 +hAw0fu9uEuBpkgwJ62+ccikXwbsM32U7bSmnPTf9CiZ/r7JFHI15ZugsRQaowo61sICd
 xPg6x3l3GW0kZin8dTNjj0HtcM6IAMu/a20tpaTA39qnxs6kKRZoA8vhzJf21ulutLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789491059;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=J7eCa8x41Jh3TjxUEaE18W4Ij+DI7zZzER4g5aMoSiw=;
 b=Ba7oQgNsnXJNRJadObS+vJJFWjSWLJ7fZBbAZZLFMt7t0kSIsOiy7VAoIO0AOi/aVDSG
 oXviBd3LiiSmtTUP6ECplBbbbVkyXkarA7xGnkCM4pOBX05QxpLGlTBI5NBJEKtTcWK+T
 DxmfkB3K6ZH8cm5ekk8dXR97/29JTbB+SH+Z63sH7hbbGeG4c5qghFnt0ZqfVKivXSgB7
 ivToJic0aQwdv6LUWGNyVcUJG3ENanUoeCihObh767R9Ol5sP0HbGiyfr3ZV+WE5TqX+w
 yBi1td7ZpS8OknmoKSAMayPovTV6gs/znrI6PFeD+habz3Wn/aKiQTVEJMkJEmcDpVQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 968EF40535
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 16:50:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F22A95CD7; Tue, 15 Sep 2026 16:49:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 18:49:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b26324b6c0c6d88b6632bfbf0c35777c646d436f
X-Git-Newrev: 053c724d6efad1412f2a6c4b460b0f0c36517085
X-Patchwork-Hint: ignore
Message-Id: <20260915164953.9F22A95CD7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libheif: security bump version to
 1.23.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/053c724d6efad1412f2a6c4b460b0f0c36517085
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/strukturag/libheif/releases/tag/v1.23.4

Fixes the following CVEs:

(CVE numbers will be added when assigned.)

CVE-2026-XXXXX (GHSA-vg7w-rp49-4fc2)
CVE-2026-XXXXX (GHSA-xrp2-63fq-jm8q)
CVE-2026-XXXXX (GHSA-prgh-72vc-3xmc)
CVE-2026-XXXXX (GHSA-fqpw-fj22-78w4)
CVE-2026-XXXXX (GHSA-4rv4-953r-p24q)
CVE-2026-XXXXX (GHSA-rhgw-q5g8-xjh2)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 6001e84ce9..78f59f6b67 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.23.3
-sha256  11c1179e0e4bec33624b87f22ec42c1e993a40d946d44d26f9c431cf1456a863  libheif-1.23.3.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.4
+sha256  d0c02b4b0e978f34a1974b6f3eea7975a537bf7a9195ffeea38e7242ff316fdd  libheif-1.23.4.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 1614dafc74..3428646016 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.23.3
+LIBHEIF_VERSION = 1.23.4
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
