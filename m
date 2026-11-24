Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F16606A31E
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 08:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=C6zjWue4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IunZCsmG
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43AC740316;
	Tue, 24 Nov 2026 08:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r95g7aYJK4fT; Tue, 24 Nov 2026 08:59:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0DDF540385
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795510771;
	b=HHldrQv3aM6H26KjgEkhl8wVjsG5eWvTNXsxPo9UCx5yArXo9JChzltvnf2/vPxwjpIt
	 iP4USaVF2JzWHt5oc2q+cW3Ex96G/F/tYKpjv4TTC3J2gNpTpwvcJpIAY3YFntJ5kCSt0
	 6q/CXbSeXs2O1fcnBpc7ZhmnqaqfJDzyNTJnFScs3/U237a7t5gWY98RIUy5RZKvsV6uC
	 lWPVF+uTg3m6m+k7ZLeh9jn1mAP7asdAKSqF7WK4O4a45YZX6AHsaxVF0+DCnWIYAAUz3
	 b3cAKgzY+5OTxphJLashDIAqYS7Q2+16ceY7b9GeZkWZHkcyP0900YVmu5OAkl4kRHg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795510771;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=DT2ri/1w+hAyy0MV3TpQCXB6d4FQSimDtPxBT7dQ/ls=;
	b=lRaNVycvMByJ8F+3ERdCvANpAUxCs4lsBdZJ7aofskTppKlpNvUqywfQ0AxBV6jvMfoz
	 XiYIFaAKKCznqdhTRQdC+y5fYYj89Y/2ja0UTKVpsbNLSguW0cycybFNZBfR3c8XUCym1
	 wYakc4UmFs+I/r7BEOGw4pcc3dUJUvB1eYOUOloD6ACXMX4CwscLjFvIuNs5iquBQF+fs
	 typEDDjMXDNbbTRp5be1igybgoGAlyJUkpR3Ntb2vPDVSaN13dfY1/CuyAitb/qyI6wW4
	 g0M3gi0xy4HKPIvt64NwxrYrhkQflbo7pAVbqJr3ncOEx/qtAj/murbOM/kATebDdFA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795510771;
	bh=DT2ri/1w+hAyy0MV3TpQCXB6d4FQSimDtPxBT7dQ/ls=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C6zjWue4YzaXdFHKHFLwUYTT1cI88jFPd6M/7ZnbGX+Mt4+aXnSZEdN8I9pjOlD5c
	 dCJ9a08YLJZB68q3H8UdNmwoBziyRzfDvYdZ4pY9JRX0ohQg1eY0QWTA+g1oxIrfZh
	 b95Q4Z5vy+Y1+wCe4Z5StDWaa6TzKkAPn6aYVoC4PzHZ6LSHpB4NSad1xaBYxqby9x
	 BoOmW1ZTKRfVg71ot3Qb3GKPzp36bXdtnBst27zLzTgLA+MlHJNQR649DXw+2LN8e9
	 IauK61+KO8Y/8hOiUJH6f4ePZAH9Vswvt1jfY54iDvPC3mzVkhjFxbLcf+oqZXmpoM
	 7TZmxGaRwGBLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DDF540385;
	Tue, 24 Nov 2026 08:59:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4507A3C4
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 08:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3681A80C2D
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 08:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8X9LBxK4chf for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 08:59:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A991880C11
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=IunZCsmG
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A991880C11
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 08:59:28 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4bb68c197c7so53538055e9.1
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 00:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795510767; x=1796115567; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1CflrdekdRj6EL4RI6a5fMTSZGmyDgRAalFX2BqXwFw=;
 b=IunZCsmGuydpW2XyKGR392ueCqcoTHhgxPqJkqc61OjytYrkqW5E8DbBMfqzOQO21j
 yu6LWsuNY3T/ZPQ1bXKd3d6w007+rYOvNi7cVwmu7x7IdITkZsxPhv7GmnFcCH1VMjU2
 w+J8e5VDf1oohCrh95B9IEP6a8fu3/44N9x9PzlgUH+lP8igNTN0jYZRAtQ8Guz1NHmZ
 DwdzOWCAUxJC0bfI0ETUNC3kWY4iBlHjLLBPO4RNjtYawqOKtIl8mI7r/ttgkyV01+PT
 nN90jCADyQ4fcaSG+lyT0HT3NN2aeRCkIL656K0UpZ4w0fXuND/FA15qf/2ZGsowgWar
 YaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795510767; x=1796115567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1CflrdekdRj6EL4RI6a5fMTSZGmyDgRAalFX2BqXwFw=;
 b=q1AmhsS+0BueLfn1OGAv3QPbe8hcGDILAaIXIG3mSs+Y/6iVnZrPV/PuhPTnBTs92m
 ovPs/P/ohXybThzLtl3q5ZCf7pbeNKJjRuSMWABHHSK7DUTXSXyJKaETdX581HxoC1HZ
 IZrltxL8Pi/JYuuLjtopyvUc8E1zVpA2n8qBQfyPT4XNlrU2BTSukRT3okj1UCBXiEns
 57QC4HNg5uWhbNGxhUiKeH3DkxCdy7XZM/TXNWtZU5FwiAfm2AbU6TWEiHlXMuaTI7TA
 aTPTgWzQ3BCxyVb0yePQ5dtJp2Np+Z3ZEZSFp6itDez9mP51RrnXEUgNW2vdhuPVtb/T
 fsCg==
