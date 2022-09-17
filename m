Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29980ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 12:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C832B6110D;
	Sat, 17 Sep 2022 12:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C832B6110D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULg9f1tM1n4Y; Sat, 17 Sep 2022 12:50:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F01B860A8D;
	Sat, 17 Sep 2022 12:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F01B860A8D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 534201BF48C
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E8FC60A82
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E8FC60A82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6UOR01b_sqOf for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 12:50:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57E5360A7B
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57E5360A7B
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 12:50:12 +0000 (UTC)
Received: from [IPV6:2a01:e0a:947:6e20:c1ab:97a9:199e:e35b] (unknown
 [IPv6:2a01:e0a:947:6e20:c1ab:97a9:199e:e35b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id DDD09BFF54;
 Sat, 17 Sep 2022 14:41:25 +0200 (CEST)
Message-ID: <a1d142b2-da92-bdf4-7b0d-43edb670071e@grenoble.cnrs.fr>
Date: Sat, 17 Sep 2022 14:41:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Richard Ash <richard@audacityteam.org>, Alex <earthquake.de@freenet.de>
References: <661e0716-bbca-eec2-8a4a-0d155edea5c6@freenet.de>
 <c1d1e5ac-efe5-eeff-af5d-dd9d6eae5696@green-communications.fr>
 <a5f78f21-7b6e-6e68-0104-d51879d82e35@freenet.de>
 <20220916220849.59cd518a@audacityteam.org>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <20220916220849.59cd518a@audacityteam.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1663418486;
 bh=MqMuGrxAr445WRQxdCa6pfwl341SA3gYFYMkMvRU9qQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GWxQ3e7SNVeZkusD+ECrZXmaxdzGIokzn9HcIUAxRdBLM05+owjxTgzpkVP0nEFto
 GphooLcAq1lVOLMSkbmpZzcw6IXO19HqJCxsA10ll/pHf8zTVONcULZxgPHd0d0bCM
 QKKMbDUQKXwoklyEdaM7GrsFmQm0VBHUjHEBJOF/Ajd1+oP6cCtXg4L62z3Z8R4VG4
 IvjG//0K5bPkZ2TmhmYXfuEsocBsnpCdaiFVE7Myz6a8w7RZAk/CRG9v6Bvab9tbbS
 3JcNlaNbUF74yzaJ70JJdalZNBhHTQLvp0CRsg0cJDucyctiDXs6XosjFlwUAilgtS
 Xc5ag//kHFKZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=GWxQ3e7S
Subject: Re: [Buildroot] libstdc++ DSO missing
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

Hello!

Richard Ash wrote:
> make doesn't seem to have a built in rule for linking C++

It does have this builtin rule:

    %: %.cpp
        $(LINK.cpp) $^ $(LOADLIBES) $(LDLIBS) -o $@

with these defaults:

    LINK.cpp = $(LINK.cc)
    LINK.cc = $(CXX) $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
    CXX = g++

However, the builtin rule for linking object files uses $(CC) (which
defaults to cc), irrespective of whether these object files come from C
or from C++.

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
