Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B902C54E68
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 21:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB4F840438;
	Tue, 19 Mar 2024 21:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i-Sm8oqZ-zRE; Tue, 19 Mar 2024 21:50:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D89CA405CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D89CA405CB;
	Tue, 19 Mar 2024 21:50:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 048901BF360
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 21:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0B29407C6
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 21:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mON7y5Un0A5e for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 21:50:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B8216407BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8216407BE
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8216407BE
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 21:50:43 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-5a470320194so2962279eaf.3
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 14:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710885043; x=1711489843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DR8aQBqYQweEysgMHnJ+r63213IKohWB6gAT0EL/+Xo=;
 b=WiuOH8ZQvSceDbDQZ7+8oSSS03choy9QDABMK+USUJiw2g9la7x4Xcjl7L8HUZ7hi9
 hQYPrsJ8a8al/N5GdhErwO2ua7d7pEyfiPIm4RZKuxR7VoCy+bkAqS+71/A6kb4GkEPg
 R19gGZVDkWOG8Rul+i909uEqEAXofHOTTw3qe2DfV/UhH7DEbbY8Ln8yGsms+FUEBchd
 IQZ2tpUZD2sjLIKNyOTHfDZmUspiFhNDHjIeZ+E6z4QqYpxaSR5IfQqkFw9+1dbE6Xko
 ZKWauawq7eXfMqroJoZp3rfYYGgclJkCQQi6sORv4eQGczqsm/7PhBYxko0q3IgzrUqN
 T+Sw==
X-Gm-Message-State: AOJu0YyIn32O8K9x437P9Z6K24iKPEvD1JFNL9WDSkjqYgLKPzxx26jK
 3Y6JuZHAnxthDUhOlKgp+AZHM1QuWDVqsDD9UOJBShqXN4f4EBju0xt/czqMIDwhJctuRg/lKPO
 uYv0=
X-Google-Smtp-Source: AGHT+IEf7uGBIFqdgn9T3UU/MdmsZE8pFgXjljtsw0DS/C4H6WuzVI45F/+H6ZySXCXMPYk3imSVlA==
X-Received: by 2002:a05:6358:5406:b0:17b:759:65c2 with SMTP id
 u6-20020a056358540600b0017b075965c2mr4707271rwe.10.1710885043019; 
 Tue, 19 Mar 2024 14:50:43 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 c36-20020a634e24000000b005db034d1514sm9451864pgb.82.2024.03.19.14.50.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 14:50:42 -0700 (PDT)
To: stefan@agner.ch
Date: Tue, 19 Mar 2024 14:50:37 -0700
Message-ID: <20240319215037.8766-1-christian@aperture.us>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <893660729815cb737418892a77d27ba089a6cbde.1677568448.git.stefan@agner.ch>
References: <893660729815cb737418892a77d27ba089a6cbde.1677568448.git.stefan@agner.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1710885043; x=1711489843; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DR8aQBqYQweEysgMHnJ+r63213IKohWB6gAT0EL/+Xo=;
 b=mNnfE99H5SRUp++rdJfrflYcw/nGx2C5xSiTdNu6GsTe258uSK3SAISYMWQl0uMPPj
 8YaQuYL+T9ylCjOqjwC0sAn+U4rxGsXOzrE4ei7WIap5n5SPNk4hwPuXAAzREcx9Pn3S
 Lz6gdd1+ymgVewP1Ms2QO1uFgynUXIychyU/eOp9X5dhigJ1xFMeH6EWdypMj2nQlDQk
 46EThTv5Q42GKobhKU9ES4Hi4fi9zE195WE2fxafpUuNyKfQY6oXHLAKslz7RKMkvrdD
 AojFKj0rXMHE4UElO9fyUibTXiDb95z5VU5tfzE0v8JMHxyK/f8WHQAxL07Gz9CDxgap
 CFWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=mNnfE99H
Subject: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: bump to version
 2024-03-16 on branch v5.6.4.2
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: giulio.benetti@benettiengineering.com,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> This version adds support up to Linux version 6.8.
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>---
> package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
> package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
> [snip]
>
> -sha256  969fa96c90e16fcaf8f6b30d4576a8446c7041932bea34bbfea7e9c91038bfe5  rtl8812au-aircrack-ng-4a983e47dafc048019412350d36270864f6b5f2d.tar.gz
> +sha256  752d9ae67140966eddc463238fde1f6b86457db22a45f61c13886c3244eaffe1  rtl8812au-aircrack-ng-f23979f0d20aafb563ac71b56fcbc74268c798c2.tar.gz
>
> [snip]
>
> -RTL8812AU_AIRCRACK_NG_VERSION = 4a983e47dafc048019412350d36270864f6b5f2d
> +RTL8812AU_AIRCRACK_NG_VERSION = f23979f0d20aafb563ac71b56fcbc74268c798c2

Thanks, fixes build on 6.8.x.

Reviewed-by: Christian Stewart <christian@aperture.us>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
