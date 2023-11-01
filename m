Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D10AC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD1A3431D5;
	Wed,  1 Nov 2023 16:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD1A3431D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dL88NeFSzdun; Wed,  1 Nov 2023 16:31:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DA41431AB;
	Wed,  1 Nov 2023 16:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DA41431AB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 768301BF841
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C3ED703AE
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C3ED703AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nF6FE7Hr5nCP for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:31:30 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B1B77039C
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B1B77039C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 33E1E240003;
 Wed,  1 Nov 2023 16:31:27 +0000 (UTC)
Date: Wed, 1 Nov 2023 17:31:26 +0100
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Message-ID: <20231101173126.2ea6299e@windsurf>
In-Reply-To: <20231010131327.1128307-1-thomas.claveirole@green-communications.fr>
References: <20231010131327.1128307-1-thomas.claveirole@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698856287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QYRKCA2/SRnigHmYQ5Nc9rUebkvS6hJWvlonyO4xEok=;
 b=bGgIEayjVkKhMqlYkO1rggAs4TBBZt/9QoM7T8SZ4xkbca06eCbMmQYh99TK3ScdvPN6NS
 RbF6kUu6xaFEx50sv7YZZn3F8tkiiY4PMZ1OJc6SLqUY/drr0odqsSWf9qUd5nwNRh2Ny4
 uucgU9SHCeUp9dzSF3ov1um9EvKZpCxcI1AKL19Ds427CfRF1SXRryARrtvEP7K1FGshDK
 KnP5FssqgfjDrowZMIx8EZr11bRSG7okAkOmNxcUhH3KQoEUa5I1X3DuFRrcqnRohjyxoH
 FaJC7hOfOx+L1+z6cDFYm7wEOMT1hj9IubM2UWbfgZgfWb/U1QA2YX3haNHsfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bGgIEayj
Subject: Re: [Buildroot] [PATCH 1/1] package/openlayers: bump to version
 8.1.0
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

On Tue, 10 Oct 2023 15:13:27 +0200
Thomas Claveirole <thomas.claveirole@green-communications.fr> wrote:

> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
> ---
>  package/openlayers/openlayers.hash | 2 +-
>  package/openlayers/openlayers.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
