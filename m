Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6B6C021A0
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 15:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13FCB8207E;
	Wed, 12 Feb 2025 15:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YaYZGjht1vMK; Wed, 12 Feb 2025 15:47:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5940A80C05
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5940A80C05;
	Wed, 12 Feb 2025 15:47:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C9D3194
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 15:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59542404C5
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 15:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HXRnSXc9nPy for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 15:47:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 97077404B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97077404B6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97077404B6
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 15:47:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.102.52]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MA7Ka-1tXpdq100o-00DGHz; Wed, 12
 Feb 2025 16:47:28 +0100
Message-ID: <30ddb8d5-72c7-475c-a02e-6b9160cbaae9@gmx.de>
Date: Wed, 12 Feb 2025 16:47:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baruch Siach <baruch@tkos.co.il>, Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250212135027.759121-1-fancp2007@gmail.com>
 <87tt8znsuq.fsf@tarshish>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <87tt8znsuq.fsf@tarshish>
X-Provags-ID: V03:K1:3eua/BCDf9pus0G9CUI8Cu5gIOlFlcGSmL6xvt2AY6muroX3hxC
 sEj5BRMlDdB9Dy03LQ+2kjpiSEUGbaVOTIrtYXhhDA5y6fAyEl+iRtq147623iUSlg2yd4F
 CNbN8nsBAQtUkTYj2qw6I3EsgeUOZiMPnTAp7q3f5+OXc7LkotaZdWi7j8vlvCwaPjTdKHb
 6zWxzOtLwGpFrUWSJCudA==
UI-OutboundReport: notjunk:1;M01:P0:gevZWlk3MZ4=;JxOZm8kD1U3PjrhLk3FkLqfHuOz
 7Ye9p03ozhwA+qDsdczQ552swG8R5UO89Terf0xuGh0JWJTh3GT/DZxKc4WULOs9fNnlOJ9Eb
 3TN66e5f9VB3tsYOiheqSm2rt24XhFO2/+ySwlKr7/xXSAumkPV/22PVKOHQB87FKY54r/HNc
 OhMvfo2nGmSdjxZ7h04+Y01ZV8E9PUZXTi8I1qfLrNkkhPCxD5NC6zWHoMGadCzDTo7olZ2f+
 yErAcAJZ6dG04PVQIBQWvfRfXXleACNMh+QnBQ5aQhfkrkCkZhJ2rEFu2Z+gEFMnmn2aEeo6V
 F2sm5djTk3CybgEf3cvV9e3BtmrUq6PHRYYB7ou97rroFvMGFTZrXBZQXHU6Cc/TVsQhfyJ8c
 V8oCOFuxsHC5OA6woQVmQsQY5N5Bz+VMbpgaJeVz+sSZx6RQk7yVdua2zbo/Dex5nUkNBybr1
 Qb0kA+ctSbntluFBhKsr8MqEFhD26oM6vVxDwY73YhLkfkvIhT8BDL3+1am9V0jHEq2xqgL1L
 D7qgU0WGoBxc/3JkJdWB2wyHvEVJpUL+InF/CQGkaZK7Cs+Pj1d/3/OSjBcWyz4812C+FKyJ3
 ljp5ajR1hJIvVNYXczwb/piyPDySzZEtHMUWtdJs74gDTZObGfTGxaJu0aQiKEnYs60ieB9pG
 qmw9A7UGl8be4z/PUjyUn/Vleqf0bIoIYal1bb2PXZXZ0AGvzkgPPS0hUDR6e0x2x+aMWO3HK
 VDgtJhSB+XuZBS3mzsgCTt8Lf/QvamtMvCB1IbiYeNM7XnISQ2iLAX21tHLyDgxJB2iRORf01
 Re1RO2UaZsZZBaJ4rssni1x5tdoNwrhEQJkYJrwMp58AcALLPTR75yH3OHRTtxOG9Mu7bEtrr
 ZgfN7GONVCOB53gGuHung9zE2ZzC/snHsgaebCOQUO5t7e1sV6IwqpsNbq8yfoaHQjy67kiqB
 qjPUvsYRaLtByn9KldCWs4CpYEl9er/gKUAux6T6LeSKtYcSOvEtufmpa/7RggMXRR1xP1Acr
 6JAbfsnymKoRGfLK/EhRzPSuwJylXZtk8OfzFZokSYpM6L+/jKaf7n/pV7YUQF1A8/k4YPhCh
 5yWJXmIEb6zKScksKGNKx/n6zH69yqBG705/kupEfRHJ/Fs/lY3OsmU4tSXhzQoWpqHGYUfn9
 xTFJyoOqjVcEBL2cYetswvLBQ0/tTPI+rsRw1AO/bh12Of7UaMsSrLbjGWXMyzHWKXp+PtkVG
 XnzaM6G1cWvkPRguO3rEBp2L6u2xd6DBEBP+ZpGQYF++I8WU1f6joytBifRLTosxvfglTE1tp
 EZuorIiGue9pdCmdCO1lCTizo5MFfQH+5hRMrg5ixHny56SzHbEBVkomAeprkFlnCwaJC0E2g
 uZdxE+zsWZNsM7ZLtpXNxDoz6nluAK2TuEVEuZx311JTvJiH96V8dq/D6t3gb1h0RinxPd7tO
 4rVRvdQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1739375248; x=1739980048; i=fiona.klute@gmx.de;
 bh=mu3psFGBsZtLPCA8z4Fz61nxkGK6nTew0hGesKFxiEs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=VfZEjsCtZZ+xd5z+bcnjWDMTiKgusnkhZVLLBKfKfcFEz2CAi0n84sTZTYGQX0RU
 t9gH94gKCIQ0/7lFRnxolt6liR32Ph3IuyPv1mCbWmHXZ0b6zI48utCb7Jo4MZKaG
 lkIf+opobN12/iWYPnz0144y2osmS3n0faTzQgUdclNjqvW3jO1zlLecFVBX0KZvX
 qMXY8D4m0P636fmsCwCtXFBOiPSuVG0BR71Yl9m/VxTB0Twx2e3ZNGghN2t1uQYr4
 wVIcS9fLn2lbs4pERXI3Vj0ZnGAxAbDSoMHH4zhIGxm8ExZBpd8RLZyIrG7jadLx2
 aCYa2mhWNYqVRti0MQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=VfZEjsCt
