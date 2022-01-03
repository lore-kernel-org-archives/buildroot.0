Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68032C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 08:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBB174026F;
	Mon,  3 Jan 2022 08:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nhp_yvNZHqmz; Mon,  3 Jan 2022 08:34:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBA9540256;
	Mon,  3 Jan 2022 08:34:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF98E1BF384
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 08:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE0BF817A5
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 08:34:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ideasonboard.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id og2I-EBBoTwd for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 08:34:02 +0000 (UTC)
X-Greylist: delayed 00:09:45 by SQLgrey-1.8.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 820A5813AD
 for <buildroot@busybox.net>; Mon,  3 Jan 2022 08:34:02 +0000 (UTC)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi
 [91.156.85.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DA5ACC;
 Mon,  3 Jan 2022 09:24:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1641198251;
 bh=DQqe1psHllclbsPQv2rglW7JkBqNQG89+uVmW0ccOhM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=tuG6Cs1icZ7ykS5zoUOPuBv+ASUxECnlGqKqiqFZOtnG5hy1nF/wyVvRPsSW4ZU9s
 uuyJnU14azshqCgujUIL5n2FcxBJGzGGpmLpB83YO8Y4f59h1PSC1xmSoJoi8tIteM
 zmuh3lo5dAD0fGcyad8JQwR78Zhpadp+Bgrpg/c4=
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, guillaume.bressaix@gmail.com
References: <20211206193109.21218-1-guillaume.bressaix@gmail.com>
 <20211206215730.GE2603@scaer>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <cae0c1b2-34bb-b1a9-f02a-9e98ddd9fbe5@ideasonboard.com>
Date: Mon, 3 Jan 2022 10:24:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211206215730.GE2603@scaer>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v2 1/2] package/python-pybind: fix upgrade
 to version 2.6.1
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
Cc: buildroot@busybox.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On 06/12/2021 23:57, Yann E. MORIN wrote:

> So I think we really, really need a package (like scipy) that actually
> makes use of pybind, so we can see how it works, and to fix it...

Jfyi, there are two relatively simple packages in buildroot that can use 
pybind: kmsxx and rwmem. Both use meson for building.

I can test the next version of this series with those packages.

  Tomi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
