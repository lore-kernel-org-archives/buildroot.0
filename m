Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665D0C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 17:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDD2E84043;
	Sat,  2 Apr 2022 17:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gpbBW9LZC_mM; Sat,  2 Apr 2022 17:11:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD0F48403B;
	Sat,  2 Apr 2022 17:11:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A867C1BF96B
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 17:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93B668403B
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 17:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5jLiAYUYqMc for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 17:11:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 528D784035
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 17:11:39 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id r13so11908063ejd.5
 for <buildroot@buildroot.org>; Sat, 02 Apr 2022 10:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bwEU5pnRfaWhxH/KVliev10UKpSoJsVBZ4KBPK0Ax8U=;
 b=Ws7vxVGX0V6Acbfe5mlNfq/uenXtX9DMfqCa5FNdzdg6Tc9nJ7y+QAp00WgxmczVCS
 X5FWOTIqhOoOwp24CVcKK2DooHMFu1rG75xOSVgA84OUw+4wL3ug6auhwgzPwQ9edTjZ
 EG+3HQKd43w/arxdTq0r1LHMGmVGzq4cmlbu1LRe8z12iL59MScA++tiAijqc5exX8v8
 eMj12Dsi26eP2INAk1KbBXtIip6boFP/v5oi1B9D/wlTc4uaxeYZdSqO6xgizXv3ahxI
 dbq04OkA33mMYd3pM8781gtacKeba39WBQoDy4efl3zhVDGo8TU/emNUCRVKzGuFfYe9
 DOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bwEU5pnRfaWhxH/KVliev10UKpSoJsVBZ4KBPK0Ax8U=;
 b=Wr3bPrMBhJqy6jou6NvKZ+ykZWirZWvq9lqOROabHesCntrAlhiTBJRiGBgB0ozSac
 U2C9hHspP8aK8N3Yz0tBOw662gxMoyhl7LeUrI9ALoQAO1eq98z3ljOA91wy7aLAwOaR
 FEVcst89VcniiTTDO44xZDN8fgzQf6M/3bkZyGdomR7WtuCv59Q5NWnkM9qSZDFsvvau
 zaMUCMHTgYyAP8o+0KC64GOuYVvtDQJnLQnfBHNM54da6q2oYwvQn3ugeVS3jfeumI3e
 V6WKfcUwE5jA2vThCT3b4M14lvm1PDXiFdsp7a/FKTwwYGaUGqAQcXsd4WIzcqZZbIHC
 cAQA==
X-Gm-Message-State: AOAM5300AdTZ8rRbvAAy6lCkDcSQL27XEPLGu7fz7tLXkq0ULdxaO5Vc
 ecKwsxzdLnmKdIEyCc72LrcyfQ==
X-Google-Smtp-Source: ABdhPJy2Se1e2RalJEJp6w+YJwESRhggqSFEbVIRysb9mLS3WhM6WVjK72Ae8rwBG9fMPXQp/oHBWQ==
X-Received: by 2002:a17:907:720d:b0:6df:c57f:e2bc with SMTP id
 dr13-20020a170907720d00b006dfc57fe2bcmr4321803ejc.345.1648919497276; 
 Sat, 02 Apr 2022 10:11:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425?
 (ptr-9fplejof7ird5pjql2d.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a056402105300b004162d0b4cbbsm2643072edu.93.2022.04.02.10.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Apr 2022 10:11:36 -0700 (PDT)
Message-ID: <4ac4b8c5-875c-5559-7042-d7a87b42aa60@mind.be>
Date: Sat, 2 Apr 2022 19:11:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20220322232224.2842266-1-james.hilliard1@gmail.com>
 <20220322232224.2842266-6-james.hilliard1@gmail.com>
 <c3610252-b676-f44f-a900-7ec8e9c6cb23@gmail.com>
 <CADvTj4pDYNkEmgxq=Zc4b+gRNeEoPMAhHu8zetRUNs5=dsrkCA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4pDYNkEmgxq=Zc4b+gRNeEoPMAhHu8zetRUNs5=dsrkCA@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v12 06/11] package/libclc: bump version to
 13.0.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Matt Weber <matthew.weber@rockwellcollins.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/03/2022 23:38, James Hilliard wrote:
> On Thu, Mar 31, 2022 at 2:50 PM Romain Naour <romain.naour@gmail.com> wrote:
>>
>> Hi James,
>>
[snip]
>> Ideally, llvm/clang should be updated to 13.0.1 first (or to the latest version
>> if possible).
> 
> There were some issues with lld in anything newer than 11.1.0, see:
> https://lore.kernel.org/buildroot/20220131015937.4113728-1-james.hilliard1@gmail.com/
> https://bugs.llvm.org/show_bug.cgi?id=49228

  To me that looks trivial to solve: we need to package libunwind (call it 
llvm-libunwind because we already have a libunwind package) and make lld depend 
on it. The CMakeLists.txt adds an include path that doesn't exist, but I think 
that will get silently ignored.

  Regards,
  Arnout

> 
> So I held off on going beyond 11.1.0 for now due to that.
[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
