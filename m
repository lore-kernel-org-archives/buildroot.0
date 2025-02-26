Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56703C021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 21:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1E11411D2;
	Wed, 26 Feb 2025 21:08:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JgLCC4u7wzSe; Wed, 26 Feb 2025 21:08:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3B91411F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3B91411F8;
	Wed, 26 Feb 2025 21:08:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BB2A94F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35A0460718
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6N7FmP03BK3m for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 21:08:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=nunog@fr24.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E918D605AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E918D605AA
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E918D605AA
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:08:06 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5e4bed34bccso219946a12.3
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 13:08:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740604085; x=1741208885;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1eWjync0fj9BgQQt2evIM12XJ/UwqinXluzq3kTi0FQ=;
 b=vTjpBH1WMlCvin/Q/6HjA5CnE57d7ZFGPrxwKFv3MM7oEARY4iyDQsKOfQp9ESWEdQ
 e8zQXAiquI+0C5MsKcHOp02dtRcmKPV8Efx/r2VF+/XgKZmH2iKsW2DydHOkTx4r+k30
 HW8Zh98O+MbFrJ45SUuObQSJXuHmVi6KCgTMsX8seNh9qgS/fQ1gYbOCtaPUd3YRcHaD
 W+I7RJas9U9dOpy/nPzoQD3HWbEWHn4lqc1wn2x/MWA2bkibqcTsCZd8PK6+7R0rrpax
 91akYlYKs/KAMPh9FQ5hmb9WvwJa0nd3y2HV8H4DmjY4wCusEXzXmSrx8ImZml3tkbDh
 /eeg==
X-Gm-Message-State: AOJu0YzPUq58hH4wTE6jQUVFfGfPxh3eH3zFsMg7NRA94VPHe6gAaR02
 aefJm8xwomPhe+9k0Q60p/3LiKS+XAhahGidzwZunBcD7BPGi1ruU1a8Jmesf5MAA25r4UXwoQl
 NEBoEeTKWLjdi5wHGo3KyA0AvvCB+TaSMdB8/D2JpsTb0gyRKTEQ=
X-Gm-Gg: ASbGncvlrVo0de4utT6+b6dMBtAvj9d/pemKfw7yyF9tfpK5tnKP9Awps6Eah8uhbRI
 z4HkJB99i+tQeMQoty9frsA/qGyrlA2XwTDyX9eOJYf8ux+sHWKGt53QtFAA/zJNz5NkMckjk1P
 ISF08=
X-Google-Smtp-Source: AGHT+IG7SaS1Hd1POU/9ni8RpnQeFw0k844yOxjI0FOQFf+mdoeMjHKxZ1mfRFX1gjMJHPswYRRaXZn2Qpj2m0EcZms=
X-Received: by 2002:a05:6402:1e88:b0:5e4:95d0:7e1f with SMTP id
 4fb4d7f45d1cf-5e4a0e29775mr6309793a12.29.1740604084921; Wed, 26 Feb 2025
 13:08:04 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 26 Feb 2025 21:07:53 +0000
X-Gm-Features: AQ5f1Jo8WmhO2eaukj3UmK1fHVp7j11THClTcis1JRDvldCzjncGQLiuv2N2v7w
Message-ID: <CA+mKM5mXCF7p_54CD9F_vvdaq03F0pj-1j_-2p2TYENHtyMEVQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fr24.com; s=google; t=1740604085; x=1741208885; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1eWjync0fj9BgQQt2evIM12XJ/UwqinXluzq3kTi0FQ=;
 b=aAYv0v0Porp3lBmsLcAcslSLwHGmjwlAn+PPWBC9J4bsymZ7ZnsKZtXU2DU6/6gKEJ
 lLrs9E0+jHtSU99EirxoTeUiCOOZEkl5cHqYQzAI4hMXpKf/nns4opNleLAA4pxcOytu
 RLUNOntK5xw9M3YtLJlgbQ6NASRjARjUVD9++Q2+cTV4T1yRvMybY1SzEC1uGQBGKKap
 p+NkfyZ0LCmLYAb8K/dmQg/PGYwP++Zkup7WXmsAnqelq0V6nBlw1/vm5XZG6iSTaXIy
 ee9yA9peGtH3V48sEzsQ51gQiF87WJVivfqm6hqbH9GU1hgIoxivpzVFEPuHcB6EJlFp
 Noog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=fr24.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=fr24.com header.i=@fr24.com header.a=rsa-sha256
 header.s=google header.b=aAYv0v0P
Subject: [Buildroot] [BUG] File permissions not being applied with systemd
 and build kernel >= 6.6
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
From: =?utf-8?q?Nuno_Gon=C3=A7alves_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunog@fr24.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I have a build issue caused bythe following:

systemd tmpfiles is called by
package/skeleton-init-systemd/fakeroot_tmpfiles.sh which is called
under fakeroot by fs/common.mk.
systemd>=v255 will prefer to apply mode changes with fchmodat2
(https://github.com/systemd/systemd/commit/adecfb3bc0be0def49433277fcad5333893756cc).
Now, it appears this syscall doesn't make the effects visible inside
the fakeroot, while they are visible outside. But since the image
(like ext2) is created inside the fakeroot, the mode changes are lost.
This only happens if fchmodat2 syscall is available in your kernel
(from 6.6), and you build a image with systemd.

This is well over my knowledge to propose a solution, I apreciate if
someone can take a look.

Thanks,
Nuno
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
