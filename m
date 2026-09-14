Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADC8C88E64
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 08:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2017C40619;
	Mon, 14 Sep 2026 08:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SmaR1lNoes8a; Mon, 14 Sep 2026 08:38:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 57DFD405F3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789375092;
	b=LFLwRV4Xr1Ll10FTDG5lA80kAl0vNzWg00nwVGPgGoZowEAt7tV5sXtOS66I8n8jcRdm
	 r92dVZ4nUboBQhhV+b8jZIx6Pi/DJJyvp/pnDXZK2TDNx5v8LlDwfygFzrS6Gp7+LI4Jr
	 RsKhJAVMmyYgwm2ldwA7Pu8/GYgoLzqcVc50DNPUEWVue70Aw1faSFuj5tKUSbmpatGL4
	 rt1vldIUwe84mjKlUHCKo/uOt1Ky+wK83n3VGAtUSM4MrTnQbxDrnIlJUlkSkRUrdIbmd
	 o75erPvNN06O/lbkgmKkoccxVzyBS8vYkmiezvKwEy8Jd2Zi978A+ljMxnr3BHhi1cw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789375092;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Organization:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IlIbP/iTGoBVSCtbGFIz3EgpctYNFvdjBd/brlGcSlc=;
	b=nHwFkE2s6ebRVE1DSQPeFlklrn0nM2z2terx7+TB4Hdz9Vav3iPdx+/C4+9fx0l6YCRr
	 rpkJ0oUFR3yvisn6XLtDBeKD2qiB2qQ4HIpBzj+LWjkWfn0NXefiiEM2wN/OJ6pun9jKU
	 HOomMkI9km/W2g72XPbXb3SQYZWWZGaIcQGeAzKU3rI7DfJ4YSJH4THo59sA2eZSbf+3e
	 XF1m8ml6rBYUmBUstNHD4ezzrDwwDUelpCBmWZodBRrlPguT+aqdi9WrHsAxMOro30UUz
	 IMdcU8rbGWaE2RlXJiFLRIlHNVA+b5YXWrXyD6Oyih66rgXvV+oj/Ma8VMz4qPmNRag==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789375092;
	bh=IlIbP/iTGoBVSCtbGFIz3EgpctYNFvdjBd/brlGcSlc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KP86l0plHanRS1KjKJegn/kv4aICXu0WKqp9YhMb8t3wqbqEzknozPEs+fbTuo7K8
	 fyZGAFJDoLSy6/LFBS0fDzRAo5k6aGseNAoRyXl4hHUuTOjsYEkZTE0VsVOO2StSNH
	 u7I3IBEpLHSKqxo+mzLt41DRVsq0nYafx2kSaFSGOij24parN9YjShaoNXUC7I/SKq
	 3yVHahEYRKL7hI8COiK6Ov8icV++0lvYyjhFS8iLgcGWxNakK1rhhJJxzRv1Qgq7ep
	 BOeGCPYBc8eLTC19fDVDPl5b3b5DSvGl2XNhL0YQxzA346Ab9t0tFKdNWLxe2xemga
	 Nb5GeriHYYAmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57DFD405F3;
	Mon, 14 Sep 2026 08:38:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 649CB362
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5641540119
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TH7-_HeuWqEy for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 08:38:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2EA5C4007C
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789375090;
 b=kV70LTMQWjEYRGV+s6vS/e8y9t/lSEC8OhZ3RqD5TUWLWemYc8GqAIMne/luNI9bMc25
 gTnJCVa3pbCefFivQaxClmqVvxsIe2HR5hs+1iBa5SBNM9OtlSJfbOC2c8Gxqk0TnpUYk
 q0C68G6BjDbWoqToGH0ZvmofQNyd/Yz93mlebxg0YhLofTZvicA4hk8xCD1ay9RE3Loha
 eRMHFg7MMAaS69Sf6kUxCDmXB+rq6v89iWHuMkbKCWJjBXd9dRHKJnrb2xrJEAiVv+0Vf
 HctP6w9jSwMg0qCyuLpwTAUjHh3uASvC2sIpYe8n47LTzXkaJnN9ye+L5FKU7p5sCkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789375090;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Organization:
 Content-Transfer-Encoding;
 bh=ODF311kbQXLjjc7F3d2rVRt2jU7JPj1TPP81qAFpp8k=;
 b=DRCGLYX2foqya+4IzHLQS8jVabI2b4tOrDm37HTIEkbp6ibJ8S2+RIQV2QVWD2y8NxjY
 poRI+d1bOZd8zGfv+Aw1c5tT/nP/t9h5DvAwBTyDzp9XcGTtnEv8e/CAE4axp4qMxu2YZ
 dz+d/DD1oaHxmnoOqJ9Kpe1igSVgWdKvGh/snrW+j9rE3NKtUNeV3ChaOcmAEHtSyZfa+
 yzL0Iv2r/JQJDHxeWO+oJLAMuXac4RbmBxWGK2YLHY9fkgES49j0Tjw5Y0Q+I2wuVwhbx
 THT16OhR+wwoA9PerI505MzvzrA81VGgCtwXvUn77lUxjKgTMJjhj8T/dDZGPIAkrjw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=E1CY0iVW; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=E1CY0iVW
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EA5C4007C
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:38:09 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c2940ff2313so134080766b.1
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 01:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789375088; x=1789979888; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ODF311kbQXLjjc7F3d2rVRt2jU7JPj1TPP81qAFpp8k=;
 b=E1CY0iVWDTxmxjevTTPA0ooJSyj/nyLsk9uhKAfO31uLCGcA2ENnWjTY/6CfVyRK7V
 lG2wQka9P8z/+O9QvNy2WH+K0PcT8jT12eWnHv74bq5PPtZAOUIQspTrxIKCLyp1dNry
 Ho8tIUrKSwsspXIz5d3dz2ygMjXoX5eyNv8KH4/zqUP5SjGjO+BcsuLH2x34nfAyKC6M
 rlmt82bI8H/mi4YkZcUndsu4YjNm5L0Weoojw4NQg8vv58s0Ru60VOqY4hu0UzwTSsKl
 TL5h9hx77ucL3Vy7V14FIlqFizdhT+ZvVni27w0KUwtfcs+jD25grZjHFcf1q3akV63x
 llTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789375088; x=1789979888;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ODF311kbQXLjjc7F3d2rVRt2jU7JPj1TPP81qAFpp8k=;
 b=LA8tX7a6YzrnpkaY1xn6D7nIe70N1vbmpq+5ydnkHL14nub05acJ/OGy0hvww4ZLoN
 BpwHegAKhTYDlsm5dUklUMt2FT34p5poqGkOaBmrN1emSRjUOyuourWpRYGJkefi86ze
 gAOX2k7Thj2R6eE1GAy5rw/7PEcm6LqD4vVGyc+kaSUenQs12NdXK/BCOqeVJ/STfol/
 ab7U5qvMD3NVp6DKYk3hGacfdLJ5F8uwHlU9I6r2+xdnDhij7rOLr3GP8cnn3T7+uNoZ
 4R/ci0AQ8fUfJZo6QL8cXe+I3V2X3RLZoqbK4ozVOqvsTegBQGp1XGu/pNrOam5cupbB
 4bCQ==
