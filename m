Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F61CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BD6C853E9;
	Sat, 30 May 2026 17:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r9QcuDOd0VIU; Sat, 30 May 2026 17:41:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 741E2853EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780162913;
	bh=nWv0kroQN9rLA2lo2hnh5D7b1UaF3iDv13ptj2Ijr5A=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A4USFlQBMxWMf6PIBdlteasJ0nUYKSrtkXx90S7fiP8Ke15Hiulj9o/9feZEhGXQt
	 hfpP/VwzfEcrIuexr5AvUbkb/ws/btWiwYeEhGMtsbhO7u0/0l+pHnRxm+72i941ts
	 ZRZnvtrEdSsqH0aAatFJOLwxZ2eJsfLy5kM9+qwDhMn9gy7WSI0d5rRUdWIJCVajx5
	 fM+C1XidRAd7l3xYES9bHsNS3PnCpoAGvDU/PCXzxAmexv9IWrmPxRdKfcb9WXwizJ
	 PdSyvVqCQcagTjLLh5xUAcOndOGiC9p7szwh+UpCIw+8U4xLQC16HFVRRaX6JBwaPb
	 LhtTsxoohE3gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 741E2853EA;
	Sat, 30 May 2026 17:41:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7232AF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 632B3853EA
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oT574VMyeGzo for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:41:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B2027853E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2027853E9
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2027853E9
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:41:51 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-c8587427468so250899a12.1
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780162911; x=1780767711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kAugEiiiY+9q3dhp+T7jw1pxtKy6PKgzfQ6GSRfYK7g=;
 b=UUAKJBFiM0LjfLPaikVQcTV3WenQNY+Xppuh25q7E4vm13HEMAjlPB8tpslpZjdUJD
 BYaZ6AX6mslvjcqdSN2zBZXxDRPCfRUJpmIVmhQ5tojm3RFNiSDtDfzb1CRXG4PhowIW
 FubR4cS5NY6c8IwjV2IoZtb0XOjCqPJiR6+cvH1BKvU7UPkOPUjnmZHALpD7s6k3Dvzh
 VPDcnO40/Fmsksjc6AKgRpRx/+jxMzd38sQlePLWtWxf9O63BGfw1XNvg9oXR+SvaJ8e
 2BGX2ZMiLODyGSvLTWPOHF1CQ1iLbKgEtzYEg1K/MHM9wQcCXjNjI/oZIGn++L2eNWF3
 BcZw==
X-Gm-Message-State: AOJu0YzvFhvJK6XnCUl9AD8gMTKuA6coTibxUJMoWnfniZWiUQEeVznc
 GJ7Ui3hTYtCvhR4syzU2xPgAnHo1oCra33hcy+NX6oWkVsSJauuxtr5sFN5bQ2EZBV8=
X-Gm-Gg: Acq92OGkz1ZYmOMI2gcHSUFDuLbFy//ddeqLt468w4MQhzwJWY+wS6ALVOuFz0iw6lJ
 /FP/uPyK4oAV/UuSwEE0pumsKqtIb03dQ+1K4W2T9O2lYiihhS+tYmm8H/yzvsiRVmBARySXXWm
 GmEOwCpNe/M1Hwjb2OyH4JZnrrhJokDhe7dTXLBqwdfAc0lRN9G+y0nXeFHGbSEscf5OPja67aI
 nO1ifa4Fv9VGomhAh0R1xg2LonYsxXzDIc6Ly6IqutJFPgSTCzrJoI5016cU0gd4vw9k4SHE0vA
 c+wv+c6XMmL+8Xjr3hM5+ewt0d/qQN1R23+axHbdoPxpvA6Wk/LNLf2hjHPKnWC+QHJ90O3AwyV
 +P7tERra67qXOSIwnVfcVeTuW5OsbnxTXR7UDzN5dZooxb53vs+tAxHrws3Ga9fFNWxukb2AhoY
 osdq93+OWQOrNRAxqxXV/sTsOcvlCoZfp0nOw11NXzdIJZb2IwqXq2H2eWeGeFvKmhG5EoZk5vw
 6h0XQ==
X-Received: by 2002:a05:6a21:1bc1:b0:3b3:fc6:622d with SMTP id
 adf61e73a8af0-3b427fbf06bmr4495907637.38.1780162910609; 
 Sat, 30 May 2026 10:41:50 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:11f0:fc06:1f55:1e4:b17b:8dd7])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c85771a9299sm5161853a12.7.2026.05.30.10.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 10:41:49 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 30 May 2026 23:11:33 +0530
Message-ID: <20260530174139.28613-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260404111250.154311-1-chakrabortyshubham66@gmail.com>
References: <20260404111250.154311-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780162911; x=1780767711; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kAugEiiiY+9q3dhp+T7jw1pxtKy6PKgzfQ6GSRfYK7g=;
 b=l2iEyLpDVmqfEblADVyNPnYZ9Kr8sHmgBIZYoidyLQLuevf1ocFidbGW0DlpK+fKfW
 x3F7iZBVa7qXv+PJwd/Cm54/LjJT7bFDHM+nHXrXH7FAMRWPPTgz6dCYwJEYoBc7Ogp8
 783eGIsqz8cSxnfQnI4iiafASnf4UP1Q3iXtErZtB+YNgBMgpb6hXEcpdGv6iH/0qEl8
 WfNSGDiAyZjotITjUyjI+lcFzCbbDFW3LxH22VdMsduH0mN+gpFZVcwYBMHrzW3k6Mlu
 5a6zHulPDU3wLjB5qHtQoxMxuokalHDqZ+uR0Cbe3MCf2xSSDFpszPnAL2DHeX1T5oEM
 0peQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=l2iEyLpD
Subject: [Buildroot] [PATCH v2 0/2] package/font-awesome: bump to version
 7.2.0
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

This series bumps the font-awesome package to version 7.2.0, adding
maintainer registration and addressing review comments on license and
directory structure changes since v1.

Changes v1 -> v2:
  - Added details about the new license scheme (OFL-1.1 + MIT + CC-BY-4.0)
    for fonts, code, and SVG/JS icons to the bump commit message.
  - Added explanations for the updated directories list (css js scss webfonts sprites svgs)
    and Less removal to the bump commit message.
  - Split the DEVELOPERS modification into a separate patch in the series.


Shubham Chakraborty (2):
  package/font-awesome: bump to version 7.2.0
  DEVELOPERS: add Shubham Chakraborty for font-awesome

 DEVELOPERS                             | 1 +
 package/font-awesome/Config.in         | 4 ++--
 package/font-awesome/font-awesome.hash | 3 ++-
 package/font-awesome/font-awesome.mk   | 9 +++++----
 4 files changed, 10 insertions(+), 7 deletions(-)

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
