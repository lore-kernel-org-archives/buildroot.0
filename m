Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38024606A31F
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 20:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=O0YPJ0XK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZXbWc73h
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01B7280C68;
	Mon, 23 Nov 2026 20:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-a5VPLgIUk9; Mon, 23 Nov 2026 20:09:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2E7ED80C55
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795464599;
	b=lhPUJnKSAzwaVnPixph1IfHz0cVHSYleFcpFERvSp/kHdfNQgtCE3YeYL33JdDk5qzm3
	 avdt//QZrjDALsrMDGdejKyXMTyWEtOTpgVgxmCCiTG/b+yktkG13NGUpbX9jPzUEN+qp
	 MPjjwOJK/3jQLrHDpc3xtbU60gUutLGsyzQbAJFvc8Nvn8wSCfn+g3RwwDbkrB0nqNHAq
	 ExpZ9HcUT5p6K5u4kkr6wzcTevXMmzxL97yUImoJQQudSgLBQw968UVP0NX8Fki6Bgnp4
	 dD2lyjlUapUDvGgshIABysMXiP4h+t+c24QGGF0m+8VKXzVfbqL0kSHJGvCCrH9Sbxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795464599;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=vtmrDEY6yGGtscTBrBkumH+LMB4viy5wuCg2FevyTlg=;
	b=Wm2EKjq5wG5lY7mW51jYb7KyVYO19VpwAObOU5oMl9o2nSUKcuhhlKQHj0E5jrPxc3a6
	 Arr1eAWIgWuu57N7MJNfm1BROBE3M8C2jDn8Rzynr0WkiwIwcrbl8hsUC7wnJ8ehLxnKM
	 KFnNIpvdZaxoWrZHYA01KS+8nJSPQjqBGs3uUeank6ov76K6L+FuoUOUWbbl3j2RD8eSD
	 5q9GFB/CBusso1zindMPC58lv65t/0UOD4rWXVCX/PdXQxr6ZKAgNIxBoHKTKwhQkIxzw
	 wiCf5y+qnkvrrfa5hRANAaSg9BdC7n1Li0U2hnq96pt6Y2mqUJ5HtRQpw2+h5kR0VdQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795464599;
	bh=vtmrDEY6yGGtscTBrBkumH+LMB4viy5wuCg2FevyTlg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O0YPJ0XKArxW6H0razg47auQiwZ3u1hXnGYVLwKdPpDRxnBNcvz6P6Znw0Ds2qnH3
	 NJrNqLETmfwe5SxCsjlhfIa53Bd0bAJPZgbATZ7RMg5XGArnm4lCXUQiiSnU2iQdhT
	 Yc3Z9x9OS105v4hnmfpDQz9Q9nzPTOjuIP8HEcCHQoUt8N0RyJDoygFBsoZ/R3bN1T
	 55kj3aXe0/FvuFOnpXXaGsGyNG70U6Br3sllQSZVsDl0Wag1zXiBVt16yHmO4XH5Li
	 bbP1JTH7F/3l8ENOtDCeZx8slWuZGaT0buqobuImLGHvVOympzG7Gcts9enNPRaI5x
	 rqDUzXdLCM+Eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E7ED80C55;
	Mon, 23 Nov 2026 20:09:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1863C260
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A082404DE
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r76uo7u-FfOQ for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 20:09:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D7A69404DC
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=ZXbWc73h
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7A69404DC
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:09:55 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4bb61185057so24713845e9.1
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 12:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795464594; x=1796069394; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=czUI0HgAjMb3WXIHqVTiWhA8vc0Lvzm+GeWvDbGdYNg=;
 b=ZXbWc73hmVtJnoHrmwTSZpFPAkHfd25xeyuoiuqx+f7bSBfpMx8mLd2u4mKwihIx7N
 ufgQ+rPLYlyRDN6oHrhgQFN4KAMHf+buGhF7SFn0pK0KR8M/kynh0woZu6VQpnxAeH3y
 BBM4tSpQetWh3fo2Nwvom/vKouXE2GkeAEieErRZueGh9epV4F8muZDUzBPDyBE5oPky
 gXqyeUd8sQedS1aXOILiXSMuC4ASecplQlmQrQjbRIlZ9zFR8vRfBKocyoBsxG5BAG1+
 vCIqCvxxwAE/RuOG2+5QEbZKcc830tmifE96fZdvU/y1v3+iA3+fL9iA54+1jvMUeTkD
 59yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795464594; x=1796069394;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=czUI0HgAjMb3WXIHqVTiWhA8vc0Lvzm+GeWvDbGdYNg=;
 b=HyOOgN8FHD+kh2w//gQg4zANZTBHQctK8wupXr5BJeMyMHxsV11IDxp4/L3L85fbun
 Ef78jCWPKQDndVudbwYyfVeg3QWIV6l0jCtPlFZG8bdEEFttjFiNrLQ0f8wHt7GyTiEo
 Ws1wjoa1HDeHRXWDs9DAosuJ/PbG59/jRxFq+U5ObxUba/QXEBmlGUybrXtoYuw5XPtK
 ldeLcbUFPe8spQCClV3eFnEUFiX6eI420Be/nrOYYADgKTFZq9cHZHHSquOT9k+8MlEJ
 5ByFzm1XGLZmbO1qSlRyUtuR4SY9FYOW/1XseMmIJL/o7Cyc6NmAJ0Pca+7lJ70Ie2Fg
 y2UQ==
