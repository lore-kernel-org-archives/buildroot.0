Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3DE606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KoSJnoqL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WozqEZBk
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0627E60A4E;
	Fri, 23 Oct 2026 18:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1CJfSw-IRhxb; Fri, 23 Oct 2026 18:19:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1002260628
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779560;
	b=rdu8E+3qX2B9OBilHgrhAJ5g0NCnl1zcSr77eUx8lLQTV2DT6AKkIoaVSFokEsKIcaNA
	 uKWYLOeCFsQ0AjRFNtCQMuHlmRpbbihVE7UzAvYbir7KwTRQvqKoPWCxjXgT/ns9VhTnw
	 fagf7e2Uw8RVU7PxWLZjgv5jWcleuBfOf8gWtnlwUcbGERNKGijZm2xW8pVD0DevET/VW
	 rblFluVc4LnLKQ41ZZO1APkATRfLTe97f1W1d9AV/s8tlwXROHCMcxIATy+Qusedv+642
	 5/IIGaQ7+IpccRLDfyyMzvmQ+LvIiqrd77iDfEJTdI+45LlroNT9q44ZqCF35FrZDbQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779560;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xxWg24PdEnPnUTQfTRIOWm/TkBsZiTct7htWTWIhcn8=;
	b=Zfmdel9VVg/Qqq70+iZLDjdXCAU6q/zK08UkrDeTmzc9P0EK1qReGFputihrqjhYWgtU
	 mDRmJaVM9M1h6eTq6ksutXdY4RHimFO6ZlCCpsTtwRS/1iiN8+2SUBV1Utff31frGuf7O
	 iARohcHu7eLHiZuuRtR1n2X4OElOPFBNj20FDN611SbwAVYR7bqpJZ9/fijgEplrpCmCZ
	 BzVNIWJb64KZ4+xxuSUe8ix1M0DOVqoPAVy2rvD95ECFeTppK84OzIhTVHz7d9i7nTvM9
	 +lvnLJRrZ6aYomLLDIwXt7xb6WbWEf0ZFHcEdq3DeaN7rUwcdt+cpJvTDLCTen+7+Dg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779560;
	bh=xxWg24PdEnPnUTQfTRIOWm/TkBsZiTct7htWTWIhcn8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=KoSJnoqLJyYZVooNT96/4riLbfcDq1cYmydNFm0ATuxVv0XZQxrnd8UtZm21PFgbk
	 Q9uMg2dYfj1AitPaUZY4Kdaqj3Bsc7eES4MjPnNMSwXgCr7JYgotF5grn4TlPSPif8
	 qK5ByRlgbMqfI3sE/mwA+uExNzHYTCvrsdAwV158X3fKLR9bkho4OrAyhV7acQ8A3Z
	 9/PaPDknlYtLuCd6aMnJVfYBcremna8a3BniKrnDXjAp1P6Fq46LVLVD6D5M+kh2dd
	 kJmMxPgGlPWMfofVetUAANeOHEYn8uyw+wqAdkwiiUAKXGrQS3z4024dj4HGFJohIa
	 +rAotZqC98y8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1002260628;
	Fri, 23 Oct 2026 18:19:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A094235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ABDC81570
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CuV55pUwYvg8 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:19:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0E81E81694
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779548;
 b=hY3DLJIOdH24hf1bPJhmCxL8w0nBAjoAo/WAMQYBlJxoaryllruiXcXjqYQ3HtoCEQxD
 36aN4+ki5mZiVAuZrwwPXWbQ5RhZfCGeuqD3feDG2ec58ev6TYFJ5CpH8r9/MmR2ldEn6
 HqoWBs7j4QhgQN3ayu0CS75FPRtqrZsXO4dB0gjC23Ryvn+KJffWs8v+6heASaQyO2W/z
 Fn7o07aVgF/t9Knf9Gz04vTzHr67/J/O/s1ndwRY5vZiNPlStisFp53NC+fjUEN8Zw5lA
 VPU+9qCYRiE9427jDrnBJJUANln4Gq2LomSKzxe2Tk3r6KO4bYmF7a5jLlJiJJS+C5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779548;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=7KYHCctbpziRko6XoB72r35ZlzWLbNcerni2ztyvNhI=;
 b=osYu/TIryVKnWCm5OYLtRpp0cqMkbLFP6mHBiEBuShOLdTzQFBHS01U2iQM8KIhiWG5q
 ZxygDxXl4NdIe9ey9Way0/mcdux7erTGVAYNPPgGp3v5aoak19MQtAUjtn+890E/VeQX4
 xfiWOhHFgox7qJzXGq5UZjEtPbhTHAhsx2MffhNVx/VDc+0G3nAz6rFIjg+T6ZJ3Sk2Bb
 xEjIAMuZ4qmAk3MLoRzr9YXMIP2iIQwJFGDNarPl4bXEw2c07MomwBUBMGv7p11gvFacr
 70JfJ46fhr1pShD6X3V928IhXpeZmgM8AW6Bt38+RrgEvmreF7W3zVMoa35ld3Cojlw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=WozqEZBk; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=WozqEZBk
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E81E81694
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:08 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-6df5e315bd1so767135eaf.2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779547; x=1793384347; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7KYHCctbpziRko6XoB72r35ZlzWLbNcerni2ztyvNhI=;
 b=WozqEZBknhVVy+oDHsWr9OzembfXGooAXpXJUoZ7KQ1Ya47I3noiKjvpV+E50/oO3m
 q4/dXOMKs0izIdyeDTt7w9slPLH8iBQMRxqshvQbzHLdyB6fxLfWPUxnxOx73Xr5NBf+
 GABW2SyEPh8WEpMXEomvj4usvF4rrhQWutTkN1U2X7IYsiEv+yqj0XAk8E+AvozP+MYz
 0hvJVQ61oha/j4J0GVi2rkRqbnzUEqLNHS8KiVv+gVt3P7EzEsip0gfHRWXufuyxhuvV
 L0JMFC/yqmHs6RidNevRuC1XJSWmH1zvsUNZQQpCS3wgBZ8aXgBOYGjxCNCB5nwe+HQC
 UQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779547; x=1793384347;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7KYHCctbpziRko6XoB72r35ZlzWLbNcerni2ztyvNhI=;
 b=LnQetacuT9rYjuA640St3khBtwgCmo0zdzHPLOcJwxLpm305XspjdS8Uuqh64092bF
 +rWARI6HrdfWLGkPX0VFWKv+r7o1VOi1Y7ibhJkSi3Fvip9LixcIxD6oocHAI4II5OwD
 gJNSwpizVnD117cnPqEwC13ux84fOMT7AIkHyTUGzy6wiZwzKir3Vqigl0dG4LswathO
 2K2WibWNxb9KAqq3DggAsaKTZ68IO8lzcEAl3SfLJWPeBInJPjvMIV9o/bfMRUnX+I9u
 mirs3wpVkgnIJCuNrJPzQx2T3zbanjvu2FOeWCspYI7TKcMD+dlx5N+tar1yvw2UV/si
 k2Rg==
