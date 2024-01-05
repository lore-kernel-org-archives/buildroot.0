Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DC9C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47E5C435DF;
	Fri,  5 Jan 2024 12:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47E5C435DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xk1kGJUQVKjR; Fri,  5 Jan 2024 12:55:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86C634371C;
	Fri,  5 Jan 2024 12:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86C634371C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A3BF1BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42169436F1
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42169436F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id po5Ee5iOdqYy for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:53:35 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A9BF436EE
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A9BF436EE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03C1560004;
 Fri,  5 Jan 2024 12:53:32 +0000 (UTC)
Date: Fri, 5 Jan 2024 13:53:32 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240105135332.0e48c687@windsurf>
In-Reply-To: <20240102221734.2449276-1-fontaine.fabrice@gmail.com>
References: <20240102221734.2449276-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704459213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YJ6YnK5OAtaHUyujGeWPICW78Cd3WLSSdsVW3o4PZT0=;
 b=LY3E0e/C34gI2JEWBJmh9s5JzRFip1k2yXrbc0+wPWeqnsraFidtYeEygZGENFYsXY1jnI
 4qyRnIgCKGqWr6jfzLPX2LJfq6pyz/4nR9gEdEp6SPq2jsRLge/kWWbUcOkOtKUrnbNnHp
 uXPjQvOHKHAUGZs2iP6Vq8ymnxCSEoyCmklbSscxe+gu3eQTlB3vNbl+j4khkpRl5FvH6C
 FJm7FzG2pQNEHnlD8+utj5W+ohrGb9MsiI7I7qmuAUZeGTORQ/hVXDMhChT6fuwWnKMDHe
 P/lcRb/Z8txxFIrIpC0goTzCjmNKvCTCCJBcO0Gp409t8/m/6oyrC8aPgMCcbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LY3E0e/C
Subject: Re: [Buildroot] [PATCH 1/1] package/isl: bump to version 0.26
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

On Tue,  2 Jan 2024 23:17:34 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://groups.google.com/g/isl-announce/c/_yQ27dRgf7w
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/isl/isl.hash | 2 +-
>  package/isl/isl.mk   | 2 +-
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
