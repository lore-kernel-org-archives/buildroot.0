Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DC7606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TFZSu/4u
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 477A860A86;
	Sat, 24 Oct 2026 11:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W59f1KN7kWt6; Sat, 24 Oct 2026 11:54:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6779B60735
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792842892;
	b=j49gVJJcLlVz/pYxfL73+aPzsiTEgFgqJkL58VYTyv1It7T2C3BmCMd56NVROsdSCEGs
	 ZL2+Rt517WbCUHN33FCkBtM4/KvbImJVRSLC0v52n7zADoCQy3b8P5uJkxTz/wnRq1oti
	 4pEFXo0tzH1FTzT28niaMXOReb0a4mdMAMr6Riz3Lz31+9o76ulNaYswDgeMm4HE7TBhc
	 tCVYR+b3FLTV5aDk+a6hBrrjAAPdrSzDXKlD56b+E3+Gnsqad3adjuyOKUwhxKh6H/dB+
	 wea68+d7Wci8fkcWcVcLN3urpSDa4r86FimxzhGuPcu/5AEYfulo4LbwgxKwCjJ4kDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792842892;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=ozKL1o2yl+RKDzmql5bqDMxCP1Xv9VLGfe/cU27TLDEpIfa9Sa4PbiblIIhzaVsaPB5W
	 SVYkFPMLBJ4Mrm0bOoDFIASbaKuboo4kwkXNWfb6SmM7J/QCoSzC591CFrTdLDf0GU0Fg
	 B1XMdF70TtrWtHLPhvnwNutVqb0CTDgAEhSbgUUNtV8XhTT1rzMiFT+6N2SeeZF/ng5Un
	 vDaV37lXos+raIfGlHsGYNlBrLXaml3VpleyFCM4ypLavrV5VuC3ex7TNFZ8Ju815xpDt
	 cyuBnQRGgH2qfHWyLuld9omPCOxwAOHqNPiUP0d7crMFZBZFzODL/RK3yLkmO9c7UEw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792842892;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TFZSu/4uUaGS3HTfs0kONowvsT23DD7nTf5qPZLv63qIcUiD3uhUjAsjQOHOpXBxh
	 bHzTtfZLPZdoOEcEHHncoTtfdm/l589TCTkWeInbn+XfOu00bGOVI5dEzBHCRtEGOM
	 anqGlBcuDYTedqL6YnuO2mGS32SnuwWc4tiip18ge8vuX3CTuCbiQTfJcYuQ/AqC/9
	 oTc41TQLQIpwIqVAQ5T5isodz4oQa49sY+k25CoJf7hPiQVlf+tEwLWVoTsQadjXoi
	 FDSdPh14zPjEO7SXG1Bxw5ietV9fsYI/x2Bm/txONp7O4/ej+ZtJH6UJrKoiNokSLa
	 z9MHFbTl44Tsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6779B60735;
	Sat, 24 Oct 2026 11:54:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E61FD32
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 605BA4007B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NPnJYjZ_Pbx for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:54:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5189640068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792842890;
 b=Z+l9rG+ALJn/333jU9qDwUidF9iVe9VAa9Y4v0cpa48sT8aDD09iQ7Chl5MX9+ahYn0e
 KV6wQGlI19wA7pt1/ffGwbPfpNg+btmxGpSbWhDDxRdqvhpUJdY3w3qxniwQaB+3g2D2I
 Z4pf00u2L3B8e4RESZo3EbBaMieLBYrZYbSlHuEN37NNPXn6t2xzSGZv2PWFGgIAOpuSs
 XGNMRsgXG+2wFBFkg3OhMwL5Kz076cf2JnPrTMnSJAU8tqw8dsED84ap0N0fhyJlN7ESV
 8yfXWpEHk9wNc7OPHYvfuihBgs/XInLLKaMiUh+EutPxoB0XSmKmVTuJJOP5gOxo+Ow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792842890;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=N+UN0NhMV8SP/VZa9vHFn3g0FOiv/N9utcH+9gRMWOq9KpD/kAQsK/JZ+m2AQ2hX0u+G
 wvsszRcFgcMtI/4ShdT3R21sIoefJpUMs5XCakXqY05/M+TYtkW1rV43oIJG2Vld+UMZL
 eZtg/PSGriCPw+GM6PSWOSSmxh3wtJG71KZWWkHyVhBplteN4TqXFa2FrLT8sJRe6EfbV
 0XZho59ZycuA0CHsb5yvmOrN0x8w78GQVs8MQnjacey6vtWkODCxT7JhlvZJLEhpga3Kx
 08h2uTObtHuwTuAwas3VGpau4fR6h5sfGR+dBzV4ZJvuh1WF5XXofPcEEm05imtzQ0A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="L/ASYmkk"; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5189640068
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:54:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 16F13B00571;
 Sat, 24 Oct 2026 13:54:46 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 13:54:45 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 13:54:45 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Flaviu Nistor <flaviu.nistor@gmail.com>
In-Reply-To: <20261023181818.920329-23-james.hilliard1@gmail.com>
References: <20261023181818.920329-23-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <2bf77008139387adad7c964269ac7558@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-snappy: bump to version 0.7.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
