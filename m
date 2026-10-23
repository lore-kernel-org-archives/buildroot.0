Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F36F606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 16:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AZ9MS2/K;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=A73QRxup
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FFC081499;
	Fri, 23 Oct 2026 16:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uzi3YQmnjyIY; Fri, 23 Oct 2026 16:22:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 799CD8148B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792772548;
	b=mwjP62oWYiYxKC/kh8yCtmkD/tEECZBUEp33X7anXeFcmLgpv1QNkISK7yq1D+RaoRBi
	 XanIQ80iHP9F/MRzg38tvqwHVGm8U7GQ+zGsHA6/46b2mpMwqXIiwhmtZZhwr6WJfal+d
	 DzRqEzDZ0Sn7PEkWuH3xrla6dtv9LNPsTVBWXa+TTVCcvFMqRikv5v2KlJcU9eUg8PPpQ
	 gYizyaj7QcHe1LgbyP47n2jzvpvTuATsf3jc9D6TYMvWO0kdf18TBpcf7JiZ3ikisrpfp
	 haDixK7GAVr0lINmBVNZolZHJNKDyM+9iLxavZ5+/6I450uFKplRMYeGLHjg48zhRgA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792772548;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=0BgsubtBOTj+tBVqAxCnF0EVrN1ZJeiguTp3/ti0XH8=;
	b=LG+ZJ5e4M/RFTou08Nz7XEm72TAVG/df2FY1CxCF1kuY/Ebq6Furlo17QPqa1Y4g+CRd
	 QYVJfFOgIaLZtGMIy2UAMMWHugpPN05g2ZDzSt9F5hoQE20Cf7WL9ZeV6juqTOL+HXgb+
	 0UP5l0hPkQIYTPYvxwEkAGSODMZJ9L+xrswCiY3I1JQ1wx8Hrp4tCc17ES3mu5kO6BoLb
	 Z4x7vpQ1xnTzZjTUzNqQRE4sQ2hrVTO2C648EFkScUTLyAB7Pg80S7vJwlTD7p8EqVLeC
	 QPjCZftpvj4fQ4Xp2YlJj+hjEDIthk3r3eYCl2rYz/+BpxjTwB1ySLcQKqgB+Ntf4yw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792772548;
	bh=0BgsubtBOTj+tBVqAxCnF0EVrN1ZJeiguTp3/ti0XH8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AZ9MS2/KbyLtBNMZaORdVcXpZ5J72V5XUk6dKyvnHU2ILAitVyg9uekILTw0kqJh5
	 897v6Q8R7oXvcwue77lGGFYKUZkWYWtXNAllwN6w4wmpE28OF/nkYprL7z+L9z0I2c
	 EyMdfrhjwB9PX999ZpO6uD6LG4wSCEcVT7XR9FXpciwcn0IHry2Josperj/+pTBvas
	 jCTzpqTfwWu+SRpgtZk1IsIJ8roWd4/NKHvVN4OHOXoYjb0wWdG2vWURhYIaZmaTOd
	 10sVtyIiQskT16B0FLsV0o2dPgA9HcaglVEeLhwcn8cVzjs1DepThVHBLMIXkIdXWJ
	 dq+rn0Nfqa6fA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 799CD8148B;
	Fri, 23 Oct 2026 16:22:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56EEB49D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 16:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C3256074A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 16:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Za6pAnHtSJPZ for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 16:22:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D1E16606EF
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.218
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792772544;
 b=Q2nxzzVk3hHLzHGN2orRWOP1CKjEzFKi1t6tP75LMCY5V+L8SO8poDpgMwKm+tkjLDaB
 ccPKSTSXtLQBanidFUd7yuney3pZVYWBOm68xrZ2iLw4Mz4ZXia46qhYZxwbSKpVdgXTK
 af56ivo7IJLb5qP46SWVrTqWqb3r58jSm/zrb11Rz1Fq3TLx8wPLYQMkdFlkJX4yCLZgN
 mVMJ0W0YYN0ZMYtGknJ7Ke7uII5i0rsPem7H/CnE/XPOaSy7xU6PlzVlreSHVt8qQN1tD
 Smm2WNRVIFcde2zBmS96YVmpY1y58o+B28uiga/m7ObxS/RPfCvOiveKbTR6FkhRJyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792772544;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=XPlmqe96UfWGcnaZ3lNQkcmii5yRU1pJZxv9I+sHC/Q=;
 b=QSWmK+pwwgxeqnbTZh+1uIH9RxjyMoNgZNCrk4P6pSCQ+s4pbNTQA4iV/oKt35hQnvR+
 9/u/jbNt/hl+9InlIMor/caLoh4DR2yPSaMff7L9y/U3AcKfETkgAczcqq0FMqxYOYP2+
 df2/yZ2wofvwLBnM1yPmdrkTpmRrgIflV/qW20k4pc+MGmx5m54FrxQgTqrBkQyG4Zh6E
 zn7r2JcbdbPpKyopAdlk+8sV7KHEln6q3+TjGaiGl6m9vD73pD8P0epABIgnyXFxVFDhE
 rwDFoEBMcZV7qgvel+v975FBCbQ1S3U54YEcpHBxGBDNlG6Og1x+r2Tx/LMpXRdFwoA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=A73QRxup; 
 arc=none smtp.remote-ip=62.149.158.218
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.218;
 helo=smtpcmd01-sp1.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=A73QRxup
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1E16606EF
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 16:22:20 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id KI25xeNaHI1NvKI26xZmSA; Fri, 23 Oct 2026 18:22:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1792772538; bh=g032YvT0VJNjZdBsHZSyqXM9LqyiFalQVbk3hzAPn1k=;
 h=From:To:Subject:Date:MIME-Version;
 b=A73QRxup3txa+JvEg4vOI5pAEmovv5cihjlJAp2QL6CR5f33q3EQRVDjj9MrijmkE
 xKOB/B7bKVKvfhhEiLtG85Yk6puN/9fou0aKvqHJ/FkIOzrFdbe89R4zCxcYaasYXc
 XzCspGel1CMs8pKr4k9KqixdPEv6zIWXwOh6qHUQxlgiAsQEr0Pa4lM5S5VQtOs2un
 jF/+HgsUIb8fpYAxIIfYRow3hZxeyxzeYO8p+0gVkglAdE+wxCSP+vRr/+aKW52MhS
 +1CDnoU2WjX4m6dqGeQi9JDsg2OOIRej7qhSViC796jLlX5e01HuQT1Jp/lkSwx4fE
 NxK0TWq0Rlw1g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 23 Oct 2026 18:22:16 +0200
