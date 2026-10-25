Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F970606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=r4PGTViX
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C1FD80DAB;
	Sun, 25 Oct 2026 20:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3PsdJ2Jh31A; Sun, 25 Oct 2026 20:26:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 73BB780D74
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792960009;
	b=ZCr12qSa+yvaQONst+ihzyIoZwoIU5d24dkQ7ftQbnzPD3eP1cu/vknyTX2pfCd19TsL
	 bt90ri+pJ6bQDDaAvIyQMNKHMTUlUn+PFZ9BpG3nLfsYH5WxxXmotpouM+x8zdthiHOtJ
	 H998gfbLrItkA8ycyhTfb+pcxgr6z7eI/UqLxUI6ik4W21+eu6hFdp2okQeUNXczw+Loo
	 wzb0ZK0f9hgmThH7gW/fS3E7ccTFHDvwcjkUo11GR4cR6Z7bLIuCBGg1rMtlH1NZqDP04
	 hTBm17KrIXTxnNzaxf3KrhazP3TS3sFqcC288x7WDLKjhtPsEwwov3AhrIzuz+FqKSQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792960009;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mzIwzEccHHnVwpRDId9lJ7KbTlHKarOb0qxD3ItqSI0=;
	b=lwx/Nx0Xkqr3nGqvjVpQ1YHt2MpnKiK6JrHKJRPy0yVITgPwNRxtwSsbeVLlm7MwKKiD
	 A2dQgwkWBn3QHsKFRX1W+obppscpvqhxjJAyjQ90COWE/OK41vfHWTmtWHxAJDM34kN+4
	 ffjySjH77ORqhS/GGd/kyy65Akv29ziIT9suqe4JqnEajhtFurlwKSNqMYJoHlm02Wg/p
	 u+52NtHufSH/NFS7YntAmm8FMbj5VLz27TiNOfcXPKQFlc5LFSgW2oZTTDGEA+/UbguBZ
	 kV4wmW6aBBgBd6t6vDVyBOaupejrPJiPCYEhbSBJ4C7ZT8XwT7FfbhDDkTk3eAxZiRA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792960009;
	bh=mzIwzEccHHnVwpRDId9lJ7KbTlHKarOb0qxD3ItqSI0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r4PGTViXnXOxjKxEB9sAFPvwvG82JjMpCZR2KPrJ5AIbSsORjMGV5ONqQNIwKDXWc
	 GmRVCEr4g6u7DEZ7+a57WzN5ODetGwMNTS4805MwCWJ7pTl4O1UPwkO08gCFr1xinE
	 dz3pemLOzcSS6HAYw4l0zblGwA2m8yyvsBKqwq1TcleEs4qx5LS4lQtgmGBs0qeaHR
	 QScmI40ESVx28df9ZQSBeik3Wbqm8g3FDWubscbfur2Hu5ogv5S264CrPikvCS4UE1
	 vIg+iSQ03l+ACnyxg1UjIgfRkzuXblWl0WJnUiMB7tDP+3fmPGocHjTYxSNO7mgMsM
	 SlApV/JKGdjag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73BB780D74;
	Sun, 25 Oct 2026 20:26:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD4843D9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF26880D74
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZwYFaLnYmx6j for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:26:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DCB1480CDE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792960007;
 b=C6jqrATgihR/DLOhUq87i0k4ZeUyyK922j7790BZ21boyw7Kcib9ll/tt3kwqcE/HxlM
 vastah8G6lFesdXn4enD3qoKqQpefV8G8svk9Eb3L6WPrxO50BibbacwZXTa4YYODmMyJ
 dKlWrY1w5uvImBrcGQIjz4MEia7x13ag6Fxa6oEfdeHFtQ0FcdE9F7+3fhPS9OTHY7615
 8SIUGu1Quw0+feC0C1Cxoqbmi9rLTxfkkXrZ4mr/LZ+dU2NHf//E0VZW91vVsb/IkXVJ1
 Q2M7yZcseagarse+RaOa/Nx+3BNoRtTocrXNgr7F3jcoARPJDUQDgWkyPVQx0qfVIVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792960007;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=rZhWyz8CzzPVe6jfdFNuHfNuDoEEmP+a1gsuBJK3c2k=;
 b=od/DH7ZTrCJZXT5ux5tlJiZDP6W17T6A3DgMy/xtI2T9Ob4PeozyuyYKVwDyG0RVZJD4
 P6MCQ1goswRAFgWBQeCsqdoYZGQPVgoqJYE8p+X2suCf+V3QoI+m6b888K6arVdvUmXfW
 z6EY9gfmlQdrjqNqbRKOSfDKhV6T7PSaO8rqugcQXo4wtjjX52oJVDlvnpJaeQSVK7yK8
 XFjNOAADCViuzjhjFTnXSFNr1PeuoirHpdTIfkG+JI8zqwQJGqTLb7OxO2OCFrif3pPvV
 7NfLOv4A3bTzhseByKrMJCGAo2xRbxkOXmULgHYiuNItFV2NB7tGdOA1g+4ockKEtkw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=W6VcOeE1; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCB1480CDE
 for <buildroot@busybox.net>; Sun, 25 Oct 2026 20:26:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 354634E41308;
 Sun, 25 Oct 2026 20:26:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F3D6960740;
 Sun, 25 Oct 2026 20:26:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D519810328E76; Sun, 25 Oct 2026 21:26:42 +0100 (CET)
Date: Sun, 25 Oct 2026 21:26:41 +0100
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
Message-ID: <at5l_cZfGQV_Xc9W@windsurf>
References: <20261025071654.193924-1-francois.perrad.86@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025071654.193924-1-francois.perrad.86@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/domoticz: allow Lua 5.4
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

On Sun, Oct 25, 2026 at 08:16:54AM +0100, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

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
