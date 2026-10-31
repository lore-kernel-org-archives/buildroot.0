Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C50606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FQo5LlVP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XoloyC8q
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75D5B60787;
	Sat, 31 Oct 2026 17:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FkJYbwK7GH2o; Sat, 31 Oct 2026 17:21:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4880460748
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467277;
	b=E5o8xLad3LwoUXWADu1zaVU4M0BiyiikDAVtMK6umXdrjWFT+8lCvp5gOs2n8i/nvf6j
	 qyY/wbW2HbuhX+4SdA0knujzYZ/FV3uPD8pbSG11FoNkXh5wsuXLyScT6Poqkfx4XAupf
	 LZQ9d0UPbKl4PiIrMM5bHUIENiV0PzxhCT2mcTo+h6UGXpXXWc1kBrMRnwEfwe/0+G9mD
	 ippzm694neWBssQQZCD+oaJorVyoltiYzk/rP0APMFRRckdWvRERkLnvBPHbpd+pxaeoe
	 3rvFY7jBx7ltT891kmXpu3ndBjFGNHGVmK0fLpI3ENmkAiV95wSVq3/zY6x+8Duf4BA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467277;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7y+aNxP2OKirBHqC5pN/kyOBh1igFI5oV5MOaUfOmXE=;
	b=UZ3vIg1wmKZB6Q0woEiSOvG85COekttkeP9nAu7QLdESeKEtMi3SyPSE5U/3gJ7fzrLv
	 qgs35NL2Nlozd6Bz2OabGI9YLrrpU1fGvMvs43aV684au8Qh8vz4TwakakX5B7/ob8olj
	 Ic/cD5ZI3z4J3cg11GJ5Avubk+u9g+m77Pj93sBo08REgPMGbj864t1iA6kd99F18uz/+
	 E4EolSVJDQ5tmQv8jNlWNGRMJtS4CSOJILO260ag5FEU0iNUFZ1w/B7FgkL7JlT/iFN2s
	 xv9Uowvy0dRYHEq9PZHi1qmGrYGAjz++VtGbqFgYXLMYnW/4nKGt8IyaClR4xVTv67w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467277;
	bh=7y+aNxP2OKirBHqC5pN/kyOBh1igFI5oV5MOaUfOmXE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=FQo5LlVPJAANGIVd2zENWJGvJFG6VQSoBLdvjD+AdQ0VDGlgpeJfoW7dM63Ixa5jr
	 FW0KmrDcKpMfUC9Rcsu3RFIScMYuLj5iRjCf05F4xI5V29A9LyMo4/m15EYp8Ucs3u
	 5Ys3rXFAwqwFwH0Nl+2mEROFkyxqCtHaSQwzE4yhMSSp7MW0A1K1CKr7EJ518sa173
	 WEpJH3hkPJaAPqKua4lSBOiZHhAkdAYR/SNnYAraa5oI0iGal/X71hdQ9ImnZDFeNu
	 i6mZJ/Bd1SQTDH3fqgvWGtdLnFzoHWFvgmn9NFBDDlUFFi8XuDGToJXK6NRXenD671
	 2P+d0D2UuR63Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4880460748;
	Sat, 31 Oct 2026 17:21:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E3FA411
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F403B40269
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XM8y4eWXSxw1 for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:21:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2724940012
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467261;
 b=K2GvxdwTU7jZkUuJ+LqUmLO1JCEH9ffGNooMiQ7GFuLVvTigM65LaKcMCffOMlFMVcq8
 EKl2Z2R1HWFaDLNRUnjcF6nfD311iiEUjQS9vX9ZV3UgC6ERufx3J+RwUdRrmLBE+ShpH
 V5cV3gnE5AiZit0X4pQW2dtxh3KNhonk/J6Wl6DUM9GPZt8zxUxP3ozW1CRWYue8r25aB
 NUF4SzobPIseax4nDn84truzUTP57CemCaw8yCMT2f/9rVrNPle9FQgkSr/vo0x2sBZv3
 Dtyc5VZlLAF42A8JA4fjwOWfblH+RUtoloAsEuZiDktMxyurxfrYKZUrMMzcPApEG/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467261;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=c4ZEdBUzoWLkAphzZXEiqKUu9FnsGcL5lGF7YUMY9Qg=;
 b=CULRdRW3S2KI6PFiLKXnAVDTvCLcnZJw5xaXWHiPQTqOhUE8F3hkIb6ZZmX6zsa8MR4k
 S11Xfg+UjfOxAab4F1nRUn5gcmIuZG8n/GdxAHKL1zMe8pS3rdYoVtl4SvIc8wYYfvRJx
 s3NYC42FTVQUZ5FklrcBAhOb38BHbl8Gn9o1eyXMWKsc7RwPLgDNgoH0rMLAaAtNeZFqy
 OGXz2ner0kCir1SFn8aTHZq/YCmMxBJIYG3qtfiunFx7MwYRO0iYJreiUPRpprxt9th7H
 A4W6fUECxmO/7Rk2fWqfpeHEk5joKvbY6iyTaVDn2O9glzrzEjnpyYNiL0/S7onYMag==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=XoloyC8q; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=XoloyC8q
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2724940012
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:21:00 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-846566246e8so1756777a34.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467260; x=1794072060; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=c4ZEdBUzoWLkAphzZXEiqKUu9FnsGcL5lGF7YUMY9Qg=;
 b=XoloyC8qsCty8lKE5x7BTZ4G9Y4Rx06R+q6qc1p9o+PN4V/pOBbTvM+M6qD/Cs2lLw
 X5HdGq1dsD1PnLkn2+rzFb2BtIcpmj1gBXs4MC9Px+oQlbVn5yGfdWx01flHyBZzaMuG
 dEbsuHS9b9UR1rZ4JP4wpBZHbpupJs3Tytr0NQimxIMxv4+a/amoZ4BIcKQr7s7PMqyU
 RXoEwZg0rWPKfuAtx7INJqcVESnGJYVvtVbnSSu3WP6lR+9WkXiu7wS7ptLKAqw7k95A
 FNsbcujIAA1P6AjUqRdD7HhNxb16coCrQJkZBqYAxNdGdsMKW7//df5cnqRr9p+YhLOn
 EP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467260; x=1794072060;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=c4ZEdBUzoWLkAphzZXEiqKUu9FnsGcL5lGF7YUMY9Qg=;
 b=adZRRRaFmPwv4EHzqL3jDiPCTOefQ9hKnXwxanHE61onS6+0ieXv1zTdDWGZO91Uxv
 6XoRy5KBnh3Drb4A9KbaDd5ffa7VBMde1xkWcucbBmUi90JzFRfhIIsC8nwcryJv2vDG
 gMKeDmccqB0JUAfEykGiZMikiVGckfDD2Q1kxvZpA+3WMTEErhAkIJq3aAJb/Ks71a9a
 HQnIMjoWxp2eHo8+LAydNDYXJHusDoXkCXrkMOd66Jt7mNbHrkSJ8C9i3uriY4VbWkFT
 780XiX5mvf/o1VakEzC3GsAWqHR9lGVzruWz1J0rDJjnOwTcu3AJe+jZJ9ix3c+gBn4t
 IMjA==
