Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAB8606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 20:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JLH03aiz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bmro4Nqh
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41D1960760;
	Fri, 20 Nov 2026 20:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fbK8bwk5STBo; Fri, 20 Nov 2026 20:49:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7747B606D9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795207775;
	b=seq82zviMm55+xgvLHLN7ZBfL26sOE+uZUb9Z1svD1ltQzmYbSyTZR+ApAL20O9K7h0M
	 BJynUh6sSaBnUDaHW/bO5UgORYDfvIXGUx7+1w+QxOyctKU/ZRb78726Jtu4sSSoNhpZc
	 7hxY3Lmc0pQCrRFUMVCbCUW7qkwrGrseia5FiEsp/sktppt3l2b1QVgka01/UqYVYr016
	 QpqZe/fgAcKofdnY/Rwpf7Rw4q8X9EpD//hR4AhVW3sU60oE55jwgFLWlpvC4eGmfRG/2
	 1fOeOdqhgZvoyHY7PQhG/nGliEogKbsej2AhnuI+76kXZym+63els+Ar2i+5H245vqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795207775;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JLMmC0PGh/fF7Y3XpmKAaJIQtTYIemYt68uv2fuxlek=;
	b=mDBsuvOYAnMfB41mh3SWkncQFgGV6S5+4EkplQl1vUdxgCQMk9Ak38NpmNkaj4AUNvEg
	 HXlpS9bGdGdwQmCoP4JmMjkPQ0ugD7YCK8UeA375xY8AC5qupAMfO95ipXfBznT5w4oCt
	 xoxV1Kc7QzA8BWTPhT7MqwTtZlAuuP3J5WZxeKW6UZHbla0VvN6mKnYLba9WwGhAX1JvD
	 MycFkIGcpYRvcHo9bS8Elzk2FfI+i902dIs5D5aH00PFWwawFa8jx9pBIAOEtPGEnyUl6
	 Wy21fr1BF4u5wv0aiNeAbvnH+xtXmq7ocQTX9N2b36I5XPFaf5wIGi8Ni/UL9w8vN3g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795207775;
	bh=JLMmC0PGh/fF7Y3XpmKAaJIQtTYIemYt68uv2fuxlek=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JLH03aiz0EhuhJW8JfiADcQgzglFy+h/hqv4Na4jonIi5QjujzzpN7piAD/jJq2yA
	 FbDEvYpPIqddODQPFHpGBdD2eoX3y/i344AEHX/ie2xaUB7OHahWMpREXzXyLfuZ5n
	 X8JOBF+j0Fi/tw7bp1Qk5JMZXQ9r637GLsixoxWpV/1H7FaEZqzjCEX9hFbFzKr5kh
	 4P+BkN41pvnki1n0/hfDq0Q0Mx9MDmAzYQqv/c5tF2SU4XKX0kwIxCDOsg2VyEkc2V
	 w3gXPLNshzbeaFLcX9TIFtPKqbJgyzraC/aDHEsnIEPOrlAo0HIaX+DyKOPQabxrxk
	 DUpp30nWRxztg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7747B606D9;
	Fri, 20 Nov 2026 20:49:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ACEF5310
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 20:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9242E40AF9
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 20:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRVRTdgDbxKS for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 20:49:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 81847400BE
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=bmro4Nqh
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81847400BE
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 20:49:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a5177d78c7so12868555e9.2
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 12:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795207770; x=1795812570; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=UaC3PASTE3gErWfjB+PloQkDSfsIt/tThJYZ0vpc72k=;
 b=bmro4NqhdWM1NkmhSKzgwJARMq03CDrC3ekprpMdCOBZ2SzIProjLL3vY5Saya5xUG
 4UKAFA7rnW/0t77482/N6amyA7AlwUQzBe6QbVNrYgF0m/pnsN2XmgEDakpQ9/KcJiGB
 stu1YtDdvbBwmrdjuX5pT2nY9nGd/pa3mZmpvpqDo9rLpgAKywXUXewpHEoHfIO2rABM
 QbGz/iok9LdDcYlnE219H/g0ux4GqSu7QrJbRAI82YbgKlskDwAevDzXZnkdNTDsoqKD
 JZ2x4QS6S0PPkKdVpe3Tkv7tzGtDioMGgF96Xv11OzQFyLbj96tsSJFPRMjHJ20buTJk
 7Vhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795207770; x=1795812570;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UaC3PASTE3gErWfjB+PloQkDSfsIt/tThJYZ0vpc72k=;
 b=y3QJhPBKgrPzDfR1m1LidhaiOSp2/hlSIyqK38hWp1cGtk2ziKfuHZMt8/Jfbkm/3v
 PXEETcp3Y0gzjCcxiFWH0PEqCJrlh1+W6jpCm/lEyK2Wdv2V68w+mlBR2+e/Nv5ePzTa
 2lupUhEtCTdPAFuk5wFHcRUtfYGmOYLj14VjeoQ62FbXfQpodO+39OxZ7P5GfUFpWlwR
 kK9sTaU96qAOYej1/vwV0/qQu5Ay3HLLD8ezBKs4F+enddgE78ax8CyO+9QBTQOiffFB
 9JaVShkAktVvDulFMyFMuNxoMfPmv5b+NIUkL8jJfA0N/A1kOw/xpk+yPHDOBfupMLCi
 FYYA==
