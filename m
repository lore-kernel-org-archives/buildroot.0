Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A258DC25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 19:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D73E400F5;
	Fri, 24 May 2024 19:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVubFnO-tHlq; Fri, 24 May 2024 19:56:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76E244026F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76E244026F;
	Fri, 24 May 2024 19:56:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1073F1CFD87
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 19:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0887D407D2
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 19:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTOcaH9Zu-Cg for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 19:56:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BC242407C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC242407C3
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC242407C3
 for <buildroot@buildroot.org>; Fri, 24 May 2024 19:56:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8ABC1C0007
 for <buildroot@buildroot.org>; Fri, 24 May 2024 19:56:08 +0000 (UTC)
Date: Fri, 24 May 2024 21:56:07 +0200
To: buildroot@buildroot.org
Message-ID: <20240524215607.31f49bd3@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1716580569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UJpxx2Dn8Ar/Gm2hhw/di1YEC3LUye02aHx3FZty8/w=;
 b=Foslrk8/7ZgtA+LWa+3Pjk6xOenX0SXINNIf3fX+Nh0EoarAFgsRMXHidYEr8lBY9q3hql
 vtEpFe7EGzfvFHtG58QSkOvp4Z3u8nztVGB43G8U2VrWLFKyUT047nCRbzQGj/kUVtDmQp
 3voKn/Suj2OlGMQcmrrOh5HzF8yqY3/XVFk0CJaWI388CwwvNWoDCajHHQVuelxbXoT2oE
 lPy0SzSdS5njRS8ZvjjXkBBs39o3t03tXVSVZShSi/tGQHoI1QtK5pqhNPHStmHofeOhQ9
 3+6zq67bfq1kh9YKEJssDGDpLsb/R55EPyWbdy5dKCXKcW8GcG9V3YmkUBVNdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Foslrk8/
Subject: [Buildroot] Build systems micro-conference at Linux Plumbers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

The Linux Plumbers conference will take place on Sep 18-20 in Vienna
(Austria), right after the Embedded Linux Conference (Sep 16-17) and
Open Source Summit (Sep 16-18), also taking place in Vienna.

The Linux Plumbers conference will host this year the second edition of
the "Build system micro-conference" which of course is relevant for the
Buildroot community.

The call for papers for this micro-conference is open, see
https://www.linkedin.com/posts/josef-holzmayr_in-the-linux-ecosystem-there-are-many-ways-activity-7199738067929169922-C6KI/
for some details on this.

Aside from this micro-conference, we (Buildroot maintainers) are
currently discussing on whether we should organize a Buildroot
hackathon around the conference. So maybe some of you will be
interested in joining.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
