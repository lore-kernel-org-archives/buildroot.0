Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4258CC00528
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 20:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBD0161028;
	Sun, 30 Jul 2023 20:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBD0161028
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zIOWoXOXYPlY; Sun, 30 Jul 2023 20:42:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EB4C61023;
	Sun, 30 Jul 2023 20:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EB4C61023
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F90B1BF31E
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7639B61025
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7639B61025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pzJTzJVxWCGH for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 20:42:34 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 136866101B
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 20:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 136866101B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D321E0002;
 Sun, 30 Jul 2023 20:42:30 +0000 (UTC)
Date: Sun, 30 Jul 2023 22:42:29 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730224229.78b2fd79@windsurf>
In-Reply-To: <20230730110432.3570583-1-bernd@kuhls.net>
References: <20230730110432.3570583-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690749751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y+UG7CvRBtUS4WurOEs+TGvowAentRLUEaPUlqEAiX8=;
 b=OmPv95WHIvkUcB6P0E3epWuboB7SWMEj3BLQM6BSzEBv5c8jW9jrvvAr788tYJgWYJJ27h
 1HnrvDS5ZOj+r5WX3aeH6Spz7ZH1LclENTnNl4s+VrQAQ5HHbQxqPzZuLjJMIpDN/oKFp3
 Op1CoXHoyfw0Bvndlu45dxzCGmyiYwseMEuzj4dIQipX/Z//LVrVuc52lFfHY9EmwVs+TE
 M5SpG5cF+D9QuLwLAIfhnbcrN5pZFi4/nH6eZyJKYPN+eN+EreDGpXqfGyKrcI0UgTdMBw
 /pEkEQ1eysVY4Mni0pHcmfDsHB4SjTUfI9PWY0lIhRHGMr41WN4+Qto+PgsssA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OmPv95WH
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: sort entries of Bernd Kuhls
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

On Sun, 30 Jul 2023 13:04:32 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  DEVELOPERS | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

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
