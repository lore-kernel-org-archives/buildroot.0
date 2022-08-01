Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FA0C19F2B
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 17:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D43560BB9;
	Mon,  1 Aug 2022 17:02:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D43560BB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NM3vcjkZFfJq; Mon,  1 Aug 2022 17:02:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 754CD60BC4;
	Mon,  1 Aug 2022 17:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 754CD60BC4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C4BF1BF315
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6551A409FF
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6551A409FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 27oHi6ec88eq for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 17:02:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 080BB409EB
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 080BB409EB
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 17:02:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0DFC620009;
 Mon,  1 Aug 2022 17:02:07 +0000 (UTC)
Date: Mon, 1 Aug 2022 19:02:06 +0200
To: Sen Hastings <sen@phobosdpl.com>
Message-ID: <20220801190206.217f4117@windsurf>
In-Reply-To: <20220728232357.270130-1-sen@phobosdpl.com>
References: <20220728232357.270130-1-sen@phobosdpl.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659373328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+iVDepKOiiz6ZleiAsiVgYe1HFoDR+WkbLm5ydArPT8=;
 b=fQoSrKc2QcKE70cfTbWn4AANlfEHjIrDMYA5IAdWK4oAr9l8SJSx75Ukc2oA1OJ5eAjIBw
 y598Ck/wX9o3Y9IiAZ0S6a4Ol6bcjGwZ7gM151Wbe7NoC4AJlUJUHmZLLVvlD3lYLt+AYQ
 DoKLubNSshtW9HVU7E5tUOtIKK7+lpL2GO9TXqdbWoTmLYxz6FIYGdVbIssv6lcPQJebkH
 x24993PHMdDUB5RjrDGLs01/Li5oLzpwiGVFO+x/SB7HxfK/ctQD2KGwWg7BmmK8MpM4QN
 lDSn27yIZcKxyXvW2g3b/d4BMVYyz2cMjG3RC6ivQMlVCD8HqdVoIGDfVfCsSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fQoSrKc2
Subject: Re: [Buildroot] [PATCH 1/3] support/scripts/pkg-stats: make cells
 with many CVEs collapsible
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

On Thu, 28 Jul 2022 18:23:55 -0500
Sen Hastings <sen@phobosdpl.com> wrote:

> Sometimes a package can have a lot of CVEs.
> Rather than have the CVE cell make a really tall row
> (that means you have to scroll a bunch) this collapses the CVE
> cell to a fixed size scrollable element with a
> sticky button that lets you expand and collapse it.
> 
> If Javascript is enabled:
> 
> A stylesheet is generated and appended before content rendering,
> amending the cells style to have a fixed height and overflow.
> 
> Also, the expand/contract button is unhidden.
> 
> This means the CVE cells are rendered in a collapsed state
> instead of being rendered in an expanded state and then
> slamming shut.
> 
> This avoids a "flash" and *helps* (vertically at least) manage CLS
> (cumulative layout shift).
> 
> see: https://web.dev/cls/
> 
> If Javascript is disabled:
> 
> The cells stay fully open and the expand/contract button stays hidden.
> 
> Signed-off-by: Sen Hastings <sen@phobosdpl.com>
> ---
>  support/scripts/pkg-stats | 38 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)

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
