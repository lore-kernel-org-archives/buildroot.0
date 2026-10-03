Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89482CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 17:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3217D6069C;
	Sat,  3 Oct 2026 17:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vh_0X_yltnK1; Sat,  3 Oct 2026 17:11:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 35BB66069F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791047460;
	b=Js6WZcyu+M1YRF0BODMOTfecIyAza1R1D0t8qR3ssnWUXVQr1A4kfFmUQ0j4edTpYxK8
	 wJXfYZNiuVRmOMg6QA1fuj5G6eYBxPYKvAN+mrhUZdjCtnp10H4PK/KFmw2Z1d7YWFOLF
	 WycBCRM1PxamGPD3FvzNe99MObJS+I1iAkipFgR5ADbQPflG5LKODZc7K5aeI8y5A8qjV
	 bjeCA48JJGAHQNykWUiVmDsidNbeWk77BOc2cRv65oeZauTSdCp/Fk68BXyx2MVGE+CA9
	 ZAYqAYPex6ZVi67wanN40ZcS5lE9oGg/ee+XbXlvs3a0R0IBkq9oEwgEQUBmkhhph0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791047460;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=v2AE2Cos8zpUQ25Y9svCQCcaAx3O8UqogAGh6CS2VoU=;
	b=ar9WN0lkCdcRgOlIUBHmdCrFB3r0+QAGb4n0sbPRszYOKf5BIUIKLPsv+5oFuAc13SF3
	 8Tysoo4/qzOeR8ZYMNiA/9L+6oLwZzpi+Unmy8wBz4LYa8wmv5ZZyvhzVpO1mZVcgH1s5
	 6WgJshTbQOej/S33YoXb7DEAdShl6sDAFKxN1j/RZ3Eev7RRJKmMz+Bs/eGgghDWOmDRt
	 5NIr0OAqO4mIQGgIc+nFpNeUKyqSKvOY2fnxC4i//JKL2NUq026wwMTIUxq0TbsUtHZCB
	 DNM8CXDUI59m7CkdN9cdnSFbXrShxJpPUalJI73sXqlfSYmRvRVVAjKXqMZT3C9WoWA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791047460;
	bh=v2AE2Cos8zpUQ25Y9svCQCcaAx3O8UqogAGh6CS2VoU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=oG9+BoaZqBQa5aC0fBbOzBG7Vqnkm8tfD3l9kgYSFRMtaCyZOi/LSlV/mexzRuZk1
	 v9cYy4VF5YMNRgpXnA62eGLO4xlJWdyJ3AucMWBuwW8APCL+BEZt5dyPjwvpULlM9+
	 ZvCXmgsSFXuPjbqlDHj3iJ0zSvPH5mS9A4S4I82G5QeSB5K3wBiAwwrD2Iq+VPD9vN
	 r9IKFIbfOokrPTLXrr41Y7I+SChkxZdZ4+31RP1qBzT92tzqds3941hDeU8t2gkDbJ
	 vVA5WxXWWMjZvZEeYW3lb/VgcJOukhScVn1Kt8HgZGwuPN1RUaaSNvw7sRh7sVKF1E
	 fQu4bOuXaRJoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35BB66069F;
	Sat,  3 Oct 2026 17:11:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB07A435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B06826069F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hJ-Uk0IIwgj for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 17:10:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8F48E6069C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791047457;
 b=YEylNBiMvciwnpbNa2dUSULgyJdjF4WOBUDobFpYoVvoV/PG/mV/gD24QSM3rCME4yAE
 rBqEAevsNFRErWtVUDeiJ6Xd+l+JxSuRoKWbxirkzZ0II57YPH2Dq1ZCDHyAPvJlRmZzf
 kJfz2uQsCTsbUDKkqHQMv9ehxtwWkHrKKMv9UbkZAxqlqLq84gpz36pHnWOyFaygkIkNw
 ZdfGVC1dcZMjppIy1p0J34J8pvQFmLtqViLdDqHai2iNk+pWsYWf6/mDgYrXgieT+yoB4
 vBlH3+IQqD37hxpQdmFmmTu2ZtD0QUSZqwFw6uD8Z/kfO27ut7vPbC4wV11j72Vy95A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791047457;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=hSng2b7rlWIgszy9TnZAHnIDUP+wZYHkvpSu4x0dzpo=;
 b=JCLScm0ZllnWB/DKBNFNXtR1m+NBEe5q7irarZuTf+bRbqWDsTDzR4/dgto6JvA9mBUx
 wJJmJQTDVYLqhxW5dIpiKaytW5cU43TZ1i8Y3CvA5i/dif9ko/2F9+5Tt3vEAr/F+0LOd
 /2TiXHSo+Hhl/kqF0+XYfPTJ5oBeYfCGU5IzLQNxVQxJn2Q774w9UU7Z4Ncoh5NG2mggs
 g1MDV1IBRseyDT9LupQLmfsk+lP+WWGu5HeQS1ByqRmE42mKzmGPUgGjzljCIwEiu1UjJ
 Sserf+pfir0sNmze0Ldnz15Pjdmj/RhxnXDZxnMuW320bQvXnGZ3SLBQNZRCqSz1JGw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=N00blX0c; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F48E6069C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:10:56 +0000 (UTC)
