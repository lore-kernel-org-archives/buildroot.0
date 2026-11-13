Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C51606A327
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 20:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Aotr3ZDE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e25yNjli
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8409D81871;
	Fri, 13 Nov 2026 20:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOU343vlMlxl; Fri, 13 Nov 2026 20:29:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 944BC81801
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794601759;
	b=Q/1x55yK7dRRalnSbTxTjQaDPxp86vZn5HiyptrX4vA1FldYXOF5XO1C+U2jYgRHkd2M
	 8wr7/OW3WRshrcfZItidtga39HqgyroTySiqQqmPvUrTtyzBPV3DL5dLcwxCPWjpJtxeH
	 I3hPVe9jzp7U6cch+rFPBljY/IGhufRk3h7T/pu+skY5I4tUFReDR8WLt/rFhrUHJb+QQ
	 wFLXpK2nIldia3SpaCGetciMqOabAutDa4VvzGdlC98kSZDqjRztigQ2cBn95rbu5Kopw
	 GzwKq8Upst9h/eUfLfQ9c3O+qRNic5MT7/6m58z06/i1bHjV3NItYoaeOjn0eROzqeQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794601759;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tHgy14iBksm6tRLNwUKBeKbFK9X5DbtPJ/3CahhhPVc=;
	b=OIb044Hl+xOCZiW0GQHBKgtx/kIiQGRn7bpcv4pnOg0tsW3OLtGNBaRJyfCOuX8+stGX
	 GwbdT9BQK+aSsw/wdvbjNUWyD7Er2AO98WRdlR3ZjE5ErbRwI7YGUzdfDBTB54uvLM58H
	 iOl+qGWoMwE9CQnggQQTYrqdVUU8D3wXoviaRZtRdyxVCUmRk6R380QeS9ND1D+EhnC8H
	 DoXx821r4TE3jKRS9cdd0Rkr624O9FiLH+LxNaPv8Pap/X4robZiBxcSgRgya8erB+TJz
	 wGA/gF2LzvYMtHM+F7CawteluxdxI7RfccaCf5oknaVIUl9gfifTqMDA4gCIhXSQu0g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794601759;
	bh=tHgy14iBksm6tRLNwUKBeKbFK9X5DbtPJ/3CahhhPVc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Aotr3ZDEKSoFCPl+N/+vAqoh/D6beSw4wdvSRdFlCe/UTk7eDSQlUJARPmjBWyml9
	 5D41ALt0fh+D0h3Fri7Z5SbZ6zLW6JXqN0nbaCs6HAsWnscvbLjw3tc0thOZO9E5dr
	 x7ixgmH9NFmlq82r9i9kjwXZmIrCgianCDgA2gI3EVYbPE6a8ACnB1T2WSkdwHQqH3
	 yjBqUeDFU/FC1ydmUn61jUKPrrggnLtUGcwcFT+EBstiIlEcvCUjeQ9Cw5S00t4Bd5
	 AUQBdkGESIDNdQAuc/fbJtqotmKBbMtuz4473dxZYfT7rK7S9kMLQ5YfT4RGFIy9/c
	 37LhMqe0IgbUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 944BC81801;
	Fri, 13 Nov 2026 20:29:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B4B3B150
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 20:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B42B4022B
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 20:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b3cjDpk0O03I for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 20:29:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B3C0C4021F
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=e25yNjli
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3C0C4021F
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 20:29:16 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a5177d78c7so19394945e9.2
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 12:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794601754; x=1795206554; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=dbE4ITYbRD5f0Z62ZnW9lBwD8sAY4rvsE8RMjQ+jDo0=;
 b=e25yNjlinS+JNpyzRP+DghhBg/gor5X7XuR6J7j3+ecOAmapO8mmOx7ngPJM9kkYl1
 /rQ1NzfoZQZhyEbfQJmv7obSuK9ROD6zJ+eT1oEypJv4VYqcydr13tkv6JcF7TItTKv8
 fq7rbMj2TSP9qaglNmRCVqIKq/5PozaNCwXVHoa6YuWVx7Epm6H1uO8eqL96VvutdIwX
 yvVC1j4HhDKmoL26rq9Tkux5o92MaJ2Mqu+W5PV2hM2efo+gvZ4zyUf4DgNN1JzAN527
 JTBkBC7gQK2hQQCl071f4k8gGnkFABIZOixA0pqnV3p8njok5Xdy1jfSwT9bGCXWNyYO
 9P5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794601754; x=1795206554;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dbE4ITYbRD5f0Z62ZnW9lBwD8sAY4rvsE8RMjQ+jDo0=;
 b=uxaOV1Gg6/yUN0xx6qzc2QahlHbJ5hBwvyem1xa1Fk1bCm1J1FxfzAQct2hWiNw675
 EDCq9MWLpW1yHzTx/DGgknnSaLEpA3pEdCkFAwjB1VmGCWH8qXnVWbEyshYYldLj5Cxh
 OAC1vnHz3jfIV8vFpTDq6G81ADOZ3u3G/nq8CLtiJOjX4dq5IZdb5nUt3hEH6HR7Uekz
 IzXn/jLznb+K5c7QkmiKBde7InBEdeMtRw3+/icI2ryaLY2JKzyoQwks4YcxX5HcctDn
 9Pl9TQ2+wH25fhf5JCtd7RSgG2F8cS6/n0XGTn4292GTfy616g75Vz4WF5krJxSBo4TG
 Jc1g==
