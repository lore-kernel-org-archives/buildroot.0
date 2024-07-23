Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A765AC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 13:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 690AB60708;
	Tue, 23 Jul 2024 13:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 314pAvcPIcLp; Tue, 23 Jul 2024 13:46:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66FD8607FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66FD8607FD;
	Tue, 23 Jul 2024 13:46:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A86261BF2F5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A23EA403AE
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCOylpr8Vemv for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 13:46:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D4C940374
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D4C940374
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D4C940374
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 13:46:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.125.116]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6Udt-1sPMwy2sQ5-00C1V5; Tue, 23
 Jul 2024 15:41:21 +0200
Message-ID: <1f14d0f9-1749-4abd-bf08-1b281a02de75@gmx.de>
Date: Tue, 23 Jul 2024 15:41:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
References: <20240723102832.2522307-1-fiona.klute@gmx.de>
 <20240723102832.2522307-6-fiona.klute@gmx.de>
 <20240723142600.6be4c23c@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240723142600.6be4c23c@windsurf>
X-Provags-ID: V03:K1:eoTWrxlZnrFh47EjvB73kSAMrDTeTPDUjxeWiITD/ksTBU/3qsr
 XP15sBLXRCeykJdAzRCFsUGSIZkf+7nEjRKlbBLD4TjIpZ3HDcqqAarT1Ed38tZSQCmDu8d
 iDTV8BE0liQLe9y+tf8VLZ5H0yL6HR7FqoVrLpb9k9hzhZ885ZHwpSoNwfetXnbJa2z8iC6
 avGPOrB5jQtfcjU2P24Uw==
UI-OutboundReport: notjunk:1;M01:P0:h0/vwjEXHsA=;+VC65XLzq++6uY8X1lafJAVX2HB
 pKyTK3KM6D5RLzN+WrpeuZN5o8RvcTU0Q1YECjiASlyxFusdi5ayBOuKp/Jru3vNE78QHyub5
 8dCd1wJfCrE6eZXbU77P32348xlJQpIa1XA8w3JNS9k1GLRdC6ZTpaJBGiBmVvveFBZOTFGP1
 oZ97oUBdoUFxszve613U1ruThdiSvhxhwaci+kovz9NrPm72UAjD0HoUbWpv55NY1PjCIRl9f
 7oDTov/ZYCqQteMA96Nyat6ZIJBO1x2zscZFyyR26ozvX3FfgMstVqq86MP6Qt1T6/KuZAYC8
 RqcOrzuMuUxXEnrUU+VUJYHFm34/eyay2dilxrC3zK94fQl+LN1y+UP3YyFLePR2L5eL1Y+ZM
 KHlT3yZtZiPc7UfIRAeelKkRA6p4rTJLSyoAnk8u74pMzrMDotHmYKRjjR15VeZdv556I/CWO
 wLjLMX0SL6nG8v+acf2Xyc0eUHRpQ1efCaIlkWZ8EZ+DhR8JdQZzfQboKCPyAInruiMUm/EEU
 qz/Xt0lBvAA6VHT8T9YaHfQiaadsUzL1+TCaZiHsovowLWvXw96me1fDIaCGPoFrcD6uM9BWa
 kNMpHaXR+eirUScU0HC+1Wo3hu3hio1riRpii9Z8F6+kogfI3g4PWlbG1f3neeKYlIexqwrl9
 YQb8O3W3l1U2GhfYxd1fEIX0XXvqruUFHQ+Qi7eqqBmG71TxxGRSF1ZSLb32MeNJs15PtbWfS
 eJppcXspLeEJOXadwzQctksRfo8H3iUyx7ZWRJCYe7K/kU5UGr4NXREZXZjbVcriQr5COHzoH
 /qntsFgAWwwaWG/GzW439Pnw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1721742081; x=1722346881; i=fiona.klute@gmx.de;
 bh=goaESL8oofvUruzfy/f5RYOn/MsBCQz3kQaCulRPMf4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=BZUUM7+WsSxCRi+KLg1/TnMghwy+7GWWKJG8NSiZCVXYuAlB2VTrosjqLzeutNL8
 P2kuP+WVcCeY+hX8T3NJ/Y9NK7PcFOLxJzXEp3n3/uWumCp2guzegqL+sPlX+G9T8
 EwBbOjOJT3intCU7IPaUyt0EBMDJotqRkGb3LKFd3OIjJ9k++vtu+avv5pO4JM6Oy
 Mk7DpJ12sW7/q4uzVa3OqmV5rLdeo6a/KQn0JVMR7Jz5EKCte0Jv0bNQfCIElSHNv
 ykcdtT4I4nnHGffbOAI/DvqBZq4aSaDQ+y55vV4chKz4/jhBcECa5zeaDsr0IFp4K
 i8V+qRpsFFbIZBJ2rA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=BZUUM7+W
Subject: Re: [Buildroot] [PATCH v2 5/6] support/testing: include init script
 in iptables test
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
Cc: Julien Olivain <ju.o@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 23.07.24 um 14:26 schrieb Thomas Petazzoni:
> Hello Fiona,
>
> Thanks for this patch series!
>
> On Tue, 23 Jul 2024 12:28:30 +0200
> Fiona Klute via buildroot <buildroot@buildroot.org> wrote:
>
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>
>> Check a save/start/stop cycle based on the rules created by direct
>> commands in the pre-existing test.
>>
>> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
>> ---
>>   package/iptables/S35iptables                   |  2 +-
>>   support/testing/tests/package/test_iptables.py | 18 ++++++++++++++++++
>>   2 files changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/iptables/S35iptables b/package/iptables/S35iptables
>> index a67d0886a9..d6ff4a4762 100644
>> --- a/package/iptables/S35iptables
>> +++ b/package/iptables/S35iptables
>> @@ -23,7 +23,7 @@ start() {
>>
>>   stop() {
>>   	printf 'Stopping %s: ' "$DAEMON"
>> -	iptables -F
>> +	iptables --flush
>
> I suppose this change was not meant to be in this patch, but probably
> in an earlier patch of the series?

Right, thanks for catching that. I've just sent v3 with that fixed.
Sorry about the noise!

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