X-Gm-Message-State: AFq9FYI/1Y6yzPK5H5OiJPxciOF8yXKZHcb+wbIOJhUqEyBH2Kf9G+be
 CjGF/LMM+8Ja3KFNHcGs9pk0p4tk6BMZKY1ZkrOmo+DP/1cuVFGNMK/49IlR2sRQ
X-Gm-Gg: AYBFou0YillmfcvVOmaVKRpmENMMJeD4++kJtPGSVCg96zAraLm777thmBZyYUrCu3e
 E4+3wIiGKhXAjBr+PvJnkNrHXVIHh+Vaf5SRs3gDKep/2fWu7ySz68Kt7nAF6zVE1VP3RlRbR/E
 bNf/0BtH5F2Qou6qptukXsz88JhumnMMBrmu121m6iO76cbaDqoMb+jJcvFisMlXN4hdd2DVPra
 zinSbXPSY/AN3R//H15hif829H2Pb9WFSUAnGxX112Tj70chULwy2hyPy33gICJfCuS3RdfNAr9
 IA4gpjClcwtZ/Htw/vfzzzBl5siAnH8kAdb5FNOuOpNtLSaSzntTgWtRCysJe27ak6mqTqM8XPv
 HtaOkrgI5yHdkaiMn+Yb6QRAqxMlpFzvl/RtPWt4g6unm13w6VI649eV/tPpf/mFDVRdU7hw/wV
 5+tJIBInSQHf6o37osniRDzsUFu4ZdOviPMG2Hmc907PLHAuutvAij2GyOwJP7Flk+WzGUwRx0B
 inzMhtTLkFHJMBRohIGaRIhhb8SI6XaoEksFf3RsCBpSVP8WftdNigchyWtaPnS9iMrghFx/gcB
 hUC5EUhuJF9NEmtcNXdNgcX6l79zLJvgn0N5iaEY3OIusot+i/kBAa1HFuJ4onVBTOUX6oV1KuL
 Ihi2PB5zGgDsrPT4qn+seB3D7KkcIFumkSvikCsLX3SUPj6BzcoKgLzJL1oYBZW+o9epWd7IKQe
 uTO2l7qz+En+7VNrthtmeITV8=
