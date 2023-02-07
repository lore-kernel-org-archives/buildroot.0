Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863CEC636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 22:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 234C740B3F;
	Tue,  7 Feb 2023 22:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 234C740B3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G4qmrACyhKeD; Tue,  7 Feb 2023 22:13:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F04940B26;
	Tue,  7 Feb 2023 22:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F04940B26
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E36CD1BF328
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA4C440B26
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA4C440B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7KOuUmoMDuM0 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 22:13:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 370CA40612
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 370CA40612
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 22:13:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2F4C31BF204;
 Tue,  7 Feb 2023 22:13:16 +0000 (UTC)
Date: Tue, 7 Feb 2023 23:13:16 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230207231316.0cb2528e@windsurf>
In-Reply-To: <20230114003122.1475047-1-giulio.benetti@benettiengineering.com>
References: <20230114003122.1475047-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675807997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fuqAm2UOHjH5Zy/I71JNbuoTyJBxnmTF9gk6GTmSZ+U=;
 b=UaVBDznnMi3FxTTQ1pgFmmopVNNUVb7/S+Ilal5OOAkbFb4ZDmgYGjrBCxVAAG4DgOL5K+
 PT/wpgfjIxg0/GATibFC/w+dTM20wfCytdbSmRKt/nqEJ0OCBAjr5wn3bGgFUe8nEPsz4G
 VQOduukkWobk+OS78g14nMqKKSUZ7612jJroGVN6jxkeGmp0G6e4hKecXhXGmUXH3iHIX4
 MIoXqWDPk0oyp9QDHuUSDNmyhE+sOFbLTihb5dNM5ApKWHVIMUcdKxuZMri6wzKhhxSjPv
 vufIP7Bc2mXYwp7v3PCUJ+5tylwHpqOrXRKs2CqyLPm6dCR+7biDuM9q04Jyrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UaVBDznn
Subject: Re: [Buildroot] [PATCH v2] package/rtl8821cu: fix build failure due
 to missing Linux options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Jan 2023 01:31:22 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/aea/aea6bc1e4f89bd1010dfdc9caa54c37edb567d5f/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * drop CONFIG_PLATFORM_ change
> ---
>  package/rtl8821cu/rtl8821cu.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

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
