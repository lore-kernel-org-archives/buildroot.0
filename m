Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C518C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E622141E6F;
	Tue,  6 Feb 2024 10:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E622141E6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2fxpmk8tt8Vf; Tue,  6 Feb 2024 10:22:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48BD641E9E;
	Tue,  6 Feb 2024 10:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48BD641E9E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 894FC1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61A3E40448
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61A3E40448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ABekLvYWMthT for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:22:21 +0000 (UTC)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E25D4037E
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E25D4037E
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d066b82658so80429271fa.3
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 02:22:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707214938; x=1707819738;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gnZ6oUbLLfOfJlS/iXXCegNBN7SJ6pvisg3InWXoPXo=;
 b=N326Et5AztTJV5iuEpZ7qL/KZm+4J9vlqdHPTau3CBGk/NnK/YQrr+lrfINMbH8hmV
 XmebuJRL8jfaMJdczsCzawAbRlc5/mj6H7+HVosKvdNoVZU85k0vKLtW3a3EcMVWF5GE
 4u8A3erq9GCpyaOqTjDKGMaz8VcFarkvMxaIIHyJ6X4f1i26xIWG5O3VfXoQBj3yVgMr
 dsqIcb3V2Ksx0Yic0Q8wTWQblCEemKh+7CPOomsbT6bo+oxalzXIMQ+nogrzOh9h3Rae
 sdsdGXSbKYjxEgjrHxDYhRoz0L7c0FJlgsd4jyzSnuQuolNjRAl0bkzHK8FiHVjAiN9U
 NnVw==
X-Gm-Message-State: AOJu0YxiAaobDaRliRlEPvP9BPv+d7+4K9UE4ys6NmS3aZZgbXj86adB
 7EAIu2GgLjV3rlgqJVTaN/TXq/X4lzoEXXtRMK21qOhRL7/9YsVUbRcKkJE/FlAbwQ30aGgqZfn
 j5HxxJEdj66ul2QQGFZnYhnM4KPRPmYqx
X-Google-Smtp-Source: AGHT+IFjfdSPoxtLkQOz+V/dSVq7hHmIe94SEIrsfCfRGQLGgUuNx11mX2Oxlb8ERaIpKUGuwv5B718w4cZIxPrbH5Y=
X-Received: by 2002:a2e:910a:0:b0:2d0:a758:51b7 with SMTP id
 m10-20020a2e910a000000b002d0a75851b7mr1635287ljg.7.1707214938407; Tue, 06 Feb
 2024 02:22:18 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 6 Feb 2024 11:22:06 +0100
Message-ID: <CAGm1_kv4kcNXwz4J2cNBje3VhbMX1xcwteAX1=j7QtsdAveQCg@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1707214938; x=1707819738; darn=buildroot.org; 
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gnZ6oUbLLfOfJlS/iXXCegNBN7SJ6pvisg3InWXoPXo=;
 b=VFAO7clfjUdfEqPYovS6+AeA4Ub9wg3y5Oh8XR1pTHJeplHNBhXfV5DQvbCfkgYz5u
 sHRN6SqmUpFRJXlQXcgM62L0aUtwaqbQ2hmkBka+DOkJt4N6dNSSHCah8YhiEHDDkb7C
 NEK4yCwHSv6HfMEP1lPUlwlKQTdXV1YRF0Fyg8ya0L8whMjUmh9HfIQW6mKCUP4Vpkgu
 zRNYtGoeXu5Okl6tXKYs1dBNFQ3FY3oARm7svSOCmUmbBiUl1Bq5Iu1oHbftwW+ZQW1p
 buGKvxKXTNYJYFfT0QKbpnyDtM39juxMEull0Fpn1H+MvE1Wq3Q3FKHYWCFvwHnkR6MB
 cYUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VFAO7clf
Subject: [Buildroot] Ignore build directories created via make O=dir or the
 default one
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

what about adding a .gitignore file with an "*" everytime we create an
output directory? Does anything speak against such an approach?

Regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
