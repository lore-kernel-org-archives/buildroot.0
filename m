Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713B1C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 09:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36E6F40230;
	Tue,  9 Jul 2024 09:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 368sgKlpdUHx; Tue,  9 Jul 2024 09:50:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06866409FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06866409FB;
	Tue,  9 Jul 2024 09:50:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A07711BF29A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BCBE81819
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1cnQ9WOkXmw1 for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 09:50:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4CB5281770
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CB5281770
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CB5281770
 for <buildroot@busybox.net>; Tue,  9 Jul 2024 09:50:19 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 3F4A4C4633
 for <buildroot@busybox.net>; Tue,  9 Jul 2024 09:50:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08105C0005;
 Tue,  9 Jul 2024 09:50:12 +0000 (UTC)
Date: Tue, 9 Jul 2024 11:50:12 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240709115012.72a07214@windsurf>
In-Reply-To: <20240630135118.2222395-1-francois.perrad@gadz.org>
References: <20240630135118.2222395-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720518613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xLvQlG0qNZPLNo1myTarwvLocUKAZKbUUFdjAukvCkw=;
 b=Zg/1mT+JaC4xdsswf0oCx6BjaQ9cuIeDTlDD8KoAL0S+vZGPMmBqrItn69U+ZKd9zYzRZd
 EoC7Jw1lvNXq3cjh0wTkrl9vAxXvZWtfR081r+YjngPVQpXMEVor3NHN5P5vKpGdxviQW5
 K1wtlc9LEZnDHTGcrCauLNbiBQ1JYaDIILZ4kme/80hRGlE1kBfFdK0fjejb8nmJUmNVMI
 7cDwrArjP6ejLAUFcFdOFVYK2YopeHfM7k2RbLKVD7CrY/2Xg40Bl0dDrc/2CKIU+K9WY+
 HwkC92N41LKCgJmQxCQ0yLGVO6909lTSUb6vUDycbI0pHv/2ofqb0kwiYPz0Gg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zg/1mT+J
Subject: Re: [Buildroot] [PATCH] package/lua-dkjson: bump to 2.8
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 30 Jun 2024 15:51:18 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-dkjson/Config.in       | 2 +-
>  package/lua-dkjson/lua-dkjson.hash | 4 ++--
>  package/lua-dkjson/lua-dkjson.mk   | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)

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
