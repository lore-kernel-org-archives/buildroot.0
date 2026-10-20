Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228FE606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 06:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ENASQa9+
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFEDA607BE;
	Tue, 20 Oct 2026 06:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mmiQD2yq9o4P; Tue, 20 Oct 2026 06:44:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1FF65607EA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792478656;
	b=CRf7bAMQoi9fLoMvPXsJ8wh26dPLp9Y/uD9b/h7OrqV12JK3t+/wdm3wvmPP+2Fy1XFH
	 DpBlSL77Dnqh8aF3E1QgtL+a5PemGYa3pc9ETBxGHx9CjddKvJLtezZA0kWl7cxmspaae
	 FfWxTmuvCp2Hf4SmFPV6hbspDqJKBUO8mcrtcsCmt1ydqgTd5FGTVJt/DoWw8/m1PnbYU
	 gCkwb9iFZrx8P5f5+H7de+tXp+vmsUL/OfbV8+pOJuj0vgXpSduDACbYAsyzAWSgQSMm3
	 wrRJvuTO9fGStPdC13cgHA04khsLO0yKq3NMsy3O9Wkf8rmQtQ6Z3TqSXx76Sbi5k8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792478656;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tFCTttqiV3cI6iU/NtrhbDVWXN/IciCs4f4yhINoIUY=;
	b=bwDLFlXKLlFZoreVXFKxO2m9aWHBTLE+/vwF7aIXZDAGrDMpc5q2CZ3RxuqGZhmwEwm/
	 33SM+rvBtJpqXkdMBiF4cTMltG1xL6L2COG+bkcAFBnP+OBYtg+zEoNAfPvNccVSwwya6
	 dOPNuwNavtVohEFWAI5jFewglYSX19gwYiDua8cG8gwxCrlAtYBrDTRA3x/NGqN0c4MOf
	 s6ZEbyQ1+MTD+VTn9FV6PppNVOyH8Rs9862NRxxYfr8ahi/kFWf9AmmTcncvrfm6WuOCy
	 z7dQH9fGOEFB+K9uvTDRzWg61QjNSIrBQ5e9vPQEMDi6FouFzF/xwDtv+7WNREA48+w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792478656;
	bh=tFCTttqiV3cI6iU/NtrhbDVWXN/IciCs4f4yhINoIUY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=ENASQa9+Qb0ivpKPNsdIKMYOiOk+w7Iz+nK7KSDBtEqthvVIlUbAjuIVlCpshqfU0
	 u5Pu7V63i2fEODCdLlhaJH07ydj5uahOtX3h/M0we9RgbeweJZgZ/FIOa8mvMUDtKt
	 zvW9jyqwR2N4h3D64TR2PegPghuy/fwaiILqprdOMPJAp2C4/SU7qcnFd6N6JkI28B
	 n8w9zYk76VQIeHfnYO9bHjVLInphTnFhmGuRC6GnQOVvaJ3HcpOY8coU+GvFGQ/ky6
	 0IvTh2xyw9KqL4i0XoPtGTJXA7ADA/gnSGIdkfKWI37NeRo8NgaoDYEFFoUDLlpBB5
	 kSl4ciSMuFoQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FF65607EA;
	Tue, 20 Oct 2026 06:44:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 277A723A
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 06:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18FE9400FC
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 06:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JmGM6YivHRN3 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 06:44:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 87380400D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792478654;
 b=dKoCFQqG0tfM3U+tyGwZVkKDr4kw0a4T5xPSjTDCdWw1Q7eNpM5BnrSNaeYqEZN5T5xk
 jaZuYnLiokODfSF5fmUcN/ZrJ/cxs9KgZXk9vVixOZcWt73vMtU5253Mv61B3iJPWVONb
 BQbfnT4/JmLi9Sht1y/wH95xbU3zVIKd7Ji9JQpsn/euJOyKKZpPi0ODqAiJ8is+neYjg
 0n/VRrlyC8FvVLmdkvphpV/uUXDf3Siue2MgMATzyph72eVozN8PGDVaTfMhkvk0mInPp
 hnEuoAMorMScAsfxqWwJbQev7+RxISW9I6wwi1DHkYSyLuJ/exi3cexcxkwhhRrurYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792478654;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Vc1mz5x+lVwLauc/NiR7vR33juPNIZ+Rm4h5Iz6sQTk=;
 b=kOqD6+tQ+TuNhvIXQrIN9rIUKKqkNAR1gYehKdPwQugAAUECtXJo7bpsU//Y3T13kHcz
 saO+ZJzXhgcxoM60Lr9LjlTcU9udsaob9yAy6KndJuv2opGPz0ZhrGUfprW0Wj9lleseW
 A6s7pZNMLNuaRSgd+6ayE4rI6iQVvTwZ0OBt8ieOT/DlGkGP8ehatNQRUE0Qtum86wND4
 TiTLR4tbcG3gl2O9N+IBbMcslovMkfzHwTQX7CzxQQ/KWuN9YIVV2sk1fn800yNLq7hSW
 dQTSHyPJoeT37FOg8SQzBL5Pij//vc87MhOANXBDXT/lam5CVZ0JQfxb3+xiPm/Dsng==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=iZPkm2WA; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87380400D2
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 06:44:13 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48e011d370dso2317218f8f.0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 23:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792478651; x=1793083451;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Vc1mz5x+lVwLauc/NiR7vR33juPNIZ+Rm4h5Iz6sQTk=;
 b=Obw8j0R7IKVNmDd1eg4pdDKmu0iWmpIByCtZPprUtS387BDdHAI5/6a7LMwnaBt22B
 C93WOT2HacxFR2lpqDG6BTUO/mdhXDw07exNWr+zOgN8u9Y+T5MoaU5vteoZz++qP1QU
 OBgJMVUMiqqMgHTsBhpsbURTmkas7Uhp1f8pqSMk7zNQwQmy5EWweZ5R7vFH2HUGCCWz
 ApwWKGt0SWyEIpVD/TfRKKt2SKJKDOcTAQhCKkPxCvJ6pz7wD04sSe/fMSObTsnKWoIJ
 n84dFI67h4tDxfRm3JBbRrJkANRmoMhdch4skn9zkLoJqdH9fGUXKuCWp+QE2/qRqNll
 L+yA==