X-Received: by 2002:a05:6820:6fd4:b0:6c9:80d9:5f5 with SMTP id
 006d021491bc7-70b88ac27a5mr1893383eaf.54.1792779547037; 
 Fri, 23 Oct 2026 11:19:07 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:19:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:47 -0600
Message-ID: <20261023181818.920329-30-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-wcwidth: bump to version 0.9.3
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-wcwidth/python-wcwidth.hash | 4 ++--
 package/python-wcwidth/python-wcwidth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wcwidth/python-wcwidth.hash b/package/python-wcwidth/python-wcwidth.hash
index a0aa0d902a..ecf1ce3d7c 100644
--- a/package/python-wcwidth/python-wcwidth.hash
+++ b/package/python-wcwidth/python-wcwidth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wcwidth/json
-md5  114dfecbe7ccc3aced0243ce93b04daa  wcwidth-0.9.2.tar.gz
-sha256  ae0ef90b90f6af38b54f1fe6d58662ec33b3cb4b8391958a62416d654231727b  wcwidth-0.9.2.tar.gz
+md5  5679851d1447f3c3690cf67e09300c3d  wcwidth-0.9.3.tar.gz
+sha256  dfe7cfbd4cb59db9fe0931bd6091ab4a95b3acc5d56bfb50fa9fef0ccba5dc5c  wcwidth-0.9.3.tar.gz
 # Locally computed sha256 checksums
 sha256  70b98a95a2144eb70af8017fa8c6d95ce247e40867436e8bc649e137fe13d21a  LICENSE
diff --git a/package/python-wcwidth/python-wcwidth.mk b/package/python-wcwidth/python-wcwidth.mk
index 260f150a58..60914a4855 100644
--- a/package/python-wcwidth/python-wcwidth.mk
+++ b/package/python-wcwidth/python-wcwidth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WCWIDTH_VERSION = 0.9.2
+PYTHON_WCWIDTH_VERSION = 0.9.3
 PYTHON_WCWIDTH_SOURCE = wcwidth-$(PYTHON_WCWIDTH_VERSION).tar.gz
-PYTHON_WCWIDTH_SITE = https://files.pythonhosted.org/packages/f0/b4/7830542634bb2d3e62aa3b586a72d5b3b6c91c3168929e7000ef3fed041d
+PYTHON_WCWIDTH_SITE = https://files.pythonhosted.org/packages/69/4a/82d61476a1ccc20d43d0805724c5de4baa4971131a8db1816705ef53fe16
 PYTHON_WCWIDTH_SETUP_TYPE = setuptools
 PYTHON_WCWIDTH_LICENSE = MIT
 PYTHON_WCWIDTH_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
