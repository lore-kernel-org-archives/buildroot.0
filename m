Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8B7C43217
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 01:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2002C6121C;
	Sat, 26 Nov 2022 01:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2002C6121C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cKxlrup_6Jf8; Sat, 26 Nov 2022 01:16:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69579611E2;
	Sat, 26 Nov 2022 01:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69579611E2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CBA11BF966
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 01:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37850611E2
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 01:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37850611E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lZM7WuP1D6uM for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 01:16:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CD16611D7
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CD16611D7
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 01:16:40 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 b13-20020a17090a5a0d00b0021906102d05so4002122pjd.5
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 17:16:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=odktr+HrhO1CAoDGFYvtyZT2YChgo9IHU3PIJfxUryc=;
 b=4FqXDHOP2WEKuhy0mB1gADFk37VJDHj6UKzkBVWUYrSL8NMxlGpsUkgtreUynLAf9F
 R8XpDJ6HJzbLssUHQ97eNO1HV2BWqdXvaK6YjJsPct7HDh9u3wlyiPpJGR+ysaozV1qX
 tHMnf+Tli+lY4qOu8eCFXvwpTJ6XuR4NbYg7ZGnoIbRFXCSkth/6Dsfe27t8AJHFdgaU
 +hnwyKWYG0aGFFZ1JwzXHk/h7GjLzLMlCJDCxNqQRLGQFeGmRpVVVkgtqHRiF8VnZMdX
 p7yRsR/KGdoUrZRB3hcl2u6IcynlGzItzqIMxf4FSf6jtwhOZfiQuPPPv9j1C2p8ZH4T
 e4nQ==
X-Gm-Message-State: ANoB5pkvvN933PuYBrE9K4wVMmeFcbdgECUbPInW599s8zGKbZV0KmHl
 z6l/P6z3nYkpodrnPDkeSxWHZwdDQaOd/ANupfg=
X-Google-Smtp-Source: AA0mqf4B0vgCgYP0TseWKONGt8yQslLmxRVC4OwKVeEpjiu0yfXAUFXZKAvslbQXvfkqyRiq3FnmQ2xUSI7g93wE4/Y=
X-Received: by 2002:a17:90a:8d0c:b0:213:1a9f:8d77 with SMTP id
 c12-20020a17090a8d0c00b002131a9f8d77mr42243519pjo.102.1669425399859; Fri, 25
 Nov 2022 17:16:39 -0800 (PST)
MIME-Version: 1.0
References: <20221126003807.462157-1-pevik@seznam.cz>
In-Reply-To: <20221126003807.462157-1-pevik@seznam.cz>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 26 Nov 2022 02:16:28 +0100
Message-ID: <CAB1t1CykDd4P2O1TgMcH6gXb4Fdvu9p6piuaz-SS95RfRzpB4g@mail.gmail.com>
To: Petr Vorel <pevik@seznam.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=odktr+HrhO1CAoDGFYvtyZT2YChgo9IHU3PIJfxUryc=;
 b=lxBH0nDrzzlPahSN5+9oj1bVd4rd11jIpq2rQyEHXJwEr3QWQHp3ajPuXy74yXByA9
 9AgZjt/yCEm9GWvuWYtauHFJLdKmz8pieeKuJSIjaotArdAoN52J4BKhKc3v2JnDt4TI
 4wjiOWyMCOWZnPBm32ut/E1ixG29trcXhDLRBphsS/WJH0Fhiv6rCQl0mVb0Ize4IqKZ
 SbhB63IRKk/vRNhQ/geX26VE1RfLCu+AwA6PIGhM8lubqjP8+7kTScA6q6U7bLWuXMrM
 zD2q+/cjVQFBrxPWcqjd+Bq+DcK1hNb8PjS9cu8wikyKe3Emmf6Ow8m934cLAkh7PU8X
 1q1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lxBH0nDr
Subject: Re: [Buildroot] [PATCH 1/1] package/iputils: bump version to
 20221126
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested:
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
