Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CC7C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8464140A98;
	Tue,  2 Jan 2024 22:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8464140A98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W4rqFcO97xms; Tue,  2 Jan 2024 22:21:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F51340A9E;
	Tue,  2 Jan 2024 22:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F51340A9E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 521611BF276
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B47B60E17
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B47B60E17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CI-tyWwTQtIK for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:20:18 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B26260B8B
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B26260B8B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34FF840002;
 Tue,  2 Jan 2024 22:20:16 +0000 (UTC)
Date: Tue, 2 Jan 2024 23:20:15 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102232015.397ce537@windsurf>
In-Reply-To: <20240102213822.2010020-1-fontaine.fabrice@gmail.com>
References: <20240102213822.2010020-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704234016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LJFZY81c5OpKQS0RsmPWgGjLgWuCHFmVdbGP/LYdrQY=;
 b=ZGo8QB1N77Jqz+c4FthqpgoDXWjQ3WPJfl4FvS8SjrvjFykITIBW4ZWkj2AIIq7JRpnlna
 fHLHZjeXqqnkVHHUHrPbf5JznudUHs2tDTRARtnKdWcNhwZy7eVkQ2fLhd5Lx+b4BlfV2g
 PdK5cyjYViYO6qMns5smMhCXPnBwa1nNofByMAifVbj0UV9cKP2EgLVSrCUy+Ih9jk0nit
 ZxegfJKZIqdB0luvzJ5QP9pn0i/ob/Cm4ObF7Ia1jPKzQI6wo5ECn/YcTxZNBCmXrHIUYV
 /r3HsuApaOMIA8oj1apIQoMEMC8INr2FRNvRhNXqkSHWiLYT6DKP8tfA0R411w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZGo8QB1N
Subject: Re: [Buildroot] [PATCH 1/1] package/ipmiutil: bump to version 3.1.9
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
Cc: David Bachelart <david.bachelart@bbright.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Jan 2024 22:38:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update site to avoid redirections
> 
> https://ipmiutil.sourceforge.net/
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ipmiutil/ipmiutil.hash | 6 +++---
>  package/ipmiutil/ipmiutil.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
