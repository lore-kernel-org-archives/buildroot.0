Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06641606A31B
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QLa8AQoG
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAF3160615;
	Sat, 24 Oct 2026 21:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZz9Aihm9f_k; Sat, 24 Oct 2026 21:30:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0DD676061C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792877427;
	b=BTNTcqb48b8NvFgZZGAJFFLzwLmj9ktRDLtfnQijl4zJJqsuXOjIacxbhz/K7fHd2tkJ
	 mp58CLpQc0MhpquhBZO+ki3GkYOo+h47Zurh1i+LTo5w4eh6xl7XhZ2EPouGL7epPVm+J
	 dSpEdsg5uNlPp1Ok/yy1MpVnUO5yyLv8PM7guo3P8XGUA1js/OKJ9kaOwhGTMtusSWU4L
	 NFEVMcF1/Y9SKmLs/RbkusHmijC3DFaHKVXaoLuqISufyxJ7g1crz9KvPS0359nc3IKk9
	 d+qLyuKtu0+4MCDrYvgyRDe6/Vxq8sOMmpdzoTvpub/JrV8I1PNMzJVoeoHQUQzpXHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877427;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=L2vXCoVIB0FHaKZSHJlwcHdaRBWcg6bvFo800VsiGNo=;
	b=aY0bE4LuWhY+hztL3SnQ/ACY/NafMv4KFt0w7UwOv57xsiFfJ+tzTwA01QmpogF4ENZW
	 O/usPia5pOtKYOuGOiE8ZKs1EBPGlf1wKL819b4g5ALjGsCIb4nfoq43Q8/+hUXLlmDv+
	 vLPwew7H1IrPUto4PyhNUC4lXBvw9mYdWJeeuLK5aUZH32GRlreCy9UvxtGQNQZ5AspMH
	 HCCOtFndXoJ0qbr7wiJwrkpGkDzLkxygXbAgR9QAqDaTZwL1a3IeqlehROQplEEk66yTy
	 oQh59Wd3idc/oEAl0Cc3jjBzSRULdm8TeQzqKF9oS/hAQi2Le8MnxtkXpD/dc+7K5Kw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792877427;
	bh=L2vXCoVIB0FHaKZSHJlwcHdaRBWcg6bvFo800VsiGNo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QLa8AQoGFGSL8HAuzlkTiz1G/qsf1juB9/bpd/8VzNJStdbVEbNwB+b7nZs89fUiz
	 xho3ZpnowJsmqTJsAQDahi37iboWgXGtPEETR1oS1vo2i8W+jxzaKz2wMJE5DdPccQ
	 /t+S8qvUGn/RQRTF4C52TBhSOfTsiIjPvVVEXaBeEnD7CX4mqoYnvXkCilBt0OdZiZ
	 gfZByKanr9TPkftoPTQnWxH4EfwCR0YVxAkJSD9jRE/HtZMeop4nej80StKJmZvWW6
	 O4lQ6rFk1I4VwfE1+eMQEe4SkMN+6CvJ751uEI3Un+UFHktm3LDmVvB866TXlJ05RN
	 4HkwZMWZvfL4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DD676061C;
	Sat, 24 Oct 2026 21:30:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A58933D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BEEC40079
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BjbTTxDIR_NP for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:30:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 790204006B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792877424;
 b=KaYg5wr+R8nm6Xc77OAvF0qKMyXNLb0eNjpuz3PdRDDp63uFadtF5Cct2MOhMvtFSdBX
 rZCvIp25gE6IOW/IPEaHIPVPuKrchBe8eQndq5RlB1UyfEpPft1NAxPumYnTI+sxf8lX1
 W//m2S3/QjcP7hkmd6aNmajMYM4x/85rILUqzDFMtI5ukI2OvOoO0qmPjR77BdKlMbele
 5Nv8BHIRq17vM/MDXveveUAds6hkWrOUA9dWu+a4HdJvbotViyYrEouAdLGWVlrN0TDax
 1ja6DDHbbKNcck8pdrfLARLW94Agsq44uRXj2MeT7uiNKE2vlCAgiR6VRaEOQFrmn+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792877424;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=A50z6SkP+Zll6sQwesHXMyDoe+bkwYQIcgIK5w5S+64=;
 b=Q9c3VNLsPHrN1awuSKIreN2/YUIvjAV9jH32ElmpA/wX49fq0zeDmqUDM+/GO1CyVacF
 1jLS9gH6T/yzWzzK4GNnpBKPPKFJwlfRk4npJIu6m7xLu3U8OTU9gZd8wmfwze+iWIJT5
 LdOxWef5kueOAQ2S2NvYT0ArJv3RI+xohHauM7wqvD9muvYMvLacYhrXLlz/WWtUZvA2e
 31mQz2iMhdaTDDDWxzw4liK5L/0jIfH4Nm1B/CTqjI2/3Hs4HbUsRdLsuhfmE6R89qDWS
 kUEV7sATfMRuCb4gTNc1SHjrWIky0GapDWTi1VsTb0eOFi5PP+kE2RPGKhBioWSti3w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=rpukjJwn; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 790204006B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:30:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 56E174E412ED
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:30:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 255F660769;
 Sat, 24 Oct 2026 21:30:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 404C110328DD2; 
 Sat, 24 Oct 2026 23:30:20 +0200 (CEST)
Date: Sat, 24 Oct 2026 23:30:20 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <at0jaGdApoh3ThUm@windsurf>
References: <20261023233005.2692911-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261023233005.2692911-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/rtai: fix download URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 01:30:05AM +0200, Yegor Yefremov via buildroot wrote:
> The RTAI download area has been removed from www.rtai.org, so the
> download fails with:
> 
>   ERROR 404: Not Found.
> 
> The website now points to a GitHub repository holding the former
> rtai.org files, including the latest release rtai-5.3.tar.bz2 [1].
> Download it from there, pinned to the commit that added it, so that
> the URL doesn't depend on the repository branch. The tarball is
> identical, so the hash is unchanged.
> 
> This is not caused by a Buildroot change: the download URL has been
> the same for years, and upstream removed the files. All maintained
> branches use the same URL and are therefore affected as well.
> 
> Fixes:
> https://autobuild.buildroot.org/results/24364819229d65dda43a4294f26a31667e7bd77b
> 
> [1] https://github.com/mmorandi/RTAI/tree/main/userfiles/downloads/RTAI
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
