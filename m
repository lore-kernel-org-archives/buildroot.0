Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453E4606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 21:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FnTGTgCu
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DD9C60617;
	Sun, 25 Oct 2026 21:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ed_eWnRCO4t0; Sun, 25 Oct 2026 21:25:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2A9E4605F0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792963559;
	b=XyWT+1A+u62UDpfagx9fDtKWFC7856p38ta5CKnQvvGQIXhqWa5XDpVAqNQP+H6gsX3S
	 agbwcYMwQeKFo1fqKbCBX01ijWmH00l3OUf5jViKfWIS5aS71DLjAMx1Bix5WZhBupQsp
	 GWZ539gsMF2MNQWk7LCpJhSmbllFr66IE6oOxx6z4JqVGVvc1lT8Yo/tfsQ4/DmGi+7lI
	 Qg5UQfhRQi5x77Z4PXeRGZh8BMMXPgy5nBpyKfquGaS1xyKBCiKtRZtL+ATBjrKAZhKD0
	 edLSM3bgwBO/QRa8QZpk7njqO1ROMAKRjNSC/LyMCtF37OC/9d2dtj+oiZ+39L+p4ZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792963559;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1UuWzpC8GhtJqxEiy3xtWkXbT1LVM0wTBEK2WbhAq1g=;
	b=NfWW3V1Vpdh6+AiPvlXKBqcpzmRMwkM14SMonMMl1GZyEVBhLypr3486uPUED67cebSS
	 A9uOaRgQZ7nSwPnt1+vqmpPXO5836qQPJlGCoFC1hGC3JwaqcGZjrFyMkW45Lc6N3B6yy
	 Fi4Xh7cfHWYc8kZ5jxuPIcES1L3nHtrqjMOxJaowypgv2jccVQLdSrdk3HRFem+hdwA7f
	 xl7gNripIA3geRH0s5I+3O391VhG646dwZZenSj2T5B/UIaT1eOivybztkZJsBpzlU4bC
	 I+srEROzOVQdto6n5Og1gGW8WL/OK6Bxk+T39QUGlj+vAGJv40JZJ32PLg695pDIGyQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792963559;
	bh=1UuWzpC8GhtJqxEiy3xtWkXbT1LVM0wTBEK2WbhAq1g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FnTGTgCuyAIz+iVdhB/+INcRcVrCL14zFmICbLXifxICO2tvKHABGhKH1Xxwzvo/S
	 4KEX4srL1v2S1RzBkYNUxctwqYlEwnE+VZnNp+7uNE5J/dgDspkUxe6cHjbUF+J3+8
	 hyO6qUSo2ltVRqXs+ChP1pgdFODsfTSlCmP9cgMnCmIhyy5Hi+Cs5IkvoWNuBzaz9v
	 y/CmavGjf7Xt5fhFQ8hekywXC8+91mqLGP/vQnRv63zCYxAZqZQcV4SXxaWgy17u7u
	 o/2ToPkyHYj2welSHmAW0QVAaOkGLzI+SlAPQdBLMAMiQXF6fE8/bndhf3oDcsiwnZ
	 0I/1x4nIAuN/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A9E4605F0;
	Sun, 25 Oct 2026 21:25:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 396DC4D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B7F380AEA
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:25:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o6ZymCmebrY0 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 21:25:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1F3E480AA6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792963556;
 b=UZo5idOiiaX0YUzKv5bN0dwPp/jynMC56x1c0NcLBmsxCUUpTBabdE/HjmdzOu7HUAdT
 p8uRH7uFyMznRM5eYiJolr3Lby8wdPwLSB9zw2lVcyUsUnInqKShByMYgvHxsRmTl7od6
 Hh4rGjBLyUf1jIpHOlQQelNgi7xdeVbGzlzy2oPK/3xhKsmbx/biaCQP4FeDGNAmJ0iSG
 mNxye52UDBuXHuLIRr55tc6c+ovRZUoAYpxZWdn1OZ5e2+UlaOX+6A9+DLo+f1COwKkUT
 thrOhyqklXbYRvCDKPSIISQvHQ9k/aClQvdUY/QfbYlUc3iXZ7m69g+fM/UZijnp7QQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792963556;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=B8n0ABLaZdEGeB26wfhvjmy+eu72it2GDQUQEv2BGrI=;
 b=mmv2GzQ1vcP6+zzo/bwR6Nh67XKJsN570YvzoiaQMc7z1jOSdZeyUUuEYOcwvE9dC9/x
 7Reb6ke5G/jFBMhzuZCfiWdain02K8PluSpoaKkUMfU2SNwAsch5T8qtfCSzNvUi3vx2l
 9g5wTx4y8jITtE234KMWtaLJ4biu/w05orV1KtI5QnixOxmRCj/a0kr4ABOiIGvEDfIRq
 b8Z9AZIKn9H7R2pBrmR1bB4JB2bbI6V2E868Abj9NRyAECLwcox3nkw1j24rs8KOUh4U2
 PVUgiQY9W5CoJQyh7VRnP0Awsxf+58zlGrsnm26oPk0abYivLWNBjWcgz20UkIzgbJg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=LA3k6sHL; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F3E480AA6
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:25:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 57089C51477;
 Sun, 25 Oct 2026 21:26:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 831F360740;
 Sun, 25 Oct 2026 21:25:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 687EA1032902C; Sun, 25 Oct 2026 22:25:52 +0100 (CET)
Date: Sun, 25 Oct 2026 22:25:51 +0100
To: =?utf-8?Q?L=C3=A9o?= DENIEUL <leo.denieul.yoshino@gmail.com>
Cc: buildroot@buildroot.org, Maxime Leroy <maxime@leroys.fr>, 
 Vladimir Oltean <olteanv@gmail.com>, Vincent Jardin <vjardin@free.fr>
Message-ID: <at5zpO5nrHoXUw_x@windsurf>
References: <cover.1792395346.git.ldenieul@iliad-free.fr>
 <be195354e0c84dc3ad31f1d53972d913033e01b9.1792395346.git.ldenieul@iliad-free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be195354e0c84dc3ad31f1d53972d913033e01b9.1792395346.git.ldenieul@iliad-free.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v7 3/3] board/lx2160ardb: new platform
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

On Mon, Oct 19, 2026 at 09:48:37AM +0200, L=E9o DENIEUL wrote:
> From: Vladimir Oltean <olteanv@gmail.com>
> =

> Add Buildroot support for the NXP LX2160A-RDB (reference design board).
> This is configured here to boot from the SD card. To my surprise, NXP
> RCWs for LX2160A rev2 silicon don't have a pre-existing example for SD
> boot, so until one is available, include the RCW through board files.
> =

> The boot uses U-Boot's bootstd framework with extlinux.conf. The DPAA2
> Management Complex firmware is loaded from the filesystem during U-Boot
> board init. EFI boot support is disabled since we use extlinux.
> =

> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Vincent Jardin <vjardin@free.fr>
> Tested-by: Maxime Leroy <maxime@leroys.fr>
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
> Tested-by: Vladimir Oltean <olteanv@gmail.com>
> Signed-off-by: L=E9o DENIEUL <leo.denieul.yoshino@gmail.com>

Thanks, seems a bit complicated, but fair enough. Since you did not
add any entry in the DEVELOPERS file, who volunteers to maintain this
platform? Note: we can add multiple people, that's not a problem. If
you provide this information, I'll adjust the patch and apply.

Thanks for your feedback!

Thomas Petazzoni
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
