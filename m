Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC6BCA6007
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 14:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97DFC80ED0;
	Wed,  7 Oct 2026 14:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PVGLzjwMub0d; Wed,  7 Oct 2026 14:44:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D4E7480ECC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791384290;
	b=r4T9Irxy2Q2nvNDAjQwe4woROcAyr+CJ63ish01xiKmlwYEY3JV6KUH2oSh+7wCVLp98
	 jDv50oqvr3d6CZQF1Enyg9DJD9vVbyuEV8sIxawEBAXR64siNkA074sKZNprw/hy0EcUA
	 h6C4OTzpIyabHSTIqjrG4KrHsJOeURggjXjtxb0p7Lt//LO5sZhvBqL5diGjqVicFLr/W
	 v0tdWpeGCJ7aw65eIpKhmHe2FA3dyFxwhsaju1qTpZkTTC6eeMjb8tTXVyw0M24r92FN/
	 aLff9rEX/hXA+79NwXHKeq9jgRUyuTxl9E3/GVDrS4hmPVcBLgFaxJC9MhmqkOxwitw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791384290;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:
	 References:Content-Language:In-Reply-To:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=0XFDJgNRZjQzB7ukzy7KpsmLwUk/AlLLwsP5/Lhl4g0=;
	b=papLlWeHI9Tv8pvQIalInhx1ApbKO8RG+c8cSq1mbxeZWJnoajn4iEykKb7uua0EIqU3
	 WthZTi65sV9n2Va4tuKdjEQ4knFNPkIRD62zGA1PfBrcfTALtl1leEuSHSOBbTwN0U5oO
	 24jUTmdxvpNvzqxzDpymT9wCl92biyuqY7W7Q/Kg13/WJaH1cIdV5iAvnzgzmfnReJDvQ
	 ak348bFGv/NPbyNnBLjWsJ9p83848vgbLjo/niRgNnFQ4REhFON/ti0STfwlztCLg0y+N
	 KUfZnkODHfmogK2wAuYE4Pj9Tq3rri8Q9XSkEEbL9khpMB/pxiu+yBr4vLNm4VixP4A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791384289;
	bh=0XFDJgNRZjQzB7ukzy7KpsmLwUk/AlLLwsP5/Lhl4g0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=POhlptrvZhvlvcto77hc7pE6Uf0U+mhPuvk+aYXyJKrMCn6Xh5zQKxh7LIEIT8UYP
	 O+S4br400z6Qnn9vV2ztMUe9Z/a6y4YVsV/I8ur2DCUH2/1/j8B4G5L9PcnkMx8pkX
	 lWO/cOTCqY++NCF5IZZxqQ0IUmo5A2pnK7uAHAHjkJe20eXCAXBNgPJIgZIhBkALV4
	 hcxAMvtUTvFRhtb/5JKWyEMbAPQw+ATO0kllboEi9R6psXJKB7nw/52w3UxYoAkvju
	 uJyq20L647Pt1CphiEBihv3hytpxoJIYPbe1T7781QQVwJezTrWEpUUwBwBB20cUlt
	 M/MaD5R7DZVDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4E7480ECC;
	Wed,  7 Oct 2026 14:44:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BFE222B
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 13:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7233B40057
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 13:36:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lShszOLPVVpU for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 13:36:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org EA5F240049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791380172;
 b=oeVpIXlU/TfYFKg+AtD7RIbRi4BpVXHiTiaB/s4wjp2Wc17Bn5mQfZ7YZJHd2fbUDu1n
 +D/bJpD+dYQNDtcuqbTZASU6xMBJXvfNUH66THUvIf7AAg9ts25Kibf5yXeWawaIldbJ9
 QmpxziYVamFndTtTe4SW4FV6+cavJg1OkmDbLly/EuYLLJamfjYCRljGyWaH/6fQmjJtc
 nOJCO6ZdCnxd8tSeJLQMMOyk5V88Ih8tkj3p5Zg549v52V/roTq53+BuQ+wBve5SH5YLf
 YtEg8wtc4QeBrgmEm1BoCSYGAfGTTxBr1ZWkkLWeVL7H78V6R27DsaQcU9/9hRr2Tfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791380172;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=jeaBP1MQgAu5jBEfO/9Jvrro8jnK/ukO1xvchCJ0fFI=;
 b=EP76X0r9a4o9t/7PXFlT/zTOO5uWWzga+GmEHnnv5Rru9+5PLeuv6Fylv9gkQmg5Mwlk
 OTsRd7zAsLB36HvXMTDfdkXKXgqNuM0PjxlLB1n3nMKgGze4G7oQES31zvr2speiwdDpb
 HUqoeE+ZZ6TbHpp06Mws0WxQkN70wjZYXs8T/vb7iF5vZgsStyPchx5ozHCtKZ3SJQPAV
 1MJRwDzWx/iOERApvJP+lW43b67nj2zhjUR5IPFM4MQsgvONGN5Pzw4PsDvFEJlrjo/9z
 CqRxmxWrtDu2BDZGJZnemqPFCvbxbPp91hE2rQxF3FMbgPP2aLMXyVNImRDK7ohTh1Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=nvwAAr7G; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=bastien.curutchet@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA5F240049
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 13:36:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2FC051A1122
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 13:36:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 049316074B;
 Wed,  7 Oct 2026 13:36:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BC82F11D50077; 
 Wed,  7 Oct 2026 15:36:01 +0200 (CEST)
