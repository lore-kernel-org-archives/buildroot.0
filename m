Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2772A606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 21:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qf7unZND;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=aTVmGT9T
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC62840C75;
	Wed, 21 Oct 2026 21:29:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOj_5m-cjyrh; Wed, 21 Oct 2026 21:29:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3B6BD40B3F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792618181;
	b=W0kukidpa0x10yj8202oHEnrfG6biQbRybbo2RHM+skja1KhCcmhSc3qD51Pt7w127Q8
	 a1qG9HZNh4HbQpuya9Uuy0f/qMoQwu6bmAxvFIU6A6nxx32RPQtX0m5D9MPFsOLCKJbOi
	 h5UlnPmCvWc1VNBRx+kMtjUDl0g+l2w+OC2epVG04MRt39nKqeCnWE7jwT1ESTn28fGPf
	 rgVJQp1eJNmKrQl9t0xc8YcQHM2h8cQEf2nww048h7I6VNpQUzk49dsvi+KLQLs9oMZvx
	 IM/Ws9GvJTLpdkkO/7KypLwfOvLnySHE+zttVwYabSVdkcTJ6w/zGZZfbTvURAaWsjw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792618181;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/SMMJEDcIn9/By3jBPzdG5TC+SCBhf4c0omZxPmXJU8=;
	b=i2gk/69yxPBtbH2vmh5N96cZGACNzwxvyPS24/x2ymE3piLVVGOJPH57Rn4rO3V2pzUa
	 TKkEp/ryNADDcFkBwCqhmW21MRAM4nKvLvImyo6AMU2usTA8gc4HHZ+CvzcQqCX3P+UfX
	 mOFlLTzw3TqXMtDGKxIDqbkI4iloKmX3MWkQBi9b+847fci/nYve6ltF9ru67lfPNmCBo
	 lLxLMpJM3BcjMzpV7qA8Onsvn92GFzuFeaA1DFlozaJ9izi35my96Ub8bQXu+DNclJPT6
	 mINfdozr3vbdlcmklqf/loAnSGT7EY/qkZ//Uyw/0u+edEivknH859BKyyQcF56isNw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=aTVmGT9T;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792618181;
	bh=/SMMJEDcIn9/By3jBPzdG5TC+SCBhf4c0omZxPmXJU8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qf7unZNDqysSw2aT4kV5IuSsApGN6028U52hSPaxt9kUKngF3QKU+R8qyoKH0fy7V
	 t2urr6rbcAdYCt5kfE9Txq10TE7RYUP8nVlWOg8pFOe4Tk5qf2rRbvvodKIoraO/Ef
	 c4Hmk8OSNadRw9pUZJ4cjWSMqdrGhmbB15fAuYcB0sVd9n/eei4Ym+3j2Mwwp92+du
	 oY9JICZHYhMG7rglmxzbZz2vU87hv22tezbdRAkQqnPVhDRyShtY94plokudSaEciC
	 3Suh3AnjQF/epXVnsBkr192tBjriXzbASc59ovkHXhaomM3Dy/keVgHsT6LRjZagSF
	 S6+ikR4p9bSrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B6BD40B3F;
	Wed, 21 Oct 2026 21:29:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA5E61184
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 902F240C3C
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uAcmGvYiMLm1 for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 21:29:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 77D7040B3F
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792618178;
 b=lWQoIwEN5v8dboi9RRwpvCK7ngjzyrvLyND6lDbm6hdDnXZt0LfSTbFWIRGE51n18SEI
 wIQk+hPIVQW/4pPUrWoZmNRBAiCEv1Z5r5GDy3GjiAf+ASKIKYJrkAGDrgzOlG1oq5mch
 8UtgxAOsdSgUvbySxqRFUPEYpH5xQ31DWEX5iZIpN1ayVbIO6PdMtLImgi+hZRQf3GCX+
 TnjCDjz5f22KBJWWKLT9waPaNfq5zJaTI6y98HPo0d4EsTvRJQnzzYwq+0i2qAEIbzhCS
 4pWAIh/nD+rEEfrrlRSLbX1HgQ6N3FLKvcbmSrdsycLqrIe3etUOG5D1fXOnFusiobA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792618178;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=O8t4jAHck1jzGg7Wu1jxk5km8PdW6lToJlyGj56B4TI=;
 b=Jz1c2zS7FPg3RVKvmLBed4DU2VltbJWeM6fW710iqtTKYOsXV3qCgWxcr1rDzn5j3RRu
 aMAatEOSbX+ss2ljX/+/7DCI1iyxWNHAHjkjWOlnj+Zfl7ZbkC7LyoThl/cQIS+WeqyjF
 RuHPQNaNH0H352OVUoE42QLerLezmqNDyxpMzdXR1DF8HD1hgTkDmALUrMWurlwCRUp7C
 F6YeXjAeWAUO/IncoTy0XDleU/V9QZp2PwFQHDDKSQrTGUE5/okeoxU80HXlyoSpHfEgq
 Q0iZ1LFcHWYwsf0PQdTD5TvNpwz2V1ESIt2mAvCzfYInJikTRE2No10KGSXjWZF8mYg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=aTVmGT9T; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=aTVmGT9T
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77D7040B3F
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:29:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=aTVmGT9TSVukWSyQhtvaIh+aS2CqqM42RlMYD07RCPgP0Jq+CT5HqSNshyTNNsYNwh+xsBeRtVrcanLsSCFOfIdJafqgGWkyt60SIiMt95DguGI3IWGA/B98Bq2mPYLdnDqlzhzjibpyfypxRmcPc5393kMPGFdrCWt9BTQu6tN85kdAOK6ybZnL/y73xXJb+USuFDRs0u5TodViV9swcw/Qz8Ej5zhDd71lj02DqDdFUjzPvDLkmj7sabuAdmXtVWV9SfhimK8hjRD9LgAQRIpkWilOElylUZf3FCjR5W01qOwtGZai/CsHPjBVkPpGEjeKTxyrkyKdXjCXaCVqLw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=mmp3mNRkPVbqpJ/o6hDKCzrXVDGYyEXM/d+dtR4XVM8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -408879672; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 21 Oct 2026 21:29:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xJdsJ-00000009aQV-00Ao;
 Wed, 21 Oct 2026 23:29:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org,  Julien Olivain <ju.o@free.fr>
In-Reply-To: <atkbIM2X44OCSixP@windsurf> (Thomas Petazzoni's message of "Wed, 
 21 Oct 2026 22:06:53 +0200")
References: <20261020102906.1918308-1-peter@korsgaard.com>
 <20261020102906.1918308-4-peter@korsgaard.com>
 <atkbIM2X44OCSixP@windsurf>
Date: Wed, 21 Oct 2026 23:29:30 +0200
Message-ID: <87ecdirbd1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/7] configs/imx93frdm_defconfig: new
 defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > Don't we try to have a readme.txt file for each defconfig?

 > We already have board/freescale/imx93frdm/readme.txt that covers the
 > freescale_imx93frdm_defconfig. Should this readme.txt simply be
 > extended/updated to cover both the "vendor" defconfig and the
 > "upstream" defconfig?

Yes, the existing readme basically applies directly here, but I indeed
do see that it explicitly lists freescale_imx93frdm_defconfig. I'll send
a v2 with a line added to the readme.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