X-Gm-Message-State: APuU4Z+U12nB4ec5vTcMBPN/Xk3/69waHGDzIoVRJHRFiUHKXpUf3WeS
 nHHuMbqZI0radC5vWxyPsMaODt1zTM6h/1gAG+s1fPR4t+CrVoMNALbRpXHJ+TS2
X-Gm-Gg: AZFdTZfWNAc5Ystxu63iiPaoR9nM4Qlwqg4VvynnQ7AgN0bPLIcJm8xCLpdk1NX2vrO
 OFuYp6+M2engsbaD5h4uqRFt6iFWvaBp3Tc517cqMRkrJvhito42DMxnniwRhFHl9fcLiA41EUp
 cb6BhYvL+xvuHyhA/XxVQL0ozFWzU5PbpccYpNSE5Fp4IGLa/hT1/DDu0n6AE8h7Qy+0PY5vNbq
 RRICjKj1FRy55kcwpP8Sx+SMctcC5eY2lkjZ33hXb+5cKxkVBPXwZE0Q2kY82Ld6L6dmZSidMh2
 FtEqRUvc1Br8rA2DlWDbYINDdHIFT0rGMIy59666syy8E5Olio5G11MPpO3BN8E/B30qoqfahAK
 LSkkaCchJCTdHf5A5KavHXRdKFayratCKgpI2ng3CLVVqW1r6YZmfrw0u/xC/V1vkg7/FZSTGJg
 5eBeQv5jNC42TJDITCM8WlIeNNj5InZMMBYRTGutjSwvU6Tw4HgBgdj89tBYS16ndr7a+O3azAG
 0S6egPs1FicBXPQ19QNS2L6uzil8gVpxBGSxYoPk4qU/AHVVlili5a1MWUNFQTffvp9R0qEFy8C
 9lxXn6O0p2zzwIgk9nYeFWKkZ3lNesFwh618OUEIPtaRPtWiOXA=
X-Received: by 2002:a05:600c:8210:b0:4a2:1a:a116 with SMTP id
 5b1f17b1804b1-4bb887865b5mr278644825e9.0.1795510766478; 
 Tue, 24 Nov 2026 00:59:26 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884865b1sm413668555e9.5.2026.11.24.00.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 00:59:26 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Vincent Fazio <vfazio@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager <neal.frager@amd.com>,
 Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 24 Nov 2026 09:59:23 +0100
Message-ID: <20261124085924.2250690-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAOrEah6tmVYxKe4C0N0GV2YvaOt22uPaRCFB1scc01ezwtBetw@mail.gmail.com>
References: <CAOrEah6tmVYxKe4C0N0GV2YvaOt22uPaRCFB1scc01ezwtBetw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/gcc: add symver attribute
 support to MicroBlaze
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vincent Fazio <vfazio@gmail.com>

While the MicroBlaze architecture does generate ELFs, it does not
leverage elfos.h to define common attributes; symver being one of them.

By adding symver support, there should no longer be any need to patch
packages to account for this architecture quirk.