Message-ID: <37119eec-f213-4fca-a54c-2c4af2b3d3df@bootlin.com>
Date: Wed, 7 Oct 2026 15:36:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260727-perf-fix-v1-1-6bffb9146263@bootlin.com>
 <asYn5Z6J9aX3h1tS@blinky>
Content-Language: en-US
In-Reply-To: <asYn5Z6J9aX3h1tS@blinky>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] packages/linux-tools: perf: explicitily
 disable rust if not selected
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
From: Bastien Curutchet via buildroot <buildroot@buildroot.org>
Reply-To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Charlie,

On 10/7/26 1:07 PM, Charlie Jenkins wrote:
> On Mon, Jul 27, 2026 at 03:03:46PM +0200, Bastien Curutchet via buildroot wrote:
>> Since kernel v7.0, perf uses `rustc --version` to know whether or not
>> rust is available. If rust is installed on the host, this `rustc
>> --version` works fine but then the perf build fails with following error
>> (on aarch64) if the host-rust isn't selected:
>>
>> rustc  /home/bastien/embedded-linux-imx93-frdm-labs/integration/buildroot/output/build/linux-7.1.3/tools/perf/tests/workloads/code_with_type.a
>> error[E0463]: can't find crate for `std`
>>    |
>>    = note: the `aarch64-unknown-linux-gnu` target may not be installed
>>    = help: consider downloading the target with `rustup target add aarch64-unknown-linux-gnu`
>>
>> error: aborting due to 1 previous error
>>
>> Add a dependency to host-rustc if already enabled, explicitily disable
>> perf's rust part otherwise
>>
>> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
>> ---
>>   package/linux-tools/linux-tool-perf.mk.in | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
>> index 3238948d76..9718d83121 100644
>> --- a/package/linux-tools/linux-tool-perf.mk.in
>> +++ b/package/linux-tools/linux-tool-perf.mk.in
>> @@ -134,6 +134,12 @@ else
>>   PERF_MAKE_FLAGS += NO_LIBTRACEEVENT=1
>>   endif
>>   
>> +ifeq ($(BR2_PACKAGE_HOST_RUSTC),y)
>> +PERF_DEPENDENCIES += host-rustc
> 
> Even with this dependency I am still getting the std error. I am
> building for riscv64. Does this resolve for you?
> 

Yes it did solve my issue (on arm-64).

> There is the Kconfig BR2_PACKAGE_LINUX_TOOLS_PERF_NEEDS_HOST_PYTHON3,
> maybe instead of depending on RUSTC when enabled should this introduce
> an option similar to the python option?
>

It doesn't seem needed to me. If host-rustc has already been selected by 
another package then having the dependency enabled should be enough.

> Rust is also only being used by a linux perf test case so it's not
> really even needed for regular perf usage.
>

I hadn't looked at how perf use rust. Maybe we can always call NO_RUST=1 
then.

Regards,
Bastien
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
