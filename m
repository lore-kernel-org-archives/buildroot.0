Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49ABCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABA28606F8;
	Sat, 10 Oct 2026 12:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KHnmp1yuVHwi; Sat, 10 Oct 2026 12:27:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CC1E160663
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791635221;
	b=VX1gXru7sIyibTyjMFUmWRJLrn9mfL3LDgTOIPCyM15GRKmxAGnM0T2c9K9AlvSeKaDn
	 hcqQS476AMLUax+HaR1Xc8oGw7/L5/JUfLJgenbcjZdYPRxIYmCZPLO45IhgNMqrbqGtN
	 spBN+Ojeci0o52m/KDhwnHonCaysG+JVtwmDdSLuilpZ0bnIJ5qEDicJForn1ukbNIrct
	 GqF29uHnSTYTMasz/ZSHwG+siSVRhFWf55FN3nXO2KyJHtI+SMB4o49tPunWzxNsdwRkO
	 +7NDB+w4LDHKP6EYKW3i9E8Raz5BAaJ0bzCaHBzNX+8I2IQpIw+9GWI39bclODykhqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791635221;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=vekDxXH/UxEgrE5VV4EBYZBl1I1ddNUrFMr0FMbwKrM=;
	b=oLmGjRl+pepLPqZoRuoSXoqSn0M4WHaW8nwmraqhta/sXySc6RWPE1ClV7kgIsAcg2tu
	 dO8BLa5ejGi0di1tqR1bizAEr08qor36ts0keyXvTqGltNOnR/Eul1czzGK8ToVE04aiT
	 hZIu+j3OnDIom8rztpsNL6YKBASS8Gk7ft5kniJcOVC6sSkQtH57OTxpLMwahN5vWJgcx
	 28FXNBcY9rOAAREPvA5qvJwWxToEZN2LujNurYwzjiRQcigM+AcA8iSL2WXiNS3CJ3DGX
	 9ESCwBksBviPrC+dhJdxHC5AWCRntU9bBvyod6O6yDhWwPkheKUpsciuaUgb9OFSkvw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791635221;
	bh=vekDxXH/UxEgrE5VV4EBYZBl1I1ddNUrFMr0FMbwKrM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qMkTR15R+EI3IHc8sPz1oUM32JHPFTPsDAlVVgFCRs1rTXkCI1alNRtmv6uK92cGg
	 BpfSi72U6cgPuCjy8PJfvjTEYvH16TowGgnhgXckS0Vn/rcj6a7+UYG61YwWxNGuKn
	 0hMHBXNFkSsIKh9aBkSP22QJM+wjeR5IJWzMf/VkGwARn2F50yfFOuo3JZ3AdMyNhc
	 ieh5f+ZAx1NPYh9SyRzlniq3a3pfa39AoSp/VNlKzw2fNeCqwZmASRQMtkn4IjoBsd
	 ae58fHzRYw8wSr9s6HNDkUFIFjkzHOxmXF5+j1jVqEU+/V5nIRnO6eeKwZSaORAzhJ
	 l2JLkpGKCD5Vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC1E160663;
	Sat, 10 Oct 2026 12:27:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 46940156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 384A060663
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dEoT_F1Chmy for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:26:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 877BE6060A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791635219;
 b=JvSj0BOxZS8CuJBGi89zpMPJSxGLA4UBn63Cn7OtRYa5uK+PXJ8sPfE0CFRjVo5F085h
 D8UHMfl/mnFQh/rGfMyh0O3cRIoz9fAdTAFBZdjFJkkf3eBp3c2N98Tl8LTgM1CNBjb2E
 N+zuFU3aR8RoaBG+igQj6PuzezSbmPqTh9PB+6XgwG+u2MOPvekKzwxO//PimG/+XHfyJ
 WtU2IGI/nfj0CUVluF2TyoqoRMJMNoQwZzYs2UjDbrwVvoYfUMYFbCPKDzwnaxLeAaED0
 Bbyn7+YTAZ80aJdnpSwJuiPALWSuESskg95AI03NN/ZbbSxcWfnWsPRKWpcWGr31zxQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791635219;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=2rlad/2ZftGjUyBKhz0nJyCcdi0c9eY4tJDsl94uFrI=;
 b=L+E5zeBLoHdW8HCmsPoPvKaKQB4e7oWHjCWZcgqGbDhDR+muNxCXbX9ZvpcT1nhfMs17
 3f4aVOaocDSltHg0xV5Rm8oiYgTzeVzs6h5i08emFU22ALz1XW9gf0RUGHNEnDnHyRR5W
 T9Vmmm7AkNi8Zx9GI+VzaSf4nvHifE4Vv/iszg7xecp1ra4tq4Pi9zJbKaVac+WGkX1TF
 6l7/usgDESLdexmpzcyQJt+30NFv5eruLXRLyBql6tT3foFfAcInXFMBa7TejR9ENBNtn
 tCdxJESEtkqPiMNfd945l32+9vtwoRPKs0rytfwcTOZqjaolelZrSOB4YF0S4V5fgqA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ilgMgrUE; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 877BE6060A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:26:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 6619B19F57B;
 Sat, 10 Oct 2026 14:26:56 +0200 (CEST)
Received: from 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f)
 via 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Oct 2026 14:26:56 +0200
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 14:26:56 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261003224447.744966-1-james.hilliard1@gmail.com>
References: <20261003224447.744966-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <ec6f8c33b289a8c1ef37666ee6822b43@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/circus: bump to version 0.19.0
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

On 04/10/2026 00:44, James Hilliard wrote:
> Switch to the flit build backend.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
