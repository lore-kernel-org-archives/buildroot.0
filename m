Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F80C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 21:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FF80826C8;
	Thu, 28 Jul 2022 21:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FF80826C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uGU5Zm8nWjX8; Thu, 28 Jul 2022 21:06:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3434B826B4;
	Thu, 28 Jul 2022 21:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3434B826B4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB1301BF3C2
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3049826B4
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3049826B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kc-GWJ1GuyPD for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 21:06:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 993AE8261C
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 993AE8261C
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 21:06:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A657C200004;
 Thu, 28 Jul 2022 21:06:16 +0000 (UTC)
Date: Thu, 28 Jul 2022 23:06:15 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20220728230615.20e52fa4@windsurf>
In-Reply-To: <20220728080733.3177721-1-thomas.petazzoni@bootlin.com>
References: <20220728080733.3177721-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659042376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=shQRx0/x0ufi1LxUxkoQF3A/mok5h2zuN8U/lclHAKo=;
 b=khjKKVzew7/T7wAvq3j+vsJE/aysZrPpv0wLMsun1yiaGyr9vj5cSZEVtPbkDvxj1soidB
 ytz/86Lzwr0iYUAzsARmANd9zmRWXqL8wbvrJax54q4BbnF+lIhl67bmn+toHqYJq0ggjd
 BELWWdQVTKy6RilGqfjuCSnyvicJ+peu7yMFYkgEON6s16N8sp73DLHS48shlHQQqN6S1B
 Y41/KuJpHbx64Rn8WzvFpR3U4JWuaJCg221dydH9K0GA2rRRAh4LEX/2Pfn9iOhMONOiAs
 E2mHevp02++fKbQVZ1GvyWBjAD2u6+pya2jEr5QgtHyNP8BTL+RsDrbxh6NBLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=khjKKVze
Subject: Re: [Buildroot] [PATCH 1/2] boot, package, support,
 toolchain: switch to 2 spaces for the hash file
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Jul 2022 10:07:32 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> It's time to finally switch over globally to the new spacing format
> that we have agreed on for the hash file, with 2 spaces as a separator
> between fields.
> 
> This commit was mechanically generated using:
> 
> find . -type f -name '*.hash' | xargs sed -i 's%^md5[ \t]*\([^ \t]*\)[ \t]*\(.*\)$%md5  \1  \2%'
> find . -type f -name '*.hash' | xargs sed -i 's%^sha1[ \t]*\([^ \t]*\)[ \t]*\(.*\)$%sha1  \1  \2%'
> find . -type f -name '*.hash' | xargs sed -i 's%^sha256[ \t]*\([^ \t]*\)[ \t]*\(.*\)$%sha256  \1  \2%'
> find . -type f -name '*.hash' | xargs sed -i 's%^sha512[ \t]*\([^ \t]*\)[ \t]*\(.*\)$%sha512  \1  \2%'
> 
> This commit can easily be backported on the LTS branch by re-running
> the same commands, if needed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Both applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