X-Gm-Message-State: APuU4Z/AhuWZAt+Z2bTGCrjf/B88XZ29BNX4v7qrDKNt5C7LlKlpieBV
 /zHBYDEXqhOCVwh764KuAUBVs0E884ebyu/LlKDFATiKZe+lBKs8scOtFQG6Rg==
X-Gm-Gg: AYBFou0u9x9TcfLhKGadibdzhFIeGiYEiUVIMndQtS9x8h9OQDA8IK9D7a75dZT0wTw
 nn5P3EW3k71GQ3hrOqFlveIHAX9DwNDRm09x56kV7G9zuy2aIHiN8Ww6jc25eOjoJjcaiqeaEkk
 zsbltd0DxuVqO6+6tIfj4YXUHhONCRi0qWsDCbPjnUMxlZkmpAq8Nciu/OmjC2NPcYIxJ5kMOQB
 MJBlsVd+sQaGHMaiJkfeOLGroNCd7zEaHF4L2MIwTZUlVnWgWtDIBWfRuhXRuyyfEsye3BZSCDD
 oYqRaqZb834BR2L789qavUpVMbGhuLHrZsUl6YeOqaujYdOeB7eeyNCh9Uq5lUPRuWKO+jkzdNo
 tc43quwcHtM1jLE+HUKIBYwf1WSVKi+VqjvrdYt1c22+PEkdvcqqnWLu3mTYpI+OiRLYX3D1QW7
 2Po4NUnPO6h+rfw++MNm+8WYfPT5Cke3uoCj50j8rGPXukaqs/E75EVHVoMNTtZkFVJWYXP8Fi6
 V5xaP9y9MydRDHGKH4G7cH97lA6GAs1MgeBvTdayizg9/EONLccllNf0XNPu27Rmg/75ZYtQuhC
 pFyo7cHBKTJwKRaqaG4/Mlh/wP69Ei9WPNTZ8kFRdJLHNatC2P+1
X-Received: by 2002:a05:600c:8483:b0:4bb:605d:8e92 with SMTP id
 5b1f17b1804b1-4bb605d90f1mr15442205e9.32.1794601754179; 
 Fri, 13 Nov 2026 12:29:14 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb55ae5299sm96098985e9.11.2026.11.13.12.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 12:29:13 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 13 Nov 2026 21:29:10 +0100
Message-ID: <20261113202910.3402775-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pkg-generic: keep file lists on
 reinstall
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot lists the files that each package installs, in
.files-list*.txt in its build directory. These lists are used:

- by check-bin-arch, to check the architecture of the target files;
- in packages-file-list*.txt, for graph-size.

The .stamp_installed step makes the lists. It compares the target,
staging, images and host directories with a snapshot taken by the
configure step, then removes the snapshot.

'make <pkg>-reinstall' and 'make <pkg>-rebuild' run .stamp_installed
again, but not the configure step, so the snapshot is missing. comm
then fails, the pipe hides its error, and the lists are emptied. After
that, check-bin-arch checks nothing for the package, and graph-size
does not know its files.

Only make the lists when the snapshot exists. A reinstalled package
installs the same files, so it keeps its lists.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/pkg-generic.mk | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4e2ce2e7a0..2af86905a1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -128,17 +128,21 @@ endef
 
 # $(1): base directory to search in
 # $(2): suffix of file (optional)
+# Only after a configure step, that lists the files before
+# (.files-list*.before): a package reinstalled keeps its list.
 define pkg_size_after
-	cd $(1); \
-	LC_ALL=C find . -not -path './$(STAGING_SUBDIR)/*' \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
-		| LC_ALL=C sort > $($(PKG)_DIR)/.files-list$(2).after
-	LC_ALL=C comm -13 \
-		$($(PKG)_DIR)/.files-list$(2).before \
-		$($(PKG)_DIR)/.files-list$(2).after \
-		| sed -r -e 's/^[^,]+/$($(PKG)_NAME)/' \
-		> $($(PKG)_DIR)/.files-list$(2).txt
-	rm -f $($(PKG)_DIR)/.files-list$(2).before
-	rm -f $($(PKG)_DIR)/.files-list$(2).after
+	if [ -e $($(PKG)_DIR)/.files-list$(2).before ]; then \
+		cd $(1); \
+		LC_ALL=C find . -not -path './$(STAGING_SUBDIR)/*' \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
+			| LC_ALL=C sort > $($(PKG)_DIR)/.files-list$(2).after; \
+		LC_ALL=C comm -13 \
+			$($(PKG)_DIR)/.files-list$(2).before \
+			$($(PKG)_DIR)/.files-list$(2).after \
+			| sed -r -e 's/^[^,]+/$($(PKG)_NAME)/' \
+			> $($(PKG)_DIR)/.files-list$(2).txt; \
+		rm -f $($(PKG)_DIR)/.files-list$(2).before \
+			$($(PKG)_DIR)/.files-list$(2).after; \
+	fi
 endef
 
 define check_bin_arch
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
