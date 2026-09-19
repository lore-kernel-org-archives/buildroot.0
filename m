Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBC5C982CC
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 12:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BFF640A59;
	Sat, 19 Sep 2026 12:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYG5Z8nrjIXu; Sat, 19 Sep 2026 12:25:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3F69440A5B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789820726;
	b=B3J76GyQwsg0URVhCaxK55ZwP1jN3hbaV757xhLuz0bwUJW1v38PJFIBVdqsjz/kVz1/
	 ilqeod9r39dYvh5XR0YiGS+HIOfqz7zhWQzutb3R6NvKXT4dfTo5lyAYMq+GLYf0DLo6a
	 dotVMI+A1jmeLSOtmjfG6/dXAHV4deHqaJfliQndpPceefYWuyUO60Ht6ucr13Z7WJQad
	 JFyYLoK0XYB45sUnC68BUMzJmHvv2Y6Rcp+xvkBvDQTO9l4SOUTEs2NLwcLyvlKEIvDM5
	 ZKmIapGAho6A4hzVKs34MMdgoX3Gjz0vPcTvHPZfFqr73SoGTaTq64OdQDN5aCNqGqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789820726;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=qD2u8ZJXoFeDOJnZZ/DSN2jZStXnFtc0dfgVxDPPs4o=;
	b=CU3/A5Fhr423+kFbc6/JOSAFxInlDSt06JLv5MJRaDQgvDCUYccwpdbrPHos1jXJKQY9
	 JwsacNQ2iCwbg1F1pHMwrdQ4u3mGVXWEqq5Ew38uhXc0MGii0TN3QSRRIMSF1RWLRY00H
	 6aJueOwABSZ6nVtQlYlGGenuH3WHFgG0CdORdKFQAHPYMwc2wo5dzocDjgsMa4bY0Ofz4
	 SRxfovDjCAx+l8PmBKBvi9ZuS5S+yJ+6abtYGoJZbIVt8Tf/xr6OD2uD7tFlEV9rxgH7x
	 kVN4Mkb7ffcHsJuHC/X/Iu7iFTSnvq3Edt7+uRkE77xJx1NIAOJG5T2fygLFUPx+3bg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789820726;
	bh=qD2u8ZJXoFeDOJnZZ/DSN2jZStXnFtc0dfgVxDPPs4o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V9OweOgN5PQoDJP1rgFfQogVY7+qF/g+oPAsuaq5W4yHhbOfKJZhsVhbGDH9BaMun
	 9IV8keHOi5zm41b/yoQah48eM1SAKAEDnKqX4nC78r1UnMmTZFitjV9WsGgGsMmCqq
	 moSrkprOBIcejPKNggQMFI5FFdcCcmpiGQKCBulBPr9wF1ekISedhyf8ik3r8l3exU
	 X5WdRJ3ajPidZ4c5ElmJOaR2Mrm7SEQIMVf5m+s3P3D9/11ueQ9DurstzjVA1dojyw
	 qFZBn4Ak2xfk/Lv7Zh/ndqEahVmt6AVroTRYa3u5SbiJvgxTGaVljk0PEFvqn17lUX
	 LIyJyX3ildDeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F69440A5B;
	Sat, 19 Sep 2026 12:25:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 14EAA362
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 12:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0618C60678
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 12:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXxXYYooOaPs for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 12:25:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4BD9D60673
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789820723;
 b=j9/jEsKOBTf7+L4+nvCf31p+SRP7sg2SqINZOnAIaR7b2nJCNa40Sw3VQfYgPs7vo9O/
 45+lgSVyiEn9qrhQjVWkpWM6ZE1eEhCfUwP6cWPct3DWDHkjOD8ehAtY9u5jO/yP9g3ro
 q0JYAUfI/hSODtkZEkK/FA+SoFMpGzskHbRh+/DIRgpaLODxtGEosJP4+LnntQ7kGZQZz
 ypR1oFIGGxCurkCBNdDiC5MQDclISxzykTvy5pRNWerSwsV+viqvJtL+ZrTdixNKf8k6Q
 ZT4Uz/XPfWW0vPmpKkjxplb7kUGabo7tL3rcRUQGy8j4DQJSnW9PeDRMIKvOUKoEu5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789820723;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=d5Ae+FJKnDE8rsi0bVwKZpp0xt0yfhA5IJFnA+nzTL0=;
 b=hJ2/HsuKEb3JNrgU5ncnAkdKk64aX0lsEsQAOoIH6GmwmVxBx6jeoFG+ta+40dwe2DsZ
 gq63ukXn3WNImQlbHQShnowecJfso5LZVfkDSopPW2qb0FquZXYNWMTBqoH77QRTIiX80
 KKtZ2t/KGZiRgYIDybgiZywFniQ/LvsrXrGbIg5AQHVxsb7uR+V1oTInaGbTGeaNg0sw5
 qIaVsUnCCZfvqpl67npGRv+l2eCuhnUHC77yEYmUaoh1I2XjaArl33ZYvug85kXV3fDaK
 7Gcx4J977HNIJAv9rBqzFVPdGPNX7J7/FdQ0rneU7b0zP614aVzkOSBU85qC1J34FJQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="Wo/SQDcG"; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BD9D60673
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 12:25:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3A2507804FD;
 Sat, 19 Sep 2026 14:25:19 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Sep 2026 14:25:19 +0200
MIME-Version: 1.0
Date: Sat, 19 Sep 2026 14:25:19 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260918222220.3573878-1-bernd@kuhls.net>
References: <20260918222220.3573878-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <4ceaafda4961c234c5bcdd5b4a4c917e@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 26.3.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 19/09/2026 00:22, Bernd Kuhls wrote:
> https://github.com/intel/media-driver/releases/tag/intel-media-26.3.5
> 
> Rebased patch 0001, needed after upstream commit
> https://github.com/intel/media-driver/commit/04584f8839ff773f18e4b1542618a00b6fc4de1a
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
