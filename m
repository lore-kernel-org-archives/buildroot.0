Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D65B606A31E
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 13:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=h6pSqVuw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tSKOlUlw
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4F8A60ABA;
	Fri, 30 Oct 2026 13:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQDNnB6Ah5t8; Fri, 30 Oct 2026 13:59:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E25E4607B6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793368768;
	b=gIqHs/lZPVK8IkxOZxjqz2o8KgdAoopQh/8rJCrhi7YCezqTnU279vhXzNF/y7QeJh12
	 MKTudAmu7IwL68gmYrlzcglkHHuDLF+J8r5ukvEJZgekjdeQicCy/W1A7tsRA5e4lmDPp
	 ocJFR2SVBLlbuYfGJ9zAmNRKIvRYLNmbLkLAmqOo8Qb549oc4qBAhG/Tjmukx9HhAE4Qt
	 d0z636OyqsoZi4DAevPEIh4AQqaHl4LM2g9pIGtFqLKFYdU1UyqGsQf9E3eno00lge269
	 eRun9kAoXizZgCwoG7xrWb9Yo3JqN9I8VpN0Me53lQwp2HeduNmx/QOEFon83tFPR+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793368768;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=GQOwEJbKaJ1bN3heL0KdLoAvkFedKjnBhYybq5kRQ0w=;
	b=sHd0GvpMyH1YqR9XSM1MpNLKUE5uiE0fDLQtGknGbmDov2pjjdUjq6+gLsnFyfKeb+WJ
	 4T+wbLA9f1hEK/KNRZuSKIK27SSbB6HTTqowbxcGaw/Na9X4JC/bXZ6/LF87CqA38ufU2
	 ryWCKMdlPvZwzjWnrFJWCS/FOiwJMuykzD8Bbyzr+itInOuGGVhSQoM6fTOLtGpMGzb5X
	 tkEmLn4ew1cH9Vb6oLyUe556Vp94VXfQxhhffM2lkJ+5bt5r3OOV+gCLXo/adKsv77zGN
	 0Fh4/OOMvrLapn3Bc4RwJJkK9VGT/yx4CfvDmWKlSxny1l9/6nvittMMgvB76hba7UA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793368768;
	bh=GQOwEJbKaJ1bN3heL0KdLoAvkFedKjnBhYybq5kRQ0w=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h6pSqVuweR0/xO7fx12Ch+XBjaC61dETMqFPRD0I94aQLd43aL5y7srIctL6YTeaX
	 lC9ejxT1qc3DgU44u6rH9CQEXs2ZBZOMgXSdsqNHlhZ6oZDB2kBTk5ZHnmPRveRv3Q
	 W8l7YODovxhxym8KDdxdsmDuDLYqxnNJsAZZ0X+5Tl8LN8i0QmZaTzi4N7fGtAtEVK
	 TxiPnHndAGSmPWdyQ8K+mtUL6TDaVbTa+Rza8M6zCCWUFF5yKFazZSKiBg+bxVWKr0
	 JU8ClsJAYGXgu4qNCJGDSfqwqt+yO4qWREcDSff2D7ORZNGhxNqD6Xyji/r5dheSxV
	 svknrE+tf3APA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E25E4607B6;
	Fri, 30 Oct 2026 13:59:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30E874BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 164C980E50
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YylnuAy9jC9x for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 13:59:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DDDD080E33
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793368764;
 b=qtCLzaqbnWZaKd0kAf58PFCuIDz4XqeA2gUK5wkOuj3TJNfPOyJjhJXuvis/Eq9SWbae
 UYkVMB+bXfpHV8I4CWtoH6VvLufULh0gcZN2L3Yb1eIJUiOZ286IdqXyUVCkBG/k6eWV7
 Drhj2UXp6w7WhF7fwug+K5Zf1d1pnU9VKtvNxK0XuXS5YTNjo0/OCyWKwRlOpVuTPGxh6
 CPLAGbsU54PNk5Ppq3YeWviwf0VJoVb/kg9BRBC/aybgCduc/9m2geT2efWadwrsfeW2p
 /W95BsqGuSkBWGowfFTBQr1w0gboPu2dOlHwknP+nIKIsojlXGq2pgZ6v+YGYuYqiSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793368764;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=nCWgjjnBJMG0Uq7XXCIJe5ZupP2n3B/aKWgHd76eSVs=;
 b=WXq96tIebUZcccH9tA5obTKbQzpzKMAp2eMC8JA15OXOYtXRPljSOFq2ijUbhzh6Ocbe
 iSNBbk+nTwGI4M2Vv91P3YEjYm9xiwJasTOgttc/5dDC3GhMSHNDMOq+FOZSRphEXZFzn
 i9eFTGYUfAoClNAKTT4jaBoxNDhgAGozXnPZO9rpMDpMhUtwf4c4zC+awv51vRKGjUq+t
 7OWfIzuakIm1M6pv7gHW75TGq9fjPN8yQGEHZ17zo0J6XdjpbcfMZYDtWpEe+v+yerPWh
 JetV2SZYeGmQ+dNh25LYJ26fRwhiXo2c1TLfitMqo0BSCNUHkSI0w2iKssHePkQHS7w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=tSKOlUlw; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=tSKOlUlw
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDDD080E33
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:22 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48e6eb21a8fso307067f8f.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 06:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793368761; x=1793973561; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nCWgjjnBJMG0Uq7XXCIJe5ZupP2n3B/aKWgHd76eSVs=;
 b=tSKOlUlwG7RO2T+CxMcRoLaJUeJQ1c9BA5urniSHFO7cuX/MWi3i7imK2K0sTS1UlV
 IeYGUTgYo0AOY0RHUYZ06cEOfllT7wGqu0gf4WcHXYsYb5h9uUWUWTTH5khy89iHpdEA
 pqfsjEAg2qPLpOdTmzCijpPgjxwTPNXMfZTZ2JwKE9XuEDfyl8Reji9KgNT7SrC5XUNn
 nAG547rrOjdT8lRIXzZquUQOgcbkQF2z51z9HBFn98QpsQq+4LDo58V0ptsC3MBbArJk
 Fs/zrt+7UGLDI89J+eQZnqWYKFuCEqlLHcSZGxqyfj6CrFU76RsqDx5bmni5axyfVXLs
 yuaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793368761; x=1793973561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=nCWgjjnBJMG0Uq7XXCIJe5ZupP2n3B/aKWgHd76eSVs=;
 b=X/N0at3Ryd+S5Cyx101JhfZT3S24BBDebV8Ty2aPzw927I7h9NIzCVgfB/6rZCo6DB
 Hu78ZZjAZ2MsB1QXceCboMd5gBNALIHE7PIygZyQGv0mMU2mI7ZVqGpUj5yXfW+Z9y/2
 f6DQWBtsVJZX84ZHQ0j9d4nIjy0g/7CxgdSvwn6JeMze1lQXqdNDFaNVX1FLPjLXkwdV
 nmwK1vs2HCO/dp+OwWcB+aMl+m2Bc7z7rBBN5Z6chkMFjhV66z8lCXhj8j2iFEZHjxI5
 MOI5p+6NJMW9cnslByb5vAkMBUWKzA/6n8oG1mf0wYAw8GrEPxok6gCTRLVkhPNJwYLv
 mftg==
