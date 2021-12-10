Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F043AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 10:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A872421E5;
	Fri, 10 Dec 2021 10:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 454B0IvXfq5N; Fri, 10 Dec 2021 10:40:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2506421C0;
	Fri, 10 Dec 2021 10:40:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5EFAA1BF2A1
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 10:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A6104093E
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 10:40:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gOdIVNd5V_eG for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 10:40:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08F6B401F1
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 10:40:17 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id v203so20305148ybe.6
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 02:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=yZv1qh4jAk3EwX3eopabpoB0vEQRN6xHSB3dDRfwcCA=;
 b=LSSqN5DZaWq3stwd7bDSfBFPsF9sRhLQXTRBDBlxS72sUAZK6yyDggXLrhmlNWQgJ0
 FFufJzYPoIM5bbGj6AWBRZ8uqoQ+iA8Y1AFACZql3YKACyl7DC7rcHPoRnG0cr8z3+4F
 jfmXiGsXE/2lnNPVEVbEwQd2104lHDsg/h428QW/aQVe4pldYDkxD3HyzepguG1tRhGi
 ecGweq6/ThiIKX8OysSVnsPrOdoc3mb5vRVpT+ZtqST+EcyH31bPSWMDQ44owKW7wTCF
 jt3xpD0DoCTZdhrC/E0Nuy62B9v0h66Yfd5f9S6zmOINKSIzGfWufidcWQ+sNg6MCeEx
 icrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yZv1qh4jAk3EwX3eopabpoB0vEQRN6xHSB3dDRfwcCA=;
 b=B7s0u8s1YZhGgAzF6TsiT5SLwvDdP2GddM+vXVpkeTACzpJZ5kPBKo1AthcoKcHqTp
 H7lKQQnD/1tuD/8J6qJcJ0//yA8F1pZyFAV0O9Yt8MH/HwzxWNCDqejiumNr6aEQOmJD
 kM3xAOAjLvzJFz2OzFmtBgRnbHtV9JC+Fx/jRUlSIYI/IfVCeFLulgUJR2Ofa0mlmg4G
 RA5lASLPu18uvCqx/xCWE/TYCB6on6RDy7HAZ/vjhDrFq5honbK8tpttp2HDIUMgk5fF
 ENo8Tw882Ku97m2PVjETs22/BkOStRIkWYLMK9HbKA7xXKT4Y//9l7JRjKtqXU+IQZi5
 8cAw==
X-Gm-Message-State: AOAM532LdJ78thXBTiTapqoqOgG69W5A6RcE18mCb2zMpJCZgYm92Y75
 URBlwsSc2IUTzE1fmguWDhVhMITQib5pdvCuW9Q0cNh6pIFNtQ==
X-Google-Smtp-Source: ABdhPJwKJyObyaPIDlslyIi83Ag5r3P7p6WII9VWmHW9ZJzfgdGiDcTkiTNdWyhXz4Jks3fCa3PwFPqgl5Ajr+AqRF8=
X-Received: by 2002:a25:be83:: with SMTP id i3mr13517929ybk.360.1639132816304; 
 Fri, 10 Dec 2021 02:40:16 -0800 (PST)
MIME-Version: 1.0
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Fri, 10 Dec 2021 11:40:05 +0100
Message-ID: <CAOiXNkBa2iycZvTW3pmSzHq6EmWTGoQfD_iHQ5mWyDyVRBYHeg@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] -E flag in apply-patches.sh
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

Dear Buildrooters,

There is a -E flag passed to patch in
support/scripts/apply-patches.sh. It prevents patch from creating
empty files.

I have got a kernel driver from a touch-screen vendor which contains
empty file. So my attempt to integrate it into Buildroot as a series
of patches failed because an empty file is missing after applying the
patch (because of the -E flag). As a result, the kernel could not be
compiled.

I am wondering if there are any particular reasons to have the -E flag
and if it would make sense to remove it from the script?

Thank you,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