Received: from home.juju.sh (unknown [94.230.151.199])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id DA41F60132;
 Sat,  3 Oct 2026 19:10:53 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat,  3 Oct 2026 19:10:27 +0200
Message-ID: <20261003171027.115082-1-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/acpica: bump to version 20260930
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 2025121, see [1] and [2].

The Github project URL [3] now redirects to [4]. The CONTRIBUTE.md
file was added in commit [5] which mention this new URL. This
commit updates ACPICA_SITE accordingly.

Upstream commit [6] (included in this 20260930 release) added
actual license files. In previous versions, Buildroot was using
the source/include/acpi.h header files which was including license
terms. This commit updates ACPICA_LICENSE_FILES to use those new
license files. Note: the license terms are not changed, so
ACPICA_LICENSE is not updated.

[1] https://github.com/open-acpica/acpica/releases/tag/20260930
[2] https://github.com/open-acpica/acpica/releases/tag/20260408
[3] https://github.com/acpica/acpica
[4] https://github.com/open-acpica/acpica
[5] https://github.com/open-acpica/acpica/commit/0d90f9616ade4a70acd050c0b52aba1cbea71923
[6] https://github.com/open-acpica/acpica/commit/58b9cab48f3f00d8f31da9f315d00f97645ad549

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/16914324421
---
 package/acpica/acpica.hash | 5 +++--
 package/acpica/acpica.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index 75a3fcbd90..768e7b194d 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,3 +1,4 @@
 # locally computed hash
-sha256  486423245f8154dd0bb5ada9ae057d670210dcbbc4386e62aeccdf5bfdad5f19  acpica-unix-20251212.tar.gz
-sha256  dbfa87ff77586ffd8da1185981a9695e80db09b114b3b00c194a9bcc2292a95e  source/include/acpi.h
+sha256  aa18901b92e30749be0edc3081c8d550c61fce4fa37546fc6a65d367a4ae71a5  acpica-unix-20260930.tar.gz
+sha256  dcf670273dd9dc86a59d0f493d26034ac58a20860658fe3f8f49ddf687b01ba2  LICENSE.BSD-3-Clause
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  LICENSE.GPL-2.0-only
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index cab0693ef5..c7346ec58a 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20251212
+ACPICA_VERSION = 20260930
 ACPICA_SOURCE = acpica-unix-$(ACPICA_VERSION).tar.gz
-ACPICA_SITE = https://github.com/acpica/acpica/releases/download/$(ACPICA_VERSION)
+ACPICA_SITE = https://github.com/open-acpica/acpica/releases/download/$(ACPICA_VERSION)
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
-ACPICA_LICENSE_FILES = source/include/acpi.h
+ACPICA_LICENSE_FILES = LICENSE.BSD-3-Clause LICENSE.GPL-2.0-only
 ACPICA_DEPENDENCIES = host-bison host-flex
 HOST_ACPICA_DEPENDENCIES = host-bison host-flex
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
