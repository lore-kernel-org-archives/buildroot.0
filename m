Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BAEC7618D
	for <buildroot@archiver.kernel.org>; Thu,  6 Apr 2023 11:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D21B41D7A;
	Thu,  6 Apr 2023 11:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D21B41D7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZYXtPNDbZ0Z; Thu,  6 Apr 2023 11:33:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CD5B41C46;
	Thu,  6 Apr 2023 11:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CD5B41C46
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F4531C2CF5
 for <buildroot@lists.busybox.net>; Thu,  6 Apr 2023 11:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6815F41C6E
 for <buildroot@lists.busybox.net>; Thu,  6 Apr 2023 11:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6815F41C6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rPjfHBeMrTIc for <buildroot@lists.busybox.net>;
 Thu,  6 Apr 2023 11:33:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E6FD41C69
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E6FD41C69
 for <buildroot@buildroot.org>; Thu,  6 Apr 2023 11:33:48 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id s19so23574168pgi.0
 for <buildroot@buildroot.org>; Thu, 06 Apr 2023 04:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680780827;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YsV/5ZBc0cyPGwPUB4uvSExpTrc+zuV3MHWmePCKEC4=;
 b=c4yBXk8/6+rkuI0xKILbA20mr574Vji75evPbC8gO91O0zExBqHa+i0RU5mh77D6Ez
 bCkKRkGJgOYdTpeD+ysRhc5QpdGScdPcla9mbew8V/SDbkHmj0wQoxLDXvTx8Fzie4hl
 8exzV7ShjtABaKAmnEK/Y0r0XSrdwz1xHBHvqMRQg5TZqXztsC2nyfsEjtXQj8a6WgRj
 AV3o+2iMq1Iz6EtH9ZOnaZok2gX8KWB3b3TTrs+hymPh3SdNpOvtLrcdMie1fmOP0yk2
 TJF9DrcHR5yK5ckYgQyY0U5SPjKXAzwvh4MsCt8oiX9s/h656n3ddp1XVBKeFc4AR9ne
 YWNw==
X-Gm-Message-State: AAQBX9f33gPjN7rUFmqEnI0Nm0nuzfrilQNLBThNjA6hvfD3dcONizHn
 hOzwrcH5Bl+hw32M5oFB8SuMiHXEhZI36Y/VHvvR9nJfJ+o=
X-Google-Smtp-Source: AKy350arLbqss9B2gX3YEu5GP4Iydm78Si7ArCMgZY8p/AOHHN5HGXCcjfQJLOxkkBssevK5nQlPhlFcm0d5N3ewb7I=
X-Received: by 2002:a63:fa05:0:b0:50b:eb56:b675 with SMTP id
 y5-20020a63fa05000000b0050beb56b675mr3019501pgh.7.1680780827319; Thu, 06 Apr
 2023 04:33:47 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 6 Apr 2023 13:33:36 +0200
Message-ID: <CANabuZdh8oCUxYeg2A4Mer9b=cwRQQv1FB3BorQSVzNatvBkFQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112; t=1680780827;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YsV/5ZBc0cyPGwPUB4uvSExpTrc+zuV3MHWmePCKEC4=;
 b=N0mvF7pAwE6IUevG1pvFE7oEOwCUTvdPfEmTpEYJzS2xUrQQC2uqUnGBoxkzY3wdOU
 S5jezo8YIBsJzCwfWhO3o4Pj+LuTBUIcBarOzKJ1CAF4GFTjj6nIdC19GFMYl4efqfgr
 uaFuKRtAAuiWi7LKftl5+1m5eKa8J1lBQ8N2Vbe3fLL5Z2/emot1VWDFM121j5GWVKO0
 ryu7Pe10ACh7PSvfPvVG0CEiAVATtudVRllSr/K9xbbLC39uJDzicaRpQhHWg49YMbdA
 0wdM/vjXtfK0/AF5Z8a9GxnmB7SXAbUb36yZ3ahWKob8V8CYw7RbGEl0y8fIx0f6it77
 jv1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=N0mvF7pA
Subject: [Buildroot] memtest86+ new version
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
From: Andreas Hilse via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Hilse <andreas.hilse@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

there is a new version of memtest86+ available, but the distribution
of releases has changed in a way that the prebuilt binaries are not
anymore contained in the source tarball.
Now there is a source and a binary archive available from the website
as well as a github repo.

Current .mk takes the prebuilt binary from the source tarball.

Since there still seem to be problems building from source (refer to
comment in .mk, tried with bootlin x86 toolchain), how could I go and
approach updating the package using the prebuilt binary and still
fulfill license obligations (deliver the source code), so that both
the source and binary archive are available with make legal-info?

Sidenote: There are now 4 prebuilt binaries for BIOS/EFI and
32/64-bit. So some more selection logic might be in order.

We need this new version since it's the first to be working with one
of our platforms, due to a BIOS oddity.

Thanks
Andreas Hilse
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