X-Gm-Message-State: AFq9FYLAs9qf3isPHKpH+8IEQCCzAvnJw11ff7bV1Soz/ijBBOrFuABG
 kQA0zViB+p371GSD2JzHXxJE/hGm2Y3BQ/iM0nIL7KX3umK/SoMrPRwQo9UATQ==
X-Gm-Gg: AYBFou2Qwz/2qFNDmRmg3KkZoEyjJYlek9hQLQk7mH1muMCLPGA10VQrM4PneZBha4I
 5QF3vfDICFXcwn7Tphu6GBHNxlfPjUrm1CV2xXa/Kk3AwW31cOPleNNVIMCn/sZhDt2IW9g3Mpk
 5clE5WWeSZGy8C6FmfrQgk4oROuWl8H15nDzlQ0ao1NZYDZ+aoQL2C5mBzZnVXVnd+h1/5tAVqR
 QAO/TlmG8ziz0IRsdIzVRxDl2NBPudNgz8QlPuc+0zVeWl/eMNgpT49EWUPW/NapcQxkNv3PdK0
 nH1ysXegq3/43a3bKeBKMrwkL8xhL29qNMfsAXpmfrfNLDLElqzFkcS6aq5blXB+ol83NsJT1q5
 QkEFBPdzQus36qwjpMXoxwzIRtppaXceb7l5JoUNp3wgilJVYW96ME6U5lv2OEYcGLVKpVBtvoH
 BWR8H3t+pQgA1BgyrQoylpI2UT0f3rOcWGnZS9EE6Ks5YYFbvGCabOE4p+0vF772hnB6wkJgmYO
 fNJv7mxrUu5YCGHFQVfRtVmR3pFEwovlXmF2co2aBEOvcNUhGtsEuo9ZKqB4AS/qTRKqUNHgwhF
 QsMyRkfFj/E+nuNmQr8nVRVhbCDIB3xXMiO4YpuI1jDlKNCS1HJmY26Rod3wd67bzFlKzLFBnD7
 fW23U6VIgIjzkrABHKI2rVF+iswzTd12gzi2Ha1d/HZ93k6AoE/hLC0ueNr4Y+Ih8i/8jt8u6Om
 1QC0e4CaAd955S5G7eJ5swDBlApJvNqY0zFcmMGWawT5xgy+RK2GqZe9BdK3Bm7OG6wAGuOy0aA
 A==
X-Received: by 2002:a05:6830:4426:b0:85c:53be:cc35 with SMTP id
 46e09a7af769-85d365b1f76mr2696158a34.16.1793467259709; 
 Sat, 31 Oct 2026 10:20:59 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:51 -0600
Message-ID: <20261031172019.2683287-22-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-twisted: security bump to
 version 26.10.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes CVE-2026-83813, CVE-2023-44487, CVE-2026-115778,
CVE-2026-115775, CVE-2026-115877, CVE-2026-115774 and
CVE-2026-115776.

https://github.com/twisted/twisted/releases/tag/twisted-26.10.0

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-twisted/python-twisted.hash | 4 ++--
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index beb1c7f3b5..f65e733411 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  931ac3e39a52c490f85d36bcb4c77369  twisted-26.4.0.tar.gz
-sha256  dbfd0fe1ee409d0243fdd7a6a6ff14f4948cec1fd78e0376291f805e1501fae9  twisted-26.4.0.tar.gz
+md5  02a15261bc2c23036399954941d951f4  twisted-26.10.0.tar.gz
+sha256  5f0355403e507fc23ceea85e9dbb4bc59335aabde41dd324e8b8cea180dd38de  twisted-26.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d7a2f74fe5c2b3f610052b75b5a131728c49823b28088893dacacf8d58849a4d  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 09198d2afc..d45d2fef0f 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 26.4.0
+PYTHON_TWISTED_VERSION = 26.10.0
 PYTHON_TWISTED_SOURCE = twisted-$(PYTHON_TWISTED_VERSION).tar.gz
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/db/97/6e9beb1e78247ae6dc34114f27d538cf2cb183c4afcd3609dfdf2b0439c8
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/fe/31/a5f99ae7f1550914b0702b8f78118d95a79da20525d26fbc1b2ab42bc8ae
 PYTHON_TWISTED_SETUP_TYPE = hatch
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
