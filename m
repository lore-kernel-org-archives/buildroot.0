Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237D7606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 19:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qbo+Z5v2
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F23D2406CD;
	Tue, 27 Oct 2026 19:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_QtOKWYvBBW; Tue, 27 Oct 2026 19:56:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EAD9540595
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793130987;
	b=LjrBvk9doPcjEa5mrXpcAgebsf4tT5O9BdChIYtJf+beTKOI4hIIObdxRZTGChAca0Vl
	 wRhXRNPPCPvt1UC7bJT77TwWfaO1Bh+ekukIXkEsnShJ8HC+rPnGOLbvdof4ec7VqwwLX
	 un7FgOV01eCrDdErH8RZ1it9vCbRKytW+io0t8K52isnvHuXH1Pk5Zm23RCkU1/7778KH
	 L29qwoE/EitDUDa88bnJ8KvhXTMqA0VuLMcdzGQn1KhneT9pcjd4ENFsMj2CMXqWG0lTv
	 phgLTNgDm7cLIDyzVA670A0FKmZcuIdzBI12y2bA4g3ZVZ+mEpj0b2FB7eHAatsOMnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793130987;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=oT/B4yXz/pPW78MpQmWcBn4oM+C1LiXgIC8IswNStFI=;
	b=akugAUXjRanxZO/IhExWyA+jYZN32A83hadXm1ROr76Q1YW4s9rhWqbj1Wxf7ENCLwfc
	 sP8rHSOrAVMkM+24PMeMAlwuQy47Oqdk/pp4/Z3u+Zi7YJcbbovZsQgD80dqo4hZmTLhS
	 6twkHchigXljVVmwdMMc836nu+KfWdZCYQz8NTqHr+liyKQ1IaREGUORngI1+Mx4ZxkSP
	 ymYRmtXlP/oYQJG3WZaKmvCmznbPA74WlSZd6afKXR0E0qoJwMo3guMAi1kvZa9KMDAtH
	 WoN6vi5eoll5t7HGI15B/cGEuTrwU/KvnL1e8FItktMp8hFlH2/hZQTHApYiD0aGYDA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793130987;
	bh=oT/B4yXz/pPW78MpQmWcBn4oM+C1LiXgIC8IswNStFI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qbo+Z5v2gaHKHTsKu4MjDT7+sg5O6fQnVhWm9H7JKnSoTR4Rb5CuEXqGAklair5pV
	 Cx3UhFwtSerUYN9HQGdcxZHzA1eOOf6oBKJSRpEqwbE6585/VWFBpZrGg2Nr+JHW5i
	 7L31IIXKcp9pFJtCvHg0KFTmWZICjuKkZGCowofHVzmhnl2LGMd9GyBq70PQd6JfzU
	 9ebBlAdwihxy3Noik0qj+JGG2vltCG8WAq/PMQo8jX/j//9uCRLlesY1VQzc2dlQec
	 /zeWR5Qc+XlQKSp0dcp4mZYUA8iPJ+n/hKII/zXVL0Vxp1iKlOpYFJ1Tgq4kA8/kPW
	 beZkjim2Ck3vA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAD9540595;
	Tue, 27 Oct 2026 19:56:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F2EE4279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8BE680C9C
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ZdFdGX5je7J for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 19:56:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 77A4380838
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793130984;
 b=QTI5MHd8prmEox24aiyJ36Qn0vjf/wTfDuGpzvEWwHY5RsGWd6D3Sk8IQSCZiMU3L08H
 JiQQushrIpsjHVJRALgFo6mUZazU2B5JoettCIOna/Jg+POWP812FyLC//ZGKIQUYFTQR
 RZP0muavfUVb4f9gTgRhgPMwJxzEiAlcBsNSk7hbxKEnNuIewpzj1Z5N7PJFebwMr60pz
 byFvDtOnoTBdtEn5s2tPsUz9beHRDYLEHriLrXIiTuiZJ7b3T+fWOS6XXkWxEL0GHmNDe
 Hof9qFZVpPFACkLs0/aZhyY8l2+6JROKM8n3XYCBzjxxL8UaVX6EcrBztYISaIBnF5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793130984;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=1zYLLs7HEl4LnqKcYjNhfPl56IaSsoB0n/3ciIHLz6o=;
 b=tdlWnykGZcX3k9YvuiRY1Xs6yCDvENVo19yTJaQF0t4ZMeQEZAIt4Uh0jAcifkt0XYH4
 dpv+v0jbTIAT3OW4dW43C0ZGIt7ciTK2WQk387m4jW5/AbZC8bFENA6xVpZgEXNOTfS7q
 JCG+7IsATlEWwz363WfE+Hg717sZQSovsAu+LBbrJvsE4Z6kwssth0QbqExKyGPsZPZ0g
 2x/ZipyvqTa42Fupo203VOTRi6bC20+06EiYBuevVO9XJgD+7qcra0BudpRVbA7PvPfJu
 62hD5q5LKdmrGPo0o1J7luYczS+lGRcuxJVMazrsqKOrtBXjAzhYDh/wIce0W/8/K8w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=2rh+AwyX; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77A4380838
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:56:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 44D144E41336;
 Tue, 27 Oct 2026 19:56:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 12BB8603BD;
 Tue, 27 Oct 2026 19:56:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3FFA810328A20; Tue, 27 Oct 2026 20:56:17 +0100 (CET)
Date: Tue, 27 Oct 2026 20:56:16 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <auEB3O5xYBwx18Su@windsurf>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
 <20261027164013.1602502-5-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027164013.1602502-5-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 05/14] package/mender-update-modules:
 bump to version 3745bbea3
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 05:40:02PM +0100, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

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
