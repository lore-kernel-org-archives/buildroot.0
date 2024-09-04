Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4565CD3431
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 08:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8987340194;
	Wed,  4 Sep 2024 08:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZO80WixIMyAr; Wed,  4 Sep 2024 08:05:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68A8A40414
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68A8A40414;
	Wed,  4 Sep 2024 08:05:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B67E1BF356
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 08:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75BF940194
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 08:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aXwBYD3M1XUR for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 08:05:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.135;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 047E140414
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 047E140414
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 047E140414
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 08:05:45 +0000 (UTC)
Received: from [192.168.0.68] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MT7ip-1scnG40m2p-00RZKL; Wed, 04 Sep 2024 10:05:43 +0200
Message-ID: <097fbe23-08d0-47e8-9ffc-184528fbc91f@green-communications.fr>
Date: Wed, 4 Sep 2024 10:05:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240903160038.19535-1-nicolas.cavallari@green-communications.fr>
 <20240903160038.19535-2-nicolas.cavallari@green-communications.fr>
 <20240903222650.10afba32@windsurf>
Content-Language: fr
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <20240903222650.10afba32@windsurf>
X-Provags-ID: V03:K1:SKh+NUKBPkSosJRRdsBOvGW10wLseoBTBe8AOZMl8E5+DQMLfkC
 9vo2gQ6VV7XQ3CPC4Ko8GuFYyoxCguB4ww/HHiDn0ZBErSf6fAtQTl54KKuBHNY6F8AgiTr
 5fJGjMBIcOhszoxh6eAcAZvrOb31/aUysQ8SCBWe/Tt6tkVGpBSH8V2074/RZDVmg27Dsm8
 YjRNLXOSjP5nYx5daLYhw==
UI-OutboundReport: notjunk:1;M01:P0:D0U0VPGfNs4=;x2oUTN73liuuRDOmerxl99y4j2b
 clC95EwyNkuYSRl6SifpIDrnbmfaC8v5xlR2vLmA2zMUjEU8Risl1jJ0tqxRk+kJl8hU5Ulat
 rj4LMdVWZN014BVscPfvVVT4I6i85PqNpETMfucAdrkdO/EG+xnpk0r3YRB0/szTashF/HPLW
 MlzV92q7BPyolU7uhCpWHavTJcYpjJharVzVdpbTsifVjFz2ScqJrjVmlZk4Fgh/NAmHon0Tk
 HRaZQ2dJtL3X5djbGfw7EPalraVGz0xJH6BeEbrTee7iUdie4ilnC0+BWSo8Rojzq/Y1MqIje
 ty88mpcEV7Y490/aPWPYSzGnVpkYqYluME45TLFAGvie3ySL/0SsmWkcR60DBLhoU2OwVceNq
 BudN/SIBdqgd0BK3xqdxApnG+fmRW/K4QUC/IhgDOEmiTbJbw+V0QVbnDI+laMrHl6HZN8z2Y
 yr1zECXEOuo0rNUi1WJV2+On7LvxcBV420pO2nWBzBsQemniHhT8PtyaoAT1ym6mq8eRkPAQv
 qXNhBRdo4bnzPdnMdcRksRGfLJo0lTFKbeJV5SL4n2wwg+AKsnOBbVrGGl2h0tX3v+IrEm7jr
 UkUydfYQUSZFpq36Hw+GN5gZ4Fdnm2F8zomTKeJRGHDubxcxGfeCzmdzCqhMB8znHTbmb5LKg
 cpzaoj2cPRNZzOmR3PVA6k5uHb3L9UXeZdV1KGlPT0J9qii1FdUEE8a7B2FKoIRTVLREURSs3
 4tl3sQsW2VZ8hIW9cmd627X4m9Qp48A+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: Re: [Buildroot] [PATCH 2/2] package/bluez-alsa: bump version to
 4.3.1
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 03/09/2024 22:26, Thomas Petazzoni wrote:
> On Tue,  3 Sep 2024 18:00:31 +0200
> Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:
> 
>> Add new optional dependencies on bluez midi support, opus, systemd and
>> spandsp.
> 
> We need your Signed-off-by line.

Seems that I jinxed it with rebase -i.

>> +ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MIDI),y)
>> +BLUEZ_ALSA_CONF_OPTS += --enable-midi
>> +else
>> +BLUEZ_ALSA_CONF_OPTS += --disable-midi
>> +endif
> 
> Maybe group with the other conditions testing
> BR2_PACKAGE_BLUEZ5_UTILS_* options in the same file?

There are no such other conditions ?

$ grep "BLUEZ5" package/bluez-alsa/bluez-alsa.mk
ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MIDI),y)
$
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
