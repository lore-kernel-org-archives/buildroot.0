Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B312CC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 08:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B35840015;
	Tue,  9 Jul 2024 08:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqk6sF1GMQ4w; Tue,  9 Jul 2024 08:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B19F640160
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B19F640160;
	Tue,  9 Jul 2024 08:38:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B0561BF2A9
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 08:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF8408193E
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 08:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2aUsTarSXwz for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 08:38:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 36BEE818CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36BEE818CD
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36BEE818CD
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 08:38:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.127.252]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbzyJ-1rpIIz0pNn-00aNdy; Tue, 09
 Jul 2024 10:38:14 +0200
Message-ID: <40102a9d-6674-4a11-bf18-a4ea41164095@gmx.de>
Date: Tue, 9 Jul 2024 10:38:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>,
 Arnout Vandecappelle <arnout@mind.be>
References: <20240705094449.8550-1-fiona.klute@gmx.de>
 <20240705094449.8550-2-fiona.klute@gmx.de> <20240708231151.2606b9ff@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240708231151.2606b9ff@windsurf>
X-Provags-ID: V03:K1:zXs2+hlTSAj0BjBQHqImCheUvT2v9S5vCHIW7RVcovbtc3Jx6Xe
 Bm/EJr3NrBHMqarBVSbbUGVr7wLrAh6OzCFlnJ2cxEr54c67SolbvJr9BNpspswXg47h6J/
 Q2Jq/8ValYSZsqQE85Fpw8HBdQqljoaTbjfdrs6XCE2h/2I+k+K3FFB898ABbj0TIbEz4hY
 LrwdfWviXtjJlA0T+5zFQ==
UI-OutboundReport: notjunk:1;M01:P0:gcE8h6w5fz4=;t2KMCSERgO0+VdV1tShiMNGa096
 +LoSqh6B2BTV7CZXwNZ5gz8ZJOSuTSmGPEQf7+5htCK7nYMhdSRiP3/HTqoHtrznZCDok+4vV
 M5HQm5R7JZKsWIKef6tuUHlMWVI4IGpw4adnJo4vdiEG8xqLoeFiyg7JGOoTuu1k7hRKgCW/C
 rYHTpmzbwFb+fEeOv2pkOK4jW3g4owi2paFGiTlZ0/xKvCMQJyqfyjux4ZjYQgtEG2e6JX7Sy
 7CbGWBBvwCyEFBthEFIGIHMHi6PYTT2ILpwLNsc+ekr2b1szwyteiImudiNLw54DcQbWLmUg8
 Tu70KeJrJ5HA5+PG40b0P61gPL2w3FCRajulmK13eY+lw6VtzzqAYtM3sxRw1IDaz3HCgYPh4
 7UG+sz+xvY4moBvJpx7JrswSqsYKj0sZgODHW1DxdIXVku5GoItaFKn57wOvnPqHOHvioUGdW
 qgVINKw/MQ87NhvsjFryzrwxQx/FXHfM/WgF03wOmdS6/n/9Zr+9XZ4l7cxf5dRQdBAJZ22G0
 15t+SuCpiAwoxiqzm8jx2sdPURUEPBzQ1DmLQW9l49njMn97OawbpRpGLo9jey2wtERkUh/1r
 K8ZEJfDm7dxffbEPN8l75smJfhPMC0bfE+W4juGfAqcowDRZVpXi4SSIZmeymzGuzfl9/+v5G
 x1RneCslb58zd8aKBCpHbG0+K0t9mq1pBJ++scIxLrIJdybG8cZk7UXGFjR2vUd5Rk1QL7X70
 0Z14eiamLTV/EEIBWe2TSPMmaiThy15g9AARvpDu1POVpuJ6SCNAM4O3JCtKLmj7Csi8wrq8Z
 NuDdqP/shs0e71nHhVMOAXoHa4Xs9g2zATUGkG0Nj6gEA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720514294; x=1721119094; i=fiona.klute@gmx.de;
 bh=zHioBhee9Mj/Vg4y9VucfpApsL66LX4RzzbhGuBOtkA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=oOx1dI7MhfZz4ZHhZ3h0m3G/9UiYnP8g3vRR/AvLyy/W1UYL8T9nwYNVIERXjHfG
 OaOmMao+FI7DM7kz9y0x7NR9Utzl6PGkzDKhnzajF6UBIquCEUDgiaTs7ULH9gWn/
 yDsMs6NZS0yXWcV3gq0dbGHljdJpVNLQC9aEAkhdj12Jsnx891CEOohuK+EOH7xBj
 Kg/7Jha7Yf4OFoiCO3y8xxCHPYB16zpGL14BwyoBwX3G2lZlhU/s9ejwoZXSOaF8c
 eQutMsjjxV8r2S7pjqpiAT9AKuxEHgQhbsNk7N0BkW/d/kW5bnU03aOWyFNbJS6lC
 /7rPMDo0CiY3cehr6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=oOx1dI7M
Subject: Re: [Buildroot] [PATCH 1/2] docs/manual: describe relying on
 default options
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 08.07.24 um 23:11 schrieb Thomas Petazzoni:
> On Fri,  5 Jul 2024 11:44:48 +0200
> Fiona Klute via buildroot <buildroot@buildroot.org> wrote:
>
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>
>> People can assume that e.g. Busybox options enabled in the package are
>> enabled when writing code for Buildroot. Anyone who uses custom
>> configurations that disable default options needs to make sure
>> relevant scripts etc. still work for themselves.
>>
>> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
>> ---
>>   docs/manual/integration-principles.adoc | 18 ++++++++++++++++++
>>   docs/manual/integration.adoc            |  2 ++
>>   2 files changed, 20 insertions(+)
>>   create mode 100644 docs/manual/integration-principles.adoc
>>
>> diff --git a/docs/manual/integration-principles.adoc b/docs/manual/integration-principles.adoc
>> new file mode 100644
>> index 0000000000..9e2f43a18a
>> --- /dev/null
>> +++ b/docs/manual/integration-principles.adoc
>> @@ -0,0 +1,18 @@
>> +// -*- mode:doc; -*-
>> +// vim: set syntax=asciidoc:
>> +
>> +[[integration-principles]]
>> +=== Integration Principles
>> +
>> +Some foundational packages like Busybox can be configured with or
>> +without certain features. When writing Buildroot code that uses such
>> +packages, contributors may assume that the options enabled in the
>> +Buildroot-provided configurations are enabled. For example,
>> ++package/busybox/busybox.config+ sets
>> ++CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y+, so init scripts
>> +meant for use with Busybox init may use +start-stop-daemon+ with long
>> +form options.
>> +
>> +People who use custom configurations that disable such default options
>> +are responsible for making sure that all relevant scripts still work,
>> +and if not, adapting them accordingly (in an overlay).
>
> I understand the wish to document this, but I'm not sure an
> "Integration principles" is the right place. Shouldn't we document that
> in a section where we document the expectations in terms of init
> scripts instead?

Arnout explicitly requested I put it there in this mail:
https://lore.kernel.org/buildroot/6d02d2d5-e71e-45b3-a447-e81521085e7a@mind.be/

I'm happy to respin and put it elsewhere, but I'd like to avoid a back
and forth between two maintainers telling me different things, so I'd
appreciate if you could find an agreement before I do.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
