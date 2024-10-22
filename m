Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0871CDD0D7
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 19:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 808CD60854;
	Tue, 22 Oct 2024 19:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iO9d9Qvrrs-C; Tue, 22 Oct 2024 19:17:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96ED760877
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96ED760877;
	Tue, 22 Oct 2024 19:17:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 157B32072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4816B40207
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZnj6sKjGJF2 for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 19:17:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29240404C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29240404C0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29240404C0
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:17:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4E1FE0003;
 Tue, 22 Oct 2024 19:17:29 +0000 (UTC)
Date: Tue, 22 Oct 2024 21:17:28 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?=
 <raphael.melotte@mind.be>, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241022211728.7971bccc@windsurf>
In-Reply-To: <20241013190152.2796967-1-james.hilliard1@gmail.com>
References: <20241013190152.2796967-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729624650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UPVTabVeZnY1eZVtTvAev+pfYOqlV+zobkllf9nX9uU=;
 b=QO+GwEFSqIl+rxy1TCgjR5QujUkhlMTUwiqqBoan+ZI9mHznV/nAbNDyCymRfUsWLgBmFR
 PGpTbURKuQtpltYCLeLieEr4oQ5pL607Uk9ea/C8J3kvLyzhCHhZ9/cKkymtKwhqYuKhCY
 yUbOBFkjG6kTHRtIaYa6YWZ02owWK6B0VDUUfwoGwo62nzC6tvrilIHkRnXSsaLcgyz1BM
 NFlxfcUOfHJsok0dVAOGRtBtDPEF6ijo0oPMLrgJwyLlbLfU21qNHzb+Kxv03ZfsuCP/XQ
 MP1UW4WgYEIvILPwKIMJKFba11xBk0VR9qvpSr9qND2qDbcCBHJ69nT9jhlyAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QO+GwEFS
Subject: Re: [Buildroot] [PATCH 1/1] package/python-s3transfer: bump to
 verison 0.10.3
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

On Sun, 13 Oct 2024 13:01:52 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-s3transfer/python-s3transfer.hash | 4 ++--
>  package/python-s3transfer/python-s3transfer.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
