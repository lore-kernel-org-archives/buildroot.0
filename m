Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52437606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 21:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nMGqaaU+
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 286D260649;
	Sun, 25 Oct 2026 21:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnRFfcUF_SAB; Sun, 25 Oct 2026 21:24:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 77E4C605F0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792963457;
	b=J/6Bi1JT52fpfsFaAAz8WB/KtU9JahWF+TAJ9aEaFPiMDwDEaUWOmDFh4JfPNw3dQO/6
	 r92lXuTILlKPcdMM7MXv4TMelWsawNoPN03qPTgyv/yIyrt1hdCPfjzmxHnIK0oIxoaUw
	 nC6fO31teCTf922mPVtYlcEV7IdZLx2tr6R++EHkkQgBdoNzwUg8rj+oM4n9NlgVBh0m1
	 NtPE8zcnSLbs0MlEBM8APca6tGpj+Oe8PPhoPbPzTtD8JatztLNuDdeFcm+rHLQJHfQxl
	 WCjeC8Di/hlBbmD7ncMPsIchGVChlHwVZkeomHeyU321rzxMoZpB8+oDlXMCwWRUKJA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792963457;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wGb/jHLD9LW9I6tSoqGTQTp1y6H8S4zoAKSHI2DqY7Y=;
	b=XBMKocHmkINywfWE5/AFG3eTglWjPus7najiBrQsCqZM0QyBtPvgy+hEzO7GUlFyJo/k
	 pnsrVUIkLrQjdZxcfkop9A3PS8Pr8kjh0fvoh4yvwE15lBS7HhY4oWMZhOfj7ERakpFpq
	 Ds1ZtENsYOx73bblt7ToSXsf0hySxdct194wWW6MYsCqlKg9CrNV1xDVfkbM2MdZMydrp
	 b9clu908lplHWiON2Co47Mw65eDYdxqox/FAp6ZKqdaSA2jxUoPDXT370Oi/g4zQsQQCn
	 jWc6Fkbuv6BGEPH+Vm2LRvdAYvieMr5/N/SL0UUeirQCZikjispmHaQX5mWTMReyrKA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792963457;
	bh=wGb/jHLD9LW9I6tSoqGTQTp1y6H8S4zoAKSHI2DqY7Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nMGqaaU+b1biKYK2Q5ek1zIgNsJeGQ0WMLy/KdLeNt89iE7D7npzZmDXbQjmMppVy
	 eK+jjcd0q4k/YPUIDCQ3AOMx/3UTo+0T8cIr63xR6joM7EPKWizrQtaFjXIHmxkw1Y
	 1xv+ZfynkFpd9yFBY6eIOvrDqhj2tMJNke9m/ZhW+u1+cq9WXSxI2CozJljoKOh4Oo
	 c0DBUZbNtOTK7dLYu2y8mZuMQtQur/MV97b9dREazr6YaQeKOYGaIcCArdcxx6lFI1
	 L89MQoc76CxjbT4Px4Jy0YZJJx1u5TFkbSUsojApHKMWboBPnQFYyyBBNV+Cg0JFxF
	 A4E1WNgxTmJvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77E4C605F0;
	Sun, 25 Oct 2026 21:24:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 58BD4334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AD7F40589
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6adw-NHKUBc for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 21:24:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 03E9740585
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792963455;
 b=VC4299otmU4eEKp3T00I3SOL25jWCYmHaypatzWYma/hVvoV8Ebz8R4GWfArvDILrnu8
 lOyqKPVuOnmGJy7+XXkqK8KdcIGh7FX3pxtPQSziFqoAzUGc8PkLZ72kLsa4cp7W+YEXz
 TlKzzBPAEC6dalVn6f10lUngEJJs0bu9DWUQIkop+LnIwi9tFj4IrnRgOzNqo47spwtc4
 kuW6s/19EM5bZdtriTWetLIjLusNl85qHbdQ9v6DUaYuPGcwuyBAizFLIVbO+3nI5geVt
 09oHmTyX4DRswjo3It9B/QXq6mG6mrWhmT5kYLXi9pp2EyNXMzKqOE1CkolwAJ6zIMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792963455;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=hg6RrMKHXwQADNM4TV/mnqId/MTFU1Plh9Frv2sJlow=;
 b=DNct9mfz/5dKV1MkrZn13Jls+TjRiA1grPRkpVjDG14KkleZYrBqw2gHvP4mhwNzfPZD
 KAwXnu2WKlkwfcFdOWjbzPUdV2TRgvDoTZwB9JlYklb8nt/++o/z1Tclq5n81hZcN3TpD
 BY0yjfvuDyo7vpLUqtqs1/SWY4jFRUsaCi5n4OLQuXeGl/ide2re57Z1SlrJQwypETv+r
 g+uzjLue1xqDEBgGreG0FKVlO5zE6Npin6AIns6GPbMw/mlzAwFdGnEaWhOQlbZ/Bsvzb
 P9itpfgYZiLXjxkOIkS06G7BN9FNm7Su9Qgnv9YA0kHm8E0pv6oMfZLOdtrcU1nXWtw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=oXzJCuxi; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03E9740585
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:24:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 98E471A1344;
 Sun, 25 Oct 2026 21:24:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5912560740;
 Sun, 25 Oct 2026 21:24:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5412410329035; Sun, 25 Oct 2026 22:24:08 +0100 (CET)
Date: Sun, 25 Oct 2026 22:24:07 +0100
To: =?utf-8?Q?L=C3=A9o?= DENIEUL <leo.denieul.yoshino@gmail.com>
Cc: buildroot@buildroot.org, Maxime Leroy <maxime@leroys.fr>, 
 Vladimir Oltean <olteanv@gmail.com>, Vincent Jardin <vjardin@free.fr>
Message-ID: <at5zctNfcmgPl9pX@windsurf>
References: <cover.1792395346.git.ldenieul@iliad-free.fr>
 <e3d482d50e74c272cd88dca16aef47b4b4e0a57b.1792395346.git.ldenieul@iliad-free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3d482d50e74c272cd88dca16aef47b4b4e0a57b.1792395346.git.ldenieul@iliad-free.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v7 1/3] package/qoriq-restool: add runtime
 dependencies
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 09:48:08AM +0200, L=E9o DENIEUL wrote:
> From: Maxime Leroy <maxime@leroys.fr>
> =

> The scripts shipped with restool require:
> - bash: they use #!/bin/bash shebang and bash-specific
>   features (shopt, declare -A)
> =

> The ls-append-dpl script also requires:
> - dtc programs: the script uses dtc and fdtget commands
> =

> Since dtc needs dynamic libraries, add the corresponding dependency.
> =

> Signed-off-by: Maxime Leroy <maxime@leroys.fr>
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
