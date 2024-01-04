Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B63BC47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C90466F4A3;
	Thu,  4 Jan 2024 21:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C90466F4A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id joG5fgdV7lat; Thu,  4 Jan 2024 21:31:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 282F961B2D;
	Thu,  4 Jan 2024 21:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 282F961B2D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 421121BF414
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2838642D9F
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2838642D9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4fNOLwnBFG3u for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:30:49 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3ABFB42D9C
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ABFB42D9C
Received: by mail.gandi.net (Postfix) with ESMTPSA id D118440002;
 Thu,  4 Jan 2024 21:30:45 +0000 (UTC)
Date: Thu, 4 Jan 2024 22:30:45 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240104223045.07f60b0b@windsurf>
In-Reply-To: <20240103174238.854675-1-fontaine.fabrice@gmail.com>
References: <20240103174238.854675-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704403846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9LlSWyH+YtSHODIilgfxm65T9YuloWCesn7FM6D7BTY=;
 b=geRYJf18/TMCYUGcIHnB5KnzRUTaZpg9EfEsmCj8ToNKFDNcOFAJmOh2kZZG58aC+kC/Si
 OPMpHgDXDpqsIlJ8rWw3hHCH1VoR06Y8JEk2C65eW/YSeoDPXnjaakTzqnVWaPbM4LmqBS
 L26SmTo5jllblHCkVwTValaIKN2QfGbzCvHf4H1SXT4dOGTX0gVOJJnMskzs3cziUB7i8y
 BDRr3bOT2vD/6qP3SY2r0YX/ghTKuz+iNNHXLhDnJzaVddmdxuTzlL3bElswttdo4+9lJV
 itwFljmmGUkEc/IBM88bnZPMTzMC6LYxtZSSP0XwDMHD+OluOKKqtcFCv+WfzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=geRYJf18
Subject: Re: [Buildroot] [PATCH 1/1] package/vnstat: bump to version 2.11
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
Cc: Rodrigo Rebello <rprebello@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Jan 2024 18:42:38 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/vergoh/vnstat/releases/tag/v2.11
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/vnstat/vnstat.hash | 2 +-
>  package/vnstat/vnstat.mk   | 2 +-
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