X-Gm-Message-State: AFq9FYLo9U8aSo2bfGhkGBzfzFU8zFLtyTlw+2rv3dAPUGSU1/DxNtVV
 +yzEqZclWhLJ2QcfBrAYnDIPJg+5aYI1yA6a40KezRHiITut738DsRSiU+D4sg==
X-Gm-Gg: AYBFou1h/IuNi+2SzAYr94KWFys5J4Un4uk9Uvel5ak0pXs/qaf5Mwdfdqf713oseS/
 mB2AiWQQqATP6Un0ZQsY2YuzQpi2vlewod+uFFKAg+4yf9TbY/VVji9F+5gK9Ust/29g3+qgJOS
 ZwtiFeVewibA7T6TcUR/JRZvQUd1VvsB+vZmClDZfrdmrIeD3+MNXJh4mvRT8oBweZh1/0MLT3/
 yPjF8a3PdMUx6kN4AIlsZFPTUQPQAU4Vbni8GL6YXxHFgRYwwTVZEhqZqJCwEzB+KyMHbCSAE8d
 CDdakqGdtOCs7ALur9quuA04d1fOmBSh8/NxHPRE9JDV7g6SNlf/cXMXL50U9CnWEmeQ4p+szNO
 F62WVhO7EAP6d4nxfsvQqlJ1khkFir6C9PDqZ7Fxitzi8LC7CtGqDS0q4yfXidVSNLMWkVus9KX
 A7G5X9tEE0F95L0HirvEk9Tx0CwLKr94T4QzPd5nU/FaH/lMSiId4VJO9uZ5V70Hf9zUz4r3bPc
 +pbEQY6pg1yJl0jPZ6+A/Mr59tSkYUn88RyxJQy5y3KjjLowrFiEx0WqRGscjMoy7/Q0mJQHEhH
 X2X60VDnzjhuwlucBvr1rRpSkUNXYqmcdkc8/tsgo73FEkIruyZw6g==
