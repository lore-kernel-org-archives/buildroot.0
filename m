Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E620CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02C8560E3C;
	Sat,  3 Oct 2026 08:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wCczvuigM5vM; Sat,  3 Oct 2026 08:45:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0CC6560E12
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017154;
	b=DZHMyXRoHZGsPZumXANDip2//IEWT86a3cl9k4YixTXrqES7+2qwtf+uHaTUxV4b952c
	 iOwemnvIQLsXhmBD7/bYXg51Pe11spmt5deqkko9NyDqNz3it0PhXZSqRS1lwykarJ/Cu
	 GzEXG6FCUDkwIMMKA6L4bf4bvakPoMgZqYJ63qtE62TD56SwO89XIWcPDQzIqUcCwFEEF
	 giwPAAF9aQ1Foa+NG08aggrUCkn3OryxYqMU69E8QAdX+snsFWcGTO8LHmz72dkB8jz9e
	 UxlHMpa1YIX8rQs7M94cWYXKdNQedV+VkTcH7H1tlBh1/e6v+vYhbJzHD4JBzXu/Ygw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017154;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RoyPZVL6kFBbBb3B/b2VxNpEkudjZOZVXTPYvq9pTQg=;
	b=B3oSP0fTS0BDCRn1NbKK1H8A8W+zQiT8gJXtmT7CxxUckNDVUDptdbU2KjFm+MI9MAnr
	 QRyfePNYmP4q6NpDEbLwdkgD66X4BBjFZ0ymtvQnSVYuXrLoJ/XmuC+vLM04Rbr3Lqdrf
	 eypve6wD7jteUJC/VmO5eWVXNElgNZi9y49rr5PDEWvyHyS+30tmjwfkWsS/QxmvN7+wL
	 oUlNnPCbzghKnIrVmR+J3MvAfsgK9hTY8ls839RGTDdsuaPulKC789IJ5ortc1dF/JfTL
	 SHeImEDpXpDL/EnFCQUzHoQsUDkGpvx8w8Di+qgZhT/oQ8NE759Q6McdaNmhROv5frA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017154;
	bh=RoyPZVL6kFBbBb3B/b2VxNpEkudjZOZVXTPYvq9pTQg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=mfFKMrrtLXIfCWSJtMzCX/2eJqlZ++NYYgNl7l0LsHxjbe/5pFcML6IOK+WIX+faC
	 W8nBDkHFDuOeyyX3d10Q3DIqJdevQ97xZYBxXUvsnmLwN6eK+j0jlT1R5Lf0IdYAjt
	 wAeS5+x5wRlwke6I10iiQi90ZzRSOdkC8WE+WK+6cpsSScMOrqtH+at5CADz5sV/yt
	 uW4nH3L9sAMyHUnQQClKvEXectblQ16ZA/3rj9k5pIAJbUi2oz7obzrv7v5aookpE/
	 EabS1zBT3ElwZk4yfADvIgfKe1SB9/bk2/Ltn0ZkGhYNyL8jDzg6nbPw4Sd5afU6QF
	 Qwu843nviqg9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CC6560E12;
	Sat,  3 Oct 2026 08:45:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E4EC32F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F8FE400F9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c44A8xORMUdx for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A008F40059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017150;
 b=khxtta4IDWKvWwd7Ih8ppInLGqViJtNFKZUcuwJdHQ3s9KKhQhXoTuPrfa8B/Oxp3mYu
 bO/IH5ULnjb6G0OmbH/g5He31rRGUy3cr5sbrNjMAjAot7UNAUasDF49xsBPrsItzlRrg
 orSqEdj2J/wyRyccUAOXyPb3MIf/OLzImRagGehTu8HwoEuUP7dZBWHlcFQi95t/CGgCP
 6a/zqAk+HCcfBsBN7n1/PWVIGYxhxUKC7ujJQ7PNSPn4Ne67OvP0aLFIFYFKZtI5ndNf8
 MEe+cd5Nk0HDFa/zqetA75sFPH1Vii7nQwov4ZDxq1t2zdTMc/EgrCriyNhtu77/15w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017150;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=DymQHiZINxaMa0FanCAa4iqDrkDSQJ5fla+j1uqemoM=;
 b=byXbs9rn+mzXzFX+xrrcmlZYFhFM0M2s/v2kTvd4yHtlugK7YwaWubxdGCFCNf2W4hsq
 UQSpmeIIolLGGT5nh2I/BxuYpKcKWlBblVOChJYpdHwEyADk+Yw/tpqRs+5Fp1czP6b04
 WJ+mPHWJqbyM3QDH/x8L00nYhSRGfid3oytIC2i8C/zFkJGoedwtAXotrEDWk/eEWanCB
 5rreR06DsKAwM6aYBtv/pOUSGm3EB7PlDbBdolcr9uIfR981Bs2lwNC9UHzfsR2iBHwBN
 huNOyNSR/Oz9WJVBUcfErwLy56Z/TSajEvXYtpnaNTVRWmopKNAGSog7wALbkS4mbGQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=pjbu3IFs; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=pjbu3IFs
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A008F40059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:50 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-82401febe1bso328133a34.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017149; x=1791621949; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=DymQHiZINxaMa0FanCAa4iqDrkDSQJ5fla+j1uqemoM=;
 b=pjbu3IFsxZHAxyT8UtnLoRPttr+Tf7I0ofS0MkJUTgXUsSh77KaRa5cEaMb3XpzQ91
 I5Ssc/g3fBqDAyGYKwgKzPQ0rGufkoWmLatb9uFrNTFWt2p9N8WUVlQzxUM68Lv2+ioF
 BPUtcI/vcqye6wmJWQDmtyqXshOCLb2KhT13M68Qkt5iGwtr1RTJqX8KI5eWPj5ih0r8
 NuZkjgc7TRFBXKwNLXSkxls6MfxaCytmIRTKoggxcKGk1lOAYzqePEXF8EoVGDUcmVKe
 CCHGh6AaFD2BvSqRf4k8VVprTFB0RoWhZNQHWxwC+8D5WAkGPNN2aUi+0hBP0WThJVVa
 EywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017149; x=1791621949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DymQHiZINxaMa0FanCAa4iqDrkDSQJ5fla+j1uqemoM=;
 b=aqC6gGiuF7FtBEWa30WOHhg75zSwpTYrwN2Y+fTrDGRLyUR77UgbWVJdn+GfwsZz9a
 DbA8xgRdWUwJ7Rslw/0rcvaZMVOY//S4FyFHDPILf5gOUYv+XD9ZJmT1PgbbhrQSMvxd
 FuAXdyDyuWt51Aktd5Zb0cSAb1k8Nrq3vQvIEnFLua8wU/0IwWyPlBsVTZGJXi2o8lzi
 UcJQx2g0JkiRMhb5Qsmz/wfoi1OkpOu3Lpr9IFSrVpxDh9MN1tTHpVTID5y0xx7ZtY1Z
 uoT7bKnLQDUCm1zg31gYzLW84OLKRYn/dL8twYeFvP2LhnExlSN4HJeWNZ0r+woMd5Qr
 PDXg==
