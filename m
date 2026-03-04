Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D779EDEC12
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 06:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B44C06079F;
	Wed,  4 Mar 2026 06:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MpAU7kKMdFat; Wed,  4 Mar 2026 06:54:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BCBF60786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772607282;
	bh=U6/FxVKKASo0PM0er1dxxWhfc9dfQ82t0ONSAIPEXBk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B1XPifEa9xvYhshovytapHe/KScLbXFRqYrUWaDvON2oC6r1lRwfKQQp01KZasDLz
	 bR0DC436AQ+w56Le7zgm8DAxdJwXPYda6E5RnjfzRVliIv1ES7KwSwhJu6LYm/qkrm
	 feDyFxdyBgbr73saxKjCuPL2NFB34Lp8uMM4TRlCIDDj2i3ZfFu9BhhTCznl3F7qxP
	 DDH996QEEs6oX8S851JSNscCU98oYemNZjpkFRi2a+e4N7f2jz8snK2HrL847wgO3N
	 lD4CK7rzx9Pmc6gIie1Eg38e+Zc4Y4WH+Fqj38YWXwyyS6u4xLIfBTUL3xuo0cmgY6
	 UGMxXZskqeFfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BCBF60786;
	Wed,  4 Mar 2026 06:54:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D4D9231
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 06:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EF6B60786
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 06:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7-cWTL3SVQH for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 06:54:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6BF4A606A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BF4A606A7
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BF4A606A7
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 06:54:39 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-82976220e97so89620b3a.3
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 22:54:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772607279; x=1773212079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ua0KFF7P9CM9tlxLQs5IcrOo2Ibfh550kwjrTVGWg6g=;
 b=AN/1ied5NXwBONlLlNa1pq4+Orv6dCfwkfEW9gfPdl3NCYrU3Gr402ZmmHpCg1ug26
 xQfwD+dAR+a5apUbRhtNKXr3BrxFEB3/pUzqdrgf/+SlKshb0EIShdWIbEx8hQSerM3M
 3LFLbcsIluG0M1y13qI7IkKgtRPopRscnQxjQv3WIskALZWmOFK9giDsM6wSP3vI5bFp
 rCmt/CVYdm9fLGYq3p2eJzUAoTjXXKv6vHrnTMrq25C9Zrzace6EYA7dvXFLXbaLZU7U
 RwtdFHFuX+UjXsLt+9CkGeoAJTzxiIkR4ekesLT3k99mg66urrd50biK3ILYOszjtCSY
 NHcA==
X-Gm-Message-State: AOJu0YwNEM7qatgNE2xlUJz+APGAd9u+W7YwyjTwgW8fu1uvutl6Gz0s
 JF2gjm8O0nPFVU8vCnUriyhpZMbywHiMb3rM02Mxhmg3zv3RRpnxjQom
X-Gm-Gg: ATEYQzyy2W5oN67VeSiXJstnwOuwlKKFT/0hzUhuZ98w+JqIyDP7gY1uIHbph+o40v1
 n8YsPy0wfIOFFp3nyxMpD7GtsjJevj3EXLbaVX9zXK+pRs65bniRpbyT8uGKEuV1PcHaPAh2rY4
 rYff0IeG7R9+NqHRSGJBl63esQKfDjV0q8q9JlN3qevnX0/mlE4/xfpJQ/vtJc9dF3sR4TScrn8
 ZTi20or1+lvmOlPUJzdUrFjqUBIpuRiU4RRt/HCqSZ+3dhWPPt7zOGJTi4s5okCBpaaRxvmT1i8
 bQTunhr+SQ+n/PSEmrAZa+1WDt9NEqrU5NIo0diAot0K4qyG1xpXsw03v6IK9ReHvAdakFW20X3
 +rQPQDC3iQLNVZbYMi62AloodJJr4WySD+G/ItjsXeG6uTOSlW2lBxij0JtB/lKHJvMBh8ahmbi
 eiLIC855Mz7aqXcl2srW13hXQVWe1AkGSu7w==
X-Received: by 2002:a05:6a00:3919:b0:81f:2b25:ca73 with SMTP id
 d2e1a72fcca58-82972c62fd6mr1062742b3a.38.1772607278714; 
 Tue, 03 Mar 2026 22:54:38 -0800 (PST)
Received: from fedora ([47.30.255.168]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82739ff3667sm16915630b3a.41.2026.03.03.22.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 22:54:36 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: br025@umbiko.net
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr
Date: Wed,  4 Mar 2026 12:24:24 +0530
Message-ID: <20260304065424.10023-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <dbd49ae98de7302e5a0cf5394e8c9b05@umbiko.net>
References: <dbd49ae98de7302e5a0cf5394e8c9b05@umbiko.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772607279; x=1773212079; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ua0KFF7P9CM9tlxLQs5IcrOo2Ibfh550kwjrTVGWg6g=;
 b=XypwZjSu04AK33mz3FyoYCLuv7Xd0uxLXk+E3WoKRSnh7QSNLjp8iA2/eHwSVCLcBR
 Pzw9K6qncjpN3ApLbrdz0buWEAVI0rxlmusrLgsvJUy/eJ2uetR/rJfPz5cCT7Frxga6
 UopDo/Xm5iQDFh9ye4K34TCkTJS2tIaPtGSFV2SOUcuIgfLHxotGz2noU4pzCfRn7uQM
 noeKu/Nw06FVc6hS/LSCLaAhnHrO/Fa/j+L6VjzOUOTsgV5olWbmMgyYdTfo1Ar5fndx
 3vIFyPwOHGrrgDlc0+UY3DEiTVsmY/HrIKb1GzpecEusecNiCTX4mxFXFf5GRccYPO6D
 T/pA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XypwZjSu
Subject: Re: [Buildroot] [PATCH v2] package/icu: fix static linking with
 icu-uc for musl static toolchains
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

Hi Andreas,

Thanks for the review.

I will send a v3 that replaces both 0003 and 0004 with a single
patch adding -lstdc++ to both Libs and Libs.private, with no
musl-specific language.

Romain, would you be okay with me adding your Co-developed-by
and Signed-off-by tags to the combined patch?

Best regards,
Shubham Chakraborty
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
