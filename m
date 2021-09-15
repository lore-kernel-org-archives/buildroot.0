Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CC2C433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 08:49:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E51B061216
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 08:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E51B061216
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grenoble.cnrs.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 960C0403BA;
	Wed, 15 Sep 2021 08:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zvabFLFQflqJ; Wed, 15 Sep 2021 08:49:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F35A1403DF;
	Wed, 15 Sep 2021 08:49:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D37DD1BF343
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 08:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2EFC80BA9
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 08:49:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dDCMJfNlULrK for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 08:49:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A1D780B84
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 08:49:46 +0000 (UTC)
Received: from [147.173.65.159] (pulsar.grenoble.cnrs.fr [147.173.65.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 09F05C32DD
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 10:49:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1631695785;
 bh=tT4SNxN5xB4NxO6I1XUDmbll8eBASy6H3/thBbRuLw0=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=UtJJTUU5/n+QlX/JSE4T/LPiUcdYk2E6BjqmnkZg21ayLNKaO/ARurOqYqvG3oAdQ
 QqiHRU1TxZkwZpKFQaIWeQXtO0I2wboSpV7VrIoMP8PJHrHAqQaXCJEebNWNs06Gad
 IqOf/Sl12JcLiTgw4EXOmq++kfoJYrdagvdlqAJEW0CFz4hl6IUqMRYTuBHkDR7BZq
 BiI9/xP5I5d+4a+mo2R5Wec5n6WNxvbP0RquT0RXo6JqDxGVioZy+ctn9XH9yd/ZeN
 USJkV63lTLBricYUFbDyUuhrDghdizEwFcFJcIhACJ9Qbe2kaTUjJnsrayosN5M/xH
 DSGDyMPXTopNA==
To: buildroot@buildroot.org
References: <20210914174321.13977-1-petr.vorel@gmail.com>
 <672cac3266544283a755e58c6b021314@AcuMS.aculab.com>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <bce3caa1-8a90-bd1c-c2e4-9efccf0defbe@grenoble.cnrs.fr>
Date: Wed, 15 Sep 2021 10:49:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <672cac3266544283a755e58c6b021314@AcuMS.aculab.com>
Content-Language: en-US
Subject: Re: [Buildroot] [RFC PATCH 1/1] support: utils: Use python3
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi!

David asked:
> Doesn't python3 just get installed as python?

On Ubuntu and Debian Bullseye, the Python 3 interpreter is installed as
python3, and Python 2, if requested, is installed as python2. All
packaged Python scripts explicitly request either python3 or, for some
legacy packages, python2.

There are two optional packages named python-is-python2 and
python-is-python3 that install a symlink named "python" pointing to
either python2 or python3. These are intended for compatibility with
non-Ubuntu or non-Debian scripts that call the unversioned "python".
They are, obviously, incompatible with one another.

On Ubuntu and Debian, at least, it is then preferred to explicitly
request either python2 or python3 as the interpreter.

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
