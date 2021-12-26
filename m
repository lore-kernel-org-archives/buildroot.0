Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCF4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 09:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFED2401D3;
	Sun, 26 Dec 2021 09:52:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ng1MpHiclUjE; Sun, 26 Dec 2021 09:52:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 097F5401A6;
	Sun, 26 Dec 2021 09:52:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6236A1BF5E6
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 09:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EA6C60D5B
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 09:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tK6KVFr1r5pQ for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 09:52:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 140AF60AAB
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 09:52:00 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id o20so50024762eds.10
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 01:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=CvPqJcMb2EKIc3UHD9+b/NWqzRgZvDGkgnORklsii7g=;
 b=HlfzpVfX41BUcsLAL1NumbO4ob0mhQtslnk1sg0KFiJcRG6dNH5f6Hx0+Uzd4FpN/C
 NC4t0TZ6MunJxG5L236KOn5/fqFgoaM0nKUQ6F6sEf2bE4X+UJvfpxUSv4pKlw0pYGbu
 1wtM7eUEm8TyiMhq8lj9Vz5mGJMjLvcHyvtPBte0+NQPQ9L7FlPMBqvoaQ7zAvm1o19z
 PQqdnKIG9wwKSOjaZaBXSJjoXNnxHpDpqLD/XTcyoimgYAIqpGRdLGOn+Q/kL83x99aO
 9lG7qlSiQSmBtZdum77RUf8Yloyk/71b/9yEy3veP73hz8iRaLQrwgkPtjOEsei8qhaa
 P+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CvPqJcMb2EKIc3UHD9+b/NWqzRgZvDGkgnORklsii7g=;
 b=Z3fyIxO+5yFC13XrDXLFP8hyeLQ4HU5V1NAw/Brh62Estu3cYXG3jXWatn9GUn4N0O
 4DAtIS6fmXsFlNMEvcBJIvl5yk/+13GrKJ5elGS/1EG9n/uPc+Iq37j5BMA1icG/IMrq
 95emYhsGUIAcukcJLEvhyC1GaZWCKxIvz9fYQnIp5m/B84TlKY0urFy42zA+dptHMas6
 Gbytga9qcjyOMPfCaFBHF96DigOq9iCjHs8YBQRUREsKq2ELdwMl3TehdlTCMPqUD0Yd
 1yP/fo7u2islompr3HjObGy7BIgIwA6MuKFdJeqOqfg2SKRLZV5wxl3XvSBIa3qmWqvC
 evbg==
X-Gm-Message-State: AOAM533pxlOZ5QbYofnljLcNDWYL+KJBAL8JoOgebwIeYSoQXIomhpTv
 8ZxCcuyFY5ax/7EqDxczDYBdFp/vTQP0aGIDLLwDJNhK7Kg=
X-Google-Smtp-Source: ABdhPJzI8IZ3tz8DloaYWz/45IAByDECD4zR/k5bUbhr6MlPQ0ygVBzwg9z+35xpp3JIYyReFnongBeTGMZ+rAlTq6Y=
X-Received: by 2002:a17:907:98b8:: with SMTP id
 ju24mr10098006ejc.516.1640512319074; 
 Sun, 26 Dec 2021 01:51:59 -0800 (PST)
MIME-Version: 1.0
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 26 Dec 2021 01:51:47 -0800
Message-ID: <CAMo8Bf+N5zOkAXgOGRYe4cJkBitactfuajB1SEoLLuwqZfCQ2g@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: [Buildroot] package/coreutils mkfifo -m exit status
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

Hello,

I've noticed that when I run
mkfifo -m 600 fifo-name
from package/coreutils on a linux system it always indicates an error
in the exit code.

Debugging showed that lchmod function call at
https://github.com/coreutils/coreutils/blob/v9.0/src/mkfifo.c#L178
returns error because when the package is configured with
gl_cv_func_fstatat_zero_flag=no the following fstatat code in lchmod
https://github.com/coreutils/gnulib/blob/9aca7b67333fd0a90bf56104325ce96199644451/lib/lchmod.c#L65
always returns error with EINVAL in errno.

Removing gl_cv_func_fstatat_zero_flag=no from the package/coreutils
config environment fixes that issue for me, but I couldn't find any
explanation as to why it was added. I can send a patch if this
is an acceptable fix, please let me know.

-- 
Thanks.
-- Max
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
