Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722A2606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 03:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ACbl9rEv;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256 header.s=mail header.b=aJ/0/1AS
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43E15405C4;
	Mon, 26 Oct 2026 03:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_1l_AP97Pfo; Mon, 26 Oct 2026 03:44:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C4B8640535
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792986244;
	b=LzWfaS+PqMtAf4LVHSrLIqKiyKpkQHziMIfi0qNc9WxHfOt19j7c1sOqPizKEyUFHadU
	 DHas8/bh4c0bMnDVX9PdNX/ItLnf+dGr1ZlxMiOrDf5eQIHIMkx6bREXdbfJVV/pCZQDv
	 xIILtydeUlYQmRhwnAj5hVo3p84Mj8Wa4OZREo9lgk6l3q3GAHZtHTkQmsM53QzmvhJ5d
	 DW/zuI18gm0ph1mBabxDrAi3qNe4WZQDWGBs6ZzU95kauAY9eFbVJeSXM6cIABGkRIbMK
	 pGwhTYw4Y4mFUYNBJMJMzPkqOMS1dRbRwwIz26w1yVdVh+1TrJsr8SEL3dGFWKJ0SdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792986244;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:In-Reply-To:
	 References:Message-ID:X-Sender:X-Virus-Scanned:X-Virus-Status:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=cFZp/Rb5Iq0QZqXu9YRocjPxnoqQZXKHcW6GBpYK//w=;
	b=He0f68SHw9bPSyo+yH945BHnEXvaBEtOohKTVW86mw8aoD6yzhIGpIhwLfCC/QrSHP1j
	 KhkLNsJdW9jIL1l+eSW1FH5ca09Xy2SKydZ53XCM0+zFYNxP6cg4p+x4hEdI3LxhOfOqV
	 06XpFW7UpxwJ+eiZtKcKp/reD4G+njiB9+lhcpdni8/18Soeajyou0Th/qLh96fiXW6ZZ
	 R0vTCaCB1iNNGcWISzi64NL/7gjdUDcBdeMAyP2it91T24yzxcoCI1TcDIfCX793eX1xZ
	 rE6fLzb3zMKMoBrK+HCFjMLqKglLpDcgcpbYfsxFaX19VcoLnpGJ9rXKmDgJ8Q9NHug==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792986244;
	bh=cFZp/Rb5Iq0QZqXu9YRocjPxnoqQZXKHcW6GBpYK//w=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ACbl9rEvJVBSV8nH9AV7ekz8pblJXxC8HN1HZrNcx+gDMcT0QDvkmoa8WzZLJy93l
	 WjoWx8aU2KOitlPKcEB1JgE6uAfV1F/btkJ8AUSjlIJohkEqS23k7uix73cSthd682
	 yk9qRDHhJRorCn45LT5vOtxo8GxQn3MtASLypzLvOMcMzeF/dLcYiEtiqTa/HPU2bw
	 ET3pr/P8ru8Ou8RJgJllCC82FMkPIc/8YxIG/B5dqFjeuOa7cE6C85n5bO6cQcfCeB
	 952MxDW+sn4RF1/HGnfCYQGNEl+zNsD/lDHPf0Rcom22L2K7EJOeutxOTTdXNa/iKO
	 XR5ifTwcLPYpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4B8640535;
	Mon, 26 Oct 2026 03:44:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C56F235
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 03:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A6F6400A8
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 03:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wAMuiUhbl6Sq for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 03:44:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B003740098
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=176.9.89.163
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792986242;
 b=E1nIQzNRBda6SlQcr3O8yD06cvso6upgyS40WcSc2p5/1h1LMxCFUDIHu4CmsD+AxlKg
 snqY8yUQdiT50jm1D7/N4hZiR8GemHtigShi/OFZCLivqxANRS2fosZ1qu1fIfq72zDYf
 ikbQrXlq7VQhF1TJ8WsXX4g0Av8me+uRSc9oc8sBuKR+UMZTQeSwe3FsN0f/beBmahCG3
 p5MpkwKJp7MsLm/SS4wBJO3kP9iOsRSOHo0+8LlzlZNFh1x+mseOsaq+V0HFlNrAK9ab5
 I+yGV6rAfXYghK4MPbK+8A5pkdKfHcjfCM0L+sE9cSie/iuDLOl2edGflFlL+FP2s4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792986242;
 h=Received-SPF:DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:
 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
 Content-Transfer-Encoding:X-Virus-Scanned:X-Virus-Status;
 bh=9OvIMKo1QuPpGSxRyGOpyi1aW/NPjVfUTAGtdXft+3E=;
 b=sspunbIxzFDZcQQ+KFg/euVu9xnVqavTIbP5n+3b0loUfper/0b7MQzJDdYFHn6oIlDH
 BFH4uPg85yM+AGYJX8enL7oKyrsMhkS5Jz2qc5+43qDBdX9dGhdG86DnBR1bEkiLMgPWR
 eC0kGdyH3INtu2gbMnIuQOXySUMFt3n42WVuKc24+IPPO4wjiu/6rumdX6OVy7wYr036h
 kYG9IcJ/fcCCILa97CBp57MCFG/SWa2wKC5BIYvGkfpXHEzQHXZGim8ObGVhMOStrUKX+
 +I5CFV07mkDB7/W14IM2Tfxq5sp9RZhqlLVvfDNOd72CaxgV69xcopOihr3YuXB61FQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=umbiko.net;
 dkim=pass header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b="aJ/0/1AS"; 
 arc=none smtp.remote-ip=176.9.89.163
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=aJ/0/1AS
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B003740098
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 03:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1792986236; bh=OlWLJTlH3XGWRQL3gzOrceUqY4oT15Utd8W3odxHe2s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=aJ/0/1AS5JeXXMAf+o39KT/BhL6aTtzjfUv+HlfXBoMX9W5rHV3PnM2MkutYuNJMz
 zNigsKQL+73ziVaCu1SAOtRX3LYJL3h5SoO1nYfQSl12fUGcw4hNGk5l2JUbD8Hf8i
 1IW87MYP3A/NkBSWOyQV2VXez/yrHpyojzTv3ad0=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 14F8ABDE0EEC;
 Mon, 26 Oct 2026 04:43:56 +0100 (CET)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 26 Oct 2026 03:43:55 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <at5DqzNZnCORf3pF@windsurf>
References: <20261025104130.1580635-1-br025@umbiko.net>
 <at5DqzNZnCORf3pF@windsurf>
Message-ID: <96e48cf08edc73bcea41f56185b7c1da@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH 1/2] package/mpd: implement
 BR2_ENABLE_RUNTIME_DEBUG
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-25 18:00, Thomas Petazzoni wrote:
>> Fix the MPD build to observe the BR2_ENABLE_RUNTIME_DEBUG option.
>> 
>> Signed-off-by: Andreas Ziegler <br025@umbiko.net>
> 
> Series applied, thanks! To be honest, I wasn't quite sure about PATCH
> 1/2, because I couldn't find any documentation about this NDEBUG
> define, but I assume you're familiar with the mpd code base :-)

Thanks! Might be an idea to try to bring this under Meson control. I was 
confronted with this feature when I had an issue with the intermediate 
version: https://github.com/MusicPlayerDaemon/MPD/issues/2605

Kind regards,
Andreas

> Best regards,
> 
> Thomas Petazzoni
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
