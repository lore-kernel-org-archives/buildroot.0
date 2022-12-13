Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAD2C4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 12:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B14BA4059E;
	Tue, 13 Dec 2022 12:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B14BA4059E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vckGvTCsAqoB; Tue, 13 Dec 2022 12:13:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE6C440541;
	Tue, 13 Dec 2022 12:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE6C440541
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 548541BF5B3
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 12:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B14281D7C
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 12:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B14281D7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YJT9-unJAZwY for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 12:13:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03F57813F1
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03F57813F1
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 12:13:22 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id c7so2013478pfc.12
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 04:13:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sb49ihZzGcyh98df7t6/xgifR5iyuWTrWISuFO4VfGU=;
 b=CyAdevZL9RGp0vvG0cpimQki5XG/ViFoxs8xooyLRqmKtP+f8bGTGrXBJy6i7bvmlX
 SMr1AEod1xBz5FxZOmeCkMeXgMz9ACuBU/dkRlCn1pmKB8Wk2UsUBPclulowLITnKAPK
 zys3Y3kdaVqnQo5W4QsnOnqveL8Lxz1fCqJRkJDOVJqx3nK7rxSz6UWU1isKJ4p572XC
 LYt7Ogt8evnXeT9QhsZyE1czWHTiBUf3MObXBa9UGOHLbc+c3Vo6dRQxIq8RQULQFyPl
 +gZ5UZaLF8gCAJlSTorDDZLspLmnck5r2c0AkbBeovXVF2FC7CxpTJ/lR1NgT6tFxW9a
 aWbA==
X-Gm-Message-State: ANoB5pkz+HbX2Fn4h4cW+zMpjyv8cOZ726JPlPlqVavQZqV9nvb678o0
 z2gJ0Dw12cj8mlCdZkCzFhi0KQx33iCxDwFqIWqpT6tD
X-Google-Smtp-Source: AA0mqf6ziyu8PlIk/1wdhoNya0swJ5cFdhCku3OZMBY/qmmHO5e1hXnIYlsUPVgHLwI/Tmhrg3uXCkAWx88X5FNgGuw=
X-Received: by 2002:a63:652:0:b0:478:bd3f:7021 with SMTP id
 79-20020a630652000000b00478bd3f7021mr17274299pgg.558.1670933601836; Tue, 13
 Dec 2022 04:13:21 -0800 (PST)
MIME-Version: 1.0
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Tue, 13 Dec 2022 13:13:10 +0100
Message-ID: <CAMdwsN8LeLeqO8prGAdNhRC1u6+DRdD2FFCscvBquZW1rNe-qg@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Sb49ihZzGcyh98df7t6/xgifR5iyuWTrWISuFO4VfGU=;
 b=DsldrhQZuYEZp2e7RRlPXq+QH7GDADMGIXwzcVjFNFQWOo+NkYcCmCF3gkj9Y0AHvM
 NY3UJiwZWk+oTJ5xwDOTzHAOaqCgRM76r3GElBNVyp+YOJHSRAHfA6pbNfTsayHR8ldY
 xmcTEts37inVD9UHU7a7bl860K1DmYfszyBzcZafsoEe5kPTqJUFiG4GeKZ43AWkJtLn
 qdINxz4h5my9+qOSRJw+OUPt1t6OEPZESkRnQ/1m1IW0zmg5cO846qbU5D7zEBSoCjhC
 sU9u/NyJm4MVvSiM7Dg1QoJOIqQRVAtsMUlYr2yBouRRkvMPt2klxsrT4gfMN5YJJOVI
 8SBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DsldrhQZ
Subject: [Buildroot] compile commands database with BR compiler
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

Hello all,

A bit of a buildroot adjacent question, we are converting some of our
software to CMake, and I wanted to take the opportunity to add some
additional tooling like clang-tidy/cppcheck... with the exported
compile commands.
This however doesn't seem to really work, I'm presuming it doesn't
play nice with the toolchain wrapper, adding -march and -mfloat-abi
manually to the flags seems to resolve some issues but it still throws
a bunch of errors as if it wouldn't be able to compile even though the
application compiles just fine.
Has anyone here gotten it working to use a compile_commands.json as
input for other tooling that's generated with a BR compiler?

Regards,
Jesse
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
