Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9341DC61DD6
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 21:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8867A60621;
	Sat, 29 Aug 2026 21:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0o4Cu27jNDeH; Sat, 29 Aug 2026 21:16:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788038208;
	bh=5Tvi1sIXSS2mW2jf8QhIlZiYK8Wnc4uJ0vtawAbq2Zs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JutIZmvjTVXOB/hTnqsSLoiah7KZoLDeQzfOvrEdS1TMPc7TNgQB7NrMN00ZDcl9k
	 WZ3aQzr5GCOmyuDvJHT/xL7CnAeG6o15Xx2XxCuHXYov70LMrX18uykSQUXJArru1C
	 oTA0/pYkr1FLnnzsVAZL1h7twFn70fuHcfOe3MjzqVh4b0XnSAeEoe31T/mC09jBZb
	 dV5yBtIsb0LqYaf358x49U7qWRsqcbAuz291BFKRI8eFrJhMsD4p8+G0O+Ckv8rhYq
	 bIxtiJViw5SILQ1S+XVh/k0aUJy/WeOzZSNfdND7iKwo/GXT8xdXI+391yCFIBUthA
	 6HCDi9rzTweKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A9DF605EE;
	Sat, 29 Aug 2026 21:16:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA5E29D4
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C3C8605EE
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2CBepGvLsvB for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 21:16:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97FF6605D0
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:16:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 608501A1868
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:16:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2F1986053C
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:16:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5D34C11C78365; 
 Sat, 29 Aug 2026 23:16:38 +0200 (CEST)
Date: Sat, 29 Aug 2026 23:16:37 +0200
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <apNMFCS2K3W1coCX@windsurf>
References: <20260814-openscap_musl_dbus-v1-1-cd42c1c3e0e2@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260814-openscap_musl_dbus-v1-1-cd42c1c3e0e2@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/openscap: fix build failure with
 dbus and musl
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Aug 14, 2026 at 02:06:13PM +0200, Alexis Lothor=E9 via buildroot wr=
ote:

> Fixes: https://autobuild.buildroot.org/results/a874d4f34d36fa9f8566be90ad=
2d5facb99aec24/
> Signed-off-by: Alexis Lothor=E9 <alexis.lothore@bootlin.com>
> ---
> The issue affects master, 2026.05.x and 2025.02.x

Wait, how can this issue affects 2025.02.x, since openscap first
appeared in 2026.02 ?

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
