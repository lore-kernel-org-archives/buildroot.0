Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C62C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 08:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1F2360E31;
	Mon, 27 Dec 2021 08:40:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Wce4KpS9Kw0; Mon, 27 Dec 2021 08:40:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36A0860C0A;
	Mon, 27 Dec 2021 08:40:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD9551BF36A
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 08:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC7C460C0A
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 08:40:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0LLvRkcC5WJ0 for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 08:40:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18CA960692
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 08:40:16 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id bn20so24694602ljb.8
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 00:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=TPTjxxwdqIJAa6Vp3PDEaBiXdcCn1x8XZmvVkp/w/MA=;
 b=fm7bN9PahzECRKk7jv8ULAre//69t9U6S6kCK4r2BshASNB2aG4QLxAcfmKrVYigPM
 DAFvKYeMMgQncJQoFvNfWYUNZMcfz1wt6x/Uj5LTFD3Jz4FeqTgect35as0V2TQPxUrY
 kGOR56EhJsKQV+PVFWSfrJg7476/TsKRY1A6TqgKd/SQpOVR+Ve4jytf9BSIrVhh1ytG
 T2TREB6o3tO+RRQE+aR1uzOhFCvJHEtDYL5ECYzpDNoybugufeEhBcCSa14S90wbvr/i
 O1RIDOSwsvnHljJLvRg9yG33p2d4Oiue3nwcxwmLm9DH2jWpaxUFMVyaDC/56lKQUcFk
 g86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=TPTjxxwdqIJAa6Vp3PDEaBiXdcCn1x8XZmvVkp/w/MA=;
 b=ZAGrVfhzU+YQ+TpdABgrABXt8dUwIkWeNxIUB39nhnOOr5ZPB3ekaEnF+Mh5A4GDan
 Qb1H9WztxieHj8Cj/XZJhZJUWRgLELqe5hGfFxWRJ8B1EEEt11Wul6nK6BFTnpbpX1Tw
 DM8zBCD4v1KVKmWAr68r1aAV2TIQIYzLQoRiafYDNO1e5GZJsy6Av9mMj1/J+8ouZHwi
 SiaKK8Sud0u3dmUWoALA12MBQiagPuPpZDaCYx+UOnpVPZyKrvpEmMVqNSTgGazFs/kX
 7mXPI1lMf6jiM9E5yrkVCHqy0O+X2K6igBXu71ch3zZbGrJKV0e8qTiR2zmp+nxAukzZ
 LIvA==
X-Gm-Message-State: AOAM530fJxWSeE2EFlHyycipyaD0rZTe3ad5/u8n+TPiHh6leN7RsaNm
 fwLuiHPLSzB360b+1evkM4/kW4CxgLnxLeHHG2zPUU4l
X-Google-Smtp-Source: ABdhPJz32l8XALbZ03S/l1tsQLcBe4ruTtRnIyKGc7rY+ML8GSoSYMpZZbJQyzzV/PqsLJl+qmGvDk1Bd9KqAcfaRcU=
X-Received: by 2002:a2e:9ece:: with SMTP id h14mr13396276ljk.206.1640594411671; 
 Mon, 27 Dec 2021 00:40:11 -0800 (PST)
MIME-Version: 1.0
From: "Juan A. Rubio" <jarubio2001@gmail.com>
Date: Mon, 27 Dec 2021 09:40:00 +0100
Message-ID: <CAE58QoPWoZdZq=cOpo0MRJXgZDfa5Ad07HtYooT9LKho5KRS8A@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] Same 32-bit image for 64-bit and 32-bit platforms
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

Hi,

I'm looking for information on whether it's possible to produce and
use the same Buildroot image and associated sdk for two different
boards, one based on an imx6 and the other on imx8. Is this something
that Buildroot supports at all? do I need two separate Buildroot
environments/builds, one for the 32-bit imx6 and another for the
64-bit imx8?

Thanks,
Juan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
