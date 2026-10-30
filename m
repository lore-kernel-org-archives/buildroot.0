Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51F7606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Y+7cxQ/U;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ge2BYGnI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8060681271;
	Fri, 30 Oct 2026 15:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMqqpeuC0F1E; Fri, 30 Oct 2026 15:24:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A530E8125B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793373887;
	b=Xt1AQimpKvyEYlboVEAOenRMkf63G+rbQu+wb+QtvN3FKslcfOSRq0U7yES2/L0Cz9aY
	 cYow+9GSxlXAODJqA95aXHCtCPFxGBr5ECEPXsFDY2xIGl6z79PKnxuFU16XZcMXh4b1o
	 gtdTqafRxW6abDtGwLXipDxhTixK580rw5HeQPs7fgpuCu79V1quwVAZrolzYPOfRf/Bw
	 yPJZQjoTxmr1o+2qGqUctb4+0poLDlBwZMe0rs15Yse8c+AR7sE9menserTT6GkRqXCda
	 gZFSBEWu39ldVEwO+8ehaQxWL8wuoi8jIbNbN+JY6gvJY1F257yEarS8an65YEUA46Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373887;
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
	b=J2+0bxrAazbu5q3NgimHlux40q+JubktbR+dmmE7JSGygecl+1fmUh6ULE8WYk0V9waU
	 CfsOUsB53qQG6Csp2bDzihSujxJhyy/0e5D5kbymI022b8ZXxsLpr9st3hS+zsiW/I168
	 vYeKfD4ax72hJNf3puY+vfgDgh+3Ge9TfTrOH05N3nRok8nptUdr149KfqCkdIK/WO8+7
	 wULksvyK0R3zn0fBKztqvm1pO0h3s3ejR4Jq1e3Lf1iFyHp37Ynmn+Xnk8CxKRyCq6ZFi
	 o0xvAq1Y4Fkdr2I4L085XFKQl0Be5rq3u2MWbjBg6CDNHxeCDhXg60/KhlbBLj6Qn8w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ge2BYGnI;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793373887;
	bh=GQOwEJbKaJ1bN3heL0KdLoAvkFedKjnBhYybq5kRQ0w=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y+7cxQ/UYHTqvbA/h8O0eJQHONl1mIRs7Rp5E4tTg+HG0MzFZaDJeg1VsoM+hDU7q
	 21hvIquie7Hl8C7igBykurKNlVcdEDcK9siAjwmyFbB19tics9oZnj40jOfB2gDVyn
	 9b8ZMsFBoizs//qe2bltpbQvHrfRJDmhgZr3kSCbEMUmBeWxRGmx9J+X6VYbyBbuip
	 Yg8j+kj7FsHRynkjIUvpeS3T5BvTSKTZRJMNZwgcEgmkz9zEISeDjjMX8Kl5lAqEzE
	 6z8xbv+qy/VDaP5OX+/FhyqqEwDKfFw2mz1kiTL6LCZOgjaClnFJkMEqgubRPOG1hM
	 aePMdu6oXnBkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A530E8125B;
	Fri, 30 Oct 2026 15:24:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99504362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AE9281265
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37HN5NSu4Ige for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:24:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7E3FF81250
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373883;
 b=oiElIHb+FgJ/ZD99ttUbFu6nYLVFYtJd8M3ol18qGaw8pXq+eeZTiL1nteoGetARcBNk
 u/hKc4I3KpDDpyqxCcSu9M4t6TBOzNFcG67oHrx5ox3F+J3nKYQ+fSofD2Cr7AMufrkOv
 IvMqi4gfn9G0m/Cb4PwMfvUjljLSCXtRDu7/jwl01+4YhgsLzRu2+mqUKFRKJtDyPTvTz
 rLQjIebAIiBj96Uced42AgvXCqPJ/3f/epPnEZFZ9k15gTF63K4fwq+AeN2Ow62JitQqi
 Wy3W8PiFnQAAgxf2UycPlGc7/S10Y7z3/a64lkPA4w4uTUNzroMKPBC/vvqfXaMbWLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373883;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=nCWgjjnBJMG0Uq7XXCIJe5ZupP2n3B/aKWgHd76eSVs=;
 b=sBtVdsp9in4MZuvcy+pTZLZvmo0e1C4TNdJT8ctuKTdt8DEzJIkC0Z5oZxkwP+MM6ZkF
 /psJ5GX0m6k/21gfUbzP5apVfEZssUcyzNC4sz6uy4ib5C36oYzwYJX1ursn+O2PtPYDV
 DAjDgAeaMtTo4qIwXYEcqEvj4hvyA3YFGhqOP2bmRmf97RsVu8tt/Y8HBsUfHhuN2MaLz
 NXliqGiVc25g0aaOYV9vfDaBe/mTdjlMdbJmfCrQIaodZJ8FlxCkF1pgiSuK8K1AP1fxS
 UhmUCLfh4lBacZxKaMg7PX1IHe8i9p4MdQAwcBd0y+YtqfLDFwAb7yCnpTRB/41zhjQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=ge2BYGnI; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=ge2BYGnI
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E3FF81250
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:41 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48b042c0759so460910f8f.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373880; x=1793978680; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nCWgjjnBJMG0Uq7XXCIJe5ZupP2n3B/aKWgHd76eSVs=;
 b=ge2BYGnIBKZC0xJVv7lywkRN39G55YAUdLHuraDGH4CP8R9H4CXI0joeFpf7djwapH
 FMcElKse0purVtVA08I1r0NFIBqcpY70zInQd4DRKoNWsGhL91Z+B3fsbJZXYIG1l/Yn
 BKK6EeRzK1kzCEVecqAMaRC3NG+TQRj3NXuoZ/vIn7IKXKKMOeUIy0+SLi4Ah+oxPHUO
 rDfDoZbIZNQXSMNMWKQlVvCgd9tJ0AJtGRa20Cu8x0Mn5fF7WnzjGmeQ/3fGtk3LBcFh
 Di8akTJ5W9jkX0S+Is1pbzFRz1hVPGK1ZeIldsYT+eJparGtxfozOU9jl+geOpEh3COD
 mhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373880; x=1793978680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=nCWgjjnBJMG0Uq7XXCIJe5ZupP2n3B/aKWgHd76eSVs=;
 b=LRiWbYZH6cCdI+RFr5gOYHUni4ZdH6jjSDLjn67ca8YHStjkxqQOyLdfinTHT4y8A3
 NXHRJ5snbWn1sZ14KKk//qLv3fjQBVhwrjc8qxE1KlE4OQl09JvqRb+OCgvGqcBU+0mR
 zJ4kF0EOdCs9FOQkuGEwcWW3XHvUAodZ72lBZDWcyNvq6ENlPxQGNLoGR9boa/QuRBDg
 LIOULUvf3rQ1/43NQuX4L++hk93T2VAoiH76eNFOY31fa9o+3RKgUqzYaPXyaLqwjwG1
 S30ZtAcjRgRjaS0bHpTZV2crWeachDdoSqTXpZ6VhEqRrB2wmrzD4Py5P/msDBldBYLZ
 odgQ==
