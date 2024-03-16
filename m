Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71998C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 19:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3CE5405BA;
	Sat, 16 Mar 2024 19:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wq1rKLPSiq_K; Sat, 16 Mar 2024 19:21:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EFF140683
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EFF140683;
	Sat, 16 Mar 2024 19:21:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 813A51BF294
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 19:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D65C40683
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 19:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LGabPNs3zn-D for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 19:21:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2F8C0405BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F8C0405BA
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F8C0405BA
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 19:21:40 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33ed5b6bf59so886758f8f.0
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 12:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710616898; x=1711221698;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XjLjDxjPItpZWKTlYRj5SoNCAaBxBHh2oBmaEd6bXF0=;
 b=YhoYry/OpcG3j3PhwtCQKUwfqyqzFEAmkMTgMh5TKYECrm5Nh6BtLKyezZdbBdvugV
 BsoPcDlJAXpnz5VQ2nZ7NeZSKFVlN5lJx2cjQOmZPiHWdnDLq2F8IccRVEH2pg+3RXjH
 a5FlSE5dEl7EF4hje0VQ4KpWJcYwMMTqojgTl/P1Pj+76icOrfuAmbPvF9/9flPzFhN6
 ZvX9UTKJXFL8Ri3cSmLYEwnN8r00VUNxRYBoKboICGUqsLkwRSJfVH3SRQkV4YaQ6wJY
 r4shh8Pxjb6c5znjKEZUJCox5JacgKDlvytAfc/j5KiGjEB+Y1bPe8oacniph93c44AE
 KYVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfclSOZRYRYodwc2qv2MFRa+CCJr2qLQBIEtwQOLsaIKkuv2M3nD5PEZLaItQEvShGa7NmauQtg6uL09O8LqF5sD7YRxn+kw==
X-Gm-Message-State: AOJu0YwasO4jaHxxp+I90H6+XfHJYDyr2A37syfFisWtvfyqB+0HAup5
 mgZPIM38pcQxrpPzWhGZPYlDD8fCzOJ3ZDp3OmzABwlOpmbeNBmiKOsQU7HJpfzKwuq7rbhyiJ0
 2
X-Google-Smtp-Source: AGHT+IFKlRrXgwK8Z+B7pEVc4fniNyodbRR+XG9vXjQqB9+AYAfZfIyaY+gbOqidPj+n9n2YLFlOvA==
X-Received: by 2002:adf:ab19:0:b0:33e:c410:a1cd with SMTP id
 q25-20020adfab19000000b0033ec410a1cdmr5756855wrc.69.1710616898382; 
 Sat, 16 Mar 2024 12:21:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 j16-20020adfe510000000b0033e42ab5114sm6049300wrm.2.2024.03.16.12.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Mar 2024 12:21:37 -0700 (PDT)
Message-ID: <9df182fa-a743-4df8-a160-9a6341837c19@mind.be>
Date: Sat, 16 Mar 2024 20:21:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: "Jeremy J. Peper" <jeremy@jeremypeper.com>, buildroot@buildroot.org
References: <20240312193528.664465-1-jeremy@jeremypeper.com>
 <5f96ce54-27f0-4657-9e20-3dd6606d7fe2@mind.be> <4976560.e9J7NaK4W3@earth>
In-Reply-To: <4976560.e9J7NaK4W3@earth>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710616898; x=1711221698; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XjLjDxjPItpZWKTlYRj5SoNCAaBxBHh2oBmaEd6bXF0=;
 b=EYjNRC2BoRx2mzpYTu8+BXiwwaI8u+Uaf7Jux/qO2KLibWV2IaOFYf3mI1SfnDFb41
 2tc9w1L23Nl/vhZ/jJEmHT9t9D7rZJ6OaqwPJJTnRVFDKCE8nKdN0b/JV+T/eIkfhT0g
 bs1Foa4jOhb1Yee4Y5yKJodnyQHyC7F/6MZOa6cLriWFkj36LhgLGZ9vwatIh/RPsbdg
 zu7KHD9e8a/BBs0hapVLHeJVfCGz3uRGNvQdYkE4O7q6XjigJ95GfTTqNCHTtgkCynn9
 sE5a02LVsA/70SsWI6b6xvzEmJ7OpIK/ofMKDw2C9lYD0KHQ0LxmCCcfHh3z6qcu/G/7
 38qA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EYjNRC2B
Subject: Re: [Buildroot] [PATCH v2 1/3] package/targetcli-fb: bump version
 to 2.1.58
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/03/2024 23:21, Jeremy J. Peper wrote:
> On Friday, March 15, 2024 3:31:09 PM CDT Arnout Vandecappelle wrote:
>>    Hi Jeremy,
>>
>> On 12/03/2024 20:35, Jeremy J. Peper wrote:
>>> bump to latest version because previous version did not work with python
>>> 3.11 corrected version mismatch with my first submission
>>
>>    I unfortunately already pushed before I noticed: you shouldn't include
>> "personal comments" or references to the patch history in the commit message
>> itself - that belongs under the --- line. So it should have been:
>>
>> package/targetcli-fb: bump version to 2.1.58
>>
>> Bump to latest version because previous version did not work with python
>> 3.11
>>
>> Signed-off-by: ...
>> ---
>> v2: correct version mismatch
> 
> Sorry about that, I will endeavour to do that properly in the future.

  No worries. I made this comment so you could learn.


>>    And another thing: we've had Python 3.11 for more than a year, so this has
>> been broken for quite some time. To make sure we notice in the future, it
>> would be good to have a runtime test that detects the situation.
>>
>>    Regards,
>>    Arnout
> 
> I believe you are correct, it appears to have been broken for at least the
> past few stable releases.
> 
> Adding the test sounds like a good idea and I'd be interested in setting that
> up at some point but I'm not sure when I'll get a chance to work through that
> learning curve.

  For a Python package, the test is usually quite simple: just import it, and if 
there's a C library linked with it, make sure you make a call into the C 
library. See e.g. support/testing/tests/package/test_python_click.py

  A slightly more complicated test can import a Python script to do the actual 
test. See e.g. support/testing/tests/package/test_python_gnupg.py which runs 
support/testing/tests/package/sample_python_gnupg.py

[snip]
> Are there any other changes that I need to make before this is suitable to be
> committed?

  I apparently didn't make my self clear enough: it is already committed (that's 
why I said "I already pushed"). In fact, the entire series is committed.


  Regards,
  Arnout

> 
> Thanks again for all your feedback and guidance.
> -Jeremy
> 
> 
> 
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