Subject: Re: [Buildroot] [PATCH] package/sqlite: fix build issue since bump
 to 3.49.0
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

Hi Scott, Baruch!

Am 12.02.25 um 15:24 schrieb Baruch Siach via buildroot:
> Hi Scott,
>
> On Wed, Feb 12 2025, Scott Fan wrote:
>> As of release 3.49.0, the author has replaced the configure script used in
>> the precompiled amalgamation tarball with Autosetup instead of Autotools.
>>
>> Fixes:
>>    https://autobuild.buildroot.org/?reason=sqlite-3.49.0
>>
>> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Together with the "host-generic-package" Baruch pointed out this fixed
my build, thanks! One thing looks odd though, see below.

Best regards,
Fiona

>> ---
>>   package/sqlite/sqlite.mk | 59 ++++++++++++++++++++++++----------------
>>   1 file changed, 36 insertions(+), 23 deletions(-)
>>
>> diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
>> index a23f6e1d66..30385f9821 100644
>> --- a/package/sqlite/sqlite.mk
>> +++ b/package/sqlite/sqlite.mk
>> @@ -21,14 +21,6 @@ ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA),y)
>>   SQLITE_CFLAGS += -DSQLITE_ENABLE_COLUMN_METADATA
>>   endif
>>
>> -ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
>> -SQLITE_CFLAGS += -DSQLITE_ENABLE_FTS3
>> -endif
>> -
>> -ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),y)
>> -SQLITE_CFLAGS += -DSQLITE_ENABLE_JSON1
>> -endif
>> -
>>   ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY),y)
>>   SQLITE_CFLAGS += -DSQLITE_ENABLE_UNLOCK_NOTIFY
>>   endif
>> @@ -50,30 +42,51 @@ else
>>   SQLITE_CFLAGS += $(subst -Ofast,-O3,$(TARGET_CFLAGS))
>>   endif
>>
>> -SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
>> -
>> -ifeq ($(BR2_STATIC_LIBS),y)
>> -SQLITE_CONF_OPTS += --enable-dynamic-extensions=no
>> -else
>> -SQLITE_CONF_OPTS += --disable-static-shell
>> -endif
>> -
>>   ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>> -SQLITE_CONF_OPTS += --enable-threadsafe
>> +SQLITE_CFLAGS += -DSQLITE_THREADSAFE=1
>>   else
>>   SQLITE_CONF_OPTS += --disable-threadsafe
>> -SQLITE_CFLAGS += -DSQLITE_THREADSAFE=0
>>   endif

Why does --disable-threadsafe remain, while --enable-threadsafe is
removed in the other branch, and -DSQLITE_THREADSAFE=0 removed while
-DSQLITE_THREADSAFE=1 is added in the other branch? That seems
inconsistent. My setup has BR2_TOOLCHAIN_HAS_THREADS=y, so I can only
confirm the branch with threads works.

>>   ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_READLINE),yy)
>>   SQLITE_DEPENDENCIES += ncurses readline
>> -SQLITE_CONF_OPTS += --disable-editline --enable-readline
>>   else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
>>   SQLITE_DEPENDENCIES += libedit
>> -SQLITE_CONF_OPTS += --enable-editline --disable-readline
>> +SQLITE_CONF_OPTS += --disable-readline --editline
>>   else
>> -SQLITE_CONF_OPTS += --disable-editline --disable-readline
>> +SQLITE_CONF_OPTS += --disable-readline
>>   endif
>>
>> -$(eval $(autotools-package))
>> -$(eval $(host-autotools-package))
>> +ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
>> +SQLITE_CONF_OPTS += --fts3
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),)
>> +SQLITE_CONF_OPTS += --disable-json
>> +endif
>> +
>> +SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
>> +
>> +define SQLITE_CONFIGURE_CMDS
>> +	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \
>> +		--prefix=/usr \
>> +		--host="$(GNU_TARGET_NAME)" \
>> +		--build="$(GNU_HOST_NAME)" \
>> +		--sysroot="$(STAGING_DIR)" \
>> +		$(SQLITE_CONF_OPTS) \
>> +	)
>> +endef
>> +
>> +define SQLITE_BUILD_CMDS
>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
>> +endef
>> +
>> +define SQLITE_INSTALL_STAGING_CMDS
>> +	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(STAGING_DIR)" -C $(@D) install
>> +endef
>> +
>> +define SQLITE_INSTALL_TARGET_CMDS
>> +	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
>> +endef
>> +
>> +$(eval $(generic-package))
>
> We also need host-generic-package to replace the host-autotools-package
> removed above.
>
> baruch
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