X-Received: by 2002:a05:6000:1887:b0:48e:d36:77 with SMTP id
 ffacd0b85a97d-48e6e2bc062mr5873010f8f.4.1793368760912; 
 Fri, 30 Oct 2026 06:59:20 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b959c1sm3423347f8f.45.2026.10.30.06.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 06:59:20 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 14:59:09 +0100
Message-Id: <20261030135916.3599219-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030135916.3599219-1-angelo.compagnucci@gmail.com>
References: <20261030135916.3599219-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/9] package/webrtc-audio-processing: fix build
 with musl
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

webrtc/rtc_base/system/file_wrapper.h uses int64_t without including
<stdint.h>. With glibc it is defined anyway, as <stdlib.h>, included by
the C++ <string> header, includes <sys/types.h>, but not with musl:

  ../webrtc/rtc_base/system/file_wrapper.h:86:21: error: 'int64_t' has not been declared

Backport the upstream fix adding the missing include.

This was not noticed before, as webrtc-audio-processing selects
libabseil-cpp, which was not available on musl.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 ...-file_wrapper.h-Fix-build-with-GCC13.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/webrtc-audio-processing/0002-file_wrapper.h-Fix-build-with-GCC13.patch

diff --git a/package/webrtc-audio-processing/0002-file_wrapper.h-Fix-build-with-GCC13.patch b/package/webrtc-audio-processing/0002-file_wrapper.h-Fix-build-with-GCC13.patch
new file mode 100644
index 0000000000..deecb8e3c6
--- /dev/null
+++ b/package/webrtc-audio-processing/0002-file_wrapper.h-Fix-build-with-GCC13.patch
@@ -0,0 +1,30 @@
+From 9a202fb8c218223d24dfbbe6130053c68111e97a Mon Sep 17 00:00:00 2001
+From: "L. E. Segovia" <amy@centricular.com>
+Date: Sat, 23 Mar 2024 16:34:50 -0300
+Subject: [PATCH] file_wrapper.h: Fix build with GCC13
+
+It is a missed instance of cdec109331de34958a892a1418d67806b171b862 (!31).
+
+Fixes #32
+
+Upstream: https://gitlab.freedesktop.org/pulseaudio/webrtc-audio-processing/-/commit/9a202fb8c218223d24dfbbe6130053c68111e97a
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ webrtc/rtc_base/system/file_wrapper.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/webrtc/rtc_base/system/file_wrapper.h b/webrtc/rtc_base/system/file_wrapper.h
+index 42c463c..bfd8fcd 100644
+--- a/webrtc/rtc_base/system/file_wrapper.h
++++ b/webrtc/rtc_base/system/file_wrapper.h
+@@ -13,6 +13,7 @@
+ 
+ #include <stddef.h>
+ #include <stdio.h>
++#include <stdint.h>
+ 
+ #include <string>
+ 
+-- 
+GitLab
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
