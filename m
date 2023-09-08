Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF97EEB56E
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 20:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D29B14180D;
	Fri,  8 Sep 2023 20:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D29B14180D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BpBmxkNv8FpW; Fri,  8 Sep 2023 20:59:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 843C141841;
	Fri,  8 Sep 2023 20:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 843C141841
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 224971BF277
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEBC282E5F
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:59:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEBC282E5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LowILpQmIBJE for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 20:59:43 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FEAB82E19
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 20:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FEAB82E19
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5865120005;
 Fri,  8 Sep 2023 20:59:39 +0000 (UTC)
Date: Fri, 8 Sep 2023 22:59:38 +0200
To: nvd@nist.gov
Message-ID: <20230908225938.249f3ff6@windsurf>
In-Reply-To: <20230903000100.0c1b187b@windsurf>
References: <20230903000100.0c1b187b@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694206779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w4EVfEZ+LuadFp08mnK2jIJS7l+V09Y7hkeS0vFhYA4=;
 b=IyAyyD9YX1liS2DP3/Rud2545/Z+XTp9ng1Zx02pB+bTCzJW5F8E/xNnyvqoz3AVHri25m
 IXGLaORu/UcQB61FJocHUm7CluBsbvQDe5XgMAADU7RfwFdKXBwt+ekFGt7Pg2RdfO4qCO
 aFdypSSOXpKgNo5Xd/FxaiWSH47UQm+Y682/WRJJBgQY3oGamb7OosXOE0l6HGcs0s+a/H
 XBEjItgMfQDMJtcaqj2GgBznhXWbtEpR9OLCmdc3r7HAuqH/y3Rvz1cqQIQbKCV0dL+zYo
 1woqzaxbCS6tdYEUGf58LURHYqxhhgKd+FZDpvLTYGZDYuHCs8C8zzCST0AFlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IyAyyD9Y
Subject: Re: [Buildroot] CVE-2018-11574 version range fix
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Gentle ping on the below bug report. Thanks!

Thomas Petazzoni

On Sun, 3 Sep 2023 00:01:00 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> CVE-2018-11574 is marked in the NVD database as affecting all pppd
> versions, as it has as its only "Configuration" the following CPE
> identifier match:
> 
>   cpe:2.3:a:point-to-point_protocol_project:point-to-point_protocol:-:*:*:*:*:*:*:*
> 
> However, it turns out that the upstream pppd was *never* affected by
> CVE-2018-11574. Let me walk through the story.
> 
> CVE-2018-11574 affects the EAP-TLS implementation in pppd. However,
> EAP-TLS was not supported in upstream pppd before its 2.4.9 release,
> thanks to commit
> https://github.com/ppp-project/ppp/commit/e87fe1bbd37a1486c5223f110e9ce3ef75971f93.
> 
> Before that EAP-TLS support for pppd was provided as an out-of-tree
> patch, provided by a third party developer at
> https://jjkeijser.github.io/ppp/download.html. It is this patch that
> was affected by CVE-2018-11574. As can be seen at
> https://jjkeijser.github.io/ppp/download.html, all versions of the
> patch prior to version 1.101 are affected, as 1.101 was precisely
> released to fix CVE-2018-11574.
> 
> So: before pppd 2.4.9, the only way to be affected by CVE-2018-11574
> was by having applied a third-party patch. I am not sure how to reflect
> this correctly in the CVE-2018-11574 information in the NVD database.
> To me, if one applies random patches to a code base, for sure those
> patches can introduce additional security vulnerabilities, so it
> doesn't make sense that CVE-2018-11574 is reported against pppd
> upstream.
> 
> In addition, in the EAP-TLS code that was added in pppd 2.4.9, the
> issue of CVE-2018-11574 is already fixed. Indeed, we did a diff between
> the out-of-tree EAP-TLS patch in version 0.999 (affected) and 1.101
> (not affected), which gives the attached file. And those fixes are
> indeed present in commit
> https://github.com/ppp-project/ppp/commit/e87fe1bbd37a1486c5223f110e9ce3ef75971f93,
> which introduced EAP-TLS support in upstream pppd.
> 
> Therefore: upstream pppd was never affected by this issue. Prior to
> pppd 2.4.9, there was no EAP-TLS support, and starting from 2.4.9, the
> EAP-TLS is correct with regard to CVE-2018-11574.
> 
> At the very least, I would suggest to change the CVE-2018-11574
> information to indicate that only versions up to (and excluding) 2.4.9
> are affected. Do you think this would be possible ?
> 
> Best regards,
> 
> Thomas



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