X-Gm-Message-State: AFuF++k6fFQvFaRWOQhSQ+Pmr2eEYBb84DX0+bYl3CtMj9u3hwTp8NSj
 lEkdmNtqRiIrQG/Ct0Ek2AfMImGQ1KeiaSlxS2Ig9xxvLaxd1uHmo+9pgKyjHg==
X-Gm-Gg: AYBFou1Xd/ck1D0I0cXwhY9mpchZxcoghlGwgS35IYkH/4t4Z4+8/xGxxEBkieyVPxQ
 pg0hqd44cD0Qxlf3XcrkNndVHIYIjcHFbSiC3gOgrAP6HIWgGXW2zXOKq5g5vb19y/Qa3iY5ezO
 ijUWSnT5WDxFAi9ngJuLf/AiBGhbkJlspbL8vuZqSJYi1KUF6oTgjyyVHy7O2+tKfrSM7N76Ova
 7EfiDUW72dv10rtBy6kH9wH+F1l5G2qRkNpjSpsLtg45rOLKL1ok1DPJe1vu3pASPQKIQx8Hidf
 sFt/tjLZyggkZWwvftWx00s2n++we1oxAZ/6vUpMxLES0HeVOar3TP06qHyb9nsBAiXdgrFAVdb
 hIkDVmOw71d0xnN2OkAzrchMaN3tCDiOxiD6mKq/nmxnwWSTl/4b1bzk653KffgYt+aDNqliqQQ
 pkt/TwVL6Tm1dOctTdWeZo0sE4Yxi9KwegIy6C0YSzJoE0wmp652QWc8AITziqXygL4qcaX6M6f
 eqHpkQMCtjnmsZcXMsP5LnJAt/IJ/8A4o15v2jD0fve0fdhpeqjO39DCcy5fAOXNMOKsAiiYnK2
 GT8u+kHUdus01Na4tkf/dYPuyfv22/jFGHJfKyzLyMzSkrxSBbPkZ9KoyV24Mt7Fm0B6IdnQFfG
 Iq5bIhQHS1rVmqUwP4oEq8lA0c4X+vBWwyeZnBWv3Sw==
X-Received: by 2002:a9d:6d11:0:b0:822:e9bf:6445 with SMTP id
 46e09a7af769-822e9bf649emr2945182a34.9.1791017149288; 
 Sat, 03 Oct 2026 01:45:49 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:44:13 -0600
Message-ID: <20261003084453.545653-28-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-tornado: bump to version
 6.5.10
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tornado/python-tornado.hash | 4 ++--
 package/python-tornado/python-tornado.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index 1eebd20284..01806b164b 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tornado/json
-md5  765aacc9cb8931aa66c8f3a83050120c  tornado-6.5.5.tar.gz
-sha256  192b8f3ea91bd7f1f50c06955416ed76c6b72f96779b962f07f911b91e8d30e9  tornado-6.5.5.tar.gz
+md5  cb425742bae00f50c5c1ba81c74ba95e  tornado-6.5.10.tar.gz
+sha256  a6b1ccd08c04b4a06fb5aeb381be99de5ad1e5375c1785e31d78c880feb57687  tornado-6.5.10.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index 7b1759bbb6..35fc9ce131 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 6.5.5
+PYTHON_TORNADO_VERSION = 6.5.10
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/f8/f1/3173dfa4a18db4a9b03e5d55325559dab51ee653763bb8745a75af491286
+PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/06/61/53d562a57b28c08eda40b258c0f975e360541943ad7c7bef897a40caafda
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
