Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69241C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C35960BC0;
	Sun, 11 Dec 2022 13:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C35960BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xaf1KgVAcx0i; Sun, 11 Dec 2022 13:47:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59A8660BBC;
	Sun, 11 Dec 2022 13:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59A8660BBC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4526E1BF20B
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FF1C4053C
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FF1C4053C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ntM5hqH3USH9 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:46:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECE634026A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECE634026A
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:46:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5182F20002;
 Sun, 11 Dec 2022 13:46:50 +0000 (UTC)
Date: Sun, 11 Dec 2022 14:46:49 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20221211144649.6b5a920b@windsurf>
In-Reply-To: <20221208103928.3274412-1-buildroot@heine.tech>
References: <20221208103928.3274412-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670766411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eAsFFzfq78EVKLsZhIBQXo7SzOgMkZj5qNRa0xlg/04=;
 b=BiuW27/jeyWrJ3tWBoFkSy6TblnzP49ltFCYfQhfZmX6a0ZZu62wCEEa1eLA7GCkOWrJba
 vtcypULMbYm8mobsB3ww4rss8vKqcNg2VGvdqzySSwdUrmlTsL3BF5czbmstf3Ol+cqkZy
 sFSZYFAk3yaWD4RxhAeoTp9UnKeRRR52WLGQXZ4GDd/P47vx70UYF6kbLBQl1Ip7XhiQZC
 dpL2yneKnyE0cP2fj/86xv/0KV+rmgnelpHEX/omORX/L6CKGBMH860T1B9PEvrTy4eK4i
 lkiGm0ADrzD1yLFf0PsMswRixEwJhAlqQZX6cL0P4pcmEAXVHSWY62N74nVsgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BiuW27/j
Subject: Re: [Buildroot] [PATCH] package/json-for-modern-cpp: bump to
 version 3.11.2
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

On Thu,  8 Dec 2022 11:39:21 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/json-for-modern-cpp/json-for-modern-cpp.hash | 2 +-
>  package/json-for-modern-cpp/json-for-modern-cpp.mk   | 2 +-
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
