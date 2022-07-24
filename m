Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84853C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 08:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F5AE4163F;
	Sun, 24 Jul 2022 08:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F5AE4163F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jKreRXaXJR5L; Sun, 24 Jul 2022 08:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2984540ACE;
	Sun, 24 Jul 2022 08:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2984540ACE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 975241BF312
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56D574245D
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56D574245D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WgyN8gfqw3_w for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 08:55:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0E4741706
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0E4741706
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 08:55:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9941C1C0003;
 Sun, 24 Jul 2022 08:55:37 +0000 (UTC)
Date: Sun, 24 Jul 2022 10:55:36 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220724105536.3677c34e@windsurf>
In-Reply-To: <20220723203423.264553-1-fontaine.fabrice@gmail.com>
References: <20220723203423.264553-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658652937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VMEK9+LlAeHeVcGYWacTggkp+10VaAqLsHxOUgm4yTQ=;
 b=jGxu2WzXr6vJkDD36FNHZhbxwmykCVf2Wjapditnu9BVnKumTn1LNSgCOfKWXrOTGJuOkk
 1AnNzRBRv2uGxCp993ap+STNQrNHXuxi5CUei/d0y29gkdutf/2ZWOWySOdI3g424N9W/q
 r5+mmvtccD6lT7FW0yp/ydkvRqVDiFnbkfoB+8lP9rT6l35YjRZUZgZy/893kqxXzk2OH/
 RW7yQL94VHp5qpdsKobPzbv3W2HJjXv57JPhwrw6Z9DHcrU11YAUnJu6rj0tmVVt9sB1bJ
 n9S0PVwR3LsZ5WYGLASb2CKVNgfujWqMFygOB8oe+rE720V8qq3iK6uedrPAUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jGxu2WzX
Subject: Re: [Buildroot] [PATCH v2,1/1] package/ntpsec: fix dependencies
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 23 Jul 2022 22:34:23 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add python3 dependencies to avoid the following build failure raised
> since the addition of the package in commit
> 27b8d0ba8c4004819e092fb81c0f64f284b3aa4a:
> 
> Makefile:576: *** libffi is in the dependency chain of python3 that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2893c213f49d37a0878dcf14ec68ef991471c70f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Add python3 dependencies instead of depending on it

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