X-Gm-Message-State: APuU4Z8MfM97iyTXMpTnXQQnvnizEnThLRR4wSUzcjXI+us6cQMxDg0I
 26TX7fy40CC1CokUJaN0wd3qayWGv3+i+DkzVPn5na6s1FJ9sVxFER+XPU/niFU/
X-Gm-Gg: AZFdTZcwneikJnAqZATqDxhiaKRDUlnfd/CX8iQvYt4Tjp9k3fD17gmGz0CE2eW3m90
 nhHHG6FM26faZRUUmvTp5yFeqiIveQp4D2Avv/D994GKm9ufGmdEqoWbrIvLGFKFcSQsoUkFClW
 ejM0HXQSj8YS8fEyjAZDJBkvf9SCz3R+L4SwuMZKGp1ekVyuIJ917As9SaKqGCq0ctmggJymQEX
 Qe5Ck09NYlifPwDsitet+/rENXdrIE+xlYxZtLBB1bjtkCXw5MjLvXQ2hTlDtbee2offPm6CJeM
 McfGjUcGSMni5ZafghutRXPooJs8eGO9AFzkcdq3y4Lcik7L+Q9SHjnuuGLEyjgUQfkc3MPCcY8
 46JdrJVD36uvbyxDCYcLWXg7YCq0qRabBJSPrM5OMF7McfeUbr5iK1PoZyrW5vDE7PUbhfV8PLL
 +KX/QIoS/EUBnrWh0htZ8kIcnHzSs+RxMCrMZK4tz5umanPvnyQU4cSioQJzOWlDo31GhwXDHOv
 gI5p/4XNqoPvqFWe3eMjMCyq+QUUw9B9XLbbEXme8uC+OxwvWWr9qdgSs3YgmAYJYVOLbbBtu+F
 DtTsZYxzkWkehXMl5CtmCf10rPxiYNzRfLesEs5/7FhYym/Ccv0=
X-Received: by 2002:a05:600c:3b1a:b0:4bb:875b:3d91 with SMTP id
 5b1f17b1804b1-4bb88820bfamr267569305e9.30.1795464593864; 
 Mon, 23 Nov 2026 12:09:53 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8d4f9aa8sm331278185e9.4.2026.11.23.12.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 12:09:53 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Vincent Fazio <vfazio@xes-inc.com>, Vincent Fazio <vfazio@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager <neal.frager@amd.com>,
 Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
Date: Mon, 23 Nov 2026 21:09:51 +0100
Message-ID: <20261123200951.3350546-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <PH1P110MB16036AFF106E5B0FA361B9C89F45A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20240228165300.4158751-1-vfazio@gmail.com>
 <20261123173006.2250595-1-angelo.compagnucci@gmail.com>
 <PH1P110MB16036AFF106E5B0FA361B9C89F45A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc: add symver attribute
 support to MicroBlaze
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vincent,

On 23/11/26 18:44, Vincent Fazio wrote:
> IMO working around this for every package is not the best long term solution.

You are right. Fixing GCC once is better than fixing every package
that hits the problem, now and in the future. I take back my proposal
to drop the patch.

If you agree, I can respin it on top of the GCC versions in master
(14.4.0, 15.3.0 and 16.2.0), keeping you as the author.

Changes Requested: https://patchwork.buildroot.org/project/buildroot/patch/20240228165300.4158751-1-vfazio@gmail.com/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