X-Gm-Message-State: APuU4Z8BJkHceyoMTHtNv6HZChXtd8V2MA/AEn1oSS+CmsyuTA0F6Tlq
 j5qkgLGZiP1Ja2zC+5fiNqyUBn9ZDcf36d81of8G6i9cSyyfV9gis2tI5b+IcA==
X-Gm-Gg: AYBFou0ZCIUGti5YJ/upO69QLNl+JIVT7ALybPezQSTRepKQ+ve5NZG3ck/wS9MnXSi
 QtCq7/D/XbBeM/9PQUnRFjNxfAP9kzUsjABMajJGU6CTaE2aYqZprwxMz5F8Pu5PSzsVHdlDJyN
 KpFCAXomfxeO0jFVmLwNQNJzbqcyv3QdqQCnFrOw/O/Rft6fwjWyoF5x/SKIwpS09vUbEx2q4yU
 XuGYpbntxPVpOHKithjnMnMpG2AAMB8vUcR/LuDy+IYiTQ/3UaCglDyApZrkmreXlmxozyE9umO
 oKyNuwPL7bNBHMtMjAF5REAJweRF5rceQ+aByusljrZR3ZOH/zbIeW6PKdrviw1Mda+FI2SdCh/
 g1rs2i9J7o7+3Xfli4tZD6x3Iwt2CufkwuSIJ89kY4wQ1ff94uvPA3D9R9dPmLqrds//MQsITHT
 CvaG4EbZab9QWdRh+3rCdIRHvZvxQaNCkTuwVQc8KJsezQJ7Iwtmi2BIOZj7xYfwjhjQMBSprmd
 Czk3e2QJBBGV5D9svC7NZ0kDzmo/3gkQi0g251OnDt+MkrLRHAeJb/dejD3dMexIfYy2sCWAkvK
 oQDyvijAomHaEeyBFQ62evreuSnomnd145h73YyQPFQ/ZCg5gkw=
X-Received: by 2002:a05:600c:1c1f:b0:4bb:6847:7943 with SMTP id
 5b1f17b1804b1-4bb88814510mr114271025e9.26.1795207769946; 
 Fri, 20 Nov 2026 12:49:29 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ad6403fdbbsm3189029f8f.15.2026.11.20.12.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 12:49:29 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Danomi Manchego <danomimanchego123@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 20 Nov 2026 21:49:27 +0100
Message-ID: <20261120204928.4020930-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/jq: ignore CVE-2026-44777
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

CVE-2026-44777 is fixed in jq 1.8.2, as stated in the release notes and
in the upstream advisory GHSA-rmpv-jgvr-wpr9, but the NVD entry marks
all the versions up to and including 1.8.2 as affected.

Release notes:
https://github.com/jqlang/jq/releases/tag/jq-1.8.2

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/jq/jq.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index 83dfe4381a..6c317ab9a7 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -10,6 +10,10 @@ JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation), \
 	BSD-2-Clause (strptime)
 JQ_LICENSE_FILES = COPYING
 JQ_CPE_ID_VENDOR = jqlang
+
+# Fixed in 1.8.2, NVD database entry not up-to-date
+JQ_IGNORE_CVES += CVE-2026-44777
+
 JQ_INSTALL_STAGING = YES
 
 # uses c99 specific features
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