X-Gm-Message-State: AFq9FYJpc13LZjKjBMhSR9oIF0GJ8IVDZewQzUq1f36lGcYMfU6jtl4q
 wSqQmGFItnZ5JoHcSwweI2rVElIJxEpDq4kZuGgbqxnErvVytn/YoaU0bDrIZw==
X-Gm-Gg: AYBFou2gP0+wFKNWzmsYAxIMY4E0qe2leu7S30WGIRusCkBmUJLdU5JlflJhcRhxLRU
 Kq6e/RwokY8xeNUbizOa3kUxahJ7+8GCnRPiBiE0IiuGH7oVlNSm80hZ2UzhKPpelTzQl7OF7a9
 1UAtE0pQKlA2a/RBTWXXSXv/7FZ7G8Ar6bV/hBwOiCbZKtdEICD1fuG5nj4kn9dbh3WUJcTLJcy
 lObJw00Zw4zdUBEozLkCFEP+8qhuQyU8ebsJ7Badbrmf1HRzEGyzHRuF5M2g7iAm6cvUUF+KIZ6
 nrkskJw2DdZ3wELUoG75LyzUgqzmjkz7/yoCstBU6mMB9wcBygBXpS+u08S89rFLCJI7g1xQFjC
 7na/fYhY2VEvSaNucoFEAGGfAiHu75jTwW+7ytmlGV9QH3Ou/Vg9LSxJgthqHGQJH+yFFajZfAr
 F8llygpuZm/4JPbmq2TCC7P12oLgZ73ijzF1WDZVjlEBg7nsvAOb4jTOS7i2ciors3n8s2m4H2c
 G9YA6v/ycjNaKVI/SxMQLNSGN4eoIA4iaRMQNzSKf2oHTBdlWPLVF78KCUgMLDGXe4fubcVjYy2
 VZZcbX73wGnKAwUn0whJfqO6juvCRGb8uy+D2+W3mrsGW6pYy9Uh7cd25lRDd9qTQsvhmagwvgs
 =
X-Received: by 2002:a05:600c:4f8b:b0:4a3:5a98:c279 with SMTP id
 5b1f17b1804b1-4ac17ffb07cmr57912805e9.8.1793373879983; 
 Fri, 30 Oct 2026 08:24:39 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b8c0b6sm3540180f8f.41.2026.10.30.08.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:24:39 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 16:24:27 +0100
Message-Id: <20261030152434.3738285-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
References: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
