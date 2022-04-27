Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9B9C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 07:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1BAB4053F;
	Wed, 27 Apr 2022 07:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YcU2WpmQYpBX; Wed, 27 Apr 2022 07:07:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AA1B40474;
	Wed, 27 Apr 2022 07:07:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 99EC41BF48C
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95E8960EB8
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zOocs6FTvB5Q for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 07:07:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B4C360E41
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 07:07:34 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id d6so841431ede.8
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 00:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wVUR30qU5f4UHffFK6ldlWRiEG34oQGzqT7Rui3rvRE=;
 b=Np8QPQuAki29u/aVjWOWiKKCIG5g+rATPLEfgRlXKZuh1C8O+/A0KNcKHPkLRb535r
 6vhjRjv5/0jpLV4qaz3CkT7mv5KkJZ1CB/xkcXHAUkIb2edJ+m6H1JbWpaXeOnTVyEMQ
 i/ebdEAaFv4nZ8HR++RJ7FEr9UyJgMv3B+ThRZ6JVIJDWBAaFrrlUtd9Ia3oOoIgpTZH
 FsO4xSKIadaplWyOQXnzXxFruuTLQJhgiz4GTH/lI0knW398WTwE6XeCGajyGcBya26s
 wSQNhwwiCMmEWKqvQqR9dxKGSvgCEcZE8gBluJf5xNXHdG2noEY1c+ZvptwH2076rDcX
 syGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wVUR30qU5f4UHffFK6ldlWRiEG34oQGzqT7Rui3rvRE=;
 b=kEXDOsteiSFx+oS/U4qc6YQn+8EYK/RsT5nc218dWMR7WkB+gwaej/7PW7jB5GwNQa
 hFPa1H4JzyqMFr178fSSIAZ+F6DeDbTn92dJWpFmwDG0mg5av19pn1bUaoRNt9ggkLEB
 sCO47S4oKRG/r1tCOfdN4A6RhdH5kiYzAqxLZuz8EDYMNkDknufeB+4onMo7GBAod+P0
 o/Ydwap4amLyJb8vrwEehqI5a7epeQZyzOXIZnbM3uO7vw8WkvlzHYxzNRofqnHCja/v
 64WVtGiUbNuwtQfe2wmYZDbtJzxtFovFQT/LBu80Cw54HhEEgdijNXdDPQSnl6Y5OYXt
 fbzw==
X-Gm-Message-State: AOAM5300Mzq08rm7TSr69i5U+WPApbFRDZlmeJZC/cKAu/a2eBxViqOE
 Fou65kMUUbCgD67w8DY/xUURBg==
X-Google-Smtp-Source: ABdhPJzMI9GFvmwkRJNh2oBdnFv/SAQYwKm28HTgqNxjqJIfMTSPf6ZN0ww6bK4uCR0tLlIMP92SMg==
X-Received: by 2002:a05:6402:1e88:b0:412:fc6b:f271 with SMTP id
 f8-20020a0564021e8800b00412fc6bf271mr29289284edf.345.1651043252995; 
 Wed, 27 Apr 2022 00:07:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a50cd03000000b00425d72fd0besm5787994edi.97.2022.04.27.00.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 00:07:32 -0700 (PDT)
