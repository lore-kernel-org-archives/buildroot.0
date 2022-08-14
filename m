Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC132C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E25960B63;
	Sun, 14 Aug 2022 10:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E25960B63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rL_tIgl2jY_j; Sun, 14 Aug 2022 10:09:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 899DF607FE;
	Sun, 14 Aug 2022 10:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 899DF607FE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D96C31BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B540B607FE
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B540B607FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8DcuXXIYnw2y for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:09:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 206EC6076A
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 206EC6076A
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:09:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 695DD240003;
 Sun, 14 Aug 2022 10:09:14 +0000 (UTC)
Date: Sun, 14 Aug 2022 12:09:13 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814120913.30de7011@windsurf>
In-Reply-To: <20220813084815.696873-1-fontaine.fabrice@gmail.com>
References: <20220813084815.696873-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660471755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4fU/6Ihd6VjsBSb/9q/sOw3eaVs6bl43u+H04bOe0/U=;
 b=I3CSXY5Os5e6i3jPN1vKr994LossJ0RAV4Fu4xWRx9bXWwevs5dEIVvKg8aA5yRJv6p0qI
 rBab27B0Wh4FHXizoyDzz6v9oXs4F66eZvIetBm5RMX+Uzw3Eyuw6w0KI4eA95LTINU3Tb
 GRHdH6HisqkmBB8hz7lEQHvu82Hr04FjxeNvxH4c0r1ZzoZI64iEbew1RrXB0wivZ2Yw+/
 8s8LExRBTDm1lhyw0Won/5OSB3alCV1vnh/Fk4ZeFKlLCxgBuSmeQDslhcs5xuQ6DNff7h
 DN0kI2P7Qvq3A6v2r9qqSBPdpLrW5ucJ8cHvCDAVsP/puNxsFHXJtAarHz0mKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I3CSXY5O
Subject: Re: [Buildroot] [PATCH 1/1] package/python-autobahn: fix
 dependencies
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Aug 2022 10:48:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit efa5ff1489625eb862b1d7d161a169514cc9c881 forgot to add reverse
> dependencies resulting in the following build failure:
> 
> Makefile:575: *** snappy is in the dependency chain of python-snappy that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fc4fdc29ff4ab3e1585a42ed6b063e9e50583fe9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-autobahn/Config.in | 9 +++++++++
>  package/python-crossbar/Config.in | 6 ++++--
>  2 files changed, 13 insertions(+), 2 deletions(-)

Sorry for having missed those dependencies when reviewing/reworking
these patches. So, thanks for fixing this mess! Applied to master!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
