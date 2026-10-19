Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18043606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 07:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YnpH67e1
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB943607EA;
	Tue, 20 Oct 2026 07:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRGOPCTkB00i; Tue, 20 Oct 2026 07:15:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 04734607ED
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792480556;
	b=H/hKHY7vLPRY/3wqmkVmPke2eePXyJ1peVOTYKfHgBKRimBSfo6oCyZoNsv0qTw3IsFD
	 cK+fJ/it0IkIGDwxndPcwh+QKzKibewdROtWopLrC6Ujmve5KCoZqNyGqCVnF0MdS+6u/
	 MkU7AREKoKMKYErCDW3yV43r5dVbXfGTzQ00UlAXafJ67LxPoWV24LUUUOr7PWeIU2VAA
	 PTmRMYo0YTsRLkKcyFLwPX/81GR9hYl1TnBeI2gqRdAIi1kojauG5nAR8W9TeOHcpp6mp
	 tvKJJUWEwYlFqjHPzgk4JIzcAM0z1//t6U6g49MDQqiAFSOeLg04GC7jWK1WkdGpWlg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792480556;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rDU7UTkK6he9mU/9FB/j8FQwif0tP4oOXqPhpSmBVzc=;
	b=FEITnl7GR5ZubgoS6FpbG8YvvYja/GJZms1updYTRYy/RtkhYAVYG2lcGFOeno1CB7jN
	 Lz23BQMoPOnmTP+02eEymr6U+nmzyVrE9v6KyioZd55EBSahPr6zNYkQ1vhTR4sw8ihGC
	 Af1E2CNxljlB/Mtt94aPFXmMDOioMA3CKizh5OzK8fi5OI0pe88FhuvkOMEV4IB38Pk/d
	 TCcficl9MhniKifT7A2XOZ9ySzL2U4GVrU5wxz3EHO69ahC0KXG/xqPWKpLHMi+N/N5Qd
	 g/k5ACu3/aFu0gYHGNsm6IcoFyxMYKdxnKuMtCRre2j8d0gUUPpfnLhaiFuUtFMRXGQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792480556;
	bh=rDU7UTkK6he9mU/9FB/j8FQwif0tP4oOXqPhpSmBVzc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YnpH67e1n1xFDV6hRV+gv85rGKPhPYqJB1EIhjZfVxymKfJ4Jl44omDdx37Fod+rS
	 qikQUZgGyC3pFj9yyvTMJGwcMAX7xgL1F8CvGv67TAFkqc8WR+Yy7RZ2HXrxNKA2U2
	 4KFsKHNN7UN21e6nW3s42Shiq5diHKdvF7GDScujNa61U7yifZ7cOWQBI4L3aRGnba
	 T2CStjL0eQ4o4u79w0v5PlQHb/iOsGuEJPyxan4XkM8zJDSmymTK05CM33NAYsCY9p
	 aJfIQTW/H64BL8HWCyiqzxJ5PuzO6Beqx9zIzSfCeC35DVG9N0/BdSm7SsF8lCtoq/
	 hufR62imTrLaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04734607ED;
	Tue, 20 Oct 2026 07:15:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A0DF279
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BE6B40313
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yNeXJt6SN9us for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 07:15:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D56094016F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792480553;
 b=qdmEvKQVhbTfaAUvpyROy4jD88jkz/UuFvQsIYY1pCMTWzs3llu6AwVLtN+PzS1cFTdG
 ZB7w9A8PDJLltX7rKeYGiQUTashOU/8wMFitHei57yKiogs/bDHTIMtCxXutNnrrR+5Sm
 LqxD+pGCyvvxqMnKHeSZJ5OyOk2pKIm/Z2Rl3N1cZbKL1bLfauaj2W2DXxMBPIvc0j0VN
 /f5PO/YCxqElOH0yxLYqaZN0NfiJcFeN2Bpu8ZxSoj1nA4MY1hvR0WL9ul9ErDFGZBsmL
 APhWSsywwzSeXY4gnCLRBx6/trBCWwPO8CeCnsmlltlhrxPnPq4nhaaEYd8gZHJvGrg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792480553;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Z9d2NrZVV3XrOUc/OduWHcXV+WhaO7UzYuZtMaDv7IU=;
 b=oyo8xqST6P0SI1VhJpjXAZo8jRv4YunhHQZx96gN23482motllEPa+HDtQHPSsJLOwv7
 R5z7AfqzK9h+CAtURuQx/j38hItFpApA8ZSUEK/ukyIKJarV/sY1BhYm9Jfl1FynGlyQY
 hBaeK8CzdByH8Y9yuN+FX0fJcPZIpeWLYWV7EJxtaj3d2BCCFQoqs+KM7bEYlSKboUaBB
 lLg9loBsMacG6FmwpdvveswBWAWp8LZ9sx9yNK77Ii1T9yy+CFmT+/n4adBJ3ykAhvfLr
 i7eLB075Yo8MFyt3+OYQ9Cdt2jBYAnv3OS/7bPGxcOsUNRwotNB0SyzQcYhhVrxB+4Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D56094016F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:15:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE31A9969F; Tue, 20 Oct 2026 07:14:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 23:52:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de94a27a6379d4fe0142147b980a1d2fea351abc
X-Git-Newrev: 5b5fc8431bfc234a80653db5772eb47d65305aae
X-Patchwork-Hint: ignore
Message-Id: <20261020071430.CE31A9969F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libheif: security bump version to
 1.23.6
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
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5b5fc8431bfc234a80653db5772eb47d65305aae
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/strukturag/libheif/releases/tag/v1.23.6

Fixes the following CVEs:

(CVE numbers will be added when assigned.)

CVE-2026-XXXXX (GHSA-h4h8-qgvc-m7r2)
CVE-2026-XXXXX (GHSA-fcmw-5764-7rq8)
CVE-2026-XXXXX (GHSA-6fqc-p7r8-2g36)
CVE-2026-XXXXX (GHSA-q7mw-2fmm-5q94)
CVE-2026-XXXXX (GHSA-vv35-6hxg-95x8)
CVE-2026-XXXXX (GHSA-8p2c-9wv4-rx4p)
CVE-2026-XXXXX (GHSA-86ch-j429-fpr2)
CVE-2026-XXXXX (GHSA-3gwx-cjv4-jr74)
GHSA-hqpw-h8p6-22q9
GHSA-hvwh-xpj6-ph5x
GHSA-v5rj-g4wv-j5w3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 30265f4aab..44e9c54781 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.23.5
-sha256  fd9036064c4432f0550d15072ddf34956a248279ee9aeaff0fba3fa0f77d8f1a  libheif-1.23.5.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.6
+sha256  4484346dc5995319dbc11e3a1c35d0a2ec46511ce370900869337fd2c7033125  libheif-1.23.6.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index cd171b9637..179c952566 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.23.5
+LIBHEIF_VERSION = 1.23.6
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
