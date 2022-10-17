Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2D1C433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 06:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91CF7409F8;
	Mon, 17 Oct 2022 06:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91CF7409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTAl_LaXx1yO; Mon, 17 Oct 2022 06:39:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF534409ED;
	Mon, 17 Oct 2022 06:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF534409ED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9EF2B1BF404
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 06:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A355409ED
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 06:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A355409ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gBrWLznZFrx2 for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 06:39:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF7E6404B7
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF7E6404B7
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 06:39:43 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id z20so9893208plb.10
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 23:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KUM/MTJ/MExn2LCvHuNiqMW6nWI6VgJxhmiiSpgLy2s=;
 b=E4XcaQkawQepK3tGquRr+4zaxVBA1ufLOJEvCJLd9t69GHmsBO9sJ6CFzBnlVQ6EZm
 ABUhQhC9VdqrziQZn3T+YkYNVXfDvirYSWZSzSbNDUElKqSomjF99+nbtdmTHc0cXNmO
 oT9JgFTeoFNGNjrCP15+qrFYPRZuKURBvWWT9cyIksAdkiMSSWw0QggVUJRfE7ysGl+U
 n72GcC1xUmYprde6mdb9oqdCPja2M9j655sbz+VL3VWv0DOExDT7wmUsRm7cYMDRP9gS
 fc5CV9iKEsw35zxJ71Wr2KsU6YLj7MwVrvURNVwXriYv0YGlhaE4AncPhC69yorKXZjr
 6DFA==
X-Gm-Message-State: ACrzQf2JQULp9bO2uUGa3qkN61+7nXeuSsln1Ks7Yb/zVjo2/e3PX4ax
 W3kW8/9lmgUUo4vUznrTjUQ6XXpllGgQHqq+cQC5RdppnSM=
X-Google-Smtp-Source: AMsMyM7J5fboQ/QY/cn4HChj8EXBSkpQtzdUNSHh9MZQ3do0NjVpUI2xa4H+O75YwzxLHTxKuKTmjiJlftQigalMBKU=
X-Received: by 2002:a17:90b:811:b0:20b:16ca:2abc with SMTP id
 bk17-20020a17090b081100b0020b16ca2abcmr12240835pjb.163.1665988782848; Sun, 16
 Oct 2022 23:39:42 -0700 (PDT)
MIME-Version: 1.0
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Mon, 17 Oct 2022 08:39:31 +0200
Message-ID: <CAMdwsN-J+VAWyUQsnJH37EqpWNe6wpzhtmL+qx-PmjR0s7OX6w@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KUM/MTJ/MExn2LCvHuNiqMW6nWI6VgJxhmiiSpgLy2s=;
 b=Wjw6A7zoj8QWC4UfrO0nNBiUN2MvbtEwMJZwxg4U7pjf83WvpS47RnVvGeSIVKmHWF
 uc46DJ/nxdWZiAhxByKbjDeeOEmLtZUQEXRAvUt/D6SOwFVUlnWMnLoYbGaFWj4ydgdx
 1F91x5Lh5hhwNXnduJn0vlj9ahDWm+PVIQORFYZ5pZQ2U/G+kQA9nBElkaodbCHK4U8h
 DNwLNSGNkyUUOxjuQElb6OPi82PcFJvnBJs4dtKbP6r4bdL9WWdXuiBqLv5VmU5YIIDC
 eK3qs15Ga1ZJYA0GPtTy8aTC/ki/RMaXQT0sRlyRGtZWC8m1fWPpj/jg8cZNDUFgRnbO
 ixYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Wjw6A7zo
Subject: [Buildroot] CMake compilation database with BR wrapper
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

Has anyone had any experience with getting the cmake
EXPORT_COMPILE_COMMANDS functionality working in a clean way with
projects built through the BR compiler wrapper?
I've got it working to satisfy my clang-tidy by either passing
additional args in cmake that are normally behind the compiler
wrapper, or running make through bear and using a config file that
passes the same extra args, but I was wondering if there's a "clean"
solution that would allow me to feed this into the compilation
database that does not depend on a config file or some fixed value in
my cmakelists?
Thanks!

Best regards,
Jesse
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
