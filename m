Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90305F99C88
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 15:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A6BC40FB8;
	Sat, 18 Apr 2026 15:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v24os8_HsTE8; Sat, 18 Apr 2026 15:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E424340F96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776527739;
	bh=uOHIxLlw0q6R9ZgVWICTrBSm+92ummVVO7AfaMiRRfY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RuCXDAQb8AfBM1LgOqLK3tyQpxsGjSMpFAXulPFwVcavT+8PPjsss0EAhe1QwGc9M
	 PZM8t758tHVvebTyx9qKmf1YVWdZuR4VtkHmTc8v/KEx3jzbC4qRxVjqvDEF0wbQIf
	 NbB2wGndRnZGGDALgobURhr7rsS7J5HBCQbMN/4OQYhoZJs/DyXJZG3nYJg98CscxI
	 /gqo8AUkjMygxU0WmO44Qq9tFvGGhqrDw1ZHyEzTGxraKonsc2Z8ZuT3CcnM0y2eD2
	 oobg14OOFHf3txC9KG26h9hfFoHxJcmltEcnz5FFmPDI1NdzUs104NGkqNZ4YanuEX
	 ZGQ02w1DPzV4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E424340F96;
	Sat, 18 Apr 2026 15:55:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 44199259
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 15:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A16C60F3E
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 15:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qtTuGJ-FhfD for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 15:55:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 815C860E90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 815C860E90
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 815C860E90
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 15:55:36 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-82f946efa38so617556b3a.0
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 08:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776527735; x=1777132535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uWhBv0r+UQ9y9eVY4p0/NjPZvGBdYR35WQyeCb/hiGE=;
 b=sWBT3h766NRK32iPBzxF4TJNVGWNP+2D6VsTGMD67Nn+SjkWqTU4idSZ4iCBA9kMPH
 tFqhKKgzmysVmGv0hRWhwonPrSgvjWNLLGg5n4vybSR0dzEitVFZnc6uRDrwpiD4qS7A
 OQeXmb9gRkI7zlVEoObzrfQ5RGoa/djb3TdFiiOrxqJ888HdI81YY9okmhLod3m+mLdZ
 DJQjSvJ3zWISFWgZHM/HvYYYrFqF1ylcuaQjMVRv7hFQYvz/SIx343otabAl4Xuf28IF
 QPIzegE90S2ZOjXXK9RtFzzyeQ0ks+Be1VfE1q8YHHLstSAP/z3G9RUbZwqMV7SZfNRb
 iJsA==
X-Gm-Message-State: AOJu0YwC73JkAYX7WQhqE8qayUH+Kx7yDvaaKP6aQpxgi9jaDzaXSKD5
 6lHumjjWEqzXTJuyNmweAb9tOMET42IiQJ4ih8bCVV4molRkyR1CfsFbB1psg6tl
X-Gm-Gg: AeBDievYshP4WTxlcbLLn5iJL/XfskYzi+iUmrORDsK92oF7UbIWgYZQ80n5ZYqWw95
 v/+QzupdXAHZPGMq2fEaWRsz70qjlUaD6frmqUJYJrQiIuP36gsL3jf1RiNzqznx8WweL8jEQae
 XTo4IHoVmsM6YqfN9EcCg/Pqilc6sV2DDTQdR+J0a/WzKpjhSF5Rd+EEhmLOgfPxGMvy7TxBc5P
 XsiM1of7DaWDkAwotRWd1whffnHxFotmxc9eXdj9mMvb7LJACgdUehAOmd86O+/lJr4m2A2NPTz
 ylXgadMdpjYSt6kPJY3EKy1MkaC3CfwMxCzfPwQwg4i9//jcP0PDIcn8fazevz0QTJ8o1O4+Ez0
 erC+1SZRFRVDSMaqbHfzeWQ+uzrUr6EfSqkt+huIDc2QEE4WYXCNDuuA7936aP1srrrIKVv6+Ud
 KZ/v1AmrAzipgHJANbk88wpcDhWTwWFtp/CowzW+nD4fpc0g==
X-Received: by 2002:a05:6a00:94e2:b0:82f:6cb3:645a with SMTP id
 d2e1a72fcca58-82f8b55537amr6528903b3a.31.1776527735246; 
 Sat, 18 Apr 2026 08:55:35 -0700 (PDT)
Received: from fedora ([2409:40e5:112e:daba:4994:b597:7615:a059])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f8e9cbb1dsm5959033b3a.14.2026.04.18.08.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2026 08:55:34 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 18 Apr 2026 21:25:11 +0530
Message-ID: <20260418155515.9980-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418155515.9980-1-chakrabortyshubham66@gmail.com>
References: <20260418155515.9980-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776527735; x=1777132535; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uWhBv0r+UQ9y9eVY4p0/NjPZvGBdYR35WQyeCb/hiGE=;
 b=UIHzdIwqoS/o797oVfG2jME8uSec+A9behWrmeeG3a25I2nSo09w+G/Y/fEAflTsoh
 fzUsJ1nALxE2ucsGSCKR63kMs/uhJh1zsFhv17AUqpy+SnbUon4WUcNHKZyet+iLcuHG
 7Mc1x+3mgZJytf5cnBuyz0VqI23aghlSgDkrLIv33v3NI/UvsFLigyi2M1bAiJ9KYubQ
 dX0rvvniT+2WQ0iI6MFJ9YLh0OnIy70a4LnHdP7oH98LHbW83drCvtLa23kT7y/KJsvt
 piPgAa8OTzwuL2EnatO9I6UaHggqhWOhA31RYw7iG6/OKPQpb35hmCFSFQdbwAvKzAnV
 7mLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=UIHzdIwq
Subject: [Buildroot] [PATCH 2/3] DEVELOPERS: add Shubham Chakraborty for
 libenca
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

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b20cf7d93c..e9c564d86f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3063,6 +3063,7 @@ F:	package/wolfssl/
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
 F:	package/hyperfine/
+F:	package/libenca/
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
