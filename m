Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4853C43217
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 13:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5260E60B2C;
	Mon, 28 Nov 2022 13:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5260E60B2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PlPC1HJKYQpC; Mon, 28 Nov 2022 13:37:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 989E160B05;
	Mon, 28 Nov 2022 13:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 989E160B05
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 588E81BF38D
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 13:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33FD340391
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 13:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33FD340391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SAgKD8Rv47MG for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 13:37:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95EBB40151
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95EBB40151
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 13:37:37 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id l67so13322890ybl.1
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 05:37:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fb0xDvamvfwTcSZXQ1lGqBwLt4ibEd85vd5FakW/PdU=;
 b=EfQthugn7efpZdGi1w48PfI+xxEvHqhCwLnDRib9SFbVQ+b0BNhjNQyL2CUHgCcWcn
 zqUEgYuZ1uG08ZO11/ZNWej+k3xjp5BGQ8J6pXu9GXNDkrZuOFoi4nt4YEX9cO/8OiyD
 ozBducCgFW9HAX/x0A72EeeuG31/tmvStS3SQ9Gd/1zs6QCp43GSrdg7QhBUryiB+nqZ
 NLkEeSHPZ0A8QS4xbErkGv8bImIcn7tPZQiKOV1gop9VXgjxHJBR5iK2W0CbCb6//bVo
 qA0um1NzoND9gONjWatD5RLgMS5ih9kXWox0QWjgICRfeaS76S57U9XSwuheBE5rucPY
 Ai0w==
X-Gm-Message-State: ANoB5pnvjRVVDsv/seR4xyupbWYarQI9XqLjJRZmvaoYXqvrZf1607Cb
 I7Bgw4Wyy9ca2kko5QhKanzfKXkZF3+zWW2zaE4=
X-Google-Smtp-Source: AA0mqf4BilQPIyuWGM27qWtIDlNtjeeURxorgi0fiGgW7CBr+47F9BRcpXrBUY5DkqQQ2RvKouN5qNOKsd9YZJbPt3k=
X-Received: by 2002:a25:d449:0:b0:6f4:3ced:f472 with SMTP id
 m70-20020a25d449000000b006f43cedf472mr11843277ybf.539.1669642656577; Mon, 28
 Nov 2022 05:37:36 -0800 (PST)
MIME-Version: 1.0
References: <20221125191155.111c4ddc@windsurf>
 <CAMo8BfKE9KqDYyFhsKK9M8XjjuR=TtONT8JdKniFKwAgfr4HVg@mail.gmail.com>
 <20221128141221.0b2f5a56@windsurf>
In-Reply-To: <20221128141221.0b2f5a56@windsurf>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 28 Nov 2022 05:37:25 -0800
Message-ID: <CAMo8BfL61tm-ojZvSqPB7C4bzqOaugTCOo8fQ+ap-wn1k36GQQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fb0xDvamvfwTcSZXQ1lGqBwLt4ibEd85vd5FakW/PdU=;
 b=n/NoUnYhvNpfBv5CLMlkOY79kboGIPu2zYuLe8wp3I0iZkNb58HX9KTzraLjOzXQCw
 lU5DthaFualyK6226LZkHc7Tumz7hfwrVegfFdZBlgnAxmiLbi4nuEDfzV+lr5JzILh7
 r4HgEmAp9zjnOX4LbccX3hWZNk/ROGiz7Gf94s9ENoo6wwF35++6UfdRkV4fRvDP7iUC
 d1lEhBMickF42XOB5bNMIa9uSmD8HrNY8G5ykKToj2GTV1Q/mfTmUhQcIKeFEqEti3Fn
 MzpihysZ8yQEPUatZtoGp/76buiMr+UUTgBsUUsgQctuCRgke/kCYcRUd/Xcdhho39TB
 4LvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n/NoUnYh
Subject: Re: [Buildroot] Xtensa qemu nommu defconfig not working
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Romain Naour <romain.naour@smile.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Nov 28, 2022 at 5:12 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Should we report a bug to upstream elf2flt (which are generally never
> looked at), or is someone volunteering to provide a fix for this?

I'll check what other architectures are affected and will make a fix.

Also starting with linux-6.1 nommu xtensa will support static PIE ELF,
which is in every way better than bFLT. Will it be acceptable to add
static PIE ELF as an executable file format for nommu configurations
in the buildroot?

-- 
Thanks.
-- Max
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