X-Gm-Message-State: AFq9FYKiQosmAJlsNAKaAQNAOjDraIQc2OXAqr36ISgrlurW/4a2yvQ7
 RMYYJdvuOcJQ1UBRdxGAi3a2fwBB2K1GRtWb51ulKDgM6MvdZgzuewZVky1Q/p8s+zvbe7OPkuR
 D/sqV
X-Gm-Gg: AYBFou04w8UZIDGOxrJr7wjdue/xxie2j67N1Io3b954V+KNDEDD5SuTf0sO2IdcjMW
 77aMgnoS79qqkSqDrBnh797VYiyCk8CvwdYg/AUIIXeFDyMMrfYop/xhAEb4tIvk4R5KrNrriA7
 NA3E8+lojhYb8TPMm+4dzzaY8ZKL+3SzMlVw5hnezV56yFxEmymPCnUJxYkMjPDVXgmSMAs/wbT
 zxJNKRR39wz0P2XdOeovc1v4skCgEpvuk0E5L0nPCaPIsXMixdw3vS2k9WPM0SToh66eiv9umBt
 QyKSY+ZZatzQxX85BOGe93BkCgw9Er6cdVFWlAgnC3Lo6wshyClblRBoAWxhoHYhYaUUzRsYkXM
 sACTR+es9xF6fh9AoApEVojy8Esyyn6cOfWKMjMqi0++zV1yrE0i+Tjv89ZBchjKjcmrI9NjHMZ
 Op3Rx/THrh1Y2EbxX3KzkQwljZiUN51xMf/fTmnsTmMRdcHOp3n/p81K6LL6AWBJU=
X-Received: by 2002:a05:6000:4381:b0:48c:6955:a603 with SMTP id
 ffacd0b85a97d-48e07bb5a24mr23986195f8f.13.1792478650612; 
 Mon, 19 Oct 2026 23:44:10 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e1d823cfcsm4013632f8f.39.2026.10.19.23.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 23:44:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 08:44:07 +0200
Message-ID: <20261020064409.179420-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x 1/3] package/python-scipy: fix build
 with cython >=3.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since Cython version 3.1.0 [1] and buildroot commit [2] python-scipy
failed to build. This has been fixed upstream with [3].

This commit backports it to fix the build with the cython present in
2025.02.x.

[1] https://github.com/cython/cython/commit/ed7e95912b6ed7d20e190fbf1aecb9f2a997d479
[2] b536caaec0 package/python-cython: bump to version 3.1.2
[3] https://github.com/scipy/scipy/commit/217748476403a1e5726a921cedb674e7ffbc952e

Fixes: b536caaec0 package/python-cython: bump to version 3.1.2
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...e-int-instead-of-long-in-cython-code.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/python-scipy/0002-use-int-instead-of-long-in-cython-code.patch

diff --git a/package/python-scipy/0002-use-int-instead-of-long-in-cython-code.patch b/package/python-scipy/0002-use-int-instead-of-long-in-cython-code.patch
new file mode 100644
index 0000000000..6763c8cc5e
--- /dev/null
+++ b/package/python-scipy/0002-use-int-instead-of-long-in-cython-code.patch
@@ -0,0 +1,37 @@
+From 217748476403a1e5726a921cedb674e7ffbc952e Mon Sep 17 00:00:00 2001
+From: Thomas A Caswell <tcaswell@gmail.com>
+Date: Thu, 21 Dec 2023 14:20:52 -0500
+Subject: [PATCH] MNT: use int instead of long in cython code (#19725)
+
+https://github.com/cython/cython/pull/5830 /
+d7e95912b6ed7d20e190fbf1aecb9f2a997d479 in cython removed
+long as a valid type in favor of int.
+
+Upstream: https://github.com/scipy/scipy/commit/217748476403a1e5726a921cedb674e7ffbc952e
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ scipy/_lib/_ccallback_c.pyx | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/scipy/_lib/_ccallback_c.pyx b/scipy/_lib/_ccallback_c.pyx
+index 59ba74369267..6c493dac7c9c 100644
+--- a/scipy/_lib/_ccallback_c.pyx
++++ b/scipy/_lib/_ccallback_c.pyx
+@@ -58,7 +58,7 @@ def get_raw_capsule(func_obj, name_obj, context_obj):
+     elif context_obj is None:
+         context = NULL
+     else:
+-        context = PyLong_AsVoidPtr(long(context_obj))
++        context = PyLong_AsVoidPtr(int(context_obj))
+ 
+     if PyCapsule_CheckExact(func_obj):
+         capsule_name = PyCapsule_GetName(func_obj)
+@@ -70,7 +70,7 @@ def get_raw_capsule(func_obj, name_obj, context_obj):
+         if name == NULL:
+             name = capsule_name
+     else:
+-        func = PyLong_AsVoidPtr(long(func_obj))
++        func = PyLong_AsVoidPtr(int(func_obj))
+ 
+     if name == NULL:
+         name_copy = name
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
