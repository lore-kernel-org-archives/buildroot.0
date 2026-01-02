Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0129FA372A
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 11:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AEA540623;
	Fri,  2 Jan 2026 11:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhR8cLFuUP76; Fri,  2 Jan 2026 11:14:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35F0E405DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767352459;
	bh=bOTjz0UjsSJNInjJpQu/yzWb4T9it5b6/77eL7Z0sXI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KsYiozKxhopcLZRMI6t3UXVAURJjQaJ1wjqP7Dtn+ZboD8ZRBylZXFKF2Wu3WIFUy
	 nbt/YxOWXAW1QmXR8iujTzz4XsMSX7pS/t4VvbuoqFPYQ7jip+pfLnY1YmTRrQ0FBk
	 a2zWeYRTjpdCb6DvsNhh3m3RqkTgmUEACzRVvd6LJmlNSW98R3s+3jPrUVdCt4Kykx
	 MaFBqPgWMtWzeRM0Me+UFH+hakm6HhvypssdQ7kdoX2okVXLR0jDw4+lj9B+ziyAVo
	 02REZaGhMg2UKecxeHD9BSJvIZLbAJkglVWDyeidrFMlOrabnmTk+eDPnrj2NEB85q
	 KDvCRPZE9c+Kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35F0E405DD;
	Fri,  2 Jan 2026 11:14:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95FB3351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 11:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CD1881016
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 11:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kgCdOcV21y-Y for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 11:14:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 987FB81007
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 987FB81007
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 987FB81007
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 11:14:17 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-64b9d01e473so17184863a12.2
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 03:14:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767352455; x=1767957255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=E4W3sS6TZ8hv513RQxNZSdOiZg7VW1/RB+Xy/42L+kI=;
 b=AT9p79cnYMVjv2qfCVUkjL52gP1H2dgupfsb0GT00PIZuWLDCEhbROvaAaBWn62trI
 l9bIxaHGr1Z8xkVa+1mgLVSXabfzVYL+/oCP7dlUIBJbKcXeBXwXZxS4AE5+6cIzoJAD
 MHJhBGqaNiuzKprZdNAorxF27uYYSYev2nSo1IzTAlBiGul+r/YkMpMr7zCmYVDkY+BM
 mzCAzE/RpCGkCpW89V87n76H8FxOL7W9sGzRrfxlCyQABaThKNhz9ZDaILiUEIYucu5Q
 /K8leVFXEXHIYTu4PFMPiYchfs+UfrTlkvkVwaE+uQ5qg/vIDwovtWYlkrdqECDVXPv7
 T2TQ==
X-Gm-Message-State: AOJu0YzHxEV0nkyPCAqbDdKQ6PC/EW4DTZurcCvTOl7Go+4Qrfv8TpMg
 zGlqxB4rmYP7c6TI/F8Lv66dycp30oWaZo9ftXzpojQftjj2zoyZRo52DOfn
X-Gm-Gg: AY/fxX46IJ0okN457TnQGHWtQ5FzYF52jyPc61vyR8BRAOF/ylco3R/8dUbo4ouRzYW
 kL5Y/0dPKdEVNzBqjD2kxNCKkhCFT14No2iLdV96bdMKlBSz14oxnf56t9UYz9XUQnIJy0zSiaJ
 R2Ep0FddeQY1cgAAncAomts9p9JnhtyuVynllYs/ztbeYrB8oZMPMtlbKZy2oVwa/pKLUgM8MXh
 69UBR1KYy0U7mSEn6UJe8gndKMw6C84GydkDg0MGsOm4szToMTqf0NKCTycMLof74/PWWbuaoRo
 LjjeiC+XiiCTq19xDHqY21lngcOVpAzTGVpIp3g4nbltkMnaEp32GuSlixkJ4ZIMSjHZZUrLpo3
 vJeHKo2MJqX8XI/CndeZFA2HZplbi228rt/qEOOzpRZiJClF10l9y2fI2GZ4PUPMBDDFvJ3cRK6
 kvBADeaCcyLa9nXrEiOyLrOm1JPw==
X-Google-Smtp-Source: AGHT+IFVrI7Vv26rpq3t0DERkxnmVNnrPgU1IlrPzZLEHo1lFIrUyn88xFNWvJ8sHGlk2Vt755udIA==
X-Received: by 2002:a17:907:7f05:b0:b72:9961:dc04 with SMTP id
 a640c23a62f3a-b8036f86950mr4632536066b.28.1767352455363; 
 Fri, 02 Jan 2026 03:14:15 -0800 (PST)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037a6050dsm4596834566b.9.2026.01.02.03.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 03:14:14 -0800 (PST)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: thomas.petazzoni@bootlin.com
Cc: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 12:13:02 +0100
Message-ID: <20260102111413.30196-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260101183401.6d399150@windsurf>
References: <20260101183401.6d399150@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767352455; x=1767957255; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E4W3sS6TZ8hv513RQxNZSdOiZg7VW1/RB+Xy/42L+kI=;
 b=PElg1zz6LRlw9OX9mw+v4pwfpBdLhGoEjEOHVG5+ilZn3ZRt37muR7Y3RMhOEtu5IP
 ux1y70kPYQmLdVMI0NpiDBk2pGhA+hiBGykoi92ZvrOhyQnI5udclLPI8lhnx1ZEOM0/
 4tAhO8soHQHi38ACObNKL++x8koxHzD5ipGNSfuZOSzcqIMgxEFsVLOaYNBrDQWsmgYA
 AJQr7vb9KvPmYH0EaW2Vk9LtCvW44xKXz8crZdrACsyXJWBmDDrhK/6TC14zcetdAtQW
 93LQnED1TgBldtwhiqjTSensxdvXT2OeYM2jgVUNwakzRWgz/H+aT9ALNvSasJu1aVVf
 kymQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PElg1zz6
Subject: Re: [Buildroot] [v4,1/1] package/zellij: new package
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

Hello Thomas,

Thanks a lot for your review, fixes, and for applying the patch.

No worries about the delay. I understand that there are hundreds of important
changes and packages to review.


Best regards,
Alexander Shirokov
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
