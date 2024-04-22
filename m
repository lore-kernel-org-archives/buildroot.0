Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10A3C4345F
	for <buildroot@archiver.kernel.org>; Mon, 22 Apr 2024 10:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65BA281E30;
	Mon, 22 Apr 2024 10:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id khS1G-zuP4ZO; Mon, 22 Apr 2024 10:46:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8244681E41
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8244681E41;
	Mon, 22 Apr 2024 10:46:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7CCD61BF337
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 10:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66AF181E30
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 10:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvpEg5hGP2-M for <buildroot@lists.busybox.net>;
 Mon, 22 Apr 2024 10:46:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 520B281E2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 520B281E2D
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 520B281E2D
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 10:46:19 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2db6f5977e1so56329871fa.2
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 03:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713782776; x=1714387576;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UCIDx85rJqLct8uqde5Ub3BCH9NlKU5/wCSgtHAy/tM=;
 b=dioE96OxDeHae4kcukox/SCXeWp1+78g+n54xj/oh1SqT0E+ncq0RM8qXYVC0HWEjI
 NSkAe06csLPzI/IAEwwSBkd8C4aHZc/unX8sYUMAMtLnFpf9U7hCSPomRM98p+/U7hjn
 uYM07cjjoMOwIvQ/jHGskgVPrv8glco7fciqDFd6MTR0a5WNqD306HyWoWhUEbhPZ0OW
 r1GKJTuX/OUg+RIlkVHyios3YDEpcmjBPcLBGqQE/uXsNI8TO0/1vVGmNmK3MVHq1FtY
 UfLMZ82lgEJIDB+caLVm5oxSQ5ByvboPDo/IADVregzwHyft5b/v682oxMiCeBH/RXkv
 NzOQ==
X-Gm-Message-State: AOJu0Yz1959umIiQ3OEKRaPKSKWYNVmxTHIBYdFEyxsDbFT+typVc5QV
 iJ9QA6qLkzEWbS6nWESPWVY6mZaZIQLkhxVIINLx1Ig4WYlmMb0buHCQiZRaJyvq9Q8R9tTrC+K
 fvDSa9iBS03fRyKg3saVQ+hNrs9ONfFy+
X-Google-Smtp-Source: AGHT+IFQNHD9rePJD2MnvGciXt6x33J1aX6ziMn8ju2SttgKdT1HnGL7Niwko3gT6nXAxWLf+6+UZtF4oJXj8159sFA=
X-Received: by 2002:a05:651c:8a:b0:2d4:9201:d505 with SMTP id
 10-20020a05651c008a00b002d49201d505mr5239722ljq.51.1713782775961; Mon, 22 Apr
 2024 03:46:15 -0700 (PDT)
MIME-Version: 1.0
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 22 Apr 2024 12:46:04 +0200
Message-ID: <CAGm1_kv4F+h1KZOiYTJ2ZActM6FMekfUc-OSQYt+ABEjdCsncA@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1713782776; x=1714387576; darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UCIDx85rJqLct8uqde5Ub3BCH9NlKU5/wCSgtHAy/tM=;
 b=al/sQc0Th007Ak8Z6ogZIy/VErhEG4ZROsgnQEG8B8no+G/IsSD5wK3gO/Hz0aV5Qg
 XlQGQuVgSFhnegrelfWC5dGqWDegZpbj7yoQBKrFm+sK22P1/yT6FdDVXxJ3VWU0/syg
 TysDtFXpAPvxedvVa69ysMFDd+QYE/41+ZTj4nl4gO7DVXJ2xGyGW4mPSnPFjWVSt7GQ
 6GDCu9Pt1V9/oweC7pQrWSxaf7E+lFnvsJ5CBC09BLt+ov1lXnZZYPc2RuUBy0wUIdPU
 zMvZfuWwuRCP+Wb4ruIwysmzMr0woEglmWX6uCeQMPRc55YR+HjdB41o9YTN4Fb7TdJ2
 59zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=al/sQc0T
Subject: [Buildroot] pkg-meson.mk: support for the host python packages
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libglib2 2.80.0 requires host-python-packaging to build the library [1].

What is the best way to tell meson/ninja where to look for our host
python packages?

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/fc6f06127cff9fe3e464b5be8c92ea08a679b620

Best regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
