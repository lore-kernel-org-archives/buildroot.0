Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7D8C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE97282CCA;
	Tue,  6 Feb 2024 17:53:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NbTs0SiTVMg2; Tue,  6 Feb 2024 17:53:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47FF58316F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47FF58316F;
	Tue,  6 Feb 2024 17:53:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93C7A1BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A22961142
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A22961142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AX9eH88d-gLm for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:53:09 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F2A761129
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F2A761129
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69EAD60005;
 Tue,  6 Feb 2024 17:53:06 +0000 (UTC)
Date: Tue, 6 Feb 2024 18:53:05 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20240206185305.0ca3bb42@windsurf>
In-Reply-To: <20240131112223.2175855-5-neal.frager@amd.com>
References: <20240131112223.2175855-1-neal.frager@amd.com>
 <20240131112223.2175855-5-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707241986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IrVZF6tOVMQsRVNJPK4bU0TykGBg6VfURivUkm3k8uo=;
 b=d2FOhIOFSKtJr+E+60lOG9/UkR9VMbSP+ktfJhs0DhCYpMYN+AhufgFRSCvj61oL1l+Qoo
 3L/ypGZLkdLIqKVto9vPEGxDaCTtRzm2Pev4hExXOyhVpy2Es9TPizySAdgf8Jk+cr2OGa
 d96w0xldW1412bRWslMyDGzboYCdaYakuASalOfI2sXeh8qWPgye9AotwcwLxCR+4IawBZ
 F8erNUdUXwxplLJWLSw5e19lS+OVaMDBCfkIpI23wagqJ74YmxIJFbaLgRcI+j/J09rdMp
 QlaBT+Pdw0HPlaJHagoLDJbBzsHXLxlVkXZL6Kk8Q0x5Pq6j0WXQ5QXPABGgaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d2FOhIOF
Subject: Re: [Buildroot] [PATCH v9 05/11]
 toolchain/toolchain-bare-metal-buildroot: wire up newlib-bare-metal
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
Cc: michal.simek@amd.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 31 Jan 2024 11:22:17 +0000
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  toolchain/Config.in                                             | 1 +
>  toolchain/toolchain-bare-metal-buildroot/Config.in              | 2 ++
>  .../toolchain-bare-metal-buildroot.mk                           | 2 +-
>  3 files changed, 4 insertions(+), 1 deletion(-)

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
