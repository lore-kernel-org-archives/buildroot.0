Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02A0606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H75JlhVs
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A9096062C;
	Sat, 24 Oct 2026 21:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PS2KLLiE-OQ6; Sat, 24 Oct 2026 21:19:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 893C360626
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792876749;
	b=KTq8QihaoAH4V0+2VkfiSe+0xX0MWVj53MRCOh4Be8sh2IngkEJZA+XAoeu/JRHt7H/+
	 D1BTvK3olC+ROv4bdQHf4TgVhuxgvtcMJITiCJ+oCiRiQOidXVe1tdplk5r5L15umHHue
	 BujpUYq92PpngtXlvb0X2S7B/YCZ4rGWhrbdw/YBwaqPETxRpNiRe0zggzzeud2d6Wd4n
	 AjGOup1th9W8OzPlpmdUHAyJxoJA7B0rZVPCc6D6wstLJPQd9WPuuSyKayFbKLsTleMoD
	 CoEquLXjV6nRLlYk3AfmkN50J+YB6VnRJmVzibG7DNQykt3xVXDKdn18CB+YbxiXqGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792876749;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hPM8AtIJoFc5FymbnohhjFP+amgz+h+AQFm0dm8izn4=;
	b=WSJbUxk8toQ+XqV89muHsrnJC338US70H+cxthlktE9Hpmb/P+wi7LmCFukLYynnNg5u
	 ZXOrnfW7BWiZexj/udHbxYujf51hZ1TESQHmsTsJc/+KGpA4nlWwYFYlt2NcawEL1UNLu
	 91SczokQ3rsGU0RMbWitAa33KCO1/0j4alD3Mwu1OrnXfHCHdQ0w4ceG/Phef1wfWEKsz
	 kpTSQzPPni+gBSAWIVJ/tIPpIf4hyssldOSOYLM+WHosav18CrTr10FGgwZ1AUTvAu2ex
	 H8BaAexprukL2qEUJf/gKJE9mY5o9lxKc3+KZwtGqzX6lC2iuu6HyNgFKjnnL2wi70Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792876749;
	bh=hPM8AtIJoFc5FymbnohhjFP+amgz+h+AQFm0dm8izn4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H75JlhVsCAooPD1J/xu4GoSiu7bfSBw/umuJquMKjXg25rBTrmR5UFl+L2VoY3Ynl
	 soaZ2NLtETqAo1USCShbvuFh1kVwLYmQDSwRrQ3q5t+/J/ibcJWJ30KTkBk5jC/DIJ
	 iQIzCWLAnJjBCQYU55InCOkmpNUmeoLwh8iqy6U/1R52Jkm2LQPe4BrAiHaMX3m5Vc
	 DKspPY2dXUXEQo4mfri5N+2eSE+FIfiwJehtE4wO1F2du1drOGdlsgPhAMtD6eO5t6
	 7Bnql0wDgp0nok8/MQe51OQfOyjI9CGHHhgLL0B4vnILQK90DMP69BHc1R7eYpwKUE
	 Bvhok35cInDCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 893C360626;
	Sat, 24 Oct 2026 21:19:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 870FA2F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7446140596
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X50VboUrt_6A for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:19:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 73DC3405C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792876746;
 b=Woma4ECd56S7OHsVSODelOZfHUDc7ahECk/9J2W79f8FraWW+HwTPhOR30sTGOf8xJHH
 3DBuWqmMGC7FXHKhsxzkrrMdHuCKvfVjaRc/MlE3O6l/8tvSOoMLj56z4z1rvDkRMyqs8
 caeOCcXy4uESKlsDcupI0oCtAXa6sqDX63iT+XeGc38qEW91KOKssPzKHrPZY+Tq+DDDC
 PhP48SSmrcPs9EjnwmCBoHRw9ipCNyXV6RE1NrGVhvIJyG+6HlX4jtlwHkNCDyGIy58Ey
 0ajzYGqXZZbKsESm1noIIB4JzVZLMeA5yNryM0tGwnPPL8sC44tRz/EmawzHuc5wSxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792876746;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ZlMqVzWWrGeBhHPLgLEva6EINyNUDK79YmGMikXF780=;
 b=Rb4ogI602CGDsXdEJJC2FUD5TkEJ1Ym5p+Pjmo0mXiOM63Ltxn1bcBvXDLEj1HCRS72s
 9ic1jB+d3FD4i7sxGvXNbmqzBVNJ3Yt1YBHOZXouCYTYdYG7oAye5an4CVJ+nUrk3sOn0
 z3zXk77fygmXmg4bo+wuSi0SZYT2VLLSEF5snswbcaMSWwDNDPIo/S6hZhTKvGOMVxo/K
 Y15QTadSVojdhNbL47feKgi0eQWDSAUGgRPAj5M831qKPZFrIDfOCAyEM2MbmQWDZS3IM
 XdDx2SGU/wi4BJBRY7VN6xMq9cY0ihwyUN4rUN6U7MLm4Ox30kbRva63GFpCbiFT/TA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=IcLLsHhG; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73DC3405C8
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:19:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id AA8071A1320;
 Sat, 24 Oct 2026 21:19:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 73D3D60769;
 Sat, 24 Oct 2026 21:19:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EA28E10329032; 
 Sat, 24 Oct 2026 23:19:02 +0200 (CEST)
Date: Sat, 24 Oct 2026 23:19:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, 
	Fabrice Fontaine <fabrice.fontaine@orange.com>
Message-ID: <at0gvf9EeYZDjR23@windsurf>
References: <20261024182139.3264878-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024182139.3264878-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/domoticz: remove configure
 option needed for CMake < 3.16
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 08:21:38PM +0200, Bernd Kuhls wrote:
> In 2020 the fix we remove now was committed with buildroot commit
> 6e6bd863093605419044d6e376185ff3caed9fbe as build fix for cmake < 3.16.
> 
> Buildroot commit 53beb8fc1a4f3ba20ea6c856b4ec8506570f17c1 raised the
> minimum CMake version to 3.18 in 2023 so this fix is not needed anymore.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Both applied to master, thanks!

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
