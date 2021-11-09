Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457C2C433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:26:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86BC8611BF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86BC8611BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grenoble.cnrs.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 510B380EAB;
	Tue,  9 Nov 2021 08:26:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1RCtHlwN72oD; Tue,  9 Nov 2021 08:26:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DC3280EA7;
	Tue,  9 Nov 2021 08:26:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D8D581BF3B9
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7EC860621
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:26:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GVQCMBRMrBB9 for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 08:26:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F435605F9
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 08:26:49 +0000 (UTC)
Received: from [147.173.65.159] (pulsar.grenoble.cnrs.fr [147.173.65.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 32610C02B5
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 09:26:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1636446406;
 bh=wiEkxfwTo+G7whBXK4/nte6LY8zkwfPOoapw0coW3UM=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=DsD3fFO8sxabIQ11Q9JCuZT50wBpsHr2e5FQJpHdFdhTennoGOObzHD43V9qTLaw+
 pKCUqL9ziEC6FvzhAo/I3wG0bpICx/jybIelq0EJ/3poWkrAn0lycw7U90DVtL/jRY
 m9XlI28THb9TpKwNHU44onJci12q0z06M1R5NfgAweTP1PgsPENESqsvLLA14P72zO
 mBE9boGxg2WHOjR1RSad/FB1R16hNzO/i0JBPH0OAkPn1H7NUv/4MigdTBM0U0U9o9
 HS4wXquXzd1eOVBlUFnpkap8igCeedGslVxLtJHLPmKgv4MuSoCG1rEXqu+EwTgTec
 iMDD1/5F9BVpQ==
To: buildroot@buildroot.org
References: <20211108230520.4007148-1-giulio.benetti@benettiengineering.com>
 <20211108230520.4007148-8-giulio.benetti@benettiengineering.com>
 <eea83befc9a6f40dad4efa7a4ae019de@walle.cc>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <03f9ad1a-21d0-a5ef-d563-86e1446d8545@grenoble.cnrs.fr>
Date: Tue, 9 Nov 2021 09:26:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <eea83befc9a6f40dad4efa7a4ae019de@walle.cc>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 7/7] board/kontron/smarc-sal28/genimage.cfg:
 fix option suffix
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

Hello!

Michael Walle wrote:
> There is no "K" prefix in si units. Stictly speaking there is no "KB";
> there is a "kB" or a "KiB".

Although not a de jure standard, quite a few Linux tools have adopted
the following convention:

    1 KB = 1000 B (i.e. 1 kB)
    1 K  = 1024 B (i.e. 1 KiB)

Here is an excerpt from man losetup:

    The  size  and  offset  arguments may be followed by the
    multiplicative suffixes KiB (=1024), MiB (=1024*1024), and so on
    for  GiB,  TiB,  PiB, EiB,  ZiB and YiB (the "iB" is optional,
    e.g., "K" has the same meaning as "KiB") or the suffixes KB
    (=1000), MB (=1000*1000), and  so  on  for GB, TB, PB, EB, ZB
    and YB.

Given that this is a common Linux convention, "offset = 4K" makes it
clearer that these are KiB ("offset = 4KiB" would be still clearer if
supported).

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
