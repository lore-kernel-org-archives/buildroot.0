Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A40C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 14:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5571B4181C;
	Tue,  7 Feb 2023 14:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5571B4181C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y_A25RRk9Fc1; Tue,  7 Feb 2023 14:16:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 391EB404EE;
	Tue,  7 Feb 2023 14:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 391EB404EE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11AD81BF2CA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6E1681E2F
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6E1681E2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x7c0eNy9Cstk for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 14:16:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B782F81E2D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B782F81E2D
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 14:16:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D99041BF211;
 Tue,  7 Feb 2023 14:16:47 +0000 (UTC)
Date: Tue, 7 Feb 2023 15:16:46 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230207151646.09c9df79@windsurf>
In-Reply-To: <20230104020558.1436469-2-giulio.benetti@benettiengineering.com>
References: <20230104020558.1436469-1-giulio.benetti@benettiengineering.com>
 <20230104020558.1436469-2-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675779408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Bstr0IP14H4Po7bZYDX8FCcYMceuwLZa0RaYBA4u70=;
 b=DfSzHREXR0Tt12wwoFE65DB/+ej7KPDZMQoGK0qFW57gwRVYWjpswZV45ahZkMv5DRqyI0
 g9gb1XR7nKU4eH1y/EVqd/A6xHvoOKsAXxFZ2bCPWPx84ykfUFQg86f5QQZU8TmKHP0jtS
 2LyfPKqsQ9hbt9jgMObEiyCec77xXK+PY5/u2681czhexc3oAsSmXgcEAgVjMoVgCO6jql
 2S5z/GwcJ+hNY8Bb1+B31fEP1J5IIzjDsmupIvYAMtTmclIW7A9wocVOIkxrRBF6pIp7Yt
 4e+krSzfaqumHMeoGVE632d6TKfF7EdEpq0CIrl40FzLS/c/nro08bZ/WrcrWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DfSzHREX
Subject: Re: [Buildroot] [PATCH 1/1] linux: fix LINUX_VERSION_PROBED content
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

Hello Giulio,

On Wed,  4 Jan 2023 03:05:58 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Actually LINUX_VERSION_PROBED is set with the string sorrounded by the
> backquotes including them. So when we evaluate $(LINUX_VERSION_PROBED) we
> end up having the command itself and instead we only need the Linux version
> probed in the style x.y.z.
> 
> Verifying it turns out that:
> 1) --no-print-directory and -s make flags must be passed before -C flag,
> The error was not visible because errors were suppressed with
> '2>/dev/null'  
> 2) backquotes don't evaluate the expression they sorround but become part
> of the string they sorround and get assigned to the variable
> 
> To fix this let's move --no-print-directory right after $(MAKE) and
> use $(shell ) instead of backquotes.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

What is this fixing exactly? Do you have a specific problem that this
fixes? Or is this just fixing the fact that LINUX_VERSION_PROBED
contains `a very long command` instead of the result of the command
itself?

Indeed, switching back to $(shell ...) like you're proposing would
result in basically backporting:

commit 28f57bb863ba48df054cec0057c844bf23d5969f
Author: Arnout Vandecappelle <arnout@mind.be>
Date:   Sun Jul 12 16:35:27 2015 +0200

    linux: use backtick instead of $(shell ...) make function
    
    Verified that LINUX_VERSION_PROBED is only used in "-quoted commands
    (actually, usually it's not quoted).
    
    Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

which is not desirable, especially if you don't have a good
justification of why the current situation doesn't work.

So for now, I'll mark as Rejected, but if you have a good
justification, you can resend with a better commit log with this
justification.

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