Message-ID: <20261023162216.4015396-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPmQt3I8lFJOyuHSbbBk8j4Gm9mOcXW0I3083Lka17HfeCcN1CvwiTj1Lthy6HhTY7kbjNncufAweJ3AvCVWc8UWZ9pRe2YPRd3CX60YQczXG1UsCixp
 3ZPxoyh26Te/P5y8TfdtZH7V+uScJrzxPE0zWe/2XkjuZNRyuqdycF9bbVFUT66qhgBBuhUMH4YaOzh0uR7h1QODBme346ZpojNKD2B8H/exZPI3GWwgBPnJ
 5yTymEUile1pYnp06fxSa2ekJNzoR1Aoq0mwvjDoxds=
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 15.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/harfbuzz/harfbuzz/blob/15.0.0/NEWS

Deprecated API:
-hb_font_set_face()
doesn't break any Buildroot package.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index da30d531a6..4bd6cf9bec 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.6.0
-sha256  d07a007327277708a2a73ae437887cdbaf282937f6d03ca5467723e9099af586  harfbuzz-14.6.0.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/15.0.0
+sha256  968536e9abd782f07f7954044c0c4020199fcdd39b41d221ec42d2a3be4a44df  harfbuzz-15.0.0.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 556ae3db61..a68d8658b8 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 14.6.0
+HARFBUZZ_VERSION = 15.0.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
