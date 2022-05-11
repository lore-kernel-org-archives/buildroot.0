Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFA6C433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 17:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 978F660FDD;
	Wed, 11 May 2022 17:17:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g_8X05WmUk7V; Wed, 11 May 2022 17:17:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FC5460BE8;
	Wed, 11 May 2022 17:17:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC3681BF402
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 17:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA88440272
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 17:17:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key)
 header.d=threespeedlogic-com.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t8vDB2TN4hDE for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 17:17:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BCA640002
 for <buildroot@buildroot.org>; Wed, 11 May 2022 17:17:26 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id q76so2329719pgq.10
 for <buildroot@buildroot.org>; Wed, 11 May 2022 10:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZykMKO897uAer8C9MnQLujmu/RbMf3gmdyxGY4+1lbM=;
 b=dy7xEPB0+9bLrKbmywl+oACdhrwgAVOjPp82nvFxYNZ8bx8iBjBnSv9mNpPyqTERov
 VNMF4JW15QCPZukC5ctB4xqOCM6/D7/wTsYkbfLF8q9b10BKTFcnF4RJud+XbFF3rwXd
 DExZ1PfaVmAhVEkitGuih9uRXJovIPcRtpxHrqR/AhpiveMQV8RGROvTdSKzgQ9jt7Ll
 tyCDRYEO+FUo8fk8cPWqFq+ofutYK/4gZ7P1n6IisjEkpKyXDPqpVm8A9dys4V5loUPG
 vBmynZQNtk3VAAAUy7L+kDgKkvj0R9ofydeboT30Ut+RsC/GtGwZaVerbeDPLq79jgtM
 iWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZykMKO897uAer8C9MnQLujmu/RbMf3gmdyxGY4+1lbM=;
 b=RHEkI2gZmP+PmE1QeoJdjNSLjBfwWiyi1fx36U64YykBzXXuToZk61pmamy52xg9gV
 HxV4GDmP64K8eKCCjHAmij4BfZ5KlivhT3kt5soA5+hnHiPy8/dYGJg/qxOQZP4bUcjr
 KYvAv8/qUm7Wu/Hc53/7ddJm1JoaO//XPI304rPQPKhxjycAF7tTC5AZeT18KfshIbmI
 PNqDDciFeTeqhpj4XH0cNpEqm6XrVXG8k4pkFi/nHNEABCCQMbVhXzAgEitaaHsKoO2q
 Kbh2y8hGGPeP5WBr3TgTxQWPg1X4Ek6BYI9ou5yAON6dJhbGd9bu+xr71Css2QoXBJ8p
 JcdA==
X-Gm-Message-State: AOAM530uGlLy3NMC36yBFKYMH28bxKx3NIWOjCZS0vDWB1F1EhY4QZ7h
 o57pbQvUQfHdBu+W7FunaUZIaA==
X-Google-Smtp-Source: ABdhPJy1dh7lJgGpgAOlEh0V71/JHymK/7sPTNcCZEAeMYEuOm5xNTW3sbWsKCxbk5kkjT/LbAgdWw==
X-Received: by 2002:a05:6a00:1acd:b0:50e:1872:c680 with SMTP id
 f13-20020a056a001acd00b0050e1872c680mr26461553pfv.16.1652289445819; 
 Wed, 11 May 2022 10:17:25 -0700 (PDT)
Received: from [192.168.0.164] ([104.246.196.44])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a1709027b9100b0015e8d4eb24esm2149985pll.152.2022.05.11.10.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 10:17:25 -0700 (PDT)
Message-ID: <28117893-5851-4b56-b4d3-5ec5ec36ac54@threespeedlogic.com>
Date: Wed, 11 May 2022 10:17:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>,
 Arnout Vandecappelle <arnout@mind.be>
References: <20220510003116.336797-1-james.hilliard1@gmail.com>
 <20220510003116.336797-2-james.hilliard1@gmail.com>
 <123fec62-0841-8dff-9da6-61f2cc9614d3@mind.be>
 <CADvTj4pdG9Uk6UaWHkgAVjex3Ef7L2yvH8rN4MMoFeKn_dPjrg@mail.gmail.com>
From: Graeme Smecher <gsmecher@threespeedlogic.com>
In-Reply-To: <CADvTj4pdG9Uk6UaWHkgAVjex3Ef7L2yvH8rN4MMoFeKn_dPjrg@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v2 2/2] package/python-orjson: bump to
 version 3.6.8
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James and Arnout,

