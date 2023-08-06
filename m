Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB15C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 20:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D175B60E24;
	Sun,  6 Aug 2023 20:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D175B60E24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KxBK9MhLXoE3; Sun,  6 Aug 2023 20:46:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2556E60BD3;
	Sun,  6 Aug 2023 20:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2556E60BD3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 806BE1BF421
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 20:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CC1A60AE8
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 20:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CC1A60AE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IJR65IXahFx2 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 20:45:51 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1520160A8D
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 20:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1520160A8D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2585E1C0005;
 Sun,  6 Aug 2023 20:45:47 +0000 (UTC)
Date: Sun, 6 Aug 2023 22:45:47 +0200
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20230806224547.207cadf5@windsurf>
In-Reply-To: <20221005091032.3014-5-br015@umbiko.net>
References: <20220409160921.GA3547512@scaer>
 <20221005091032.3014-5-br015@umbiko.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691354748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X/agdjSbkwM9VF2gar6qDhAfYwvDhyjKjpsQqnneGPM=;
 b=GzjAI6Gjmeq/LzJiVug4uDbmHAzVW9qKNB24hzTmUQ/S0O3FlpR11kq8YcJC0a8sS1CHk5
 SDUZOGOqre9CD4LaP/nhTRGRyH2AiRLSt4WWGKaIFytBZBt9zAiwqUk8FtWCYndj51XsJy
 dDPLkkHHFzaZ/sjCu6tUVOiBI659hzU/ayg7V5fsTUc9D3YDiO2ljTcLMmSh5Vby14OqU9
 XKnpUbaDFd37bETsFEqrajc3xI2mGSYsN6f30xgy7HzbeCFdjzf0WC2Q5ebCcl6RN1QUep
 7jZy4g9Ve2hOjQtajPaSQgg57rRFVOWb2fy1f9OQkOmXQAentfEJEzLh9Gsyyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GzjAI6Gj
Subject: Re: [Buildroot] [PATCH v2 4/4] package/mpd: introduce sub-options
 for expat and yajl
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
Cc: YANN E MORIN <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andreas,

On Wed,  5 Oct 2022 11:10:32 +0200
Andreas Ziegler <br015@umbiko.net> wrote:

> Make inclusion of expat and yajl libraries in the mpd build dependent on
> user selection, not presence of the libraries in the target filesystem.
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

So I handled this differently:

- First, one patch that adds the "missing" dependency of
  BR2_PACKAGE_MPD_UPNP_NPUPNP on expat:

  https://gitlab.com/buildroot.org/buildroot/-/commit/6cdb48a0482a093dcdf73d0d748f5435262515ab

- Second, a patch that takes care of expat and yajl, but without the
  intermediate options: as soon as expat or yajl are available in
  Buildroot, their support will enabled in mpq:

  https://gitlab.com/buildroot.org/buildroot/-/commit/3693462a1f8bd328c1a4f8fb68f00ce9127c31cd

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
