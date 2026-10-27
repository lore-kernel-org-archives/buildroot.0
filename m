Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F236606A31F
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 19:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NIo9nR0W
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B842840675;
	Tue, 27 Oct 2026 19:46:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1yUxFVUf2xu; Tue, 27 Oct 2026 19:46:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6E1DF40688
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793130364;
	b=QzuK1UdtBcQXyN4GKaJXd3eYieH+VMqYenRoI++jj4b90bSL1TSIcHUrl258s2EqJMqv
	 oAUNq5ZLyXcek/jNp7pOxkFA8xZyVQghFrj340Klozn+NqPjCIOsss23IEETp4VV+mU5j
	 t9hG8fRoobxTf66skO4CZ1RAy9HhtaClfHwz19nvfOieghsymzp7lVc90GEXFrMQhtq7i
	 qFTKILrTRZk35FXB0W3FkZiXZY3ZL5tU820gQl6ZdwqRZgTIGCSN+Rq+Ow+PILPPtHJDP
	 XaSdiQRYHa60gdRmOLy4Ijvr/NHc+fpDyuFDTmHlBm3uusz3biEaidTfy0yloBgEWdw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793130364;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bLF1g4zZvbHjN2oMHVGUFJpVI/dvdbdvB2f++oL1N/A=;
	b=NQgsum/kDuecLj4sOAdxqWBh99De5UK9h4w/dMlf7bjLcwhfHuHsvyBHmhC15wZKpDK8
	 o/QK4D98/IPcYsQvg8Ku4QMcz3BD0VKLA/Sm0f/ijJGPKmqMZDymVylxNIWQIsTJH8pOB
	 HVWTCgsE3Y4FGXAt1AeBXgZ1nn2aCkbNusaGQcF6wttICt981FkjdR4oYZbURlqYUITCN
	 mWKP+iJYg7TlGVJFdAHMfZloJ58EHdKoOemMaygI67i6pVRx1AEbPhsc1OoYMdBf3nn9B
	 Di/aEIyPBluWAxNuddlwiRs506aJxcQQwZVo5sUEIw2AAyqRYZAQd1R37/uAPfXPm2A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793130364;
	bh=bLF1g4zZvbHjN2oMHVGUFJpVI/dvdbdvB2f++oL1N/A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NIo9nR0WlBIOLF0WfbvR9v8udnQBsJl+WCymtPklXB0H0WV62QFUV47g31D6cM1h0
	 YqhXzJMx6GBzfSVFOthDNG+Q+s7muQHsVswooytWayFtTzKX5rmflKvVT4ANgsd4cT
	 +fwj9Mc4vSaTgYKnnuDzlBDcQJDpimN0nrF7nYvXzXQSjy39ClYC+G94sI6U3E/P8P
	 Xlbs2ZiL2GldGABL99vg3r7OQ2FwNvgxBQXUdnN6S66yRReY74/3ei7LrMVbdnfckC
	 pj7/FBnHdbVPyhNmsFJ9nsMZ92AJpmQBP9VVHV9533nm5c8aZXJaQGYOVw2ebQaB21
	 K++GFt8AN34Ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E1DF40688;
	Tue, 27 Oct 2026 19:46:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE759529
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBA58401B0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19TmX7kThUaq for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 19:46:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5A62F4016B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793130361;
 b=jFdBW4Ii/g9RHrg30UTKNX3eRacahHw2bkaMzt6RTXhBSuAVRqk9z4Wt2LvYGRXyuPhr
 mADTcC6FHBwv/pd680ga3YCGhhQqOJZ3YOvsXi8bIdqESM2i42FHn6woNJgcrIcSwsqZi
 0SAmoxUFd/+TPx/foIx6MfYMr6ubMWh8GTkOeO3iC6TPhm3lN5gbbZa0uqY9sT72F8d36
 wycVB487ct7ZjNqGdEkxrePESL2079lQTqvwSMUeeuGhpgqNde8JYSVzaXzLFSoDXj6iT
 ghuhDu1Ejniyr2sHNo0HUUqULwN9gT5zTuP6tXEIldyOuPsAZDndpNm4k0QmD8CM9Yw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793130361;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=aQBRiqN8pVs6cDJdI+PJKECc1g3MrIPvLidb1GcKNM4=;
 b=V5f+0rfaT8YjmPAJAv+zdebHGDo44ocN/EyxP/sVc6r0By+PY1IFqs9HfRDmWiR4dfMz
 GHCwmmaoUVbjKW9iQWk8xI1CKbi/YhDfwHFEwnWVgta8PT1H0uHsdDkyAPik3rvrc52uh
 CBl/Rsw/Hu6itCo/50ehZyBnLtK65boat31skFpWEAzum+i++FTCxX3ozgeC2Ifs9Xvjo
 Hv5HAH3t7HdkNC4E34W5DUJwZM+acffvZd0ycsxg+3oPaYipsBlr0iEsNl+uCbsL/oFZ7
 dwSX8bERAbH3/JS9tbe6umxKxTOU9PnNDTKgh97osb2AwDdCykAM3L43RxVJ/g1GcKA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=sh7KaLWA; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A62F4016B
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:45:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 029904E41336;
 Tue, 27 Oct 2026 19:45:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B2452603BD;
 Tue, 27 Oct 2026 19:45:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6A0F91032902F; Tue, 27 Oct 2026 20:45:51 +0100 (CET)
Date: Tue, 27 Oct 2026 20:45:50 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <auD_arCKei00HSLb@windsurf>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
 <20261027164013.1602502-2-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027164013.1602502-2-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 02/14] package/mender-connect: bump to
 version 3.1.0
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 05:39:59PM +0100, Adam Duskett wrote:
> License changes are due to golang dependency [1]
> 
> Update github.com/go-ozzo/ozzo-validation/v4 from v4.3.0 to v4.4.1
> Update github.com/mendersoftware/go-lib-microfrom 904960e to f0e3087
> Update github.com/stretchr/testify from v1.11.1 to v1.12.1
> Update github.com/urfave/cli/v3 from v3.11.0 to v3.12.0
> 
> 1: https://github.com/mendersoftware/mender-connect/commit/14ebf68bd4f83057f75beb06702d6f8adac84aac
> 
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
