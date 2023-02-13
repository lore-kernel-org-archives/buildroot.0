Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6195AC636CC
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 14:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1541A60FE0;
	Mon, 13 Feb 2023 14:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1541A60FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2j4anm4YrYp6; Mon, 13 Feb 2023 14:54:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C5E560FD2;
	Mon, 13 Feb 2023 14:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C5E560FD2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AAF401BF349
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 14:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84B724089E
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 14:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84B724089E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y7vW42FEwv9i for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 14:54:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1F6840866
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1F6840866
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 14:54:43 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id AF7925C04BE;
 Mon, 13 Feb 2023 15:54:40 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 13 Feb 2023 15:54:40 +0100
From: Stefan Agner <stefan@agner.ch>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20230204115212.GC14083@scaer>
References: <175cc1e7e72602b9c0e8d6b761cf72b375383189.1675421166.git.stefan@agner.ch>
 <20230204115212.GC14083@scaer>
Message-ID: <4731f67c09026856282903ad811d15ca@agner.ch>
X-Sender: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1676300080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YHrYKOjQ+nn6hHaczGfFKL5XEbaqKZ9JwXWpP0tD/Jo=;
 b=NJ/ydbV5QYZIPU8c/RoDaDkwa21ucrBibWmftdm8lw8egYlUKAvj0VY62GvzYdglqYsKM7
 e9wqgr+3fuArt8+UpgYgUiq1gi2LEMpqhCj3/3Yz0qmDgm2Xp/OUJMGQ8nVOxupOqGyckT
 zozhWgSCi3J7i2RtlMlI6nQKtLhOJkQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=NJ/ydbV5
Subject: Re: [Buildroot] [PATCH] package/dbus-broker: bump to release 33
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
Cc: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2023-02-04 12:52, Yann E. MORIN wrote:
> Stefan, All,
> 
> On 2023-02-03 11:46 +0100, Stefan Agner spake thusly:
>> This release contains mostly a bugfixes, with some improvements around
>> error handling for unimplemented functionality and resiliency against
>> runtime changes of dbus service-files.
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>>  package/dbus-broker/dbus-broker.hash | 2 +-
>>  package/dbus-broker/dbus-broker.mk   | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/dbus-broker/dbus-broker.hash b/package/dbus-broker/dbus-broker.hash
>> index f6c2cbe160..89b27ddddc 100644
>> --- a/package/dbus-broker/dbus-broker.hash
>> +++ b/package/dbus-broker/dbus-broker.hash
>> @@ -1,5 +1,5 @@
>>  # Locally calculated
>> -sha256  bea7f653e7251063c5f427e9e3f93562d38a0d8667ae6d49fb56f113605985de  dbus-broker-32.tar.xz
>> +sha256  23713f25624749fdb274907e429080fa2d8f4dbe76acd87bb6d21a3c818c7841  dbus-broker-33.tar.xz
>>  sha256  3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4  LICENSE
>>  sha256  20ea1f96abc15553695c6725bb3dcabff4b43b85b7ca7d675a2b8860e3b01f87  subprojects/libcdvar-1/AUTHORS
>>  sha256  8153c478102dc209b30dd4627cf5bb3596263f99692bf3eec174b1e17bbf8a3b  subprojects/libcdvar-1/README.md
> 
> Unfortunately, there are issues with licensing info:
> 
>     $ make dbus-broker-legal-info
>     [...]
>     ERROR: subprojects/libcstdaux-1/AUTHORS has wrong sha256 hash:
>     ERROR: expected:
> 32913ba08dc041f3f4ca361fc0d68014120e1c612772aabbcc901556df499ce5
>     ERROR: got     :
> e796182869fe0892347d069f3f423774124987d6c45d016854fc51530633c177
>     ERROR: Incomplete download, or man-in-the-middle (MITM) attack
>     make[1]: *** [package/dbus-broker/dbus-broker.mk:71:
> dbus-broker-legal-info] Error 1
>     make: *** [Makefile:23: _all] Error 2
> 
> Can you look into that and resubmit the bump, please?

Change was due to copyright date bump and additional authors which is
maintained in the same file. Will adjust the hash and resend.

--
Stefan

> 
> Regards,
> Yann E. MORIN.
> 
> 
>> diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
>> index e82b79220d..c4e3679a2e 100644
>> --- a/package/dbus-broker/dbus-broker.mk
>> +++ b/package/dbus-broker/dbus-broker.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>
>> -DBUS_BROKER_VERSION = 32
>> +DBUS_BROKER_VERSION = 33
>>  DBUS_BROKER_SOURCE = dbus-broker-$(DBUS_BROKER_VERSION).tar.xz
>>  DBUS_BROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUS_BROKER_VERSION)
>>
>> --
>> 2.39.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
