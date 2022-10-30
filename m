Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D4BC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC30880DCF;
	Sun, 30 Oct 2022 11:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC30880DCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SeUdAdjsKR9C; Sun, 30 Oct 2022 11:10:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E875A80C1E;
	Sun, 30 Oct 2022 11:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E875A80C1E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28C681BF2EB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 044D960644
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 044D960644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6PCe2k2VGwAx for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:06:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE41860592
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE41860592
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:06:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 974001C0004;
 Sun, 30 Oct 2022 11:06:46 +0000 (UTC)
Date: Sun, 30 Oct 2022 12:06:45 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030120645.74fc2990@windsurf>
In-Reply-To: <20221029184742.17565-1-fontaine.fabrice@gmail.com>
References: <20221029184742.17565-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667128006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7GhGNTrryhkxELY9cMGK2JyvObXpzBPlfCFdH9dFFc0=;
 b=Tb7ibx8LVgGBlMXjcn/1togFKaF54xg6i6eBQjXXRhP0TPc8KiRngr+VRV3UjjOPiMisbk
 q/qWSpmvsepATF+6Qluasz41nhft/qDEiQaf3z289jsporp368iLSXx4YxYlwT78qkzXr2
 +1Uv20YHS8yFdFZT0+WQRvGN9+Kaj69khf41gtDS9/dbgpxzqoxTOBKhBe8pNO5ffFKT2q
 0Ssg9QsOPp/Knfb/QjBZwnjDcPIJBVmhcBXGFJLNnTQ7rb2yEkzvrOpGXgReGAhYvO7l7T
 b2aiCe9ZsQkPlqtays1wKTEwQbaZ4NHp2VYPmDCSbtgfZLm3bfrUu63x99zTWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Tb7ibx8L
Subject: Re: [Buildroot] [PATCH 1/1] package/gawk: bump to version 5.2.0
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

On Sat, 29 Oct 2022 20:47:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://git.savannah.gnu.org/cgit/gawk.git/tree/NEWS?h=gawk-5.2.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gawk/gawk.hash | 4 ++--
>  package/gawk/gawk.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
