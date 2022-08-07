Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9467BC19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 12:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C42B4046D;
	Sun,  7 Aug 2022 12:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C42B4046D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tXq3kL88me81; Sun,  7 Aug 2022 12:40:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C22040461;
	Sun,  7 Aug 2022 12:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C22040461
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A033B1BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A656410C6
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A656410C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 79nFT0qYi50V for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 12:40:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26A73408D2
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26A73408D2
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 12:40:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2960A240004;
 Sun,  7 Aug 2022 12:40:05 +0000 (UTC)
Date: Sun, 7 Aug 2022 14:40:03 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220807144003.16a747d6@windsurf>
In-Reply-To: <20220807095553.3186454-1-fontaine.fabrice@gmail.com>
References: <20220807095553.3186454-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659876005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V8pZ/6a3gIhkr5//YC0gPujGnJWvdtppYdpeeN5gJDM=;
 b=fHjFuABTHxGnM/f0leexAyDtlIWt6kYpgJtx3lKB+CEnO5tUE4MyJuq5kbSdbvHAA+nAhI
 vk4r/ppaoL6ehRgPCA+sA3inD+exm4/ejzvQVehf9JbNX1eHEg9NRdkkCj2et/G6RVaGJj
 Me0IoahlHTf0aQft+wLbCpkePHXdK1u9ZmNSxDfhe4LReGECA0C6OlZDUBb+xS8kuHKa1W
 YPFSsEAedAqcGLs7p7paZWmyrc8SQH29JxdOZWWoR8kOvcnhE/lpM9gZOV1nH0IugcAW4Z
 gZnLpJffnqk54I28rXCGANfk6ijIegb84d/KKIfLV+79lCJ8EZqPewxFRcmeMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fHjFuABT
Subject: Re: [Buildroot] [PATCH 1/1] package/dump1090: fix dependencies
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

On Sun,  7 Aug 2022 11:55:53 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> dump1090 needs threads and gcc >= 4.9 since bump to version 7.2 in
> commit e80c99e1519dafc2cf88ab4672eecda88359ecb1 to avoid the following
> build failures:
> 
> In file included from dump1090.c:50:
> dump1090.h:69:10: fatal error: pthread.h: No such file or directory
>    69 | #include <pthread.h>
>       |          ^~~~~~~~~~~
> 
> In file included from dump1090.c:50:0:
> dump1090.h:68:23: fatal error: stdatomic.h: No such file or directory
>  #include <stdatomic.h>
>                        ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a8993d9a09c79231358f50d2c1eb2e08cf7d5fd6
>  - http://autobuild.buildroot.org/results/7367abae7dc8187e4a2aae5397618c6e1b7aa521
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dump1090/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)

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