Fixes: https://autobuild.buildroot.net/results/29c/29c76e02becedf922bd7dc0533338c078bf77d2a/
Fixes: https://autobuild.buildroot.net/results/1e9/1e965d83d75615f35308440c5db044314a349357/
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
  - rebase on GCC 14.4.0, 15.3.0 and 16.2.0, the versions in master
  - Upstream: tag points to the bug report comment with the patch
  - autobuild URLs in the current form, in the trailer block

Supersedes v1: https://patchwork.buildroot.org/project/buildroot/patch/20240228165300.4158751-1-vfazio@gmail.com/

 ...e-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch | 56 +++++++++++++++++++
 ...e-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch | 56 +++++++++++++++++++
 ...e-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch | 56 +++++++++++++++++++
 3 files changed, 168 insertions(+)
 create mode 100644 package/gcc/14.4.0/0004-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch
 create mode 100644 package/gcc/15.3.0/0005-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch
 create mode 100644 package/gcc/16.2.0/0004-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch

diff --git a/package/gcc/14.4.0/0004-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch b/package/gcc/14.4.0/0004-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch
new file mode 100644
index 0000000000..51459f5763
--- /dev/null
+++ b/package/gcc/14.4.0/0004-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch
@@ -0,0 +1,56 @@
+From 99873bdc294aabd19861786f51c6be01ecaee59c Mon Sep 17 00:00:00 2001
+From: Vincent Fazio <vfazio@xes-inc.com>
+Date: Tue, 20 Feb 2024 16:49:06 -0600
+Subject: [PATCH] microblaze: define ASM_OUTPUT_SYMVER_DIRECTIVE
+
+The MicroBlaze target architecture generates ELF binary objects, however
+it does not leverage elfos.h like other ELF generating architectures
+(see gcc/config.gcc).
+
+Due to this quirk, the architecture does not receive "free" updates for
+new features that get added for ELF objects. One such feature being
+symver support [0].
+
+Now, the macro necessary to emit symver directives is defined.
+
+Packages such as attr, xz, libkcapi, et al which use this directive
+should now compile on MicroBlaze without needing a patch to account
+for this lack of support.
+
+This patch has not been submitted upstream as discussion [1] around
+the approach has leaned toward a full migration to elfos.h which is
+non-trivial.
+
+[0]: https://github.com/gcc-mirror/gcc/commit/d7ddfbcb7
+[1]: https://gcc.gnu.org/pipermail/gcc/2023-February/240752.html
+Upstream: suggested in the bug report: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766#c6
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+---
+ gcc/config/microblaze/microblaze.h | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
+index c88a87c..e0847e4 100644
+--- a/gcc/config/microblaze/microblaze.h
++++ b/gcc/config/microblaze/microblaze.h
+@@ -832,6 +832,17 @@ do {									 \
+       fputc ('\n', FILE);						\
+     } while (0)
+ 
++#define ASM_OUTPUT_SYMVER_DIRECTIVE(FILE, NAME, NAME2)		\
++  do								\
++    {								\
++      fputs ("\t.symver\t", (FILE));				\
++      assemble_name ((FILE), (NAME));				\
++      fputs (", ", (FILE));					\
++      assemble_name ((FILE), (NAME2));				\
++      fputc ('\n', (FILE));					\
++    }								\
++  while (0)
++
+ #define MAKE_DECL_ONE_ONLY(DECL)	(DECL_WEAK (DECL) = 1)
+ #undef UNIQUE_SECTION_P
+ #define UNIQUE_SECTION_P(DECL)		(DECL_ONE_ONLY (DECL))
+-- 
+2.43.0
+
diff --git a/package/gcc/15.3.0/0005-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch b/package/gcc/15.3.0/0005-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch
new file mode 100644
index 0000000000..519fe8673c
--- /dev/null
+++ b/package/gcc/15.3.0/0005-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch
@@ -0,0 +1,56 @@
+From 99873bdc294aabd19861786f51c6be01ecaee59c Mon Sep 17 00:00:00 2001
+From: Vincent Fazio <vfazio@xes-inc.com>
+Date: Tue, 20 Feb 2024 16:49:06 -0600
+Subject: [PATCH] microblaze: define ASM_OUTPUT_SYMVER_DIRECTIVE
+
+The MicroBlaze target architecture generates ELF binary objects, however
+it does not leverage elfos.h like other ELF generating architectures
+(see gcc/config.gcc).
+
+Due to this quirk, the architecture does not receive "free" updates for
+new features that get added for ELF objects. One such feature being
+symver support [0].
+
+Now, the macro necessary to emit symver directives is defined.
+
+Packages such as attr, xz, libkcapi, et al which use this directive
+should now compile on MicroBlaze without needing a patch to account
+for this lack of support.
+
+This patch has not been submitted upstream as discussion [1] around
+the approach has leaned toward a full migration to elfos.h which is
+non-trivial.
+
+[0]: https://github.com/gcc-mirror/gcc/commit/d7ddfbcb7
+[1]: https://gcc.gnu.org/pipermail/gcc/2023-February/240752.html
+Upstream: suggested in the bug report: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766#c6
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+---
+ gcc/config/microblaze/microblaze.h | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
+index 2390542..59f8a53 100644
+--- a/gcc/config/microblaze/microblaze.h
++++ b/gcc/config/microblaze/microblaze.h
+@@ -829,6 +829,17 @@ do {									 \
+       fputc ('\n', FILE);						\
+     } while (0)
+ 
++#define ASM_OUTPUT_SYMVER_DIRECTIVE(FILE, NAME, NAME2)		\
++  do								\
++    {								\
++      fputs ("\t.symver\t", (FILE));				\
++      assemble_name ((FILE), (NAME));				\
++      fputs (", ", (FILE));					\
++      assemble_name ((FILE), (NAME2));				\
++      fputc ('\n', (FILE));					\
++    }								\
++  while (0)
++
+ #define MAKE_DECL_ONE_ONLY(DECL)	(DECL_WEAK (DECL) = 1)
+ #undef UNIQUE_SECTION_P
+ #define UNIQUE_SECTION_P(DECL)		(DECL_ONE_ONLY (DECL))
+-- 
+2.43.0
+
diff --git a/package/gcc/16.2.0/0004-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch b/package/gcc/16.2.0/0004-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch
new file mode 100644
index 0000000000..408a05c533
--- /dev/null
+++ b/package/gcc/16.2.0/0004-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch
@@ -0,0 +1,56 @@
+From 99873bdc294aabd19861786f51c6be01ecaee59c Mon Sep 17 00:00:00 2001
+From: Vincent Fazio <vfazio@xes-inc.com>
+Date: Tue, 20 Feb 2024 16:49:06 -0600
+Subject: [PATCH] microblaze: define ASM_OUTPUT_SYMVER_DIRECTIVE
+
+The MicroBlaze target architecture generates ELF binary objects, however
+it does not leverage elfos.h like other ELF generating architectures
+(see gcc/config.gcc).
+
+Due to this quirk, the architecture does not receive "free" updates for
+new features that get added for ELF objects. One such feature being
+symver support [0].
+
+Now, the macro necessary to emit symver directives is defined.
+
+Packages such as attr, xz, libkcapi, et al which use this directive
+should now compile on MicroBlaze without needing a patch to account
+for this lack of support.
+
+This patch has not been submitted upstream as discussion [1] around
+the approach has leaned toward a full migration to elfos.h which is
+non-trivial.
+
+[0]: https://github.com/gcc-mirror/gcc/commit/d7ddfbcb7
+[1]: https://gcc.gnu.org/pipermail/gcc/2023-February/240752.html
+Upstream: suggested in the bug report: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766#c6
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+---
+ gcc/config/microblaze/microblaze.h | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
+index 8d1bcba..53d8245 100644
+--- a/gcc/config/microblaze/microblaze.h
++++ b/gcc/config/microblaze/microblaze.h
+@@ -829,6 +829,17 @@ do {									 \
+       fputc ('\n', FILE);						\
+     } while (0)
+ 
++#define ASM_OUTPUT_SYMVER_DIRECTIVE(FILE, NAME, NAME2)		\
++  do								\
++    {								\
++      fputs ("\t.symver\t", (FILE));				\
++      assemble_name ((FILE), (NAME));				\
++      fputs (", ", (FILE));					\
++      assemble_name ((FILE), (NAME2));				\
++      fputc ('\n', (FILE));					\
++    }								\
++  while (0)
++
+ #define MAKE_DECL_ONE_ONLY(DECL)	(DECL_WEAK (DECL) = 1)
+ #undef UNIQUE_SECTION_P
+ #define UNIQUE_SECTION_P(DECL)		(DECL_ONE_ONLY (DECL))
+-- 
+2.43.0
+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
