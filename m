Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769E1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 02:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0BD140199;
	Mon, 22 Nov 2021 02:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6JG4bun97Bwa; Mon, 22 Nov 2021 02:08:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BDF840190;
	Mon, 22 Nov 2021 02:08:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C3A6F1BF83E
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 02:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3C1C81865
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 02:08:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iHmK3X_MzAxQ for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 02:08:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2EA1B81842
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 02:08:12 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id n12so73558158lfe.1
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 18:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CpC7elyAKbWd8gwDxBAOEeIjwpWy+g6Ub7WS/JWpQio=;
 b=D/yR1exAlGS9eyyzY66rtxIy1omdT0xwR+orZn1y+1DyP3mNa2FoG3FW2cFlRD3FTv
 FXQFpFRhYcyMLwSkq/RJtnh8F7FjZfs1Qtp3tsu/7YBLNaunJofU62Iy4yWmtMSmDrNf
 7Nk9gLbASXfxQG9cFzEWWypu5X3oo0H2wAtYqjX2nz9OMJdCmEOZL3Mhmqq+smT854+A
 i+KKe7PlEFQWQSJZj/EBI8CByPDBX/t6syNrTDbxXOy0k6qDKHSHv+/xlMYRwv1QFtPy
 F7wr4pbKNeFxAJkjCbwyS/d83nNKN9rL3VAR5tbZPD00ODpLllgI5GCDzjahPCP/tZcA
 8sJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CpC7elyAKbWd8gwDxBAOEeIjwpWy+g6Ub7WS/JWpQio=;
 b=yZddztqt0EPUf2M4NrbQoGFqpRcmhor8TmmwLQr7B2J3uXdXDuVMLNOqksK3afk53T
 oPd4XpcU6bV/Z1jWX0GeP8Y5bQdJnXALHrvmxEXxI2vnOFWQBCtxqHqHHgW2L/P9OFvS
 fCs2CLn18qw/cLlK0gK7KOU+rtCAMz2wUfb42/w8+BsPh9x1wi8A7OJcRI4Y0ruQxPIv
 oRlSXitmx/PjhdgyFO6Co/V1gs+FjlhmFh2zHyIEmWWPefYH2Zl6Hv+3bv5irWlJXUa+
 fCYL7gvepJiyzhWVyq2Sy3qsyAyHV536WQHWtajLLJFW0SMxoQdIINsiWmHJyHHexdej
 h0Ng==
X-Gm-Message-State: AOAM5320hLzLbhCM8aJcAZ7apm8KWSx73EXVWrxCMjxwPOuYhuDappI6
 V2QObYHcdx052fy+dvALj8dTlgDHGKc=
X-Google-Smtp-Source: ABdhPJxJ/C7XkqdRvklOwZaA2kLtE5QHCuDM5PJgyNAK0EfT98+y8JL0cekhxCUvk/ak9Ps+K18zwg==
X-Received: by 2002:a05:6512:234c:: with SMTP id
 p12mr51614278lfu.157.1637546889658; 
 Sun, 21 Nov 2021 18:08:09 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.197])
 by smtp.gmail.com with ESMTPSA id h19sm788120lja.71.2021.11.21.18.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 18:08:09 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 03:07:59 +0100
Message-Id: <20211122020804.535891-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/5] package/inadyn: bump version,
 script refactor, etc.
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

this patch series updates In-a-dyn to the latest version, adds myself
as co-maintainer, drops the local systemd unit file, and adds a fully
rewritten sysv start script with a few more features.

Best regards
 /Joachim

Joachim Wiberg (5):
  package/inadyn: bump to version 2.9.0
  DEVELOPERS: add Joachim Wiberg as co-maintainer for inadyn
  package/inadyn: replace local systemd unit file with upstream
  package/inadyn: refactor start script
  package/inadyn: update inadyn.conf example

 DEVELOPERS                    |  1 +
 package/inadyn/S70inadyn      | 85 ++++++++++++++++++++---------------
 package/inadyn/inadyn.conf    | 25 ++++++++---
 package/inadyn/inadyn.hash    |  4 +-
 package/inadyn/inadyn.mk      |  5 +--
 package/inadyn/inadyn.service | 10 -----
 6 files changed, 74 insertions(+), 56 deletions(-)
 mode change 100644 => 100755 package/inadyn/S70inadyn
 delete mode 100644 package/inadyn/inadyn.service

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
