Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9C8606A321
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dtLJOgZ/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qSDXtxq
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8021C607B3;
	Mon,  9 Nov 2026 14:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LH3cO1Yos6ly; Mon,  9 Nov 2026 14:22:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 97E3F607B9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794234135;
	b=agGUN0MDxXMMXqCuHCaRbezpGNB31bbMEXkaevA3Dc3+rsyefPjR1nmoA2NTO9elEmOI
	 Xz7B7BDdajjvW4lA9S/e/+D1GEXe7/D4qXXmip7nr2rB5neJBH5adp5B8pDjlT/3yKdG1
	 BOFZIDunBW104hLl5gLRN+EbyLM6EcfAvmZmHL7Jyp0H9Hx5Tp11lJTfwV7bp8Ne2fLGu
	 mXzHyapP3IUn+O825LlnVc43pLUrgLbT2KAF0U4MVvH02HcyBInkpjvlV5ob/lD5ol5Ke
	 PybPpDFOWP3qZ5NrZ1I/ji2e8lzUOappSfsXlbEzrRV+rDyZsSC6dym0IsGpBZHl9aA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794234135;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ub6rUcFTrKGfVc6cLJym/qW3KeWdNip+m7APRTDqX3M=;
	b=mVNo3KKIO1rCMy8j0/1QG9AFdTLhp4461GY+M05Nu4kAeYPOvXtfL2ElZrKl2zxT7vSg
	 OqTPDQbYjXJ3q01WhzeLBhqhbSPLiBK+M94yyfvrgkq4ZiNEihoDQ9aIU/vVOKrVmICLJ
	 htFaUP8UY1tV0y3FNLqNafHyf98CDk27eVrczh4fjsIHG/+84ZwPwXMcvHe/7pEOlo0a/
	 +oImnNnQXL9K300C42ix/VEPlDU/FLHckx3RpPSTD5QqFp78J++PJu8nSfr4795RMWQ8m
	 nVecB5KcAcqVHr6eGhlIgVC7qB65MAWONVvTW9lZ/raQBNq+jaYIXZj7FDl856G9vVw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794234135;
	bh=ub6rUcFTrKGfVc6cLJym/qW3KeWdNip+m7APRTDqX3M=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dtLJOgZ/C2aYEHpbP1CGM4CWjQO7f9rBt5LS80ZHbhRlDlEOJyWMEa50VYRKxnAoY
	 HhBmQX7WocHSPksXYs1p2yg6/kWsQPNiOU5080WqtdgrbESmZmbfwTXJmszInx9iFA
	 V269uHGvH/Ho6l7csvzlTENTY23INCsJ4MCq+Z1Bj7gD+aq46DJdDxdaYMF76hbUQp
	 H6qJnUrt5Cv4g2lUfRdaSFUhMQkg7wV5+iYurB56exTDE18NW+nw432vhAK9tDt8v4
	 i30wwTTRc+wOJHM9tKjF32/qf0Vx8q7lD4zPVZX6zuq8xSgurQTwRNajSXh6tTAVrP
	 QGjNHakxssD4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97E3F607B9;
	Mon,  9 Nov 2026 14:22:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FE3E932
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 14:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D70480BB8
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 14:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nWrceiCHPNm7 for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 14:22:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8FB0380760
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=0qSDXtxq
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FB0380760
 for <buildroot@busybox.net>; Mon,  9 Nov 2026 14:22:11 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a1b07c3c5fso9106225e9.1
 for <buildroot@busybox.net>; Mon, 09 Nov 2026 06:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794234129; x=1794838929; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=J6Pol8/7OI++f3AHlRm9QwvncmZeqG2gzKjZISDrkjg=;
 b=0qSDXtxqcOJw5vfUPQFAEs5UuxRIgMX7kYTA9DK15Gcn5gCRugMPEWSYPoOaPjudpq
 V0qXeIBqXeouFCm20pkPzoOSnAdRkaNK1q0ZzkIHUS3Mh6L6v2VHJEvbM8rlqdYbJ3HI
 63CmbpPQJ2qYNp18KcOIM1ZS478LKq8GsA2HsX8G8CR9S0tdIFQC6CiKuZpLnze52ioT
 BLHgP+aou1W6k5DD5R2x2iAlVcFuGGo6HZWkIW2gP4J3Tt6U5lzXaLOY0TGiSmHGDEvc
 c7cj/321LLyS2zmKaMGIsyhmzdx0GI7Eh80uuDgLKRKH885U99iYIbs/zV310uubD2Cc
 czXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794234129; x=1794838929;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=J6Pol8/7OI++f3AHlRm9QwvncmZeqG2gzKjZISDrkjg=;
 b=mrthQKRmmARu5jIKoWcWLmypjDRqlzMKwLlhlGmOShdsJxd09VGNI1VDL+yjKq9kGk
 uui6Zeq+HIJe8F/EdEOS4CnZO3q7oPrKuSgmwsFoxCJue4R5Jpe0NYzG8H74jIKoRKRF
 JQnrM1tf3t7kfgE1ebRtJPZqsHnL7YEgj2QPo/6xJzlQaLJPWpM+vDQlQFB8tkMlAuwQ
 H8Zpi04YXoWaJAvF66dVRR/V3U/AYB9AuWGo+RL57kZrjJbOl5FD/BX3xXt8pHMZpmOd
 IotbkIE7cEaETAM0qcUik+hSUwoUrikf3JiK9NA/jERpIdeU0Epj1ThWKmnqCRaaSOxr
 Migg==