On 2022-05-10 13:03, James Hilliard wrote:
> On Tue, May 10, 2022 at 1:01 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 10/05/2022 02:31, James Hilliard wrote:
>>> Convert package to use python infrastructure instead of cargo
>>> infrastructure.
>>
>>    AFAIU, maturin was already available in 3.6.7, so the conversion should be
>> separate from the bump.
> 
> I mostly did it at the same time to avoid any potential conflicts/confusion
> with mirrored assets.
> 
>>
>>    That said, I think Graeme intentionally did not use maturin because it doesn't
>> really offer much benefit over calling cargo directly. Do you have a reason to
>> prefer using maturin?
> 
> It should be more correct, I mean calling cargo directly doesn't really properly
> install say pure python files and is more likely to break in weird ways.

The python-maturin package wasn't available when I initially packaged 
orjson (3.6.7).

I suspect if this patch works, then shifting python-orjson to 
python-maturin will be less brittle (or, brittle in ways that are less 
isolated) than the current maturin bypass.

If the extra information would be helpful, I can give this 
python-maturin approach a try and see if it works in my application.

best,
Graeme

> 
>>
>>>
>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>> ---
>>>    package/python-orjson/python-orjson.hash |  5 +++--
>>>    package/python-orjson/python-orjson.mk   | 24 ++++++++++++------------
>>>    2 files changed, 15 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
>>> index 5ef2726d82..06cc5cae79 100644
>>> --- a/package/python-orjson/python-orjson.hash
>>> +++ b/package/python-orjson/python-orjson.hash
>>> @@ -1,4 +1,5 @@
>>> -# Locally calculated
>>> -sha256  4713b120ad86b1b273f5952cbf9578c13d0f453064bd26d823e04a10c84824e6  python-orjson-3.6.7.tar.gz
>>> +# Locally calculated after vendoring
>>> +sha256  40b95576b81916d167f7a44829401acb3b6cbbfe9840b5ed88c9535a86507d7b  orjson-3.6.8.tar.gz
>>> +# Locally computed sha256 checksums
>>>    sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
>>>    sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
>>> diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
>>> index 5de4b2c5fa..ccbaf37c6d 100644
>>> --- a/package/python-orjson/python-orjson.mk
>>> +++ b/package/python-orjson/python-orjson.mk
>>> @@ -4,19 +4,19 @@
>>>    #
>>>    ################################################################################
>>>
>>> -PYTHON_ORJSON_VERSION = 3.6.7
>>> -PYTHON_ORJSON_SITE = $(call github,ijl,orjson,$(PYTHON_ORJSON_VERSION))
>>> +PYTHON_ORJSON_VERSION = 3.6.8
>>> +PYTHON_ORJSON_SOURCE = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
>>> +PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/14/8e/7e745d867466bdafb12ab7b0179d40f23f55639f7cd14bd375acfa74aca2
>>
>>    Kind of an aside, since this applies to many other packages: is there a reason
>> we prefer to get Python packages from pypi rather than the upstream source itself?
> 
> These are sdist's(release tarball equivalents for python packages)
> while upstream
> source is not.
> 
>>
>>> +PYTHON_ORJSON_SETUP_TYPE = pep517
>>>    PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
>>>    PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
>>> -PYTHON_ORJSON_DEPENDENCIES = host-python-cffi
>>> -PYTHON_ORJSON_CARGO_ENV = \
>>> +PYTHON_ORJSON_DEPENDENCIES = host-python-cffi host-python-maturin
>>> +PYTHON_ORJSON_ENV = \
>>> +     $(PKG_CARGO_ENV) \
>>>        PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
>>> +# We need to vendor the Cargo crates at download time
>>> +PYTHON_ORJSON_DOWNLOAD_POST_PROCESS = cargo
>>> +PYTHON_ORJSON_DOWNLOAD_DEPENDENCIES = host-rustc
>>> +PYTHON_ORJSON_DL_ENV = $(PKG_CARGO_ENV)
>>
>>    Is this going to be needed for all maturin packages? If yes, it will make
>> sense to move this into a maturin setup type (but preferably only after we have
>> at least 3 packages that use it).
> 
> Yes, I'm planning on adding that along with a setuptools-rust setup type, I have
> some upstream work that should making things clearer as well like this:
> https://github.com/PyO3/maturin/pull/909
> 
> I'm going to rework this to handle maturin as well(both are pyo3 build tools):
> https://patchwork.ozlabs.org/project/buildroot/patch/20220501074401.1135229-1-james.hilliard1@gmail.com/
> 
>>
>>    Regards,
>>    Arnout
>>
>>>
>>> -# orjson uses "maturin" to generate distribution packages - rather than teach
>>> -# buildroot how to understand this, we reach in and install directly.
>>> -define PYTHON_ORJSON_INSTALL_TARGET_CMDS
>>> -     $(INSTALL) -m 0755 -D $(@D)/target/$(RUSTC_TARGET_NAME)/release/liborjson.so \
>>> -             $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/orjson.so
>>> -endef
>>> -
>>> -$(eval $(cargo-package))
>>> +$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
