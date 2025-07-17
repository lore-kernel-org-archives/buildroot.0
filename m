Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D0EC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 19:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B60E41160;
	Thu, 17 Jul 2025 19:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SSFWvuGp0eR4; Thu, 17 Jul 2025 19:13:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91AAB41071
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91AAB41071;
	Thu, 17 Jul 2025 19:13:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FCAB117
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61ABC6061E
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:13:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcSnvzVMJobW for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 19:13:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D09406000A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D09406000A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D09406000A
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:13:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.36] ([89.144.223.86]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MV67o-1uDhdJ3oyk-00Q32p; Thu, 17
 Jul 2025 21:13:20 +0200
Message-ID: <e2ada059-8d9a-4c06-bfe4-1d56dbcb078c@gmx.at>
Date: Thu, 17 Jul 2025 21:13:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, Julien Grossholtz
 <julien.grossholtz@openest.io>, Refik Tuzakli <tuzakli.refik@gmail.com>
References: <20250711132237.76597-1-dalang@gmx.at>
 <aHEUpPI69u41yIM3@yd-6wlzhs3>
Content-Language: en-US
In-Reply-To: <aHEUpPI69u41yIM3@yd-6wlzhs3>
X-Provags-ID: V03:K1:Jl8EZvaML2kgBNrx1XkHqcTeTELJJTOUxoI7Czq9sPUzjoRv0kC
 z0qGJmULRVlYNwfqugAfeGMjwMxNckwlxAC1dudfRicDKu8zOATpVSDYyYofBUz9tILOogu
 X+8dBkYNsdIg8vofYePSF7DTIp92ZrDmqhU+ffMEKbo2c9udu9sTf5Gh8Wqb8qtNNchamM8
 yQEWmrZMBC6IIuolyVbfQ==
UI-OutboundReport: notjunk:1;M01:P0:QSRFQy82xpk=;Olvw+fAqHSHBhi6zVwitcIC6NKQ
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1752779600; x=1753384400; i=dalang@gmx.at;
 bh=g0KQAbPXahVmXmOM7i0Akc1arA7GSLH09B/QdLIVCRU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=elSA6E0f2GMdhKh8HLP1iDo/hiVCrv48aQ96UL9qqV4Q87XvU1NbkI3LGM9GhwYJ
 nrWhbVoo1wYxEAapx3pTP0vPb4vFL0SSFvFkub9nDFBZZzyw+1RoowFQIt9bCfIYj
 C77G7CgZoB4/BvNSZxSmz5TsRTbI/tHJup8/lXXCZu3+kxgRph0xzW8orv0snk8Qa
 Vl53ydspAWPDOOdLLhPmNBk6f09MK107iQzuiFOfdIY5e3hxvQfwRUEBIa3W5WRTf
 b56Xyr4xaRcRFC27Xlctb6hS1enKGMyXvP1cg4lA2sOnHo+u+HYKkhJpEsLKiu6+8
 GPAQAQrJP1YQeHyBvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.at header.i=dalang@gmx.at header.a=rsa-sha256
 header.s=s31663417 header.b=elSA6E0f
Subject: Re: [Buildroot] [PATCH] package/paho-mqtt-cpp: bump to version 1.5.3
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hey Yann,

> Daniel, All,
> 
> On 2025-07-11 15:22 +0200, Daniel Lang via buildroot spake thusly:
>> C++17 is required since 1.5.0.
>>
>> Signed-off-by: Daniel Lang <dalang@gmx.at>
>> ---
> [--SNIP--]
>> diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
>> index 2e0f409b96..0562cb0eb5 100644
>> --- a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
>> +++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>  
>> -PAHO_MQTT_CPP_VERSION = 1.3.2
>> +PAHO_MQTT_CPP_VERSION = 1.5.3
> 
> The version history is a bit of a mess:
> 
>   - Tag 1.5.2 is dated 2025-06-25; points to a commit dated 2025-03-11;
>     annotated tag;
> 
>   - Tag 1.5.3 is dated 2025-05-16; points to a commit dated 2025-05-15;
>     un-annotated tag;
> 
>   - Graph-wise, commit 1.5.2 is before 1.5.3, though.
> 
>   - Commit 55833eb9fb1bf (Bumped version to v1.5.4) is dated 2025-06-25,
>     the same day the 1.5.2 tag was comitted, but it contains a Changelog
>     for "unrelased", not for 1.5.4, and porperly points to the current
>     HEAD of master.
> 
> It all looks like a bit of a mess. Could you see with upstream that they
> clarify the situation?

Thanks for bringing this up.
This is how I see it:
1.5.4 is definitely not released yet, there is still a milestone open [0] which seems to be
planed for July 25, 2025.
The 1.5.2 milestone [1] was closed on March 11. The same day of the tagged commit,
as you pointed out.
The 1.5.3 milestone [2] was closed on May 16. Again, same day as the tag.
1.5.3 is marked as "latest" release on Github [3].
So my assumption was, that they forgot to create the release for 1.5.2 or redid it.

> 
> Regards,
> Yann E. MORIN.

Regards,
Daniel

[0]: https://github.com/eclipse-paho/paho.mqtt.cpp/milestone/18
[1]: https://github.com/eclipse-paho/paho.mqtt.cpp/milestone/15
[2]: https://github.com/eclipse-paho/paho.mqtt.cpp/milestone/16
[3]: https://github.com/eclipse-paho/paho.mqtt.cpp/releases/latest> 
>>  PAHO_MQTT_CPP_SITE = $(call github,eclipse,paho.mqtt.cpp,v$(PAHO_MQTT_CPP_VERSION))
>>  PAHO_MQTT_CPP_LICENSE = EPL-2.0 or BSD-3-Clause
>>  PAHO_MQTT_CPP_LICENSE_FILES = epl-v20 edl-v10
>> -- 
>> 2.50.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
