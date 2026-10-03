Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E668CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 527C581366;
	Sat,  3 Oct 2026 12:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VRMOstI5fB42; Sat,  3 Oct 2026 12:53:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 860248134B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791032032;
	b=CaiR4Ds+T3ngK/bNpg6WBzjmcCOnFsoSDkEQ0SlN97UMGvsp2T8n02RXRSyci8VkojZm
	 GPpRbHs+/N3ERsJH2kepK5ufNAmxbtERmkxgckHSHYYVDBUBGReFIzG87nF2/rD/yZpvQ
	 aVyMnqtRYYY/SLVisngt2p93NVLD8U+9GCGd2vTBuz3VukLzP7P1K2GKYEfrgT0Cf6SOB
	 9MsF1Ki1VQFu2fND6EhlSI8Zvi1W/vv3Hcu1xrMfzesVbONGFgUjQNhRYRlGTKFLYstNC
	 amnEeN9Ma9QXZthZc7QTUqe8UCCRMc043djZn00LYclu7WglRnGOI4LtiJFPhzsdlUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791032032;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QIaAEttemid/1qxei453KjcPO/wgQ4Aj5uPhzsO4f3k=;
	b=id3me28kpl2BxCV6wKyJrhdWNBSNtkAiIydAMJPw7acS8FhA8MAPo8ZcQeJm8BGr5bxU
	 wGNDgVJJoV8TpJ2+BOq931C8ys4/GMh6wvyJqX6Bg7ZKFVc+taWrRP2cJIgv4mVu3aZxh
	 NJuFxFk+LzP3EftC3bbC+lTB5orNLtBKF/faoJ5vAClC9xX2KhrnG8oDZlivzzLA3Zwzi
	 G8iuSqt9oCnA7y/+U4N8rgPk4S7Dbh/hPEfmNbjRb28F2X9LKjwq9whzO9HEXkb4OsrzU
	 M9Wh6kzLcjbS7IgnFbvvtwDDX6E9IqY461IlvVO2Fkq5Zk/bABpSKxqd4Xb0SCbijtg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791032032;
	bh=QIaAEttemid/1qxei453KjcPO/wgQ4Aj5uPhzsO4f3k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CAua+mAOIsjKmXHkJjYIWCby+eY3DokPFhMvz+tAuPScZtqzoVWFQm4ZiMHKD8GYY
	 AOPeEfxCa7OLBDF4jZ5lcVi9L63cX9pKn6STTQfv5T9mk35xNZH8qhnvV/aEg44zcT
	 4HNCBhK+Eg7TI7fG8z8sJ53Rw3Y6CLbvWMTpcb5WY48p3EYdV3ueTTtY5xu046FOwl
	 6p02XUqbI5yqLqA5voJrubBO/icgQNxVNOIkmDTeTgLpfXg5il00beW5AsNEkeZEBQ
	 IUDIUC19kcNDWU3L3fbxH08n/FuezA/sHo5E+coEi2DuGq5T2s50Lv5+nxmg1eCTph
	 Oza1ZYvGouJEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 860248134B;
	Sat,  3 Oct 2026 12:53:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 307E71A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D3D940064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlLzzJklo9zR for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:53:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0969240063
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791032029;
 b=ENujEvN7+Jdwu7u5DCX4D+MClQlvU/502YJzLyQW87UzeyZoYXfcVT2MyWa65v6frlLB
 i20baIWiaGJItYu6xHEi+6iz2SeF6mS5vEyfoPO1jJhFsYpXTqwzdwb1HoVS1O6gXY0qL
 UGC09qwux+vMYEDTGq74mZShvUVE6RvJzxoy8gvwUFb3s02v4LQwQPs+s2B9uL1CwIgPU
 cdZ94evmq073avCT78qpYxLXvmuAfM5JyN3rCJp4cWxv9/W4GaEeByJHtpn3F/12E7P2W
 EaEi1jJltJXThS3IHYwuqM5WM9N5rpNO0I8CBz8IHvA+6lCAe7m1P71H4fkixiVoskw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791032029;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=LpIJFejS5mJfra95rUREvunRDurGAMOdl3okjlFoqn4=;
 b=LID6z+1PrhVeBCzXDZ2AXQqbKDu70gSpzhtiz65OGZeUsxbcAmNrxmm5d4lOMVG2ofuF
 YeFmyM+E+Hk7iDfkKzoRe6/zU7uOt18/sb08MqxU3/5IVo09cMfS8dHPE6Uk6vVNcK6fr
 gmUCwagmMaRDMuVomi9Ydrv/TOvhBfugfw3T24U7Y0VquLQmFgLxeRQb1dJsYsC6J0AbK
 Ghcve83uL7mmhQi4Et3I3I7ck8a2VLuYes4jkFk81AfK0CxnCmGiC3zMVPbUou4pZ5pQa
 KhxO6k4y4EMF5WArAHERyIrJeXX3b0W1nOWESOfQ6J6Jbo5NWR0mtUp620PEmg8vkLg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=uDi16v4r; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0969240063
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6EDF74E41129
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 43A53604FF;
 Sat,  3 Oct 2026 12:53:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5D1A710328366; 
 Sat,  3 Oct 2026 14:53:45 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:53:44 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asD609yUIUkfV6p3@windsurf>
References: <20261003084453.545653-27-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-27-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-soupsieve: bump to
 version 2.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Oct 03, 2026 at 02:44:12AM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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