X-Gm-Message-State: APuU4Z83bdPqXOA9DQCMp6yb/bzkNpx6XyGdmZWphJxkpIdlHZuew2BJ
 HpcN3HbLEJD8/efhfq0mUfhYlTUtFVkbkqi5LaNslTAqgPyhcD840hRusCnviA==
X-Gm-Gg: AYBFou0U2wFSHIp6e2oQ8XMI11H3wge76JNYgtdpBB7FqYdy+7NEN0eKakdWgOz0mrT
 fxZlabffHaONYYXJ1Q57MLkIAKr9Q3+Tx9V5AZ7MUXBJ9+wP3pi8cDDJNL51uPfqPajf5qQZEOY
 XS7fLmRigT8T+p9Uy48q8PccRLq2OSryqrPPeWHjoZfDSeoSYIbQTJAj3I5kShwrXokCjWueOo5
 tyDSzhOBhOHMXW0IRRdG6DFm10Z5RalRETaQoDpB9JJiZ5cq7+2PlIuNbgaPr8sVcQfpLuCrins
 4n7GZ2Qum0OuxOi2r7PTroHyRUSCa0eEvstl86WAuFNrWdM8rGIHbRuTPk07GRYhX/mzOcoX1bh
 sYiy4PIciwcTfSH8IdSvYHN2Kar1tAHYeImtpfPUOGZN16dzZhsZsQ64wITc93Z/Sih1fG1yzbm
 nW3TD0WgQ5bmP0Lqc1hNFvtr/44VeELGkVLQbCrpiinfhzo+8H/09dRHTmbeLY75l9gJhgeJdYC
 N0mkZ1A/OeJSEZxvFXCS2V6zONp2FFXT786UaoFkndgoM/CAOZ6xnSkW4/E87w0Xz6BiTBi/P4r
 RF2e9FG4lZBl2KBlP3u4qRTqH6/DRqKbYxP2HjEZ5LWoTe9Nl0eDfhfgSWtKVJUQSo1M11QbHGN
 3IENVkH7m
X-Received: by 2002:a05:600c:8b34:b0:4a3:5a55:f454 with SMTP id
 5b1f17b1804b1-4b963c7432amr74630305e9.19.1794234128842; 
 Mon, 09 Nov 2026 06:22:08 -0800 (PST)
Received: from vm-2404.. (186.185.66.37.rev.sfr.net. [37.66.185.186])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b795012503sm136878515e9.2.2026.11.09.06.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 06:22:06 -0800 (PST)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon,  9 Nov 2026 09:53:50 +0100
Message-ID: <20261109085350.375349-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/hare: fix build with per-package
 directories
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

the generated config refers toolchain into per-package/host-hare/host/bin,
packages using the hare infrastructure, call this toolchain.
so, add it as dependency.

see failure on https://autobuild.buildroot.org/results/e69/e693a6d01e1f473d4b0462d2bb99e498f2d66cc2/build-end.log

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/hare/hare.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hare/hare.mk b/package/hare/hare.mk
index 88662d3c2..6cb45da20 100644
--- a/package/hare/hare.mk
+++ b/package/hare/hare.mk
@@ -10,7 +10,7 @@ HARE_SOURCE = $(HARE_VERSION).tar.gz
 HARE_LICENSE = MPL-2.0
 HARE_LICENSE_FILES = COPYING
 
-HOST_HARE_DEPENDENCIES = host-harec host-qbe host-scdoc
+HOST_HARE_DEPENDENCIES = host-harec host-qbe host-scdoc toolchain
 
 ifeq ($(BR2_aarch64),y)
 HOST_HARE_TARGET_ARCH = AARCH64
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
