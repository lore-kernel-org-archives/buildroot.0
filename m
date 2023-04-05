Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FCDC7619A
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 21:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77D84401D2;
	Wed,  5 Apr 2023 21:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77D84401D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p4VdGHBWsOVv; Wed,  5 Apr 2023 21:43:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E50B401B7;
	Wed,  5 Apr 2023 21:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E50B401B7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A842E1C2BD1
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 21:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80DBB61430
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 21:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80DBB61430
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nI0kjHmUi4iv for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 21:43:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0954B60B35
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0954B60B35
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 21:43:08 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id eg48so144467365edb.13
 for <buildroot@buildroot.org>; Wed, 05 Apr 2023 14:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680730987;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mo5uCf9T1jHtofDnm7bJvVmgeGw/7pNbMHE5gIiQJdA=;
 b=fZiRMmozYZE+f70UuXwRkVeN8ziMBVRqHQh5XqaaJMDW7y6/UGwfCa0RsLe0i9rkhn
 nvikp8MWo8gquLGqeaBIaVod9SGp2IyfecSuIIsIMOaDqV2TwiQ/nyL8uMaQuavzvq28
 BS5yZF0QScJ4k1tTqN/A8w9wLcWwPOiLq5cINh8aO3dob7+Pzem8l93AUJMIVssxCCQI
 r6PEYd9jpR+tuRkm2k9TiWHLdDu3HAtJ+9NITjVUs6pfB9bSXEUl7+voZqoL9rnUIJ5g
 ptTcHVbx3CLs1qHkxQFEixxIi5gusGph1N7FQbCpKlQVVMI46tgUgLhoqR5VJIh94NMd
 mYYw==
X-Gm-Message-State: AAQBX9cWqw1Yn0jGLUIkqobNU9rxNriXhHUA4qFXLbC5zFSEFhPAUwIQ
 cHVcY3BD/4aD5MrAIsVahLtOfjiwLiacdUJqHZk=
X-Google-Smtp-Source: AKy350akHJyt/9Nfdw/aCX0bCli5Yw3vzQ4rdRac9TcfGKncXP+EDF+oJqJ5Af4qEcLZvV+FzokdI7rAKAgnWvXUed8=
X-Received: by 2002:a17:906:3ec6:b0:931:7350:a7b6 with SMTP id
 d6-20020a1709063ec600b009317350a7b6mr2451710ejj.10.1680730987204; Wed, 05 Apr
 2023 14:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230405202149.1411245-1-pevik@seznam.cz>
In-Reply-To: <20230405202149.1411245-1-pevik@seznam.cz>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 5 Apr 2023 23:42:55 +0200
Message-ID: <CAB1t1Cyc+UVL8y7HrDt748HcF10y1c5RQ3mP40dnoFt47kz9pw@mail.gmail.com>
To: Petr Vorel <pevik@seznam.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680730987;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Mo5uCf9T1jHtofDnm7bJvVmgeGw/7pNbMHE5gIiQJdA=;
 b=duJM9wqTSq+4d2yhBb1FzNS6RzVRfhdPBpKZHSQ8tA270JqkFrrJd/Vq9sMWULIIcQ
 v4mfRzvHPgzvn8GR+yZygfY6n3PUA6p8unz8r18hUG0OqlgxwAs7SJcmizUR/j+fQ/7q
 Fu+YK1sNeZ77YZ144QzTGKBW59Ozvnneb71upZ4skX0HluxgteHto2qaH0vwIjiqqyqD
 5WqeiLkKKXo5FhxZdprBFJsKUtqmXwenB6tWtbJ63Ys7yttF64IwtOs1PbQ1SKbAfYXx
 WCET2W6/us+BCswnR0wXBv9kgI12Za6wosSYy0JLrs+yXnhVM86MymTB2wP14Rj06HVf
 27VA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=duJM9wqT
Subject: Re: [Buildroot] [PATCH 1/1] ima-evm-utils: bump version to 1.5
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

tested:

                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                            sourcery-arm [6/6]: OK
6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

                             arm-aarch64 [ 1/45]: OK
                   bootlin-aarch64-glibc [ 2/45]: OK
               bootlin-arcle-hs38-uclibc [ 3/45]: OK
                    bootlin-armv5-uclibc [ 4/45]: OK
                     bootlin-armv7-glibc [ 5/45]: OK
                   bootlin-armv7m-uclibc [ 6/45]: SKIPPED
                      bootlin-armv7-musl [ 7/45]: OK
             bootlin-microblazeel-uclibc [ 8/45]: OK
                   bootlin-mipsel-uclibc [ 9/45]: OK
                bootlin-mipsel32r6-glibc [10/45]: OK
                bootlin-m68k-5208-uclibc [11/45]: SKIPPED
               bootlin-m68k-68040-uclibc [12/45]: OK
                     bootlin-nios2-glibc [13/45]: OK
                 bootlin-openrisc-uclibc [14/45]: OK
           bootlin-powerpc-e500mc-uclibc [15/45]: OK
        bootlin-powerpc64le-power8-glibc [16/45]: OK
                   bootlin-riscv32-glibc [17/45]: OK
                   bootlin-riscv64-glibc [18/45]: OK
                    bootlin-riscv64-musl [19/45]: OK
                      bootlin-sh4-uclibc [20/45]: OK
                    bootlin-sparc-uclibc [21/45]: OK
                   bootlin-sparc64-glibc [22/45]: OK
                 bootlin-s390x-z13-glibc [23/45]: OK
                   bootlin-xtensa-uclibc [24/45]: OK
                    bootlin-x86-64-glibc [25/45]: OK
                     bootlin-x86-64-musl [26/45]: OK
                   bootlin-x86-64-uclibc [27/45]: OK
                            br-arm-basic [28/45]: OK
                    br-arm-full-nothread [29/45]: OK
                      br-arm-full-static [30/45]: SKIPPED
                br-i386-pentium-mmx-musl [31/45]: OK
                   br-i386-pentium4-full [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: OK
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: OK

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
