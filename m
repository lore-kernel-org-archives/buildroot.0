Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EF5C02199
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 18:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18A18847AE;
	Thu,  6 Feb 2025 18:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ch3f3MtJksSS; Thu,  6 Feb 2025 18:57:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 272BE84858
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 272BE84858;
	Thu,  6 Feb 2025 18:57:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 182EFE2
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 18:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08346847AE
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 18:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_zfnuCxB_i6 for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 18:57:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B7AD847F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B7AD847F2
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B7AD847F2
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 18:57:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.166.127.53] ([176.5.54.127]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqJm5-1t2ylT2lX9-00keFN; Thu, 06
 Feb 2025 19:57:32 +0100
Message-ID: <dd076879-0eed-4b49-973c-05e300708986@gmx.de>
Date: Thu, 6 Feb 2025 19:57:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Bernd Kuhls <bernd@kuhls.net>, Sergey Matyukevich <geomatsi@gmail.com>
References: <20241205150114.3474074-1-fiona.klute@gmx.de>
 <20250205153726.35bd53e7@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250205153726.35bd53e7@windsurf>
X-Provags-ID: V03:K1:a2IvDRY/uw6JulIgLDZPWhCJ7sThERLQnJAH5Y9872s90OpmXfn
 Hwk2tQF2s8LHGfR37pTPUPNo0dlNOm8Di3D8pbBFbSJNBaH4ooUfPBn5RJbyLX1dUsqUM28
 7xuRuSzIp3TSrfaE6XHkW5nONT9GufSN0BWJgy4+QWmfLUKExdrWHAxuCJciIy0Ah4uNLra
 1KsybwCSVTrtxJebWxJ4g==
UI-OutboundReport: notjunk:1;M01:P0:11XddFKNjzA=;FixsmTYq2iD/JB1H9QDe9eNAph2
 HOXYrGi7tw8Gjjc1wS3bCapc22JNuaI4Lzw6oQ+SeUiqNvMEbwKrkxZffercXQ/msDXXpliND
 0tAtTmI32wMMMa7ALYwGteTBzYHZtIo8d7pBC9gwm1PmANPZZKDSHhNyepPmJJ+ADhbqv5pje
 8cUi/T1vWVGDBB5ZIc1ti78zbXMRAXgpz1xQyT6Dksx5HhjOEs1JBVuZz/fjODaFH6tpvIYJ0
 802PUaCPT/8eXhg0XpUAsynRHA5/LWn3HeUoG8zvndvlea+REFPszJrV3qodBreJha+UWtNvw
 /0eJAFnudi9FldhaAiu8vIF7mWF9QTUCDUOCldMIXB1DMmCXw21oNeAGtEsWktNz1U98sKkCB
 TzGKuIKk/rLTaSOkZBMRx+ppWpvcWgG7b0sN/sVBi2/jzPtNujhsa7X2XUrLtGYw3bqGaBrkX
 1FzC98VyOoE5JbU9GqjBOXID+0ARf37sdeP/yaBf7eu194FbOvqgmCaM5eJ2OWfu0EqAvZAK5
 frYX7FkpiJarDvkeTy0wpemG88H0yS11tqsWqSQbWjK1HzurqcaRO+rLG6syu1r1kODBtHQtC
 8p5BtrrzzT81dx0/4TpApWoxPCbYvhhyCYS11K3wqNgFzfKbsG8kOTF5FU5J2ox1buvSsqxUM
 3ljI9KaOlHNyHMrS6Xx8Ybcx0ufIZjAl0af/mMfMnVjVoCr6d6aXpfZSyuflIqeOAE4NoLWNh
 pXJt+uaW3epUjuAGSxjVsaMz/hyf4PYGL44I7dvZ3xmKyEpWPI/vCH8HCnVMMSs0ua++Hu/1A
 hv/HIrXJQx3wLnUhbFshEe/Pm9da35hHjBff0ccglijnh8DRW7jqOIg7dSz9Ftsn1DgvCrOj5
 Eg9IXgUmiceqsKqDbEd/O0dwfg3CsWwMbSuhAt2Fp15SwGa25NEiiZGB5bLiKnBeUjRh+md5S
 KBX7+tt4IHUXqOeNa1xxuB6p2ugQT1qvWM0kJ8jesTTI1SDDJnmLV/DGEFJMSJCxwDd+uh53r
 pyja50Qdu1vnhmODWjgyfOUdB+F5x0FJ+TK3EngRIm6u+n+/safJXTC5bqDjBJ/h695lUjtuH
 7JvM8zvVQLz0zMMscqFGKMYhDz68XC1d18nQihECQ7CYFNrRZLT97xmvnXhjPKEpfpIsbf/ej
 QtwW0rUhLUm5yVK+JT9NUtO5bEyrN/Fnp4Fg/3t1g1HC6+Upavx4UbSnju2guTpzjuwCPs7oh
 sAsjNYPuE+C1ZllH+hAnAiawGOCRITfzTqIXKbhCPJDGfH+bXAcM0JC9B/e4kYJOBAzYIQARZ
 D0aha5ckvZ+1+MjMxyn4oIOv5T0fV4dR5pfVO5f2Ihzh8flhQ1QhLrY+Hq5CGy6DPVf9BXJeS
 oWbW1p2OEgNRcwX4a6UP554IUtnQDoG6VWZ3A9wCNcqhDSlEvlWCyeo99z
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738868252; x=1739473052; i=fiona.klute@gmx.de;
 bh=6fcsjP1RVQWKaCyK8nnmk3uhEK83BWRjq2tJppJ5dmM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=nCBCCk1OBB3JrgzsmHFHjsMW8BuE8+CQWzSgQ77VwA2+sTPBGE0pO5H+3OQSgUn+
 99hDtop3RlRKyPlYQ7LprGau2kaJfYC0YvNDpUV6No14ZWlhZknv8p6usjLwRXNxw
 VfLDX6dB3koXI67v47E2ihUhjpO750ZU9w3I0Uj8sJpBDgxwqryPTBfEgZRismAnT
 N6n/wOpOevYDUJgEup2Mfyyoy5nlsP2vd+jwnTChDL4daxcsqisYANLAe6fLI/Pao
 ECrz2INcjmwdi1/G4HU0VvdEOvhZo0TQMDp3xErZqo1cuGfpEnkm16LXUruNqKqqb
 arEqzKvRbiG8Z3nF4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=nCBCCk1O
Subject: Re: [Buildroot] [PATCH 1/2] package/dnsmasq: install D-Bus policy
 to datadir
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Hi Thomas!

Am 05.02.25 um 15:37 schrieb Thomas Petazzoni:
> Hello Fiona,
>
> On Thu,  5 Dec 2024 16:01:13 +0100
> Fiona Klute via buildroot <buildroot@buildroot.org> wrote:
>
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>
>> Since D-Bus 1.14.0 installing default policies into sysconfdir (/etc)
>> is deprecated, they should go into datadir (/usr/share) instead
>> [1]. Follow that policy.
>>
>> [1] https://gitlab.freedesktop.org/dbus/dbus/-/blob/8f1e00427f7048f8b24c3a1cfca8903254fe00d4/NEWS#L274-283
>>
>> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
>> ---
>>   package/dnsmasq/dnsmasq.mk | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> Thanks, both applied. We still have quite a few references to
> /etc/dbus-1/system though:
>
> package/dbus-broker/system.conf:  <include ignore_missing="yes">/etc/dbus-1/system.conf</include>
> package/dbus-broker/system.conf:  <includedir>/etc/dbus-1/system.d</includedir>
> package/dbus-broker/system.conf:  <include ignore_missing="yes">/etc/dbus-1/system-local.conf</include>

These are fine: Config in /etc/dbus-1 should still be loaded as the
directory is meant for local config, it's just that *default* configs
shouldn't be installed there.

> package/mender/mender.mk:               $(TARGET_DIR)/etc/dbus-1/system.d/io.mender.AuthenticationManager.conf
> package/mender/mender.mk:               $(TARGET_DIR)/etc/dbus-1/system.d/io.mender.UpdateManager.conf
> package/miraclecast/miraclecast.mk:             $(TARGET_DIR)/etc/dbus-1/system.d/org.freedesktop.miracle.conf
> package/shairport-sync/shairport-sync.mk:               $(TARGET_DIR)/etc/dbus-1/system.d/shairport-sync-dbus.conf
> package/shairport-sync/shairport-sync.mk:               $(TARGET_DIR)/etc/dbus-1/system.d/shairport-sync-mpris.conf
> package/tpm2-abrmd/S80tpm2-abrmd:check_required_files /etc/dbus-1/system.d/tpm2-abrmd.conf

These should probably be updated, but I'd prefer if someone who actually
uses those packages and can meaningfully test did that. :-)

> support/testing/tests/package/test_python_dbus_fast.py:        config_dir = "/etc/dbus-1/system.d"
> support/testing/tests/package/test_python_dbus_next.py:        config_dir = "/etc/dbus-1/system.d"
The tests create some local configuration and do some check that depend
on it, so that should be fine, unless the test is specifically meant to
test loading default config.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
