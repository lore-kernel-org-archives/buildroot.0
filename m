Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E221E77363
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 15:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C647841590;
	Sat, 30 Sep 2023 15:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C647841590
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hS7Q70hnrzKZ; Sat, 30 Sep 2023 15:23:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7AFE4158C;
	Sat, 30 Sep 2023 15:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7AFE4158C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AEA801BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87B1D60B10
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87B1D60B10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UeHxfnOWEmq5 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 15:22:57 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCCC760B0E
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCCC760B0E
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40652e5718cso27775595e9.3
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 08:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696087374; x=1696692174;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MbwNWfhDPxhGNV3cFm3rqyyslQjo0vQIofSEmfMfEKU=;
 b=OjIpV3xBIRVYoVz0VlAfXPd/BfV6mPxHK1ujZ8TPUEzCEU0ylWdanVla537qN1HzbY
 wgqCKKlJ8zC9cKBdwc6IwboHAGcLPibrIA3xUerVvqIXpJBpsF9oU4wv2/5kNx8qnSDS
 A2ZIWXmU6XZSzVNkipget9cE2/nhHUX2q/oFm5qOCYddUB/x9lFeUoVRmk1Yn50y1TYz
 leZxv5zLZNvyi9ruCf/Jg7L9P1DZKlalnQn6n3kDi4/w/iZcJN9g+P5ddCJmwaXJjN59
 D5wGCEzVOQeSNPXkZKrAdgR4SjmEke7g7ZO236xxlMx6vD2JF6615rDjwknO/r6ZfYfL
 GLwg==
X-Gm-Message-State: AOJu0YxEj5kHCNLRvwGvLPmwJ+EfEpdE32M3hDVfd+lNOkI9rVuBcVvE
 9XyFoFdFLfO6sWk+wPxSiVxX/Q==
X-Google-Smtp-Source: AGHT+IENzTDndovHCC6jhR4N8fIHoj7PVwSNsSVTGJLIjmwtl0zOkzkOUBsQM7dXJ3u89jYuom2E7A==
X-Received: by 2002:a7b:cbc8:0:b0:3ff:ca80:eda3 with SMTP id
 n8-20020a7bcbc8000000b003ffca80eda3mr6139990wmi.10.1696087374533; 
 Sat, 30 Sep 2023 08:22:54 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264?
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 w1-20020adfee41000000b0031f82743e25sm5896243wro.67.2023.09.30.08.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Sep 2023 08:22:54 -0700 (PDT)
Message-ID: <9139a581-5192-849c-f2e3-7c2addebca9f@mind.be>
Date: Sat, 30 Sep 2023 17:22:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220809094109.2279598-1-james.hilliard1@gmail.com>
 <20220809094109.2279598-2-james.hilliard1@gmail.com>
In-Reply-To: <20220809094109.2279598-2-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696087374; x=1696692174; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MbwNWfhDPxhGNV3cFm3rqyyslQjo0vQIofSEmfMfEKU=;
 b=KxBc8WV0kMf0FIdeAWR61YQlU7kb/R6h7ug2PfbFNy/yubDgYPpIKbB82m6ZV+X/Pq
 Mx4UgAkX0t6666MxaZ4z/y7hAcu7PUSG2RwGu24SLt5Rp2X7A514FmMSl2x/3CS6c3Nt
 iqod8UNhyRIHiN93U6UVhmrrXTrGO/bAtC0VyOU6bQcUq82AmUbjCEM8TvJQs1opgB4i
 BW+/v6glYWK3y6da5/SFRkGETskCvh5beBjOM1HpVA3kGsxXs3f8zYzsJarrZWOjcZh7
 By0yk47R953VAnZ4czVcWP7ubIADc/jOJIreaMd9nV+Dy0e+JfwZdMjA6Auk2Ek6Z5Vd
 sJtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KxBc8WV0
Subject: Re: [Buildroot] [PATCH 2/2] package/binutils: add BPF support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: "Jose E . Marchesi" <jose.marchesi@oracle.com>,
 David Faust <david.faust@oracle.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/08/2022 11:41, James Hilliard wrote:
> In order for our BPF target builds to work correctly we also need to
> build BPF targeted binutils.
> 
> To build BPF binutils at the same time as our normal binutils use an
> isolated build directory similar to the one created by
> HOST_GCC_CONFIGURE_SYMLINK and execute the build stages for both
> targets.

  Again, I think it's better to make this a binutils-bpf package that shares no 
logic with binutils, and has a fixed version.


  Regards,
  Arnout

> 
> Cc: Jose E. Marchesi <jose.marchesi@oracle.com>
> Cc: David Faust <david.faust@oracle.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
