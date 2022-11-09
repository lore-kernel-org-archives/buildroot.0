Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF00AC433FE
	for <buildroot@archiver.kernel.org>; Wed,  9 Nov 2022 16:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EB4060AE4;
	Wed,  9 Nov 2022 16:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EB4060AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zP5NVjUvCQlL; Wed,  9 Nov 2022 16:00:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE47B607C1;
	Wed,  9 Nov 2022 16:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE47B607C1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67CD61BF29A
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 16:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35F33812A1
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 16:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35F33812A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9NfHRWGs7xIg for <buildroot@lists.busybox.net>;
 Wed,  9 Nov 2022 16:00:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AF968128C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AF968128C
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 16:00:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 66F47E000B;
 Wed,  9 Nov 2022 16:00:48 +0000 (UTC)
Date: Wed, 9 Nov 2022 17:00:47 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20221109170047.055d9e6b@windsurf>
In-Reply-To: <87leokfe9s.fsf@dell.be.48ers.dk>
References: <20221026175705.3928406-1-thomas.petazzoni@bootlin.com>
 <87leokfe9s.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668009649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zM0lutnbwJQCf33hFEwgaPCWr/rPQGivFhoNnOwb1vQ=;
 b=ZuD7DGeKnrgToUZNe++sA0Z4RPaSjZ1vauOY5zUsIGbVkOL84wKkJKEERx9JDpUfBaDSa9
 NrIwMaRfrGLQqrR4SMQAATHNGUj5tcBXURjt0FOP5XWCCy//uqFN5ZSPLFF0YyHmS1hTY0
 WW+OLoE43O8ymWkBNqC5wgdcPoP0StcGD4LSYoZCVjKbLKh6XmhLa1ZR1eevziIfZKEEhl
 lWP96xKpnGA5PwYJqA8JbfT+xxRFkxgU3ke1XHgx8h/P0xCuzBtiJSEauxkdAS57/XJxa4
 ZuKCDh4TFVPVJ2hnRqWJTPkTJdrlf8gSeWzEgpwQEOapaG++CSSZS+4ibU4crw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZuD7DGeK
Subject: Re: [Buildroot] [PATCH] package/nodejs: drop support for the MIPS
 architecture
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
Cc: Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 09 Nov 2022 14:28:31 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Committed to 2022.08.x, thanks.
> 
> Perhaps this is only a >= nodejs 16.x issue? We don't seem to have any
> similar build issues for 14.x on 2022.02.x.

I honestly didn't look at older releases. It is indeed possible that it
used to work, since when MIPS support was added I suppose someone was
using it :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