X-Gm-Message-State: AFuF++kfWfXOZiT36p2KhdpRLpMh6kQ/3f3bSsJQluyUmsiMoLXWUYyp
 FhXeoxIbpdSuMufENOtKfFOl/Xis8bHa4AK/Kwa1cIprHMErR3892M0W9MvWgA==
X-Gm-Gg: AYBFou2HpfYVdb3CvKU7wd2VV/xP30RScfvvMtqGhzJBS2rfeUGK6EGZdImzFMD+3DJ
 JU7aXhfSzrCNcWfChWMUKFItWNz+LsaPnWIrOgn7zx2KU9948y2Pw0Fk9L+ursRqaXmOCdPB2U1
 ftaPPnSQGSne1hDPVYSj4O7qIj8chKzMdJqTeuxYvRjKpb/joTFtnh/BLmT03GLRS6p0fPGXDD6
 peDoU/fnSBR3EnsMCFVj1Xn8+K+X0iLUl1eSDcwqgi2T1ArR3io5NTh77mIyZRJ3s1yyicgVNb8
 FTaByRNfj9DZb7PJeH4l0l0zkfjabVAxk38w2SvbNyz4JohYU93uiNf/vtjBWM0FTEqdblkyzAS
 /YM9pqUQG32ey3se4FumpCLKD1pNjSyrC9qCuH9G9xWbGPmkK6cEbBnASLM2qAvUN84RW4V99c4
 WMpRgNTThs/YfmXKdT3A88npMROUuE6GAZhJObRTML+mElqEJsbRLQryLNQOmdMNiwNM/yMHbYQ
 3dVmjK1XtNoL3RYC6K/tDGT3/g+6zeAhRvKzg==
X-Received: by 2002:a17:906:7313:b0:c29:58ae:8327 with SMTP id
 a640c23a62f3a-c29b93b8cbcmr91332266b.19.1789375087502; 
 Mon, 14 Sep 2026 01:38:07 -0700 (PDT)
Received: from gimli.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c29660219ecsm388431566b.16.2026.09.14.01.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 01:38:06 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Mon, 14 Sep 2026 10:38:02 +0200
Message-ID: <20260914083802.3268655-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH 1/1] package/mg: bump to version 4.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds double-width UTF-8 rendering with Unicode 17 character widths,
a new line-wrap-mode, shift-PgUp/PgDn selection, and yaml, text,
git-commit, diff, conf and makefile modes with syntax highlighting.
Fixes shifted-key selection in VTE terminals built --without-curses
and several ~/.mg startup file bugs.

Release notes: https://github.com/troglobit/mg/releases/tag/v4.1

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mg/mg.hash | 2 +-
 package/mg/mg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mg/mg.hash b/package/mg/mg.hash
index 147809f719..85e5efa8db 100644
--- a/package/mg/mg.hash
+++ b/package/mg/mg.hash
@@ -1,4 +1,4 @@
 # From https://github.com/troglobit/mg/releases/tag/v4.0
-sha256  7040117fc8177b73038027fc59e62012c77842e4ef40ab07e57f7b69832446e2  mg-4.0.tar.gz
+sha256  6b33adb70d59d1449b40343be1162201576026242470dbf76985aefad5d4b0ee  mg-4.1.tar.gz
 # Locally computed:
 sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/mg/mg.mk b/package/mg/mg.mk
index 0b5c14d8fc..49e90532f9 100644
--- a/package/mg/mg.mk
+++ b/package/mg/mg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MG_VERSION = 4.0
+MG_VERSION = 4.1
 MG_SITE = https://github.com/troglobit/mg/releases/download/v$(MG_VERSION)
 MG_LICENSE = Public Domain
 MG_LICENSE_FILES = UNLICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
