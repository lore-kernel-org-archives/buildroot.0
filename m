Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70D8606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=l17JXxuh
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80DB460DB0;
	Fri,  6 Nov 2026 21:21:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZRoaz5kM-ky; Fri,  6 Nov 2026 21:21:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B094660D8E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794000090;
	b=dINf37ITEcxYRiJdRl4auGQ0tlvRCNWcVGxp8ycOxT50FDDsbrhzoH0SQ/IcaEgRG99x
	 kq9zsQwkxx6pHaWntFB8e75HfbCGNUwe4UDlXl0V5mO/jNrFxqnSunWfqjO2MTEdMqCsP
	 QkxNMt5sg1R00oU6d92fxa8X8riDpyOrI8n6OfZk+y4yHnE6m+7xTg/Kkixuu1cO3dh69
	 qtBeCB40ADIRNngwhje6T7f0t5cA11O1fxixDAVoLZL1UWKKJw4wp+9LOILoPw/fistKN
	 a8bjpre9martuenrUz+elnn0jirJq0IsfOjTxByf9TdPjgnrq9SoF6mfVVOu9FFn3Gg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794000090;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ozatjTX0yMSJ1XKAuQLCexbhwHc5Nm+5ilqIi8XS3g8=;
	b=OY30l3H14o53KCXtksPwU6d5dzuFz9IlmBAe2gArDOpWtkbPDFzD6t54U23UC7igs+HF
	 l4MpAxWKdjsqxqd/EKuw7zMU2MSDXt9OpVEUoEYy7CZAgRDltz4ssxki1qgqGAW0tVS6p
	 KbrvB65XaX8Mm/7P3Tuqw2z7zFjszWqJ0xab7rHScLNDfOrk158xT1QRbrui+gTMS5ksR
	 Og4DRTem4VVKQsbZ7mqEW5Ah98Mbu1JIjU3c/9w6RRGKrL8wgWlYBX8Ul+/R1TW7L15NI
	 wkMKABkVopju4tvm88ibiaz0gCzGIYsoDLaDY24jkC7xU9jqIVBy5bb484xa0CC2oHw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794000090;
	bh=ozatjTX0yMSJ1XKAuQLCexbhwHc5Nm+5ilqIi8XS3g8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l17JXxuhN9mGeDBdKiaSew6FMiTdXLkbonUjZHVsMq0pRgMpQ9Pi1v11X8/v+lRqu
	 64ZXPXVrPRD6y4jVX6jds7D2kHYxqwdLEoawfTLMRcxc1hZka7a6RzMEyvK3sR8lqf
	 KSIgHflaSyNnVXkg77PXZwkkB4gJpU5o1rdHx/ZtU2gihGGJGUJ2ROunkBNgfqSjQr
	 9JvwdhFdKIeWsAP3MI5GDpWBjqhZY0ah8etDgbcmytLjW0MI1ZY0n3ZEz+MrpywNcJ
	 /IOoRgzuvf5buRZ0o8vZewgqXR+CinYIZHTFjMMSvya7dMc6Ct5gDgH2VQw/M0d81e
	 vlMA+D0g/dTdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B094660D8E;
	Fri,  6 Nov 2026 21:21:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D29C31F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F204404EB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORcbQmrTkdpr for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:21:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9A6434040E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A6434040E
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:21:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B852078035E;
 Fri,  6 Nov 2026 22:21:25 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:21:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:21:25 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106191536.2120153-26-james.hilliard1@gmail.com>
References: <20261106191536.2120153-26-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <228265479d8437f0f22c483b8128ddbf@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-socketio: security bump to
 version 5.18.1
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06/11/2026 20:14, James Hilliard wrote:
> Prevent HTTP clients from dispatching events before their connection
> has completed and the connect handler has accepted it.
> 
> https://github.com/miguelgrinberg/python-socketio/commit/0f5f4faafd941878b7ba815d3369d01777ddd121
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
