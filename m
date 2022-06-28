Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CF9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 18:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B967741993;
	Tue, 28 Jun 2022 18:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B967741993
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xw3ghMdLQECF; Tue, 28 Jun 2022 18:10:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CC0F41978;
	Tue, 28 Jun 2022 18:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CC0F41978
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF2001BF57B
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 18:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3EBD4197F
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 18:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3EBD4197F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UrQgcJOMFzyZ for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 18:10:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9EE541928
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9EE541928
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 18:10:15 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 o19-20020a05600c4fd300b003a0489f414cso4535372wmq.4
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 11:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:to
 :references:content-language:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=NejKQDI0uyPbOPkcsyQ2Jb/3yUBq3V0Vlm3e2+fwhnQ=;
 b=idV8twnZtCFfpDdpC6R5vV6r3R2Bw1eMlzbuGTbfvyj83UA0DaDrSK+1+MX8b53WAD
 W8FnhjdEhvXURiqAFU2SLYy4QyPpaZfFYCKrJC3ULXMqHLXMJz9zT1zaxt9JZ9RWDs0I
 2E7+MoKDF1Ao+RqmRWC5tFD5NQYdX1eKhDfjbfYLc2DsnRoOTGclybVCQLwI87RDxaKn
 bWPP7V9DLFPpq3OU6ElEcv5UWqhXVLHlLwWNAUNzvkKtm8MyY+9fbyeEqBtQe9h08R9G
 sv/uxdbbCmHsBsLXYDYgFFTADDc2+7cYtP5qup8Ua9ABuJn5BgT3nGc4wCNcl1dFHYmJ
 4i+Q==
X-Gm-Message-State: AJIora+TscXdCz5IqYsYwPmyv1U6MLV+k09Q22GbxJsw6Z0jyhZufE33
 ZePxolc9S1QAEKjRYrAswlYo/ZbV3ktZ9Q==
X-Google-Smtp-Source: AGRyM1uNxXG2zHhIQpNsgegBdVwHJpM+IlhLjUqpEjY01PtnB4y5esya0l1S8f34GfTeaFjVAzFdMQ==
X-Received: by 2002:a05:600c:8a9:b0:3a0:3d78:21a4 with SMTP id
 l41-20020a05600c08a900b003a03d7821a4mr1000986wmp.112.1656439813944; 
 Tue, 28 Jun 2022 11:10:13 -0700 (PDT)
Received: from ?IPV6:2a02:8070:41a4:2c00:cb21:3fa8:230c:d355?
 ([2a02:8070:41a4:2c00:cb21:3fa8:230c:d355])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003a0375c4f73sm251698wmq.44.2022.06.28.11.10.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 11:10:13 -0700 (PDT)
Message-ID: <703d2f07-9c45-9bfa-2278-8bcec8f584ba@googlemail.com>
Date: Tue, 28 Jun 2022 20:10:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: buildroot@buildroot.org
References: <20220619210102.1021263-2-fontaine.fabrice@gmail.com>
Content-Language: de-DE
In-Reply-To: <20220619210102.1021263-2-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:to:references
 :content-language:from:subject:in-reply-to:content-transfer-encoding;
 bh=NejKQDI0uyPbOPkcsyQ2Jb/3yUBq3V0Vlm3e2+fwhnQ=;
 b=eWnxTP+D3xoewhBafcCwI9cMLoG1Wa3GwHr0XoFl7lo7gYpoN5Sh3AsElxBgZ3pe+r
 SehRh3Bum+R4k1E43a57Uzpi18dDPmM2kjl9yLRLR3cQ3gPAej9Gh49GjBuku7ZsLitb
 PYQ/mmpHV2c0B0Cb3P24VxsWBGUP5K2Ix83ZLXRndqvEXXzIPo0z1/UBSZia580QmA+2
 lzVfQrH2fCkQwkSDumo7aSaDpEUSLE5pRuHpoGXblhK75u7XD3f4xR1meZ47Mpmr0YbD
 mIvlKHexBDzHwlrbkxpdwhz++h8vB815J+sDD7qufFhQR+jSf6N/ry2euMiaiwx5hu0F
 0mWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eWnxTP+D
Subject: Re: [Buildroot] [PATCH 2/3] package/bind: disable cmocka
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
From: Raphael Pavlidis via buildroot <buildroot@buildroot.org>
Reply-To: Raphael Pavlidis <raphael.pavlidis@googlemail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Maybe we could make this dependency dynamically, if the 
BR2_PACKAGE_CMOCKA is enabled.

For Example:

ifeq ($(BR2_PACKAGE_CMOCKA),y)
BIND_CONF_OPTS += --with-cmocka
BIND_DEPENDENCIES += cmocka
else
BIND_CONF_OPTS += --without-cmocka
endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
