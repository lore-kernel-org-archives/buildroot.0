Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230E3C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 06:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A249983A82;
	Thu, 14 Dec 2023 06:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A249983A82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYxxUZI3azpg; Thu, 14 Dec 2023 06:08:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D41683A80;
	Thu, 14 Dec 2023 06:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D41683A80
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E81AD1BF335
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 06:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B43324047D
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 06:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B43324047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 97yVgCs-zwh7 for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 06:08:02 +0000 (UTC)
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B67E340124
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 06:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B67E340124
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6d7fa93afe9so5790488a34.2
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 22:08:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702534081; x=1703138881;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qIy2685b8dmOvbpnPq0tqQ0AhQfGiooiZUP1FNsO7H4=;
 b=iRF/XmIfQ04Gu8pAki0IKY6tprSdsTonsbZQ4plJAJt0B1J9LSnWSdW8TeYz2Tu+gW
 LpJoTVGpGdnOGpgFVJcV8jJuD4ytu0/7Jt26qQvwnROQ1Qw0GteII0IHMCBsSRnwzPDA
 tAQMUUrhB/a6EFzbV7IEneAP1lFEjmAUrd2Cz22kcpvrNEzcs0s8k9xiZNyslmbC/g+E
 J//32M/rcJpbPvgeY/RpUjRre8EFmQnMe0pw4/+qcRc1wyGj1lvwIqhqnflmnyIQ/eSo
 Q8hWPToCtv5XjMbeZAdSSRFMJEboT5/zZll1uYvgfP/F1sPjRzGbcYUFEEHQqahNZCep
 e6eQ==
X-Gm-Message-State: AOJu0Yw8vkCZUy8uHxb4bAtHr7D/t0sOR94u1ebpSOwkrI3Ip87wO/dM
 eNQ8J7aCwOKLXYhEO+ZH6m8XcSHVM6J+/h/sj5NZiPRDIpk=
X-Google-Smtp-Source: AGHT+IFuWiUq9OWMC7qjq2DOQqZoqh9yPWzpvpv+3+v/sdpbNGPi2bhV99t/v5bVzQa2VkveOw8cn1qXal7gx60fQ4M=
X-Received: by 2002:a9d:74cd:0:b0:6d9:d995:5eb4 with SMTP id
 a13-20020a9d74cd000000b006d9d9955eb4mr7934368otl.45.1702534081453; Wed, 13
 Dec 2023 22:08:01 -0800 (PST)
MIME-Version: 1.0
From: Davis <davikovs@gmail.com>
Date: Thu, 14 Dec 2023 08:07:00 +0200
Message-ID: <CAHQn7p+q+ZEpLdDWYG6M-oLP6mSqXtE1M95MKjQQfEBtOmf6xQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702534081; x=1703138881; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qIy2685b8dmOvbpnPq0tqQ0AhQfGiooiZUP1FNsO7H4=;
 b=LqZ1fEkZTpTa1e4wMapVutIuFhfC8brJLH6Y5NzoIRv/dN3qqwbsNOuWsOKu947Xgz
 EIidwP0uxqracCCt9mf30UaSkp/CpRNYQlWjdftUm1As1h03AZLqG2L2LQ9Hj/UafTJe
 TW5xp3pDEOrbn85773Z3k9jQvOc8csyFScpSo5TYmbnDwLhHf4lih+pWhziYgqV5mQfR
 fWSZe8xomj6ndbaH2lzM7rvpETMTj9YcuE1u9ekp7olamekXjx2qQQOHRdfQ30DB4MNt
 /ua474fKM3bqigiP+6lvtjZfTzRieVPDSSqKRZpzDdLpKwD3CS5fT6D5vwyK/39h5OBC
 +3Dg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LqZ1fEkZ
Subject: [Buildroot] Bluez 5.71 released
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Greetings!

Looks like Bluez 5.71 has been released.
It fixes CVE-2023-45866: https://ubuntu.com/security/CVE-2023-45866

Could it be possible to bump Bluez version to 5.71 in buildroot?

Br,
Davis
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