Message-ID: <57660639-2f34-4068-793a-ce82fc881b47@mind.be>
Date: Wed, 27 Apr 2022 09:07:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220424213958.1747120-1-james.hilliard1@gmail.com>
 <20220424213958.1747120-4-james.hilliard1@gmail.com>
 <f2289739-57a7-268c-ebc1-1ba41d8c2d41@mind.be>
 <CADvTj4qJwS=qwt=ce0JX0UHEeZ04BJoSsuV=2kvqxAiA+2OvYw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4qJwS=qwt=ce0JX0UHEeZ04BJoSsuV=2kvqxAiA+2OvYw@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v7 4/5] package/python-tomli: bump to
 version 2.0.1
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/04/2022 03:35, James Hilliard wrote:
> On Mon, Apr 25, 2022 at 4:37 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 24/04/2022 23:39, James Hilliard wrote:
>>> This package now requires flit and must use the flit-bootstrap setup
>>> type for the host build since it is a dependency of
>>> host-python-pypa-build.
>>>
>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>
>>
>>    Applied to master, thanks.
>>
>>    While testing this series, I noticed that the following gives an error (this
>> was already the case in the original series; I haven't checked how it was before
>> your series was applied - for tomli, it certainly wouldn't happen because it
>> would still be using setuptools, but maybe for other flit packages, I don't know).
>>
>> make python-tomli
>> make python-tomli-dirclean
>> make python-tomli
>> ...
>> FileExistsError: File already exists:
>> /home/arnout/src/buildroot/output/target/usr/lib/python3.10/site-packages/tomli/__init__.py
> 
> I think it happens only when building across version bumps, probably a bug
> with installer(https://github.com/pypa/installer) upstream.

  No, it's exactly the sequence of commands that I wrote above that triggers it.

  I haven't checked if this is the case for flit/pep517 packages in general, or 
just for flit-bootstrap.

  Regards,
  Arnout

> 
>>
>>    Would be nice to get that fixed...
> 
> Yeah, I'll see if I can track that issue down.
> 
>>
>>    Regards,
>>    Arnout
>>
>>> ---
>>> Changes v6 -> v7:
>>>     - only use flit-boostrap for host-python-tomli
>>> ---
>>>    package/python-tomli/python-tomli.hash | 4 ++--
>>>    package/python-tomli/python-tomli.mk   | 7 ++++---
>>>    2 files changed, 6 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/package/python-tomli/python-tomli.hash b/package/python-tomli/python-tomli.hash
>>> index 1a274c8a40..8368f9ee13 100644
>>> --- a/package/python-tomli/python-tomli.hash
>>> +++ b/package/python-tomli/python-tomli.hash
>>> @@ -1,5 +1,5 @@
>>>    # md5, sha256 from https://pypi.org/pypi/tomli/json
>>> -md5  2ecbc7a23b8c8dc2fe96f588f88463d9  tomli-1.2.0.tar.gz
>>> -sha256  d60e681734099207a6add7a10326bc2ddd1fdc36c1b0f547d00ef73ac63739c2  tomli-1.2.0.tar.gz
>>> +md5  d4341621d423a7ca6822e23d6d52bb9a  tomli-2.0.1.tar.gz
>>> +sha256  de526c12914f0c550d15924c62d72abc48d6fe7364aa87328337a31007fe8a4f  tomli-2.0.1.tar.gz
>>>    # Locally computed sha256 checksums
>>>    sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
>>> diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
>>> index b8c20ca736..b803d67466 100644
>>> --- a/package/python-tomli/python-tomli.mk
>>> +++ b/package/python-tomli/python-tomli.mk
>>> @@ -4,12 +4,13 @@
>>>    #
>>>    ################################################################################
>>>
>>> -PYTHON_TOMLI_VERSION = 1.2.0
>>> +PYTHON_TOMLI_VERSION = 2.0.1
>>>    PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
>>> -PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/ec/38/8eccdc662c61aed187d5f5b168c18b1d2de3827976c3691e4da8be7375aa
>>> -PYTHON_TOMLI_SETUP_TYPE = distutils
>>> +PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/c0/3f/d7af728f075fb08564c5949a9c95e44352e23dee646869fa104a3b2060a3
>>>    PYTHON_TOMLI_LICENSE = MIT
>>>    PYTHON_TOMLI_LICENSE_FILES = LICENSE
>>> +PYTHON_TOMLI_SETUP_TYPE = flit
>>> +HOST_PYTHON_TOMLI_SETUP_TYPE = flit-bootstrap
>>>
>>>    $(eval $(python-package))
>>>    $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
