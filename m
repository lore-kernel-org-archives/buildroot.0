Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C1FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Dec 2021 09:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33C4440600;
	Thu, 23 Dec 2021 09:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pogqoks_y4P6; Thu, 23 Dec 2021 09:08:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49F60405F7;
	Thu, 23 Dec 2021 09:08:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74D741BF4D6
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 09:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61FAF405F7
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 09:08:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mYEh-ezSYirR for <buildroot@lists.busybox.net>;
 Thu, 23 Dec 2021 09:08:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E60EE400B5
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 09:08:05 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id 207so7981341ljf.10
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 01:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3KnnMFO3EQ2kdtG8kRLTNqZ4G7JFI5oXiCmNhbzvY3c=;
 b=bcK6RbjwLG25brsBKqHVetL8jP2XXpp9yHPCr6jO/alrwwnyyuNwcystt+CFfLyhlx
 yMcNv9GUoaO5zfihypavc7Lnwj8v5Trlr1J2yllbOWsg5udjUiEdX7g1Ffahng1HW/pp
 03viQ2ZbzX5rZDQI86Mpgex7+jWPElE5R+rAsCab6pU939Ap5k+VuWEjt53GIgwfbeCB
 1dF864GUw/iJ7p9YZQGzbRRww7gTs87DQWIEhT97FWA3MpOlYljuVqLbuQwGdD+T7Qzu
 uKghamfwUrOZKwc+bXTy3SexKu2KMnMaMyRo9IjF7bqsZD+NfKRry0svqvQF86G9dxSz
 KewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3KnnMFO3EQ2kdtG8kRLTNqZ4G7JFI5oXiCmNhbzvY3c=;
 b=ff7kP9BOV/rG9GXoxsVHoc/Z4bpgz7ASuBsl6eQREyf76pwj1T5qelsyRDopyQI9DX
 s0IXCNbmEQ9ojJk/AgCBysnqW1EwXu76MSR12HFePU/i8XU8oj30s8NJLyhj4u0Izu0m
 YTzal8S+nbpVsyvjHYQQyu4b40d36w/uKv4GxE/Jwo7C+xqecZ4WJPfeYIggDR0Z6CTj
 OZv5VQ3W9Ao2gTcKfWdKkZAuZmcGjRbtFffOvEhSy7clvkFjpURb73MnVwtvUTHM88kt
 AvpeO/Ru8yrk5n6A1qsRN1QBQNfeW5CFhunZ4cu19GdM76Ge849rxIDbHxfue4PiRQ8D
 JafQ==
X-Gm-Message-State: AOAM530CVZpf3AGLibVr44jTUdriho2FK3bkllgMBifkbrtVx8aXlaRj
 zDLk3WT4Tg/dO9KI+GmKPO1DWwmQ1zu1fQ==
X-Google-Smtp-Source: ABdhPJyJnZiTkUiuyj0vekeUkIPdKI2QJu9p0KydgRb4DQYr9Gb92Woiq5Wua+jygMQl4yN7caJzEw==
X-Received: by 2002:a2e:83cd:: with SMTP id s13mr797211ljh.373.1640250483538; 
 Thu, 23 Dec 2021 01:08:03 -0800 (PST)
Received: from localhost.localdomain ([98.128.186.122])
 by smtp.gmail.com with ESMTPSA id br39sm446854lfb.243.2021.12.23.01.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 01:08:02 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Dec 2021 10:07:57 +0100
Message-Id: <20211223090800.1716321-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 0/3] package/makedevs: allow recursive on
 directory with symlinks
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

take three on fixing the problem with, as it turns out, *dangling*,
symlinks when running makedevs recursively on a directory.  Thanks to
Arnout for pointing this out!

As started in v2, this patch set includes a coding style cleanup, and
now also with a first .clang-format for Buildroot, as suggested by
Arnout.  I've not enforced it strictly on the code base, e.g. max line
lengths caused a way too big diff.

Best regards
 /Joachim

---

v3:
- Problem only applies to *dangling* symlinks, feedback from Arnout
  Patch updated to skip chmod() on symlinks that cannot be accessed
- Import .clang-format file from Linux 5.15.6, suggestion by Arnout
- Employ clang-format to improve coding style cleanup, see commit
  notes for exceptions made

v2: 
 - Use lchown() instead on symlinks, feedback from Yann
 - Initial coding style cleanup

v1:
 - Skip recursive chown() and chmod() on all symlinks

Joachim Wiberg (3):
  package/makedevs: allow recursive on directory with dangling symlinks
  .clang-format: initial import from Linux 5.15.6
  package/makedevs: coding style and whitespace cleanup

 .clang-format               | 566 ++++++++++++++++++++++++++++++++++++
 package/makedevs/makedevs.c | 119 ++++----
 2 files changed, 631 insertions(+), 54 deletions(-)
 create mode 100644 .clang-format
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
