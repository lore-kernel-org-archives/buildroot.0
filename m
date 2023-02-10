Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E022C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13A476111B;
	Fri, 10 Feb 2023 22:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13A476111B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f912CjzE1cbK; Fri, 10 Feb 2023 22:38:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6226D606A9;
	Fri, 10 Feb 2023 22:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6226D606A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 051E91BF36F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F899808A9
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F899808A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ngbf3UTpcoqK for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:38:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AC48823A0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AC48823A0
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:38:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9F2311BF204;
 Fri, 10 Feb 2023 22:38:25 +0000 (UTC)
Date: Fri, 10 Feb 2023 23:38:24 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230210233824.7b040a31@windsurf>
In-Reply-To: <20230104222007.43604-1-ju.o@free.fr>
References: <20230104222007.43604-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676068705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JWo1k8sCORYmxlkMhPlJ2OIdG6qMq/6+p1K4w7JOIyQ=;
 b=V1rDbMXZMU1/urqxowN2Av96LZpWKFjcFW8ttyy0M3tc4npFv2u9XY23QXUZ2yrqfgJvUE
 Iqx+Dr+OCXEamfPkH0UvNVqveAt5mJDyZ3+x9vF5t9XNwsKNI3U1mHecRW23sTz3Hxblc0
 T8xFuNk6jyQGiHfT5kgm4g7WmqR6RzSrE6p/eGsSBmvVX2VK7+LNHHpDg5O2V2cbjOeR8M
 2YLMQ2ftHXxV00Gsn4IaErslEkhRtIvZMRxYIGZf3Ye9JTF+EyHfDtpeXVLd3dZt8j8Qix
 dU6tQbfL7flscVPhykRLl4ruz6ULh7fkO0FApXze8VEoRy7fibQ1lLP7o+xioA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V1rDbMXZ
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_gnupg2.py: new runtime test
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

On Wed,  4 Jan 2023 23:20:07 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit 1ad6b4e with commands:

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
