Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD63606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 12:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RNSLMcFb
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8850060F38;
	Sun, 25 Oct 2026 12:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8RpUzsJ9nEFG; Sun, 25 Oct 2026 12:00:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C52B060F34
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929625;
	b=UPE78h0fUyNeMf6aRgf9OPpQ1/65Q2yR2nYNr2JibdMUxs13VdVRP6ib8ZfJsP98176c
	 C+XgMk76DyUuOc3AunPTQn/lZhQBEB5VgQLVIKcnf3zjG1PcvLvMCJDs3QpTszByd3VNt
	 Et44M4/YzAwsmLqHlQTQu6/nAFMDyAyOZ13PQcj3DcpSnq/wzDxKNVX3FGp3acwkQsxKC
	 gjOZN3ZPeIkX1x+sDb6JjwGZYeLQSIu3dK150+HPAICeOFxr3Qyu8TpALuwlDI/dT6G1C
	 qDX/NjLBLwEs7CrwsqqYmhAS62ti2AzQT1cRuKySRxu6M/G+eWKxEb8mDIrTeMXiB8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929625;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ZFd/EE1hvXpJ2Kh9Ha+WKtloYMOSRYpRT6JAMqxyauY=;
	b=Wt7V1cXViGR3a1yjfr+nZ7YKilzDg6Zqfedfcb+OodRTg+5qR8XvekINi17mScvF+hkT
	 0Jcp5cnVmfeagYNXMxG/DPyL+ORs47MnBEaownOfIYtwTCAvzF2SNpZ/Ao8/avTjbZfdF
	 OnJbaYqcaMY7vXXR1y+g2WxWaz+YYXn2f6Qqkz9OX43E08JEhVbrecTZE8u7ln7IhwKCp
	 vzmVAWbybtJCdUhrsanOvC9FEpu4dDfaJB5JoGsGBi8nW2zP5I/VHZwk70ndHsvlWm/fH
	 Zy+NWY9AMXLssvFTaX5g4mB5A5yZqes3DZkATiUobHyadi3bargB1q2/A8sDHcMGMOA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929625;
	bh=ZFd/EE1hvXpJ2Kh9Ha+WKtloYMOSRYpRT6JAMqxyauY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RNSLMcFbMjLJSkR2oQvhsiXxqSvg6GaYom4mg9v3788hKXRSjYtWW7VWDALFWBz5P
	 5T+Vlf7+T52kRsc/57kvwW5UM7LHO9/CmPikAPwzw3qoHplxCx8cGsKrMsRH6rYZdu
	 F4+f3d47DimZXAUA+ojaEwn2U2RD+JEDMFN0d1sxHnpMYiMGHKHT9nvDf72GW6oRDE
	 QEqbUdFQpx12C2IW0wHdSbXmAlb8OfyaQ88Osbg1R1sReEB1zmuwcCaZM/kXIPXh1q
	 /9EtdY8x9iOWXPI1eHAtgp5N/zlgghH+xZtnObiLfH/G7HU04D0/+EaUI6ZQlLlIWm
	 EZjddvAvTAyig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C52B060F34;
	Sun, 25 Oct 2026 12:00:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 82AD9356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 12:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 689E060F41
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 12:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lE2q-__8xdI7 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 12:00:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EAED460F11
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929623;
 b=Bm3JdXUaQ6hAhro5fhY3exRk4xaJrtwOo6QlyUHGzKWLptEBR+w4EIa2MONYZc4FYsEw
 4MGnBmQ99ODM6hGeP1JF4yssUubIClXilMslen83lJRZu5iWgwtYYdovvFGcd0GnuVC6y
 jK4cMmXWu33X2nw1MqH7ui/Czq2MtlUVQbbUqWaEdWhrHV1BhqwNnAFHhAHADi+DM2i7J
 ZjEtc26FSO69smkgQaD872vmd8+NA+ma5BGnzzcmhQUe0o2ZyIArzJIdoMsHdp2T1ilYO
 6u3TkMhH1jsgdKi9RITKdBErVTKz+2a66j6LFGXtCq/PrUu/jZAr1rakhqX9aXc7RtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929623;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=XQ2nCdqyNXsbbWRNchWEivI7wsGZTdbdK0VEqxeNPpo=;
 b=PNiHVkHDeUhHNshf8MPiLZqeBknOjhBCENxKne3BNwjBjYv+0lcXlBTPpTB1wlFXh4dT
 yPLHhy4VIfTBAHZ9tAM6osa9+mw24KosP6ztNV0yq+ABdU6aiOuDokwUoK/HG9kDg+6WD
 XZuFYhdx+LHHBZmesL0aE6X/2o/1bGNcYKv2objUXMBEFgOGoJmJEOa3ilRqjQ7eXVA5H
 xHYeF0QMMN5UEUJ90tU5fjxYbfjGh+YSojF7WxkQ+JpeU5hldpzJVht7dRIwSL9MoR1Uu
 o0xbhCB8MxiFsHK19/xiCGHRHyuuGum+qNIh3mYO3M9a9kwGYW07B3xld+nNd/IUkvA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qyuwMv+N; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAED460F11
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 12:00:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B9B4519F733;
 Sun, 25 Oct 2026 13:00:16 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 25 Oct 2026 13:00:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 Oct 2026 13:00:16 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Guillaume William Brs
 <guillaume.bressaix@gmail.com>
In-Reply-To: <20261024191007.2101371-1-james.hilliard1@gmail.com>
References: <20261024191007.2101371-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <0cc30edaf520377bda570685c76f032c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pybind: bump to version
 3.1.0
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

On 24/10/2026 21:10, James Hilliard wrote:
> Refresh the STAGING_DIR patch for upstream import and helper changes.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
