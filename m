Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787E5C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16E2483032;
	Sun, 14 Aug 2022 10:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16E2483032
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id plI4YImO00cZ; Sun, 14 Aug 2022 10:05:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 280E6829B1;
	Sun, 14 Aug 2022 10:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 280E6829B1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E0A61BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48E53829B1
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48E53829B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oJbZO1tnNNnm for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:05:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A2EB82893
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A2EB82893
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:05:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 175631BF207;
 Sun, 14 Aug 2022 10:05:40 +0000 (UTC)
Date: Sun, 14 Aug 2022 12:05:40 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814120540.3beaa35c@windsurf>
In-Reply-To: <20220812143859.130116-1-fontaine.fabrice@gmail.com>
References: <20220812143859.130116-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660471541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ygmDrKvCm7asBWebnphzQxLO12YZ2AFkF3k33Us7Dw=;
 b=V60VBYOm/m9kCUWN3LjU/WM6ZEVwwLhioEshgNZVwIDyFp5LP6krqlxPvTaYvccUM0u4lw
 8vI5yHAWaOtNze1E1w8AhnE0mY1WHYt4Hb65/s4d8Slg5TsYKljfFq/vfPxzuIzE3j2Q0s
 +iObdiPnaQfz1Pkt/eJUePqA7Z89qhsEG0MS/JRrKKLjEJ3fVIEL/YacNd7frGOXd9nx2H
 q3qxwHoHXiAjQF0Z31ssnlcLLqHg2ffbJ2jAnI0L4Bv22f5lbSq3C6CygL9rLU/sH8bKte
 19m0qBJNMqduuoVyExNNM+7BxnA4M6k4V+QubZ+L5gbXoa0T5klz5erYs1qrng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V60VBYOm
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/hawktracer: fix build without threads
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Aug 2022 16:38:59 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without threads raised since the
> addition of the package in commit
> 94d8764ef938936aa5432f1f13bd1b2d8b62a159:
> 
> /home/giuliobenetti/autobuild/run/instance-2/output-1/build/hawktracer-e53b07bc812c4cfe8f6253ddb48ac43de8fa74a8/lib/platform/linux/cpu_usage.c:5:10: fatal error: pthread.h: No such file or directory
>     5 | #include <pthread.h>
>       |          ^~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7edc29e21e441e66ad7c4df1673e506950930913
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Update patch to avoid a build failure on macos

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
