Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F7A606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 22:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BEjcy3Lx
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 351636065A;
	Sun,  1 Nov 2026 22:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W5XkA7TVm7dN; Sun,  1 Nov 2026 22:45:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5D25060616
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793573135;
	b=NDd2UpOFekICnMsHMgxhAtGn/08laz6+m/eLeGPCmWIfsBYQglt3/JNL6vahv51C9kAt
	 A2TkF9JwXVusfZhVg90I53FvZAIoOcXRO6MAS6m/lKh1ZrxQmDliHEk3V+SpHeWdLb9ib
	 IxQg/eBrgCnwbyqCAORvLiItBuu+U3BQorgJ7beLOmhb8xNLVjeNLtJIplG3VUx8/tU8x
	 KyoynkKN/0Q9s/PEU7JAxaL781DvAh/JsvrYehMGZhKHg/USX8dFSQZA1Jg2BP+BJw1MX
	 7b3qK5cUy6UEVlmEBKLqA5Rwv6ECUNtnL1khXys3UO0miKhxixAN1ggn+UjhTiaFWDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793573135;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ew9k5G1IdgkcgPHWBkaTGTePxvN3sxdDxLgZylkm0ps=;
	b=j4cS0zRzvzpY+3STvFym1NrTDqivSAqtHM/nYyKOydxmO+B4f2XsNzLfMHuLZaiw6uNs
	 apsn+4k/ygQ5b4TcNAuSk5rH+H2LpUY25PhxkbEIUqp1hYafNDty4gJxpSYDK9Q+fsnHl
	 iRJZXr2o5LQMbN/U+c6Q0qzryUvu4pnQeRnSGQNU7d/pWIzwhiZBUjor0b4tmhRfjIuLO
	 q5dCj9YMEmtq5mU1zZygqho6Leq9FhZ+6RsTzCeSRxhCxTXenVzivjeguBlZimopirrE1
	 13aPHyOS3RWWkGI9OqInpD02sUyJPi73DPJkRN9GWKs7pxsuTUNK/DzC7ns+6r/aVcA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793573135;
	bh=ew9k5G1IdgkcgPHWBkaTGTePxvN3sxdDxLgZylkm0ps=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BEjcy3Lxz2XrmueQ3L8gx9L97Uvcc0z9HfkcmvVtgSLOirVDfJmzSB5C0qPC85aS2
	 wQqPNnDNrkert5xUBl5mEtojxX6MM2abpVa8IB3hAp9uSmq0sMf3zAnxh3WrjEpD40
	 LJZMi3hzGPDfavFjuHhSYd90WswIdoO0ohVC3WdT4ej14ik2iokFXzVwgvcOf+3fQN
	 UjOFShzIfMgmtR3kzSvwxzfvkr+tEH63Q4JPluiA/IR0UgIEwO1pjsJzslGlMDfjY2
	 UsZi+M667f6Iz9D06ygyaqn3QuVxSTm8sYbrcd1OGZ4lHvbD74MVEXtetyIqQSEhTp
	 GcNAX7uVrwV+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D25060616;
	Sun,  1 Nov 2026 22:45:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E78B435
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8452560616
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tsw09f5g1Igc for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 22:45:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7BB816060D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793573133;
 b=PpixX5ZSbJVkERpZPaGAxDjyMirdsmchxbO+3dQUjX6IE6bhlj8A/d0jui81daBd1/SP
 An3mZOABiCCdaIe3zTCUxu07jNmW/HKPLB9cO1p++CQZ8CYdWxBIVPLvlmrTZFabSzTvZ
 Fx8fG+JCzg4PJ/4u10Q5B7rSfO4vmnf56FM8P0XaOFa2uw7ZrSZQPjBhnxOFyHG/0q/YF
 WujyBwWEHsmNNMdJCi/e3TCUSWkbV8Sn7UKhX7Xg7idVHStNHpW1y6Z+iWNI2WyhmddSC
 26jir+T7aIpb9j6QvDOtfKXNZ1jGzv0ioseS872tEQZFvB4uKA2XwoICb7rGEcdWQEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793573133;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Bk63iU9mmZvyqMHQKHMkOO4sXIpqbOJx2w02214dK9k=;
 b=c4cLFrFtRc60Iro+lIRXQVu1qPc+6cAfO48HH5AZFcxceC+98jYyrv+tH9jLyQI0G4L0
 3D9glI9hHs36gbJw6P95XRNvJmVhy3MKpk+yRWpJvKtJdRe4N6ED3aFWWBx/XfB4EBJRn
 fsx2c+BRyLJBZ2lCUwoJSUFGvq2xeEy/oDWSyhY4ThsoIr317Ma8npslO07ijO0OZULng
 MiCzRZH6/a8ENOCngdOeo26uVr/gpXuNF3E7w75CZIeV240A1lbcr3PEkV6hZ2v1sqyP1
 XyU/omldPmImq9VdmIEFUqVaQq8Cpj2KhZ4/rZ0SkR/dLykttLkbjV72OxdOKw2E/gA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=IcpvPlIO; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BB816060D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:45:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E76FB1A13FA;
 Sun,  1 Nov 2026 22:45:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A653460750;
 Sun,  1 Nov 2026 22:45:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D47CE103290E8; Sun,  1 Nov 2026 23:45:27 +0100 (CET)
Date: Sun, 1 Nov 2026 23:45:27 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aufBA5DsrJPPxbrk@windsurf>
References: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
 <20261029144400.2972217-3-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261029144400.2972217-3-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/9] website: fix HTML markup errors
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

On Thu, Oct 29, 2026 at 03:43:54PM +0100, Angelo Compagnucci wrote:
> - news: the title of the "New logo" entry was written as a broken
>   "<new Logo/h4>" tag, so the entry was displayed without a title
> - news: add the missing paragraph tags in the 2010.08-rc2 entry
> - download: close the "Downloads" header cell with </th>
> - sponsors: add the missing closing tags for the row and container
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

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
