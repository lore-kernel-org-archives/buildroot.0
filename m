Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D48C433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 19:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 257986106B;
	Tue, 10 May 2022 19:24:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AtTACIcw27b2; Tue, 10 May 2022 19:24:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4248360D62;
	Tue, 10 May 2022 19:24:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D75731BF32E
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D397C82F32
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:24:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id haT9OBOA9ezK for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 19:24:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA6AA82F19
 for <buildroot@buildroot.org>; Tue, 10 May 2022 19:24:33 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id g6so34933522ejw.1
 for <buildroot@buildroot.org>; Tue, 10 May 2022 12:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=H96vB1A3T4/SpwuTJCZvyeGfwCfnvVetlQhXzlO9o2Q=;
 b=J0Om0xWZeZFdcMA+Juw8PM03cugvq8w6Tq2BUs+0yUtJb6RBIX17w+uRwLMQ83+Q+s
 gL5el9mT/HVzjDMfbZoJ+s8f0zJ8pGFDQ8Wa+OZnbz06rzvoSP8B6VDfW81qMk2EaZA3
 fQfVNYUbe2DZeTVDmrO6pzRQEqaVEhmwzDybWts7aSQeBRRaFAo+zoB3VIt2mJa4LwB3
 U1hVAtXHYrxNXbxhTFaAW2/nGWTXt9S+t6Q5qleV89ojhq/eWJasQulWBqhYm859/WHH
 9Dr6N46obJNipjgLaYe6ZjrLC++9pTywT6DCqE5y5DGSqGFMs6EIns6G5/OLIRcaqkDm
 4A6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=H96vB1A3T4/SpwuTJCZvyeGfwCfnvVetlQhXzlO9o2Q=;
 b=bsUFJsrCUSBppAm0CgdLZAI3ILJzT2fh1hU85bJtLXI+wLMR3p/CTZJyw64BmDrPJR
 7KuZ7UrbIZV6uwyxLGCePZbS8n8mLaO/3lTypo0/oClqNbbRYd1dWSCYNLoL4cNymgGa
 aq6LPsOdU4LelMjvan66JU2uKwEUyFXFMaSufikcCYYGBebep5rZUOkbotFtWpbOUlYN
 a7KXsaj1sFejW0pOebCDyNySLClWbgWpmaPmHKUiai6Jia2TWnV35GV3ynLTZCV5JlTG
 elKIVFWeJn+oKfw+FV3DC++kq8YJUiYEB987KAjaYhZeCPTgzkHBlo+7QIIl9IFSesjO
 z6IA==
X-Gm-Message-State: AOAM5321OT9gheBUXmLsXyWeqIKipRId8XCpRLae00sPVY8LVQ2uoFBL
 66Z1nSB2ld9ScBS0VgWIIwKTcEBgDlr1kg==
X-Google-Smtp-Source: ABdhPJyir25NyjB0LLwnxi5DiGx/l9187DzYfiegfEnzs2sTdWkMvV0QohAzcUebletxrH/fRe03Gg==
X-Received: by 2002:a17:906:9b87:b0:6fa:8b03:5837 with SMTP id
 dd7-20020a1709069b8700b006fa8b035837mr8846631ejc.362.1652210672171; 
 Tue, 10 May 2022 12:24:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa7c7c9000000b00427afbbf5e8sm42270eds.11.2022.05.10.12.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 12:24:31 -0700 (PDT)
Message-ID: <4634ccff-2b76-5b91-0730-391c53b883b8@mind.be>
Date: Tue, 10 May 2022 21:24:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: yann.morin@orange.com
References: <24588_1651771186_62740732_24588_360_1_2d4cd3ac6995d7b5119ef4dfdc22b975992b8a73.1651770627.git.yann.morin@orange.com>
 <c8c34832-4993-4779-e125-4beea032836b@mind.be>
 <31076_1651814495_6274B05F_31076_440_1_20220506052132.GB2870@tl-lnx-nyma7486>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <31076_1651814495_6274B05F_31076_440_1_20220506052132.GB2870@tl-lnx-nyma7486>
Subject: Re: [Buildroot] [PATCH] package/pkg-download: do not try to vendor
 _EXTRA_DOWNLOADS
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/05/2022 07:21, yann.morin@orange.com wrote:
> Arnout, All,
> 
> On 2022-05-05 22:37 +0200, Arnout Vandecappelle spake thusly:
>> On 05/05/2022 19:19, yann.morin@orange.com wrote:
>>> From: "Yann E. MORIN" <yann.morin@orange.com>
>>>
>>> For golang- or cargo-based packages, we apply a vendoring pass after the
>>> package's "main" download is done. Whether to vendor or not is based on
>>> the heuristic that a specific directory exists or not; for golang
>>> packages, we look for '/vendor', while for cargo, we look for '/VENDOR'.
>>>
>>> This is fine for the "main" (by lack of a better term) download, but
>>> this falls flat on its face for extra downloads. Indeed, so packages may
>>> need to download data sets, or assets, as _EXTRA_DOWNLOADS. Those are
>>> usually just data blobs, and are not actual golang or cargo packages; as
>>> such they do not need to be vendored, but worse, if we try to actually
>>> vendor them, this fails because the required files for vendoring are
>>> missing from the archives in such data sets.
>>>
>>> We fix that by decoupling the download for the extra download, from the
>>> download for the main archive. We pass the post-processing option only
>>> to the main download.
>>>
>>> This makes the hard assumption that extra downloads will never need to
>>> be post-processed for vendoring, of course; we hope this will always be
>>> correct in practice.
>>>
>>> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
>>> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>>
>>   Applied to master, thanks, with a few changes:
>>
>>       - no loop needed for MAIN_DOWNLOAD, it can have only one;
> 
> In fact, that was on purpose: it can have no main download...
> Indeed, a package can very well only declare extra downloads...
> I forgot to explain that in the commit log, sorry.

  OK. However, somehow this seems to work:

package/foo/foo.mk:
FOO_SOURCE =
FOO_VERSION = 1

FOO_INSTALL_TARGET_CMDS = echo '***foo!***'

$(eval $(generic-package))

bash 84467$ make foo
WARNING: no hash file for
 >>> foo 1 Extracting
 >>> foo 1 Patching
 >>> foo 1 Configuring
 >>> foo 1 Building
 >>> foo 1 Installing to target
echo '***foo!***'
***foo!***


  So I don't think it is needed after all? The dl-wrapper script apparently 
doesn't do anything if the filename is empty.

  Regards,
  Arnout

> 
> So, either we do the loop, which is a simple way to expand to nothing
> when there is no item but the reason is not obvious, or we add an
> explicit $(if ...) test, which is going to be a bit more verbose...
> 
> What's your preference?
> 
>>       - remove superfluous backslash in the definition of MAIN_DOWNLOAD;
> 
> Ah, yes I forgot to drop it... Good catch.
> 
>>       - introduce _ADDITIONAL_DOWNLOADS to avoid filter-out.
> 
> I did that initially, but I thought that yet another variable could be
> easily avoided with the filtering our. But OK, that's fine with me too.
> 
> Thanks!
> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
